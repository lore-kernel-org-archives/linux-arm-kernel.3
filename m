Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3168CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNAkko49dTDidf162I2tqiC5m5UzDfOqdx5rR96HDDk=; b=dJUFlzWxG8tox7rKF3Nl0dOSkw
	KPeCILY4Y/6ks9so6BhsVCLa0dS3FbzakuqVslHI7HFhpZQ2GTEloK0eVcfPFp+CTuPVAp77L8YtZ
	qAjjybPbA4xAGkCMyIlo6jN8g3qp17OfMwnTtZqKxmk247w0HSwUqIj82QnXbJOrbwbFBP+REsb3P
	n4R+bHvFE9I8eDMxZluOxzFntKB5prf8Vs+PGwXzGbSKezPc+eP8f44amGzLy7ZbmFnkph/+ANfkZ
	RpE5iwVdrRUMkbTnBGzeoQYnqHVe44ZNST22Cw7TvK7qvaDEPuFdVSwQOZ+/za6LqMjc8Y8k8uJA0
	iiUKzLCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1U0-00000003N0W-3kf1;
	Wed, 29 Apr 2026 09:45:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Tp-00000003MpG-0Wqs;
	Wed, 29 Apr 2026 09:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777455915;
	bh=p4MEP3L9VNLH+Cn6kf0XMFEk+CAUCXfGyjdiWLKVOEE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b5bzCSiba6tK9CUjPmhvn1T+PgQq3MjNvuYZ4H3L+/vsVyx6kYRFcZKf5q0cfae5P
	 fByVQ1fKkRhP5MUyQ6aZjgFJKXklPBF9NqJ9xnDGIFoy1H82wUHL6wROEfjicz+mKQ
	 vzer26wraCd1vmSROgy2EWi8OJOYj7EeSuLVLFWkc8HrwbPi46+Zr5vB4AAwadgVpe
	 rQfQJ+CXou71qOu8zT6nViB1Z+9tcRRRd47ua8pz5RcQ0EZjFSHeFfurQkmYf2/8zK
	 MKOsQNr73/OllDziu9kd/7UFlZBL6DrWTgEIypYtSHbwCzqg+LRvQhAEbZ42xLzPKX
	 tlqB4nfNsja7w==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A56317E0610;
	Wed, 29 Apr 2026 11:45:13 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Apr 2026 11:44:19 +0200
Subject: [PATCH 6/9] arm64: dts: mediatek: add MT6365 PMIC include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-mediatek-genio-mt6365-cleanup-v1-6-6f43838be92f@collabora.com>
References: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
In-Reply-To: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Chen Zhong <chen.zhong@mediatek.com>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-input@vger.kernel.org, linux-iio@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777455902; l=1462;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=p4MEP3L9VNLH+Cn6kf0XMFEk+CAUCXfGyjdiWLKVOEE=;
 b=cIv7I2oDrc2JeH5kitdA6FjUHF5HnTzvYLV7Djp0ttLAq3CM1FKLVVWIf7qy9RvUrnOD7cS67
 IMOa8qDeh3bAbe6YP9lUpIOSX9bFBFZFKuRYMPqkvYElwVEN5z5acWy
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_024517_312306_DE1BD112 
X-CRM114-Status: GOOD (  12.17  )
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

The MT6365 PMIC, compatible with MT6359 PMIC, never had its own include
file so the boards that integrates this PMIC used mt6359.dtsi in their
devicetree to enable its support.

So, add the mt6365 include file for the MT6365 definitions and labels.
In order not to duplicate all of them, make it include mt6359.dtsi and
override the compatible strings for the MFD main and sub devices with
the MT6365 ones.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6365.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6365.dtsi b/arch/arm64/boot/dts/mediatek/mt6365.dtsi
new file mode 100644
index 000000000000..ed4e349f63c9
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6365.dtsi
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2026 MediaTek Inc.
+ */
+
+#include "mt6359.dtsi"
+
+&pmic {
+	compatible = "mediatek,mt6365", "mediatek,mt6359";
+};
+
+&pmic_adc {
+	compatible = "mediatek,mt6365-auxadc", "mediatek,mt6359-auxadc";
+};
+
+mt6365codec: &mt6359codec {
+	compatible = "mediatek,mt6365-codec", "mediatek,mt6359-codec";
+};
+
+mt6365regulators: &mt6359regulators {
+	compatible = "mediatek,mt6365-regulator", "mediatek,mt6359-regulator";
+};
+
+mt6365rtc: &mt6359rtc{
+	compatible = "mediatek,mt6365-rtc", "mediatek,mt6358-rtc";
+};

-- 
2.54.0


