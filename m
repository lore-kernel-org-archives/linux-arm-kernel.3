Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA41EC1108
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 16:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgeTGS+8qJEGuJv9Z7ulFAIz5McOanQP0tQrEdPQw4A=; b=qTLqgpRo5G+Aa9PGQg0vbkoQkk
	b+aZw1yywYTK+JSyVyESwsg9/lUQ4SFfROdsxDyLkIFcYRDhIvucRLiO7v1oyTvD/PHRpPG7g3xSn
	dpoXDVpopQiGpGeFgHiDEdchw1iPgbCQxFilrFR//sD531Bb5tAfdTEa1dIhjDqrwK11933yAIoF7
	nuJe1ic3huJcKG1AWC5Z2ZGOzc8Y13pyzCi1o2XXWU4kBtb31qrZr4/fIWBuBNliWJe/4lOjh1trq
	WLHWLmSozEh+/IrM7eii5OYydmG9DqZe8kv1SiYm6X1Tmxu6Xd1P6X3SFAlpLAyIWUsxhn9TMJn6T
	355HhUkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYle-00000000fo2-3Kee;
	Mon, 23 Feb 2026 16:26:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYld-00000000fmQ-2GT8
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Feb 2026 16:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wgeTGS+8qJEGuJv9Z7ulFAIz5McOanQP0tQrEdPQw4A=; b=D9WgtD7YMyxcPyWZlIWZA6IUfr
	9bDWxcoZXc/fRd2ekQJXD7sNyEB5koDxnfowqyCYdz32pyw60R/9NrwsEg+yS4DWdsi8RqlE5Dm8e
	qr9H74C+4NMnZd5v7WoXfB5MMZnnUuytKUQdKZjRZv+PKufoOfyF4LJygZ86yZNLm0LAV/DSxB77R
	ntMW8GjTYwxrjEChCZ7hIm/XF47boN48du1Q6dPedxEU+D17/A86JrwFc+/GpF1nyh/SQKSukZfbE
	GvpAHgaq8TL/HhuEsO1+qrHRBD/7SjUyjUvOO/XqFHhVM9DZfdpxshm6es9iuxHwNm+L4oo2ep+5r
	Lwdb1rWw==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYla-00000005T6N-2lH4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 16:26:40 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48379a42f76so35228405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 08:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771863997; x=1772468797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgeTGS+8qJEGuJv9Z7ulFAIz5McOanQP0tQrEdPQw4A=;
        b=iihKvzRtnp9ERC28mT5Ojzr6QK4PDq3pUf3TNQQEsRottELEGeFwnSzxzrV2Q0IhaK
         z2nHNaX4XD5hY5dTwd1zUT9hhi2XXjU72askAIiSAJHNyVkdE2UlQeLcfCO2RYxaLN9l
         AeXf53LEYgzcfpxhjFJwDit2mFhOmJ7qUI2SWvQKX//Jqc4aNmbwLS1Qa6Z+4BBEcRPq
         4hqpS8D+q5NnHopXOt8rlcvyshpIOnsY5tfCwm6ZNfqkgfiutsei9lX2OPyyS+8Ybd5I
         Aw0hktaJz0Xi4xywFuNR4MDzNXPf+WaW2F0ngZv2TSftn8S1jHlYfWPHl1HUut5/lSGZ
         LMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771863997; x=1772468797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wgeTGS+8qJEGuJv9Z7ulFAIz5McOanQP0tQrEdPQw4A=;
        b=EEhayJ0u69RtkkctctaSB6jrkd00+s8/H/Yhg4vRTFwtCOReUJswpiyTFLywGjZiwz
         1jowSBGxcs5EfXRSFMNs75mNjwRYFHJ2lUX97bHUEe6dicrk3V/t4oBeZ4qVZB4YX8OF
         /sBNUylLDiFoDQ8OyXZI6GE+S6lw9xkmRYAAxP5NylD7pNmTUMMXSRkfqeSzEi0YQs71
         oDlZLv+xkCDFhGonYYCROkrJ+HC3G3XytpqxA5bZg5/iLprRQnd7o7zoUdgx5/8XHlkW
         QgkyzYW7fVfOt0IUb3SOm0QdhmeotyyfGJ5GB2GuTMexjw5eTyONliFS/iTjNn1Q+vLl
         xVkA==
X-Forwarded-Encrypted: i=1; AJvYcCWeH216rVT4NZ7mzYlxzC/sEFWQNnlc8mFVWx3sqJDbpqfXGGbvyN5K2IyTVn2MUWyJnarva4Z90quDpmNcHVbX@lists.infradead.org
X-Gm-Message-State: AOJu0YwWUnCtH6xQDQJRZP/MXE7Wf1ANwR2/hnbaVDnFirjgC9D9O9KV
	EtQXjvNo3IqKIWLWf1QQeFxpizKbc5zkbmKRT31PvV/Ucjq4Q4AeZDTa
X-Gm-Gg: AZuq6aIUyetB0uE0YKzKX8+HFCPjymMFtmUxoGb59PStxqEVYY5H1UH+QXOpP0ok1O6
	4L0uCH/gZdmus7CVIGfFaZfthLElqEGP9crSy2eO+/Uf2VsvwtdsC69y7uLys/Vd2lu13l9qYvy
	bxgmamc7WRO/117Nn7PRS3eeR9t1nUOzzMI0xXbChsrpXQ0jtCtERKmaxbLpPKpKLWRNrAn9WyF
	2lpy5JEMaXPJlNkVDEl3JtmH5wENZPdKjgdeOn496Y5VzpSkcfBYeGYCk684yPprw/sMUQo9AEg
	x69Rn2GPni+Si+6Iy6ckLU8u+2lFiFsjZhGEoRemEVzwzMC79LsRv90nIcmro1qEyftxyOMEdVu
	BQFy0yHd0xeLyCm23QNdDk8kJUxIn+YjcqlSriq6XlxLE6sUyaU5P7jdvRsuMsR663Acef0tBaI
	c86AoRBxt+0K0ChpsKluo=
X-Received: by 2002:a05:600c:4fd3:b0:480:4d38:7abc with SMTP id 5b1f17b1804b1-483a95f8eebmr158193415e9.11.1771863996672;
        Mon, 23 Feb 2026 08:26:36 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d5463dsm19120357f8f.34.2026.02.23.08.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 08:26:36 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v3 1/6] arm64: dts: mt8167: Reorder nodes according to mmio address
Date: Mon, 23 Feb 2026 16:22:45 +0000
Message-ID: <cd857bb68661a3b5b7bab222b2ceb5337582e18d.1771863641.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771863641.git.l.scorcia@gmail.com>
References: <cover.1771863641.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_162638_804802_A1E41189 
X-CRM114-Status: GOOD (  11.49  )
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

In preparation for adding display nodes. No other changes.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 68 ++++++++++++------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 2374c0953057..27cf32d7ae35 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -29,12 +29,6 @@ infracfg: infracfg@10001000 {
 			#clock-cells = <1>;
 		};
 
-		apmixedsys: apmixedsys@10018000 {
-			compatible = "mediatek,mt8167-apmixedsys", "syscon";
-			reg = <0 0x10018000 0 0x710>;
-			#clock-cells = <1>;
-		};
-
 		scpsys: syscon@10006000 {
 			compatible = "mediatek,mt8167-scpsys", "syscon", "simple-mfd";
 			reg = <0 0x10006000 0 0x1000>;
@@ -101,18 +95,6 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
-		imgsys: syscon@15000000 {
-			compatible = "mediatek,mt8167-imgsys", "syscon";
-			reg = <0 0x15000000 0 0x1000>;
-			#clock-cells = <1>;
-		};
-
-		vdecsys: syscon@16000000 {
-			compatible = "mediatek,mt8167-vdecsys", "syscon";
-			reg = <0 0x16000000 0 0x1000>;
-			#clock-cells = <1>;
-		};
-
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8167-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
@@ -124,12 +106,36 @@ pio: pinctrl@1000b000 {
 			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		apmixedsys: apmixedsys@10018000 {
+			compatible = "mediatek,mt8167-apmixedsys", "syscon";
+			reg = <0 0x10018000 0 0x710>;
+			#clock-cells = <1>;
+		};
+
+		iommu: m4u@10203000 {
+			compatible = "mediatek,mt8167-m4u";
+			reg = <0 0x10203000 0 0x1000>;
+			mediatek,larbs = <&larb0>, <&larb1>, <&larb2>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_LOW>;
+			#iommu-cells = <1>;
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb0: larb@14016000 {
+			compatible = "mediatek,mt8167-smi-larb";
+			reg = <0 0x14016000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&mmsys CLK_MM_SMI_LARB0>,
+				 <&mmsys CLK_MM_SMI_LARB0>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+		};
+
 		smi_common: smi@14017000 {
 			compatible = "mediatek,mt8167-smi-common";
 			reg = <0 0x14017000 0 0x1000>;
@@ -139,14 +145,10 @@ smi_common: smi@14017000 {
 			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
 		};
 
-		larb0: larb@14016000 {
-			compatible = "mediatek,mt8167-smi-larb";
-			reg = <0 0x14016000 0 0x1000>;
-			mediatek,smi = <&smi_common>;
-			clocks = <&mmsys CLK_MM_SMI_LARB0>,
-				 <&mmsys CLK_MM_SMI_LARB0>;
-			clock-names = "apb", "smi";
-			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+		imgsys: syscon@15000000 {
+			compatible = "mediatek,mt8167-imgsys", "syscon";
+			reg = <0 0x15000000 0 0x1000>;
+			#clock-cells = <1>;
 		};
 
 		larb1: larb@15001000 {
@@ -159,6 +161,12 @@ larb1: larb@15001000 {
 			power-domains = <&spm MT8167_POWER_DOMAIN_ISP>;
 		};
 
+		vdecsys: syscon@16000000 {
+			compatible = "mediatek,mt8167-vdecsys", "syscon";
+			reg = <0 0x16000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
 		larb2: larb@16010000 {
 			compatible = "mediatek,mt8167-smi-larb";
 			reg = <0 0x16010000 0 0x1000>;
@@ -168,13 +176,5 @@ larb2: larb@16010000 {
 			clock-names = "apb", "smi";
 			power-domains = <&spm MT8167_POWER_DOMAIN_VDEC>;
 		};
-
-		iommu: m4u@10203000 {
-			compatible = "mediatek,mt8167-m4u";
-			reg = <0 0x10203000 0 0x1000>;
-			mediatek,larbs = <&larb0>, <&larb1>, <&larb2>;
-			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_LOW>;
-			#iommu-cells = <1>;
-		};
 	};
 };
-- 
2.43.0


