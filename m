Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D77C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 21:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rA13CpEHgxDzbzqfTuPWxhWIE+MCvGZMMKH7aM9bsl8=; b=rmogkGa5YOxZoEGx6RTjmoXT/P
	P35wnCrQmuGDjX47sDVpH2vDhnQT00klXSMlehH3zDXcHDhcvyQLCZxVEioWhu70PeWni8HIO0d4j
	cCuvtD4njggn2Hw8g0izvAADHtVhrUZZGbHsKnB1uOrHZJ9tAbIWvLwIsOFCDVI+j/2E2kS+JOjc7
	Cd35mp11P7CHBt5THeMV1H4U89dRszyPjO+wWqu9W9r81Ql/Gtnh/MgpUIvfQHeQEYa2SME9Ljizc
	zgig1Ltcty597lMNKIFo33HG4WCY5Ew1GY4abpywipy2tWWoYOG8IPdLZTSFY5Px9L27e1Aov4eBc
	1t3pAFQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjNIm-0000000AN1E-3Xex;
	Mon, 13 Jul 2026 20:30:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjNIk-0000000AMxX-0UbC;
	Mon, 13 Jul 2026 20:30:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B43043B54;
	Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E8A0C2BCF5;
	Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783974653;
	bh=7Peo8R+rVWVG6kWFFJl2L+ChHy1rf0XLf1HZKdhDLPk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ttBVqn+mIEZ+/Hknekk8cZ6TV5BToIU2g6JOjoHmVJ758E8EtL69yPmyLlqTLt6C6
	 iuN8l2j+tT/+Mt/H1ObpNuym/DCtuxMQOkTTzK++C8fBDhFUKki3/Y2TWdJl4tdUl/
	 rGm1qM5E3XKZwFbM/psHhQ8IMwzTI84gu2YVMhF7zHQtJJSZ/Jez0wNk9kv2BbLFxp
	 XdZ0kTotisyZpKIIPO3k6fQECHqf37RIJKh8b8kY0gqrfMdViFskie0GclOSIjV4Md
	 3Bb5XOqmthSNTHUmpJs59DTxgtAjWL1CsHq68wpOnE6aOnnqm3CAT6UBd62V8uX9L/
	 Gu1BpxUV+1jyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBFCC43458;
	Mon, 13 Jul 2026 20:30:53 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Mon, 13 Jul 2026 22:30:12 +0200
Subject: [PATCH v3 08/12] arm64: dts: rockchip: rk3588s-nanopi-r6: add
 gmac1 add phy-supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-nanopi-m6-v3-8-227567ffc5dc@gmail.com>
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
In-Reply-To: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, diederik@cknow-tech.com, 
 jonas@kwiboo.se, Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783974651; l=744;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=VtXwxo9nIN5ynn514KiA+OPs3fVdBgCDqzICxbxr++4=;
 b=Dvi+F3ftfPLt06D3Meo0CNMOK3lLnZNvTzlNhCC52I6re/leQxduNp87Lcsr5pPVJB0XI7URu
 iZ2xtWQ3y2kC1IUphJLjgJYZ8i2I2w3iwExINEhx9fc/bNaMOUwL7rX
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

The RTL8211F Ethernet phy is power from the VCC_3V3_S3 rail.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index b0a92f3174e2..aa074ecda050 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -210,6 +210,7 @@ &gmac1 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
 	phy-mode = "rgmii-rxid";
+	phy-supply = <&vcc_3v3_s3>;
 	pinctrl-0 = <&gmac1_miim
 		     &gmac1_tx_bus2
 		     &gmac1_rx_bus2

-- 
2.55.0



