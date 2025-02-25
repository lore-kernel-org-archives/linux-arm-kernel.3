Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78DFC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6uKjY+c8znArEdsXxvvHalAJGtJQsKZwUYyqgytrlU=; b=xsQC+UldHcdQ2AL/5yWmI1BN8k
	9rsgKfqCeRw58Ubd1yrfPBYfMW7ynGweYuv2A4g+DEwgfOBnpfApOvpj1ZAGCa7WloJDtn0UB50YN
	OKzvmjvqktkR19IHVy0juzwbAWygJdO14YRKXwVFLpu8baGa2B4aeL4RqdFBZSjzMXhgu7O1TpUZo
	BE3ri1RrKJZ6ok2PdesD0Lnli3+zAbbPhIFqd+Kc1etAIryb8EoIDavYYvTLDy6jQRh9Ibu/SsH1p
	o+Y9W8kuagHnKpHh3HHmAnt6nmI6aS5mwm7xohOTZShdnY+5RoapWEtn3rC3hZXINJ374l1SN/BOR
	fgD76eWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxzf-00000000Jah-0ixR;
	Tue, 25 Feb 2025 16:41:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmw21-0000000HXpG-3RPk;
	Tue, 25 Feb 2025 14:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740494132;
	bh=Skk39L7rjdPJjn3Yg0DBWoQQlhn9HJYB37tSSwUK8o4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bE+rB8Y1zsPx3E+gIBvGT2pcZT6YLZKwtTgTLm+h+8lfv5Ru8YqRCDR420+DE+Pa3
	 xFJyKfgFFemOuRxpScg8CEf/Dvt/eeGk4PZfCntr5814qcMCCzm1sHv4NcAg9ojXKD
	 HU9jjhu3Jcqe4DcR/ujcLd+ikMu4d1Jgm6T0XPSmwRSFIsePIO85TTCMfUa3HWLJo2
	 xOLFEJStSXDcGmC2gN2//BAuhMn+WhbXukDVlQ3o2D+MP30fCWPlHw6SZAYQlZrYfP
	 +iNf4BRLAoWDpuJUa5aetmNnubRkTZuTWCrNDsLYXEusyCH8fnn8eh/BRhiFm0bSGp
	 b6mbv9rHe339w==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9055617E0E91;
	Tue, 25 Feb 2025 15:35:28 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 25 Feb 2025 11:33:53 -0300
Subject: [PATCH v2 7/8] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add DMIC
 backend to dai-link
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250225-genio700-dmic-v2-7-3076f5b50ef7@collabora.com>
References: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
In-Reply-To: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_063534_002749_1BBFF776 
X-CRM114-Status: UNSURE (   7.92  )
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

MT8188 platforms also have DMIC DAIs, which were previously undescribed.
Add DMIC_BE as a possible backend for the dai-link property.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 362e729b51b43ec16716aee70ad736420def81f3..8c77e7f68ad7b6f5b88b53cedccb291139a2eeea 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -62,6 +62,7 @@ patternProperties:
             - PCM1_BE
             - DL_SRC_BE
             - UL_SRC_BE
+            - DMIC_BE
 
       codec:
         description: Holds subnode which indicates codec dai.

-- 
2.48.1


