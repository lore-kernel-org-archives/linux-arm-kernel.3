Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED1DC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 22:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBMtNI6cTtuuD6FKdLMsNoUStz5+7O3bDHN29nw5LRw=; b=Gs0NOkDAPSEcFjd0KDQFF2/nDy
	S+0fdP0Nbdka5DIA2QMpmD3b4xWnYAA8zBIDZwdaqPtqWsH8LL0HYKvJtu4wIwkxT9tbf/Nj+07o+
	1v2eoywU2I+IumUrlqxmzJwOwBM/jgp2E/XnXeKgLE+AAMUcjhlrDfzxAtep97fl20lL0Cb/WHWzV
	3zgZ+o1VFcbEulJHvZe3LYVMBa8uQgLb1O9df8dRjiEBnp43Vdhm0QIyK+5lkUljqp6NB0+UU7eSb
	YioQz08SwEPpDcWn1d17sH3zpXHJEvVBhOTnIe7dwIszdSFCHFfLkpbl/Qmd/WoJmLpEtNdCaHE3l
	OZybAVpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGmI3-00000007bf1-39Sz;
	Sun, 18 May 2025 22:15:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGm8A-00000007aG7-1MUg;
	Sun, 18 May 2025 22:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=GBMtNI6cTtuuD6FKdLMsNoUStz5+7O3bDHN29nw5LRw=; b=BIDI9BIFqqrHzG9df7pynEaLxP
	gchll30OIePpoSQ0XgeGkB1/cF7YXTk6kioXpeBZfcxcC4pOWpE3BeCtdRDnAxENlyfDjQg2JdMlR
	KKFf0ulV3w+81HTR1eezkPFakVARPsUDNIElbIQhjjkOErBxIrqipPtzwuejnP51BlMKiCjxNArSk
	5O35CJbz4zb3uUuPKfmJrVbmW+5dtnIWcWVjYX0nB5RqF6Un/z6r2OJNC8OEW65pap25nlvzqi5SM
	/fE41RP0nOmHQ39EaGctpElz3D1fCUSDEyobqzfWB+r7zTUlvbmrWB5IpCr+wPVO667yHrE/8UgVa
	4+b0gyJQ==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uGm7z-0004gv-SL; Mon, 19 May 2025 00:05:03 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ziyao@disroot.org,
	kever.yang@rock-chips.com,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] arm64: dts: rockchip: remove a double-empty line from rk3576 core dtsi
Date: Mon, 19 May 2025 00:04:45 +0200
Message-ID: <20250518220449.2722673-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250518220449.2722673-1-heiko@sntech.de>
References: <20250518220449.2722673-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_150514_382470_492F9896 
X-CRM114-Status: GOOD (  10.68  )
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

Two empty lines between nodes, is one too many.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 0e0a37849874..b6e946e68b09 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -2000,7 +2000,6 @@ i2c5: i2c@2ac80000 {
 			status = "disabled";
 		};
 
-
 		i2c6: i2c@2ac90000 {
 			compatible = "rockchip,rk3576-i2c", "rockchip,rk3399-i2c";
 			reg = <0x0 0x2ac90000 0x0 0x1000>;
-- 
2.47.2


