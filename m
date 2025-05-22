Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE97FC54756
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 05:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3EyvgPSogl+bAGzaQgbs4jw/OpgLHQK5R7ejK2Dn/U=; b=bPMsoj4G4PvWOks8afUkMFTFbP
	e2b2tGi0sGoWBHZegi4aeqs2C58a3gMRPZVumIDpomAfhocR9rPS38ilsI5bbux94MjsB58qrOAwV
	ba1rmmg2nMGYOKwEOqcVP8MbeTg9eVTWsf5LhKEvs5PXBfHPiRSzfY6qUdlAZSQo6N1XN8RiVOnHt
	lBWhhOhxrmycjzQpgyXmlNCVgi8YZjsmJ/MlKQG/7c2jy1lpJPcmQALGy5ZKL8CEkycVfFIlKpY9U
	yx1ns+Ia2A5M6OikydM5rNHOwVLBCE4P6EccjVMAs91e2uKC/mtoLhOiFNl69Hnl1/iF8Zc0JdE6I
	OrxoWJjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHyHk-0000000HTsD-2879;
	Thu, 22 May 2025 05:16:04 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHy5k-0000000HSDi-31Qp;
	Thu, 22 May 2025 05:03:43 +0000
X-UUID: 1cbb10ca36ca11f0b29709d653e92f7d-20250522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:fadaa0c0-1669-4e2d-8fbf-1547de942e0f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:82d79eed96e3b3d732c5fad996b78929,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1cbb10ca36ca11f0b29709d653e92f7d-20250522
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 621894384; Thu, 22 May 2025 13:03:34 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id D373216003840;
	Thu, 22 May 2025 13:03:33 +0800 (CST)
X-ns-mid: postfix-682EB024-50849734
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 7732A16001CC7;
	Thu, 22 May 2025 05:03:30 +0000 (UTC)
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
Subject: [PATCH v2 5/6] ASoC: imx-card: Use helper function for_each_child_of_node_scoped()
Date: Thu, 22 May 2025 13:02:58 +0800
Message-ID: <20250522050300.519244-6-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250522050300.519244-1-aichao@kylinos.cn>
References: <20250522050300.519244-1-aichao@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_220341_050490_6CBD7EC0 
X-CRM114-Status: UNSURE (   8.33  )
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
 sound/soc/fsl/imx-card.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 3686d468506b..bffdba4292b6 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -513,7 +513,6 @@ static int imx_card_parse_of(struct imx_card_data *da=
ta)
 	struct device_node *platform =3D NULL;
 	struct device_node *codec =3D NULL;
 	struct device_node *cpu =3D NULL;
-	struct device_node *np;
 	struct device *dev =3D card->dev;
 	struct snd_soc_dai_link *link;
 	struct dai_link_data *link_data;
@@ -552,11 +551,10 @@ static int imx_card_parse_of(struct imx_card_data *=
data)
 	link =3D card->dai_link;
 	link_data =3D data->link_data;
=20
-	for_each_child_of_node(dev->of_node, np) {
+	for_each_child_of_node_scoped(dev->of_node, np) {
 		dlc =3D devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
 		if (!dlc) {
-			ret =3D -ENOMEM;
-			goto err_put_np;
+			return -ENOMEM;
 		}
=20
 		link->cpus	=3D &dlc[0];
@@ -567,8 +565,8 @@ static int imx_card_parse_of(struct imx_card_data *da=
ta)
=20
 		ret =3D of_property_read_string(np, "link-name", &link->name);
 		if (ret) {
-			dev_err(card->dev, "error getting codec dai_link name\n");
-			goto err_put_np;
+			return dev_err_probe(card->dev, ret,
+					     "error getting codec dai_link name\n");
 		}
=20
 		cpu =3D of_get_child_by_name(np, "cpu");
@@ -722,8 +720,7 @@ static int imx_card_parse_of(struct imx_card_data *da=
ta)
 	of_node_put(cpu);
 	of_node_put(codec);
 	of_node_put(platform);
-err_put_np:
-	of_node_put(np);
+
 	return ret;
 }
=20
--=20
2.47.1


