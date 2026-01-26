Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5D4CF65F0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UibDLAu1ZOJZamqzcljENM4AlJU5unLjhVJzv+M3Js4=; b=lFQIwbReb1lmnmMwtaPZMXJilL
	stW8BLHe5wxvG37t+JvY43DTRgtA1F8niIbXuxT8zQ9973zc3BzlKt7M0nSuRDLsQtgBNgDPpnACr
	gbAQS0kX9vKxNSWmkoAhmqAR+QBxqLzquDgro3+88PSitOHZVeTrzed76sLcX3YgsYHBSXj409qX7
	XfQLd/UtxJ/qbmIXgUWifXer+mqg9NSKK61OD001Ow36j7oh3ddh7Tzr7uQexIE6ICcHtLxvc3sFj
	KpJldVapty2BGLBYpDQTHrvRT04ip6GyKbBE9sb9IPSU9CDHv9JQlDn27OWf5lppSovXpn1lW3tYD
	PvqKSMzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLlV-0000000CXb9-1SNw;
	Mon, 26 Jan 2026 12:32:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLlQ-0000000CXYw-1m1n;
	Mon, 26 Jan 2026 12:32:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1955D497;
	Mon, 26 Jan 2026 04:32:09 -0800 (PST)
Received: from 010265703453.arm.com (unknown [10.57.51.176])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D89F53F5CA;
	Mon, 26 Jan 2026 04:32:14 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: dts: rockchip: Describe HDMI supplies for nanopi4 boards
Date: Mon, 26 Jan 2026 12:32:05 +0000
Message-Id: <8c1837976937a0ef03811109ca12f353c4d5e67d.1767111968.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_043216_501043_58F7BFD6 
X-CRM114-Status: UNSURE (   8.70  )
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

We already describe the 0v9 and 1v8 rails used for analog supplies on
the nanopi4 boards, so hook them up to make the HDMI driver happy too.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
index c8eb5481f43d..9e4fea84c4fb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi
@@ -206,6 +206,8 @@ &gpu {
 };
 
 &hdmi {
+	avdd-0v9-supply = <&vcca0v9_s3>;
+	avdd-1v8-supply = <&vcca1v8_s3>;
 	ddc-i2c-bus = <&i2c7>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_cec>;
-- 
2.34.1


