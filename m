Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7ADED7B9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 10:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8QHOy3ra4IFny5Ey993K5xs59jKtguHgSHZvIpWKPQ=; b=CKwW7ndVqRMnMfqw9J3pKVBVU2
	8LCagLyZkhWJ7SJpAQfhiBtV0dgE4RDX8QucioIdk5+WrLpd8g5UKP9nrDhsbN/pQ93dzhrQvzoZ0
	oFK+aVOb+A+rekzZ+RhsfECaAcp9MotgMF8i8oM4ymiN63mV40K4tNGsvs6QrVJzAgFw3yMT+wPWn
	JeKfGBKY/xg6yciQIsTDJsT5uGPULrZaEpcLxl0ntpm7YNuILU87TWEQdZ2Cq6UC+naYa7gCT8LXt
	myoacFQpgYEqRXq9K/5RU9K5jlkFX27tM82JUvvne+qIH2PjhAFJMtGeVmJfh21ndcgRegKxY/Vyt
	DAwpZVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCb5f-0000000H9Yl-3Qva;
	Tue, 14 Apr 2026 10:33:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCb5a-0000000H9TZ-0VDH;
	Tue, 14 Apr 2026 10:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776162827;
	bh=KWcYLXR3SCPD4C4XGxkdTEzImPQ+OVS9H3Ad1rh1FyA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mO+YCPRQY0Um27I97agmSipFvat9xgRgWeZT5YVVyjbLYVxla161R75A6KtT+yV7E
	 0DZACVmJ+8Wg4B7AXfyXAK432iYxWWm+XCbWXNXyxJWuegCWpBKFRQcU3n2MrXef+Z
	 kdUz2WnA4HGYW8Es9K4evCrHcMadq9sIkqgsxNHbMVSFDd6OMAwCBQbBQloYb+uo0/
	 N5gb3fsxvPQZe3EIPskycMo7reNqd6KKSWcMY0CFrr44A8meJNb4P8fiNh2mgKPGXQ
	 Uj70dglaRGzpwjBNlTjX5j+bjpsgAd97EkTUfSWTdS3/9GohSo+Ru440a5ByIxP3An
	 MKGl4KB4h55Pw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F377217E137E;
	Tue, 14 Apr 2026 12:33:46 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 14 Apr 2026 12:33:32 +0200
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8390-genio-common: add CPU
 power supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-mtk-g510-700-cpu-supplies-v1-2-3b8313e5ca8d@collabora.com>
References: <20260414-mtk-g510-700-cpu-supplies-v1-0-3b8313e5ca8d@collabora.com>
In-Reply-To: <20260414-mtk-g510-700-cpu-supplies-v1-0-3b8313e5ca8d@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776162824; l=1691;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=KWcYLXR3SCPD4C4XGxkdTEzImPQ+OVS9H3Ad1rh1FyA=;
 b=SSSvq5wiJytbcW9kvgsxYNwvEhUVwkMIDeNUu3F0c+VEXNOkB//PxCKZmiDmGa9QYaYqXJ2xm
 f+jBDRpcUDTDD7ZmE6EYVSxuX0tS68QXobkWZrVynQfqu805tIV66ly
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_033350_359579_559D293A 
X-CRM114-Status: UNSURE (   9.94  )
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

Mediatek Genio 510-EVK (MT8370) and 700-EVK (MT8390) devicetrees are
missing power supply definitions for all their CPU cores.

On the boards, the big core power is supplied by a MT6319 (sub PMIC),
and little core power by a MT6365 (main PMIC).

MT8370 and MT8390 SoC have the same core type (little cores are ARM
Cortex A55, big ones are A72), the same big core number (2) but MT8390
SoC has more little cores (6) than MT8370 SoC (only 4).

To handle the little core number difference, add in the board common
dtsi the power supply definitions for the common CPU core nodes (0-3,
6 and 7).
The power supplies for the additional MT8390 CPU core nodes (4 and 5)
will be added for the Genio 700 in a separate commit.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index aab474d6c5f8..9ebb222a877f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -285,6 +285,30 @@ &afe {
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu1 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu2 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu3 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu6 {
+	cpu-supply = <&mt6319_vbuck1>;
+};
+
+&cpu7 {
+	cpu-supply = <&mt6319_vbuck1>;
+};
+
 &disp_dsi0 {
 	#address-cells = <1>;
 	#size-cells = <0>;

-- 
2.53.0


