Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEF5C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 11:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMja8MzF4lJ9N3IYREdz00CybaZrxQQg0o3RyFEH1I4=; b=AWV0RGOWz8BRlEoQW7uhDEz1qA
	lhpMSYwnkjG3t3oIoB+HjMlyZF0QQmbCE9Y/TgspJTUb4tmQw7YD482B+mgcbEzK3YwpYlqxiVVaz
	LekXD9yeUNUalkQJ3p5X2tYQEBYYmhECU/Q3E4JKuvxxQRZE9+dSicENTCckMyHK2P9rOuNv/DB0x
	WdEf9+bcZ5+AqtjPTkahN8RiFqnkjmoeI4CJEpuVls6hMHz4X54ZD6mOdhoKDS5ZYRt3lBXyv/SX1
	iFj6OC1DzCfX8hlsJyNPeEghHZwHfsyuLaZr9nf35dOxRbzKK6mwRxnu5lXBFMgUKxd6VhULVdioZ
	haf9PNWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLin-00000003PN5-1hL8;
	Fri, 09 May 2025 11:16:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKkW-00000003EJz-3FXN;
	Fri, 09 May 2025 10:14:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746785675;
	bh=Nh/3NP0bjRTX7YboruB3JZ2xLOeP0c8eAjI6a96C+Ns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SWmuL2DkadT8glMPTDJkD0fHkph5ozcxmQp3otwW2hV+Urzlx+jkib0P1Y8sb3oGe
	 uKCPCpGQ6H9FjoCKG/r2xOWmJcME7cBaeX+8diGKPRYaEWqnpwnWNvNHkIiwiDIiP7
	 N+AdgLixstcmZuk72b6VF9t0ITdJGRrAFufuzd3GAHmQRqukFYXhYTd6xqpjw+I3Jl
	 1/FxFzrk9J7gEyjhaMB+VHsCDb4qDiKn50nb8oGA3/AfuRUFfsdJchWHG7Zrw/ZiWa
	 Ttl8nUMcmFvjQ8viGKfD2E741vtKllWNJlCFELdT1Bai9qGk3qI05BI1SkfZv+r0hx
	 zupU0gzgvnZlw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3792117E05A6;
	Fri,  9 May 2025 12:14:34 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 09 May 2025 12:12:51 +0200
Subject: [PATCH v6 5/5] arm64: dts: mediatek: mt8370: Enable gpu support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-mt8370-enable-gpu-v6-5-2833888cb1d3@collabora.com>
References: <20250509-mt8370-enable-gpu-v6-0-2833888cb1d3@collabora.com>
In-Reply-To: <20250509-mt8370-enable-gpu-v6-0-2833888cb1d3@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746785666; l=1948;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=Nh/3NP0bjRTX7YboruB3JZ2xLOeP0c8eAjI6a96C+Ns=;
 b=eS5XUwVylAb8iDUak8oAOPDL805+h1Snt1WhfhP5/wiMk6RaACqriIaEcPBEjxh/02dQm1DLC
 cEMADU1uaGeA0DdlZO8WNI/tOi61KEvy5ydd1mr83tlCL9GPmWF18Tg
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_031436_961493_8337C597 
X-CRM114-Status: GOOD (  12.74  )
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

Add a new gpu node in mt8370.dtsi to enable support for the
ARM Mali G57 MC2 GPU (Valhall-JM) found on the MT8370 SoC, using the
Panfrost driver.

On a Mediatek Genio 510 EVK board, the panfrost driver probed with the
following message:
```
panfrost 13000000.gpu: clock rate = 390000000
panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
panfrost 13000000.gpu: features: 00000000,000019f7, issues: 00000003,
   80000400
panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
   Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
panfrost 13000000.gpu: shader_present=0x5 l2_present=0x1
[drm] Initialized panfrost 1.3.0 for 13000000.gpu on minor 0
```

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8370.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8370.dtsi b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
index cf1a3759451ff899ce9e63e5a00f192fb483f6e5..7ac8b8d0349455922a73f35db607b2b27cad23d7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8370.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
@@ -59,6 +59,22 @@ &cpu_little3_cooling_map0 {
 				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 };
 
+/*
+ * Please note that overriding compatibles is a discouraged practice and is a
+ * clear indication of nodes not being, well, compatible!
+ *
+ * This is a special case, where the GPU is the same as MT8188, but with one
+ * of the cores fused out in this lower-binned SoC.
+ */
+&gpu {
+	compatible = "mediatek,mt8370-mali", "arm,mali-valhall-jm";
+
+	power-domains = <&spm MT8188_POWER_DOMAIN_MFG2>,
+			<&spm MT8188_POWER_DOMAIN_MFG3>;
+
+	power-domain-names = "core0", "core1";
+};
+
 &ppi_cluster0 {
 	affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
 };

-- 
2.49.0


