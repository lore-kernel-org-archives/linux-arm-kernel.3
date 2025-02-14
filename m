Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF5CC021A7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0MWFk+dTHQBz1p7Hv/WwHFEEiTXSBr4DDoFyvcQqzI=; b=XaHNj+AOeTkt7L3zSxYJ1ovLH5
	97zjwVniyJW5weKkoO6OnLap6r4/t2PoO0Gz+5ZY872X+vrkfJiofpnz7ANIausvO4v86lglu/6GE
	0W8dGLNs4ej2GP2nS8n1Z8h0De8cJ78nkttNe9dS3qFU1z87JOq3B+r0IR0Dj15+P3mUptCBYrtcn
	C8sfDV5vS1BlCBXhQn7xQpLBpTQ3Y/W5Jp/g2+lmbs3AAWoOp6xN4Ksa4HEYhhfmFt4wEvURrRSEb
	t7ga0J2F9wN9FeX5RgKWgQZLJzJpcc8JPCIvB2ZtRWmQPf3r4f4XtLvA6NvNCEIROJdzU1353h7FC
	DFKk9gtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0rX-0000000Fx95-1kPW;
	Fri, 14 Feb 2025 18:56:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizLk-0000000Ffvr-3b2g;
	Fri, 14 Feb 2025 17:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739553575;
	bh=lPL1S5SCW1+PI23N/jcgP12hMhBfoTHib8FSUQooe88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gIesuFvpOQ7/iFIFngOzZTm6MMmukdjPv3X0ec+jjsVWTpHWiOj8ZTRn4iHbg8i6n
	 lkHkV3Gk83RNtg/wMlqz+n34f+cNavlirn+ucU7LgH3qNPZIQ/byWB7VHvRFpy6asJ
	 /0awctKwFeOOnw7M5HSD16qVlUHQQiG2NRMlP5bb8QndM4gG4fbhUKOo9cUlYKKrd+
	 XKjboOZrfkQVV4KWAsMK018sUEq2pj77ABcw33a7Xg9JlZGdYeoU20IGYXP8YJPNkY
	 Fya6ZtvLW8cMLAxUaGFpiDqtOBwbe1z0iDECm6R2IJ4c6jGAg39NeV6qZbCvq5rAFV
	 fjnRMsE8Wp+sA==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1003])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B7F8417E1551;
	Fri, 14 Feb 2025 18:19:30 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 14 Feb 2025 14:18:35 -0300
Subject: [PATCH 04/13] ASoC: mediatek: mt6359-accdet: Add compatible
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250214-mt6359-accdet-dts-v1-4-677a151b9b4c@collabora.com>
References: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
In-Reply-To: <20250214-mt6359-accdet-dts-v1-0-677a151b9b4c@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Andrew Perepech <andrew.perepech@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_091937_045118_69DB34C1 
X-CRM114-Status: GOOD (  13.23  )
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

Add a compatible property and add it to the module device table for the
mt6359-accdet platform driver to allow automatic module loading and
probing when the compatible is present in DT.

Co-developed-by: Andrew Perepech <andrew.perepech@mediatek.com>
Signed-off-by: Andrew Perepech <andrew.perepech@mediatek.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index ed34cc15b80e856356c07fd53af22207124e0d19..6f07db879c6a56ce4843954f51bb9602373e4aa5 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -1047,9 +1047,19 @@ static int mt6359_accdet_probe(struct platform_device *pdev)
 	return ret;
 }
 
+const struct of_device_id accdet_of_match[] = {
+	{
+		.compatible = "mediatek,mt6359-accdet",
+	}, {
+		/* sentinel */
+	},
+};
+MODULE_DEVICE_TABLE(of, accdet_of_match);
+
 static struct platform_driver mt6359_accdet_driver = {
 	.driver = {
 		.name = "pmic-codec-accdet",
+		.of_match_table = accdet_of_match,
 	},
 	.probe = mt6359_accdet_probe,
 };

-- 
2.48.1


