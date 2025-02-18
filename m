Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B653FC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 21:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pfaw25oJjV25oVOmHTnRt76oDEvFQmCKbYEVKD+Mxbo=; b=efXOA9Se+wNQjdasF8VjzwTCOT
	sM2e1piMdR/xvXu95Jkdt4ZUib0zg/P4vYRrrUWnGhgc0jZ65HUtxzn8N/xrCklvpSd7N51S45Lni
	r0tjFXrcb5d6lUNoJZduOKo4RQVqf4qPiSp4JkxrWrXOlCxmE5oa3Lp+mM6U4S7diF9w27TDEm7g7
	03xWyA2YzKkrxSRSeb2ddOeH+4TeeuFYBHlgeByasxl58GI6IlXOTBXzKuM9M5j48qrKoG+O1iEQQ
	hgZWQIOyAT68toIik2xRX/divM7ztgKs7Y27BuoqaTeY1HnKATIUEhrsv5Wp2ZacLyVQ3PrPyTLf9
	FPOuE3uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkV7a-00000009zMP-2bC5;
	Tue, 18 Feb 2025 21:27:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUcd-00000009sfm-3Tb6;
	Tue, 18 Feb 2025 20:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739912114;
	bh=B3FIt860XOzRzSLwGAyU0H8nrJF+jVL8fCQPsnOwnsI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A44rg6jAA9mDbtSrYZ2BdQ6DT8sWsP5ts8XMj5S2SSD7XQc6Gcl6pnrHcLpx0sevy
	 DGzA8v76GNYYMgRtiQtg/TKTDF2boxrCe4/ONmeu2yE1kYiiI6FaOQByVd/Zvy/z0T
	 YojFlA9QxEqmtGLvRKzryT55VTMRHu4Ke5HcN+MCQrswia5lVBzG4kzese83E4ztcL
	 +xf2Pxq3o8MTi44NZ1e3dWC0chFlKr21zBFvGOJdVwUBmIdHZkxJH8CcTzR2KIf2+m
	 AurK+ZzRIc0KnQN7pKL1BYwHE/CJMmrO7PX0cWy1mpEL8K3snvrOvJcmyS4q752eIB
	 ISmu+A2WC4WrA==
Received: from [192.168.0.47] (unknown [177.33.139.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D98F917E14E7;
	Tue, 18 Feb 2025 21:55:10 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 18 Feb 2025 17:52:19 -0300
Subject: [PATCH 6/6] arm64: dts: mediatek: mt8390-genio-common: Add routes
 for DMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250218-genio700-dmic-v1-6-6bc653da60f7@collabora.com>
References: <20250218-genio700-dmic-v1-0-6bc653da60f7@collabora.com>
In-Reply-To: <20250218-genio700-dmic-v1-0-6bc653da60f7@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 parkeryang <Parker.Yang@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_125516_020004_50EE632C 
X-CRM114-Status: UNSURE (   8.67  )
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

Add necessary routes for the onboard dual DMIC present on the Genio
700/510 EVK. The dmic is supplied by micbias0 and micbias2, and inputs
into the MT8188 DMIC DAI.

Co-developed-by: parkeryang <Parker.Yang@mediatek.com>
Signed-off-by: parkeryang <Parker.Yang@mediatek.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index a37cf102a6e928440cc88e7e8fe0225fc28ec962..efdeca88b8c4e58f0c17825156276babf19af145 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -959,7 +959,11 @@ &sound {
 	pinctrl-0 = <&audio_default_pins>;
 	audio-routing =
 		"Headphone", "Headphone L",
-		"Headphone", "Headphone R";
+		"Headphone", "Headphone R",
+		"DMIC_INPUT", "AP DMIC",
+		"AP DMIC", "AUDGLB",
+		"AP DMIC", "MIC_BIAS_0",
+		"AP DMIC", "MIC_BIAS_2";
 	mediatek,adsp = <&adsp>;
 	status = "okay";
 

-- 
2.48.1


