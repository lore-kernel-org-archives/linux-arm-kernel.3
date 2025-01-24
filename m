Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E2CC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 06:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ioNYi1LZ2VVOSFcqdaBC9gwtOsuOjZpbh3YO049b9E=; b=y+465nchEvizBx35c1AfiZaKl6
	GYE83c8Q24jdkMm6cNum8pYK48hxB9Pv13bOqt5l0srQo5pMHJTjfcsBN5sldfsSpbfbEwnX7vq/g
	0Ca6wmBTZjoZo3a3uWqtkwoC3QOzXRCeV7diK3s+6svQMLJmXU+qzG/xHM2ZJrr2HefUF4l39FxHI
	H30ZTn9UkbhaO1TLGnPjXZnk4VZer5CyuaQh8KzO/td6Zqfq2lqu2qiZOmDUl7GPaBRJzqE8OttE7
	gJiGOLiM7zCgMn4KMuZwS3Vn7BgGGLSMJ/4RhKv7kx6cthJEsWIgq1IBHxTS3Q7muM1tQzU0lo/wU
	7mkJFdOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbDVK-0000000E2W7-460P;
	Fri, 24 Jan 2025 06:49:22 +0000
Received: from mail-m49251.qiye.163.com ([45.254.49.251])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbDSc-0000000E1hG-0PhF;
	Fri, 24 Jan 2025 06:46:36 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 994456f1;
	Fri, 24 Jan 2025 14:46:25 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	kever.yang@rock-chips.com,
	zhangqing@rock-chips.com,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 2/3] Revert "arm64: dts: rockchip: Increase VOP clk rate on RK3328"
Date: Fri, 24 Jan 2025 14:46:18 +0800
Message-Id: <20250124064619.13893-3-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250124064619.13893-1-zhangqing@rock-chips.com>
References: <20250124064619.13893-1-zhangqing@rock-chips.com>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGklJQlZNS0wfSksZGE8ZHxlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94970fd93d03a3kunm994456f1
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PiI6LDo4DjIVPCENERIiDB8B
	LUsKCj1VSlVKTEhMTEtKSkNMSkpDVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUJDSzcG
DKIM-Signature: a=rsa-sha256;
	b=M/D6kNNGvDab4mQZLgZ+1qvY209zaiG70aPm2+DyB9v13jgL7GYT1giZyxNgxkSYMCIYnZTZciSf/ITmhRURDVPp3SJotGsa8gJFkqCEJUmadhyPCtaZiuq7vKSDxTWaudMQlc7kK3L7sQ9u7hSDXLvnVVuznN5FTX6xYGYhyjg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=4ioNYi1LZ2VVOSFcqdaBC9gwtOsuOjZpbh3YO049b9E=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_224634_609222_AF179044 
X-CRM114-Status: UNSURE (   8.69  )
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

This reverts commit 0f2ddb128fa20f8441d903285632f2c69e90fae1.

Before changing the PLL frequency, in order to avoid overclocking the
child clock, set the child clock to a large div first, and then set the
CLK as required after the PLL is set.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 7d992c3c01ce..f3ef8cbfbdae 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -852,8 +852,8 @@
 			<0>, <24000000>,
 			<24000000>, <24000000>,
 			<15000000>, <15000000>,
-			<300000000>, <100000000>,
-			<400000000>, <100000000>,
+			<100000000>, <100000000>,
+			<100000000>, <100000000>,
 			<50000000>, <100000000>,
 			<100000000>, <100000000>,
 			<50000000>, <50000000>,
-- 
2.17.1


