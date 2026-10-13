Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5B5CC6B16
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHkarczcbqlaN16UtCgQXuPxQyaPx2dVP2Mh65lyQMA=; b=Wzi2RxF221E3QrMeeyIgjGNIa3
	oqnvCt5e+TxRsG30UvNXbjoG7rHtsgjfU+h/siQ0vjNPDw3DuJgxlAyNRvEWhViOgb5bprJDUctZk
	GRyD0+rfDvywy4Fp4XaGgFSfbYbG9vdaWFbyVfHq9Jd00EpghPGmXg3bFU2QWmhlfcnGyFBmBQKBx
	QiibBNgBbT6zM3XIWLxi8Kr7GQBfSi1KrBeCJr01RK9rdaNobhEOeb4FbWlzdGOlAsKQp4UAwtgRG
	XOcV0Bol00vrL1jEhg5YJqnpEaiJPppkwgU6/EfXgvUeB+xNfOXp4CHqICyOdxX0Fr1BHnaJWRfzV
	L+FsCuaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGe3j-0000000DCoA-2zsZ;
	Tue, 13 Oct 2026 15:04:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGe3h-0000000DCnh-4AyN;
	Tue, 13 Oct 2026 15:04:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C2B244035;
	Tue, 13 Oct 2026 15:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D827C2BCF4;
	Tue, 13 Oct 2026 15:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791903893;
	bh=iGK+XDeF5LRCgZT6TVHdzPc2Nv4eswmoGZ7cthlsXwc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HzkVXpIKn7vH5c5cLxcFc8GvfZWYQjMAjRyKWp0LKIxLjELYN5tgXXMOVe7khRAkJ
	 JMm1mJ9JfRTvOiOCTipjarSVCnAdhnedS3let2X2S0fOImU1fxBDXy8AhVAfI/V+Um
	 o52NSxQfbgqCmMGzuhI/efZGnagXOJG0B9X4+wsAmKXqkci4aPysT+6RvX70tfH+1c
	 7zzMyq6Jnafh/F+1h4dcOGtal9urFaEmRuEID+6O1q4whq++zZeEeRoF2+olAwxdkz
	 rgSxEW9Gr80G6zLi+uDxqAdI4OYK8FCT6wf5uGEgQ4EG0GmqhT4UWDd8KXakgqc5Cg
	 FjxRcHWTpa8rQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A308CC6B0E;
	Tue, 13 Oct 2026 15:04:53 +0000 (UTC)
From: Mizuno Miotsuki via B4 Relay <devnull+founder.crepuse.com@kernel.org>
Date: Tue, 13 Oct 2026 23:04:52 +0800
Subject: [PATCH v3] arm64: dts: rockchip: add UNIHIKER M10 V1.2 touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-review-self-touchscreen-v3-20261013-v3-1-beec2a35cdb8@crepuse.com>
References: <20261013-review-self-touchscreen-v3-20261013-v3-0-beec2a35cdb8@crepuse.com>
In-Reply-To: <20261013-review-self-touchscreen-v3-20261013-v3-0-beec2a35cdb8@crepuse.com>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, conor+dt@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1528;
 i=founder@crepuse.com; s=20261012; h=from:subject:message-id;
 bh=niQemHq0zIYyejRqSf64CgT+VZtMHF21KC+IBXETBh4=;
 b=kA0DAAoWFtY8A0Xkb6QByyZiAGrOSJOg3Uk1iEB/UQW6AHIMhLgXnDiU/com3J6bMPYkquRg5
 4iRBAAWCgA5FiEEmxUHd8KDqNadkII+FtY8A0Xkb6QFAmrOSJMbFIAAAAAABAAObWFudTIsMi41
 KzEuMTIsMCwzAAoJEBbWPANF5G+k60YBAJhYsdJkB1AQZ/lpiN34RkGKJ+49aU5kZqH53WFi8OO
 HAQCi6cmGzLlP1oQ4AldK1QEhNyzjsfgcY19W2UmQtAzOBg==
X-Developer-Key: i=founder@crepuse.com; a=openpgp;
 fpr=9B150777C283A8D69D90823E16D63C0345E46FA4
X-Endpoint-Received: by B4 Relay for founder@crepuse.com/20261012 with
 auth_id=1166
X-Original-From: Mizuno Miotsuki <founder@crepuse.com>
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
Reply-To: founder@crepuse.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Mizuno Miotsuki <founder@crepuse.com>

Enable the NS2009 on I2C2 with the validated raw Z1 contact threshold and
Y-axis inversion. Connect its VDD to the existing always-on vcc_io supply.

The NS2009 VDD is connected to the board's common 3.3 V rail, represented
by vcc_io. This connection was verified by continuity measurements
against the exposed 3.3 V header. Additional measurements around the
SD/MMC interface and SoC decoupling capacitors are consistent with the
existing vcc_io supply topology.

Reuse the existing supply without adding an enable GPIO or changing its
shared supply constraints. The 10-pin NS2009 has no separate VREF pin.
PENIRQ routing has not been established; retain polling without declaring
an interrupt or claiming that the pin is disconnected.

Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>
---
 arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts b/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts
index 0c03f118378a..933d3a139ace 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts
@@ -134,6 +134,14 @@ &emmc {
 &i2c2 {
 	clock-frequency = <400000>;
 	status = "okay";
+
+	touchscreen@48 {
+		compatible = "nsiway,ns2009";
+		reg = <0x48>;
+		vdd-supply = <&vcc_io>;
+		touchscreen-min-pressure = <150>;
+		touchscreen-inverted-y;
+	};
 };
 
 &io_domains {

-- 
2.56.0



