### Installation && up elasticsearch
```
git clone https://github.com/Velman04/docker-elasticsearch-analysis-lemmagen.git && cd docker-elasticsearch-analysis-lemmagen

sudo docker build -t elasticsearch-analysis-lemmagen .
sudo docker run -d -p 9200:9200 elasticsearch-analysis-lemmagen
```
Open and enjoy :) - `http://localhost:9200/`

### Installation into a project (Syluus).
1. `cd project_path/assets && sudo mkdir lexicons && cd lexicons && wget https://github.com/vhyza/lemmagen-lexicons/raw/master/free/lexicons/uk.lem`
2. Open `config/packages/fos_elastica.yaml`
3. Replace all `nGram` with `ngram`.
4. In `fos_elastica.indexes.bitbag_shop_product.settings.index.index.analysis.analyzer.custom_search_analyzer.filter`, replace `nowball_ua` with `lemmagen_ukrainian`.
5. In `fos_elastica.indexes.bitbag_shop_product.settings.index.analysis.filter.snowball_ua` replace to
```
lemmagen_ukrainian:
    type: lemmagen
    language: uk
    lexicon: uk.lem
```
6. `bin/console fos:el:pop`
7. That's all :)
