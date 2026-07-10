Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C8EC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 22:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zuFIKCMIp4rk2KykuL3CFyDI92ay/8qNKtBbRjiOu0w=; b=l0aooRX4feGFevrVYR9pSwvRzZ
	OIdjm7NfD4tbRQLgZr5jsoaHxXk9t09yshnJ9DvX2WyOASFjiJ5DnN9Pn9yR2aCKBXdvzpZThpdEL
	anmDXD3+A7RZFtmMJmA2wyTSGhFiEF/TrZPPcHyGLKpkN/NS4yKzBj6YsPSsNUpccx22CHlt6264F
	POJmF4+JlD6BXQiAX15Y7Kqy9ceu+qWCiNCFfaKb4/7dbaKaLlx9V3wh1l21qxo5ARWWUsvSr2TW7
	XKH/jGGU9KTOytQPVOX9fCnshXlng31m92V2H1TzNgQYE0mRV5wMHM7NpOJ4y0/miuy9O8b9GjB0C
	2eyyTeCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiJSR-00000005ubi-24du;
	Fri, 10 Jul 2026 22:12:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiJS9-00000005uEM-2qWP;
	Fri, 10 Jul 2026 22:12:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB7A24401A;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD083C2BCF5;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783721532;
	bh=npo/fLTvxFH33okSDT5hZKC/JT24REZBjA22Ob+RouA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I8IDNeXMArCfAAmS8GIMYCCXhI7sDQDIQvj/oDKML9nt5yWyqwzV0Zy3P9CIB0zDr
	 0JUFdwAVdV83kxDM0hJPrXEBcC9+IOpBpveZvX/gfebf5jkiYYJ5vP3CoJ6h7opg5D
	 hw5C1RfnlKQP9xBNeRi1C93OrrNqRTViwUDR3fEjSe1lP25mwMpPtFLRqHfAEcFyeh
	 +83WS1p6yYPjYaUCJM+iO+qKBdNJ+W/G16ZicJvrHHY2kcVtvQgToSRAtWs188YdLp
	 ZGdHEe0snZZC/TOvuwX6zGtMZaoRXa5qOhlKVIFG4oLAGoq9DUYdyhFYjt3k2jj/zT
	 f71KC9JcqQCOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD21C44501;
	Fri, 10 Jul 2026 22:12:12 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sat, 11 Jul 2026 00:11:57 +0200
Subject: [PATCH v2 08/12] arm64: dts: rockchip: rk3588s-nanopi: remove
 always-on from vdd_npu_s0 reg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-nanopi-m6-v2-8-422675a65402@gmail.com>
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
In-Reply-To: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783721530; l=747;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=xYuB/QxuBX7PA9bPdFQENsiRAGCOhRcwISiBdc/4PZo=;
 b=zNPJIUAv39IhWBBp4hPXN/+Mdg2AZuPIoZQUvjVmpCqcOMtrlf9Q+MagrqGkdYVHW2w5auiuE
 9V3jxkXiB9ECsM7tN2ijroXuqa0BBprLF0YEiOXZHTKvJh33HHQmRzc
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
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
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Since the NPU is hooked up on these the always-on isn't needed anymore.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index bcb2f5d63a61..463cfeddf270 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -258,7 +258,6 @@ vdd_npu_s0: regulator@42 {
 		regulator-max-microvolt = <950000>;
 		regulator-ramp-delay = <2300>;
 		regulator-boot-on;
-		regulator-always-on;
 		vin-supply = <&vcc5v0_sys>;
 
 		regulator-state-mem {

-- 
2.55.0



