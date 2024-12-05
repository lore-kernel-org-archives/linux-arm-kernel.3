Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79849E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SkiNCYBsX3SSVIhNupJCz1vRRfZR3b/YxZ/4X0YZf4=; b=bBelOvLoTLDQivHwoXdby7Wq2m
	5VGI2W6dfTu1lIJk3X6CWo/EZ9lc8Sf1eYHsYLlfhQK5FokJM8lXhpSWU/k9PLHoC0qsnQPD8P0TS
	5lzACtmnn01NgxVOcEoY0yeqMAhzSPYSiwLx56t64pa5dZBigd5XyG9HcOeDsQGWw9302EDirTa2X
	3A31dSk+1BWrnIHXzFS2rxTReU1d4Q7f9hF8M6N2OyJXttHU0+emDPyvi0tXfKEQPicYJGfpWkT+a
	glA7HdfArv0D30EAs1Dj52HIL7STBLwrNnVjlhAWfiOkc+I9+ZoTR7Voti1k0nVrUVAgCNCgSEo/M
	GpLvGSlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJArF-0000000FvUU-2wGp;
	Thu, 05 Dec 2024 12:21:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAlU-0000000FuLV-3ELp;
	Thu, 05 Dec 2024 12:15:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733400927;
	bh=KyZ5CACimQSWxoWyn7gctVe0I3LE7LBdjabpyJ3Zld0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RIR38fvdP35N8NMfgWv85t7hMpo0egF0D84RDrw3gkyHSjpxkOLPR15B/z3TixfXV
	 Ezn7ZGlcHR773nq9JVyBZVFS66WTOQy71yg/tq4FHFegCAFWyHH6ydndKdNpzQn7ro
	 t70vmLOu7109IQECu2TSqAWMIDIx0vlGVFLHHuhPWEsqLZml3DxLPT8GoQ0ZuWIY6e
	 fsvWSlGNYmqEY8gztsy7xGb3dnSK+CxNwzV4IIBtjCoq49eyf9FlsixDFizkrum2MR
	 kN8YIQYd/+N2Fw5RcbZa4VGC+n29REGZM5Hij152p8RqRdLmEmH+ec/U+x1gEtyOlx
	 vUew3GSNnNwVQ==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7ECF217E3661;
	Thu,  5 Dec 2024 13:15:23 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Thu, 05 Dec 2024 09:13:58 -0300
Subject: [PATCH 5/5] arm64: dts: mediatek: mt8390-genio-700-evk: Add sound
 output support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-genio700-audio-output-v1-5-0e955c78c29e@collabora.com>
References: <20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com>
In-Reply-To: <20241205-genio700-audio-output-v1-0-0e955c78c29e@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Trevor Wu <trevor.wu@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Aary Patil <aary.patil@mediatek.com>, 
 Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>, 
 parkeryang <Parker.Yang@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_041528_972719_E409CA12 
X-CRM114-Status: UNSURE (   9.64  )
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

Describe all the components to get sound output working on the two audio
jacks, Earphone and Speaker, present on the Genio 700 EVK board with the
audio DSP enabled.

Co-developed-by: Aary Patil <aary.patil@mediatek.com>
Signed-off-by: Aary Patil <aary.patil@mediatek.com>
Co-developed-by: Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>
Signed-off-by: Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>
Co-developed-by: parkeryang <Parker.Yang@mediatek.com>
Signed-off-by: parkeryang <Parker.Yang@mediatek.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
index bb68665f0b2da80397b833db0241a06648a322a0..2fded39078773e81d8e0313d6b118b3064be308d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
@@ -92,6 +92,24 @@ vpu_mem: memory@57000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x57000000 0 0x1400000>; /* 20 MB */
 		};
+
+		adsp_mem: memory@60000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60000000 0 0xf00000>;
+			no-map;
+		};
+
+		afe_dma_mem: memory@60f00000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60f00000 0 0x100000>;
+			no-map;
+		};
+
+		adsp_dma_mem: memory@61000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x61000000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	common_fixed_5v: regulator-0 {
@@ -209,6 +227,16 @@ usb_p2_vbus: regulator-9 {
 	};
 };
 
+&adsp {
+	memory-region = <&adsp_dma_mem>, <&adsp_mem>;
+	status = "okay";
+};
+
+&afe {
+	memory-region = <&afe_dma_mem>;
+	status = "okay";
+};
+
 &gpu {
 	mali-supply = <&mt6359_vproc2_buck_reg>;
 	status = "okay";
@@ -912,6 +940,28 @@ &scp {
 	status = "okay";
 };
 
+&sound {
+	compatible = "mediatek,mt8390-mt6359-evk", "mediatek,mt8188-mt6359-evb";
+	model = "mt8390-evk";
+	pinctrl-names = "default";
+	pinctrl-0 = <&audio_default_pins>;
+	audio-routing =
+		"Headphone", "Headphone L",
+		"Headphone", "Headphone R";
+	mediatek,adsp = <&adsp>;
+	mediatek,dai-link = "DL_SRC_BE", "UL_SRC_BE", "AFE_SOF_DL2",
+		"AFE_SOF_DL3", "AFE_SOF_UL4", "AFE_SOF_UL5";
+	status = "okay";
+
+	dai-link-0 {
+		link-name = "DL_SRC_BE";
+
+		codec {
+			sound-dai = <&pmic 0>;
+		};
+	};
+};
+
 &spi2 {
 	pinctrl-0 = <&spi2_pins>;
 	pinctrl-names = "default";

-- 
2.47.0


