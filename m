Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9E6C54756
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 09:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3EyvgPSogl+bAGzaQgbs4jw/OpgLHQK5R7ejK2Dn/U=; b=KesvdIYQdx09yuy8AkVOeSuQaB
	mqCPyCWKSutMw5DRWPYocJ6xrFZHfKqZ2TT9vE6JgPAwR0PTJuooFxK5ov772p1U0DzagIzwG4jPh
	ZGkLz8BZuX/+xCiVhgjAIa+PAMNNAgI8JDi2Upy32kAxLdTeKZPhfvOl59obu72kLlamw6tghNnE6
	soOkeuC+d0iVbFfpJOJoIdMHovxe7Ff/wJEkUVhBOVPb8SVnHSKDrJZHEE+ES+icePUB4PuGeU31A
	Kk6djO2iebsNAHgnMWYM4qYVNPlwCA7Mbkg62P79AGBdZpKJ0AbcwKoAVEeYjZiBtQuEi34XmXHmF
	TL4wh6pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJDj-0000000CBZw-3Lkf;
	Tue, 20 May 2025 09:25:11 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJ17-0000000C91r-2fSc;
	Tue, 20 May 2025 09:12:11 +0000
X-UUID: 7eb6c0ec355a11f0b29709d653e92f7d-20250520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:13616bc0-98fb-453e-810b-0199eb5b8d18,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:980ae2365df82707056bbe9350351444,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7eb6c0ec355a11f0b29709d653e92f7d-20250520
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 650892054; Tue, 20 May 2025 17:12:03 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 6877816003840;
	Tue, 20 May 2025 17:12:03 +0800 (CST)
X-ns-mid: postfix-682C4763-2333681690
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 762BC16001CC7;
	Tue, 20 May 2025 09:12:00 +0000 (UTC)
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
Subject: [PATCH 5/6] ASoC: imx-card: Use helper function for_each_child_of_node_scoped()
Date: Tue, 20 May 2025 17:11:30 +0800
Message-ID: <20250520091131.4150248-6-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250520091131.4150248-1-aichao@kylinos.cn>
References: <20250520091131.4150248-1-aichao@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_021209_976179_8AA3CA48 
X-CRM114-Status: UNSURE (   8.68  )
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


