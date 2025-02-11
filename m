Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A93C021A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 14:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGS99IR6r+vXb195phTJWqUilac9XLQ8gIYYmxhuvCY=; b=1uH7dxOnYb0KUFpnYi52lZV4B9
	OYt60yGcdd6F22zUaoN0E1ICVYmqsBDok/vtPx31KxKGISkXOMl5WcNrsLCUAaDUVpblt2unvRLO/
	F8sisS9exlkvyUU8z3gCxV/qspRpedBm3vGZ4pII3fUH09EdW4n7WC+K3QJDIkBRa4MCEoChB7pW+
	sblL9djWL4rsRQM9scvwvxqFyre+42CSfLOJeOXAZO9nFHpIImSrEaiQgj1wUvsVfmdWFxMRUqFQa
	jgA4NyE7YOTkz27HTPJU6b5p3Y5S0T4U+VYK6smtWgmjcEKMPgm2VHYLE7TTjMDsldFVwTvryzF/P
	f9t5aCRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thr7T-00000004605-0Iph;
	Tue, 11 Feb 2025 14:20:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thr1v-000000044sm-2ByR;
	Tue, 11 Feb 2025 14:14:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739283266;
	bh=r8GSQt4Fmtk2nUUtsyC/9rHcXIOOOzg63rG69cNIuyg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=laCkDPdTknse85VhAVNJGiJax/fYG8P+5oXXFk/i2BLlJUdp/VjazgWQlXPg4gX58
	 KnvtkuiXZaLTbMa4T9+YGkrvIi2YQ5FuLFRX7MIJsgg4FFiTh9mejtBJYXo97QPUdE
	 YqDPYTb6IIaz09HuftSoc5Q+gaIJscJI+kmLDGbiK5ayzTn1f3mljYFT4SnQYwu0UQ
	 7VIwC0FdZZB8hIviV1SeETqUdvhvVG43PiyMtbVHznMlLqpgmLQxr1slFzcKLhn7yg
	 DytAyLij5vj0ILhHQXmYl5XIQgFbldJ8Zzt1aQYBRC71WJXhgkCE/afpKq4JocZp7r
	 x8qTMi8figsQA==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0A64117E14D5;
	Tue, 11 Feb 2025 15:14:24 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 11 Feb 2025 15:13:10 +0100
Subject: [PATCH v4 3/3] arm64: dts: mediatek: mt8370: Enable gpu support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-mt8370-enable-gpu-v4-3-77deb7a75c23@collabora.com>
References: <20250211-mt8370-enable-gpu-v4-0-77deb7a75c23@collabora.com>
In-Reply-To: <20250211-mt8370-enable-gpu-v4-0-77deb7a75c23@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739283261; l=1948;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=r8GSQt4Fmtk2nUUtsyC/9rHcXIOOOzg63rG69cNIuyg=;
 b=RVgfl0lBwwqykOnm/tB7a5QYLPJ6sXQ+7vvt2INaxPYJU0jW5tuJvYC24r5c3i3nKE+Ek1rWl
 bwgif4T/yvxDR5oWO/zeRR/Irr8/RIx77r+XCzRueqnHD/qvOk79nbZ
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_061427_740146_DEC25842 
X-CRM114-Status: GOOD (  12.30  )
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
2.48.1


