Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B27C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 05:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPUCXsPGc+4erH3P3HSqGBpkg4cLX1U7TN5xq7voaMQ=; b=WYVWKDBeGITY/2cYjwd9RV4xMF
	qKwG6IIhsn5IBQ6u+nyp7eupMzHjSuAlms9kZNgQwIRR52FBVV4kghjDfEXv1NH2tO6ipCrq97YlW
	oy4mjpifFwLQHNUI/k46AJz6AZpluBGRA0/rBc+DkKu8unvpeadtsODcZWVZZSFNiGY9nn0Fo2nl0
	hrOgyeMICo2p2Kxh4OwXjQlMI+6VDJQEhYMqoEFl4jw3Cr+wZMVbzCsUUUxsftLV2dBVfTX5GLDTN
	pb5DvBq06WLGNYMDGnr9G0LqOVYaA9AQDHM3uKS87vy162SnsRQiUEciZAPBDaILt7vgHmwiY4o+5
	Ah4v64cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHyJm-0000000HU3z-2jRg;
	Thu, 22 May 2025 05:18:10 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHy5n-0000000HSEI-1mRd;
	Thu, 22 May 2025 05:03:44 +0000
X-UUID: 1e8158ce36ca11f0b29709d653e92f7d-20250522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:ea555cc8-6fa9-4a34-abf1-8b3b44eadeba,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:c89aa460ca0e367d394d49b188629272,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1e8158ce36ca11f0b29709d653e92f7d-20250522
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 960776778; Thu, 22 May 2025 13:03:37 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id DF9AE16003840;
	Thu, 22 May 2025 13:03:36 +0800 (CST)
X-ns-mid: postfix-682EB028-75871135
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id B9FFF16001CC7;
	Thu, 22 May 2025 05:03:34 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	johannes@sipsolutions.net,
	kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	srinivas.kandagatla@linaro.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH v2 6/6] ASoC: qcom: Use helper function for_each_child_of_node_scoped()
Date: Thu, 22 May 2025 13:02:59 +0800
Message-ID: <20250522050300.519244-7-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250522050300.519244-1-aichao@kylinos.cn>
References: <20250522050300.519244-1-aichao@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_220343_756116_7112E5C6 
X-CRM114-Status: GOOD (  10.42  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The for_each_child_of_node_scoped() helper provides a scope-based
clean-up functionality to put the device_node automatically, and
as such, there is no need to call of_node_put() directly.

Thus, use this helper to simplify the code.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 sound/soc/qcom/lpass-cpu.c       | 3 +--
 sound/soc/qcom/qdsp6/q6afe-dai.c | 3 +--
 sound/soc/qcom/qdsp6/q6asm-dai.c | 4 +---
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 242bc16da36d..62f49fe46273 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -1046,7 +1046,6 @@ static unsigned int of_lpass_cpu_parse_sd_lines(str=
uct device *dev,
 static void of_lpass_cpu_parse_dai_data(struct device *dev,
 					struct lpass_data *data)
 {
-	struct device_node *node;
 	int ret, i, id;
=20
 	/* Allow all channels by default for backwards compatibility */
@@ -1056,7 +1055,7 @@ static void of_lpass_cpu_parse_dai_data(struct devi=
ce *dev,
 		data->mi2s_capture_sd_mode[id] =3D LPAIF_I2SCTL_MODE_8CH;
 	}
=20
-	for_each_child_of_node(dev->of_node, node) {
+	for_each_child_of_node_scoped(dev->of_node, node) {
 		ret =3D of_property_read_u32(node, "reg", &id);
 		if (ret || id < 0) {
 			dev_err(dev, "valid dai id not found: %d\n", ret);
diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6af=
e-dai.c
index 7d9628cda875..64735f2adf8f 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -962,10 +962,9 @@ static const struct snd_soc_component_driver q6afe_d=
ai_component =3D {
 static void of_q6afe_parse_dai_data(struct device *dev,
 				    struct q6afe_dai_data *data)
 {
-	struct device_node *node;
 	int ret;
=20
-	for_each_child_of_node(dev->of_node, node) {
+	for_each_child_of_node_scoped(dev->of_node, node) {
 		unsigned int lines[Q6AFE_MAX_MI2S_LINES];
 		struct q6afe_dai_priv_data *priv;
 		int id, i, num_lines;
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6as=
m-dai.c
index a400c9a31fea..d7680dd3a3bb 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1236,10 +1236,8 @@ static int of_q6asm_parse_dai_data(struct device *=
dev,
 {
 	struct snd_soc_dai_driver *dai_drv;
 	struct snd_soc_pcm_stream empty_stream;
-	struct device_node *node;
 	int ret, id, dir, idx =3D 0;
=20
-
 	pdata->num_dais =3D of_get_child_count(dev->of_node);
 	if (!pdata->num_dais) {
 		dev_err(dev, "No dais found in DT\n");
@@ -1253,7 +1251,7 @@ static int of_q6asm_parse_dai_data(struct device *d=
ev,
=20
 	memset(&empty_stream, 0, sizeof(empty_stream));
=20
-	for_each_child_of_node(dev->of_node, node) {
+	for_each_child_of_node_scoped(dev->of_node, node) {
 		ret =3D of_property_read_u32(node, "reg", &id);
 		if (ret || id >=3D MAX_SESSIONS || id < 0) {
 			dev_err(dev, "valid dai id not found:%d\n", ret);
--=20
2.47.1


