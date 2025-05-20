Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11D5C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 09:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Jzts+NR6BxJleMDYfxtTU0HkTyKAc41X6oK1xPCW4U=; b=SPO0+OvhT4pmMmVnAqrX4zJS16
	PNoO/zb+Jh3zJnf3LBuu7ynRhGXMnYwii0fA4IivyAcEQqkQF2zHSyjuD1Qo22o/ogmKTLh48jIar
	C9OnmKKQsVMV79o0j2QNaBk3xm/nbto3r+uR8Dd8jO6lSbjYUeCeQmSCSOHGH/5GL8uwCR+GO6wA+
	5ku+EC0LnQcU48dC5v0K8CI5eqlChnTc+bx1V29gjequ3k5CMA05bRiABMpbiktialfTWJKxVwa10
	VkQSygLpLTup35Wgysz1v9YXgrzTrlirRsIocmZLKRkVouDOtaA1n9lYnnVFH1yTbVIt1sp559d+w
	1xTg7Ujw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJBf-0000000CB9F-2uO5;
	Tue, 20 May 2025 09:23:03 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJ11-0000000C90z-2wvn;
	Tue, 20 May 2025 09:12:05 +0000
X-UUID: 7c2d313a355a11f0b29709d653e92f7d-20250520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:0634e2b0-6be5-42ee-abbe-7876ece723fb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:11e3fd52d48d5c05f7356116c988d80b,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7c2d313a355a11f0b29709d653e92f7d-20250520
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1957821300; Tue, 20 May 2025 17:11:59 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 41D4F16003840;
	Tue, 20 May 2025 17:11:59 +0800 (CST)
X-ns-mid: postfix-682C475F-939691689
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 8659916001CC7;
	Tue, 20 May 2025 09:11:56 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: johannes@sipsolutions.net,
	perex@perex.cz,
	tiwai@suse.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	srinivas.kandagatla@linaro.org,
	kuninori.morimoto.gx@renesas.com,
	zhangzekun11@huawei.com,
	krzysztof.kozlowski@linaro.org,
	ckeepax@opensource.cirrus.com,
	drhodes@opensource.cirrus.com,
	alexey.klimov@linaro.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH 4/6] ASoC: meson: Use helper function for_each_child_of_node_scoped()
Date: Tue, 20 May 2025 17:11:29 +0800
Message-ID: <20250520091131.4150248-5-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250520091131.4150248-1-aichao@kylinos.cn>
References: <20250520091131.4150248-1-aichao@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_021204_042592_66A49170 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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
 sound/soc/meson/axg-card.c         |  3 +--
 sound/soc/meson/meson-card-utils.c | 14 ++++----------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index a2dfccb7990f..b4dca80e15e4 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -222,7 +222,6 @@ static int axg_card_parse_codecs_masks(struct snd_soc=
_card *card,
 				       struct axg_dai_link_tdm_data *be)
 {
 	struct axg_dai_link_tdm_mask *codec_mask;
-	struct device_node *np;
=20
 	codec_mask =3D devm_kcalloc(card->dev, link->num_codecs,
 				  sizeof(*codec_mask), GFP_KERNEL);
@@ -231,7 +230,7 @@ static int axg_card_parse_codecs_masks(struct snd_soc=
_card *card,
=20
 	be->codec_masks =3D codec_mask;
=20
-	for_each_child_of_node(node, np) {
+	for_each_child_of_node_scoped(node, np) {
 		snd_soc_of_get_slot_mask(np, "dai-tdm-slot-rx-mask",
 					 &codec_mask->rx);
 		snd_soc_of_get_slot_mask(np, "dai-tdm-slot-tx-mask",
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-c=
ard-utils.c
index cfc7f6e41ab5..cf08c8dedd91 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -137,7 +137,6 @@ int meson_card_set_be_link(struct snd_soc_card *card,
 			   struct device_node *node)
 {
 	struct snd_soc_dai_link_component *codec;
-	struct device_node *np;
 	int ret, num_codecs;
=20
 	num_codecs =3D of_get_child_count(node);
@@ -154,12 +153,10 @@ int meson_card_set_be_link(struct snd_soc_card *car=
d,
 	link->codecs =3D codec;
 	link->num_codecs =3D num_codecs;
=20
-	for_each_child_of_node(node, np) {
+	for_each_child_of_node_scoped(node, np) {
 		ret =3D meson_card_parse_dai(card, np, codec);
-		if (ret) {
-			of_node_put(np);
+		if (ret)
 			return ret;
-		}
=20
 		codec++;
 	}
@@ -198,7 +195,6 @@ static int meson_card_add_links(struct snd_soc_card *=
card)
 {
 	struct meson_card *priv =3D snd_soc_card_get_drvdata(card);
 	struct device_node *node =3D card->dev->of_node;
-	struct device_node *np;
 	int num, i, ret;
=20
 	num =3D of_get_child_count(node);
@@ -212,12 +208,10 @@ static int meson_card_add_links(struct snd_soc_card=
 *card)
 		return ret;
=20
 	i =3D 0;
-	for_each_child_of_node(node, np) {
+	for_each_child_of_node_scoped(node, np) {
 		ret =3D priv->match_data->add_link(card, np, &i);
-		if (ret) {
-			of_node_put(np);
+		if (ret)
 			return ret;
-		}
=20
 		i++;
 	}
--=20
2.47.1


