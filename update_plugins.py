import zipfile
import shutil
import tempfile
import requests

from os import path


#--- Globals ----------------------------------------------
#winmanager
PLUGINS = """
taglist.vim https://github.com/vim-scripts/taglist.vim
bufexplorer https://github.com/jlanzarotta/bufexplorer
minibufexplorerpp https://github.com/vim-scripts/minibufexplorerpp
OmniCppComplete https://github.com/vim-scripts/OmniCppComplete
supertab https://github.com/ervandew/supertab
nerdtree https://github.com/scrooloose/nerdtree
""".strip()

GITHUB_ZIP = '%s/archive/master.zip'

SOURCE_DIR = path.join(path.dirname(__file__), 'sources_non_forked')


def download_extract_replace(plugin_name, zip_path, temp_dir, source_dir):
    temp_zip_path = path.join(temp_dir, plugin_name)

    # Download and extract file in temp dir
    req = requests.get(zip_path)
    open(temp_zip_path, 'wb').write(req.content)

    zip_f = zipfile.ZipFile(temp_zip_path)
    zip_f.extractall(temp_dir)

    plugin_temp_path = path.join(temp_dir,
                                 path.join(temp_dir, '%s-master' % plugin_name))

    # Remove the current plugin and replace it with the extracted
    plugin_dest_path = path.join(source_dir, plugin_name)

    try:
        shutil.rmtree(plugin_dest_path)
    except OSError:
        pass

    shutil.move(plugin_temp_path, plugin_dest_path)

    print('Updated {0}'.format(plugin_name))


if __name__ == '__main__':
    temp_directory = tempfile.mkdtemp()

    try:
        for line in PLUGINS.splitlines():
            name, github_url = line.split(' ')
            zip_path = GITHUB_ZIP % github_url
            print zip_path
            download_extract_replace(name, zip_path,
                                     temp_directory, SOURCE_DIR)
    finally:
        shutil.rmtree(temp_directory)
