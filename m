Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EBFC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 10:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=89CvzQO2eysos6EalznjL5KGrflU3yCTeBwW3Bzd8xI=; b=fF31p+UhgJT9Uxvc3opsvkgmrR
	PVfhsp4L2Xai1cMjWDnhTQdm1ZdnJBWE2kWmyJUPKWX+cwzIaQVQRx9FJ+a5fZEYisjIYu7q6IUFa
	A4PA6mB7jCN5xfQ/EiPiDe6DFCLnMFNoxnwwOXk77zbp6uoBpap2+0LG0AsUtjYcMNTKdhVGOEHS5
	2QdYjK1lXwzQg6uV8J5DWk9ny6zOyFhEAKBsJjs7kPDRL7sRZwyjrOuiiuaIPYhcn8OPJDlq9NlKz
	ZThKeNTweFZHz/xGYgz7V+IAS7JW1xO63cjHrtybgtDcjgP4VbzE2RVrqJzYe3NJ5IszND3pvdGBo
	5gcAZ3+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVOH-00000008eEZ-0SGB;
	Mon, 26 May 2025 10:49:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJVKz-00000008dyJ-0s2i;
	Mon, 26 May 2025 10:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748256342;
	bh=3zQVdTY3RzRyRFYvs+PWvDmD2Tf4e73Q9ALAMl05qOs=;
	h=From:Date:Subject:To:Cc:From;
	b=kQ0zBpOSTeCp9zmSNgVxYVe6DUMhoeFj4bzHyhKKNgEaC0x41XaotCE+LC9OTdxeT
	 VNpmmDjro9BnQuS+PPK07bJjOBhaRp2wwDFToCMhi6u5p0nvBI+LCD19OERY98D2BZ
	 eSukh+fGA2be2YRO68SbBjpg6aS4U8RH3fylYZRZHyXfnAS+Bj4fWX7Ux6hBOTAL0W
	 tt8uVtY2IKFjPJvvv9UeihkTPZKtGXzgTfhXjFXs2mqIo3xu3qkb+tUe++7C8pBHRs
	 IaJuxxFCjG/Qo4IARD6/agWjZWzt3BPKqKVmDYDeNtVmII+O7ccYJUETbZZezsVQhk
	 bFM6maFnHBb5Q==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BB2C17E0FD6;
	Mon, 26 May 2025 12:45:41 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 26 May 2025 12:45:27 +0200
Subject: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: Enable Audio
 DSP and sound card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-mt8395-genio-1200-evk-sound-v1-1-142fb15292c5@collabora.com>
X-B4-Tracking: v=1; b=H4sIAEZGNGgC/y2NQQ6DIBAAv2L23E0AQ0P9SuMBcbWbBmgBjYnx7
 5La48xhZodMiSlD1+yQaOXMMVSQtwbcy4aZkMfKoITSQiuJvpj2oXGmwBGlEgJpfWOOSxhRW2M
 GN9mWhINa+CSaePvVn/3Fib5LnZRLwmAzoYvec+maQFvB/+gO/XGcEiLC3p4AAAA=
X-Change-ID: 20250521-mt8395-genio-1200-evk-sound-5a88bcfa3e0c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748256341; l=2546;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=3zQVdTY3RzRyRFYvs+PWvDmD2Tf4e73Q9ALAMl05qOs=;
 b=ZSIMkwdTldNoIvD/1HqGZSYHaXkeOwJEfPcba/BsazHrveVFYT4y0LFHyG62ifL165HfNMSVf
 k5IkYU2pjHbBxr+ZzuzZJbLIFI78UayRb8qrN+thf5G7IoDdonSBXFp
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_034545_426860_DD283346 
X-CRM114-Status: GOOD (  11.97  )
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

Add in the mt8395-genio-1200-evk devicetree the memory regions for the
Audio DSP (ADSP) and Audio Front-End (AFE), and a sound card node
configured to use the ADSP.
This enables audio output through the 3.5mm headphone jacks (speaker or
earphone), available on the board.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Tested on a Mediatek Genio 1200-EVK board with a kernel
based on linux-next (tag: next-20250526).
---
 .../boot/dts/mediatek/mt8395-genio-1200-evk.dts    | 46 +++++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index be5e5f339e811728e91b1ffec45ada25f9b0208b..9f0734731b5ef3c6b86693a389adc399707d5212 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -79,9 +79,21 @@ bl31_secmon_mem: memory@54600000 {
 			reg = <0 0x54600000 0x0 0x200000>;
 		};
 
-		snd_dma_mem: memory@60000000 {
+		adsp_mem: memory@60000000 {
 			compatible = "shared-dma-pool";
-			reg = <0 0x60000000 0 0x1100000>;
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
 			no-map;
 		};
 
@@ -179,6 +191,16 @@ wifi_fixed_3v3: regulator-2 {
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
 &disp_pwm0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&disp_pwm0_pins>;
@@ -976,6 +998,26 @@ &scp {
 	status = "okay";
 };
 
+&sound {
+	compatible = "mediatek,mt8195_mt6359";
+	model = "mt8395-evk";
+	pinctrl-names = "default";
+	pinctrl-0 = <&audio_default_pins>;
+	audio-routing =
+		"Headphone", "Headphone L",
+		"Headphone", "Headphone R";
+	mediatek,adsp = <&adsp>;
+	status = "okay";
+
+	headphone-dai-link {
+		link-name = "DL_SRC_BE";
+
+		codec {
+			sound-dai = <&pmic 0>;
+		};
+	};
+};
+
 &spi1 {
 	pinctrl-0 = <&spi1_pins>;
 	pinctrl-names = "default";

---
base-commit: 22d449bcd69e66f25fe847b678738950dcf9301e
change-id: 20250521-mt8395-genio-1200-evk-sound-5a88bcfa3e0c

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


