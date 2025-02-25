Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD52C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O85U0ptLsyT0QGOWC2n+rfW6CjNEmVM6d5RssTDaW48=; b=ve94fFeKn+ehOAgE9LPnUIzYfA
	QIBmvyVeNSQDME5pr7wIWi2MmtiJ4IBtFmjOZdV0lxkoSgkK5tnwz+JApjiFRJ+nYbHNqOOTa/fji
	VG5SoNeOFb3cxjLf2lOcEcbF+djtW1YcbQd6bIyMw1QUelcRoDTzzHa1SL9jlfOBX5p59e/yqjDxA
	RmhX6pvD2x9h7xmTcPy0MEonW9+KJsL36xy5lw0NrwrE7D3vDGt4HWw25IqbS8KTlrV5MfiI0Y6eb
	bDuuhj9+nOD1ThWn1p/VvIzSYPPWUX6cdsKD2GCH7a2TvUSjo+etgZhh1TykHH7Disql/kmamiUbq
	+v/43Q/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxzZ-00000000JTt-1KCc;
	Tue, 25 Feb 2025 16:41:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmw1x-0000000HXny-1StT;
	Tue, 25 Feb 2025 14:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740494128;
	bh=3Q8vh4dqgs6gSrA2h35eYPA23DKBRh9HZ/RKTzTbByk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aOpv/Txa7z0/W/NhoWZ89fCcbP5ZoXOVuz+qQ3c32YUPWNBkOX4Lf+nhWDZa9hTGX
	 GjUGu4xpPR52Npu3GzoXGbJU3E4HuKU7X4TDTzlqcORwnRGVQPQaP13clc38sWYUyI
	 UUoUtPhxLaG2UQzPlzaCGUE5gntqvLE76DdscerioVOfWf88e6DdDPOwu00qcShpMP
	 pxEY8Ix8CNNv7fSZM/NUIvhI03GuP49CtoIMsVYTR1VoaKaK4GnErDKhNPek4qJiCK
	 5a3UoZ5lGG39FpZ/DbLrcHCE08MvIl8Gfziw826qFX15E7+9p1zTF6JnP9J7JsC5AJ
	 EDWe0Zg5ejOkg==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1004])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 119E817E0DB7;
	Tue, 25 Feb 2025 15:35:23 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 25 Feb 2025 11:33:52 -0300
Subject: [PATCH v2 6/8] arm64: dts: mediatek: mt8390-genio-common: Add
 routes for DMIC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250225-genio700-dmic-v2-6-3076f5b50ef7@collabora.com>
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
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 parkeryang <Parker.Yang@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_063529_532881_04545176 
X-CRM114-Status: UNSURE (   8.79  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


