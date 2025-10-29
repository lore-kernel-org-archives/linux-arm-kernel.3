Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5073CCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lS1Qd6sR7uUFGzDhmhX8T3I3V40n7u3ecG/l6fx2tC4=; b=mpJscQ8uYjyZqXy3t3CWc3wPZG
	PHltPpEoNcOZeBcrpYQvlx+/6wdEnuVGdRWAbqPS8yqEnDDvhPGnzd05tYMGoSzrrUQBH7rCwYyJo
	h3wRVnn5LDt1Mz7uKu/uUjMyfulgWjuFzxIifhsWzuxAUvNWBn2rKq/Bkl6QEXJKaQu3RuJAyrYuy
	iio1YNKp4+F/abxujkdpLMd9zfT7OttszXQmZYyOLjOSgDhZuzhbvjvsLHXXlerqPdNAVraHBlpIv
	xXAQmpE4l1hKd2sC6KE8JE+uI47o/LGGEx/nBpPlMQQ1ICxM7433A89DkJL1l05+TYn38nlipuz3m
	aVoihsPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6aC-00000001Rha-3w3C;
	Wed, 29 Oct 2025 13:51:24 +0000
Received: from smtp-42af.mail.infomaniak.ch ([2001:1600:7:10::42af])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6a9-00000001Rf2-1Lwm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 13:51:23 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cxTDL1QMfz9X7;
	Wed, 29 Oct 2025 14:51:14 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cxTDK1V4Rz5F0;
	Wed, 29 Oct 2025 14:51:13 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Wed, 29 Oct 2025 14:50:59 +0100
Subject: [PATCH] arm64: dts: rockchip: include rk3399-base instead of
 rk3399 in rk3399-op1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-rk3399-op1-include-v1-1-2472ee60e7f8@cherry.de>
X-B4-Tracking: v=1; b=H4sIAMIbAmkC/x3MSwqAMAwA0atI1gaaVoV4FXHhJ2pQqrQognh3i
 8u3mHkgSlCJUGcPBLk06u4TKM9gWDo/C+qYDNbYkoxlDKtzzLgfhOqH7RwFe0fUF0IVG4YUHkE
 mvf9p077vB4K2Eq9kAAAA
X-Change-ID: 20251029-rk3399-op1-include-b311b4e16909
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Dragan Simic <dsimic@manjaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_065121_496664_2E20AB4E 
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

From: Quentin Schulz <quentin.schulz@cherry.de>

In commit 296602b8e5f7 ("arm64: dts: rockchip: Move RK3399 OPPs to dtsi
files for SoC variants"), everything shared between variants of RK3399
was put into rk3399-base.dtsi and the rest in variant-specific DTSI,
such as rk3399-t, rk3399-op1, rk3399, etc.
Therefore, the variant-specific DTSI should include rk3399-base.dtsi and
not another variant's DTSI.

rk3399-op1 wrongly includes rk3399 (a variant) DTSI instead of
rk3399-base DTSI, let's fix this oversight by including the intended
DTSI.

Fortunately, this had no impact on the resulting DTB since all nodes
were named the same and all node properties were overridden in
rk3399-op1.dtsi. This was checked by doing a checksum of rk3399-op1 DTBs
before and after this commit.

No intended change in behavior.

Fixes: 296602b8e5f7 ("arm64: dts: rockchip: Move RK3399 OPPs to dtsi files for SoC variants")
Cc: stable@vger.kernel.org
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi
index c4f4f1ff6117b..9da6fd82e46b2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi
@@ -3,7 +3,7 @@
  * Copyright (c) 2016-2017 Fuzhou Rockchip Electronics Co., Ltd
  */
 
-#include "rk3399.dtsi"
+#include "rk3399-base.dtsi"
 
 / {
 	cluster0_opp: opp-table-0 {

---
base-commit: e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
change-id: 20251029-rk3399-op1-include-b311b4e16909

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


