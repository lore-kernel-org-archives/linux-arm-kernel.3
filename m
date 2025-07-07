Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC896C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 01:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brF/zDw0sd2Nm8qaLsv5n0JwfWWh4wIPcI3iGOB6FRs=; b=nDO/P38DGwDDpLdHBDPtoMJ8+S
	Bg1PI6z52TKnRFXGxHzFYpktGck2K94dVwqTa03VhQl2482oEJeLd2n7Pb7LHsDzT1cABKqtJ56mo
	nleEyEQjt+uGUN6/Z2+xPOfgF7QF3Ad3RRVQcCv2J92WGR6ZVTFWothgscVEsViSR+MosPzQwyJVW
	D/oQDerKX2cTMGoI9GkwyaU2XSPsakoos6m6pbXkD5uuZM58dfQwSqM4a/RT7120kFIW9RH43UHI4
	rjlo7ANhgJeYE9hQIvSNi5HSiK4P6HIT8fMmbOKRZwQeV4SL4rltn4jfkhK1BfNpXgxthm8hclSbN
	RAEqB38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYb81-00000001AFe-2WxE;
	Mon, 07 Jul 2025 01:58:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYb5g-00000001A32-1CKq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 01:56:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BF35451FE;
	Mon,  7 Jul 2025 01:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B0EC4CEED;
	Mon,  7 Jul 2025 01:56:18 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 12DC65F7C0;
	Mon,  7 Jul 2025 09:56:16 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20250628161608.3072968-1-wens@kernel.org>
References: <20250628161608.3072968-1-wens@kernel.org>
Subject: Re: [PATCH v3 0/5] arm64: allwinner: t527: Add OrangePi 4A board
Message-Id: <175185337604.2581101.17317086913285770626.b4-ty@csie.org>
Date: Mon, 07 Jul 2025 09:56:16 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_185620_351929_81C3F191 
X-CRM114-Status: UNSURE (   7.49  )
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

On Sun, 29 Jun 2025 00:16:03 +0800, Chen-Yu Tsai wrote:
> This is v3 of my OrangePi 4A series.
> 
> Changes since v2:
> - Actually include cpusldo regulator name change and axp323 aldo1/dldo1
>   comments
> - Fix indentation of comment in usb_otg block
> - Link to v2:
>   https://lore.kernel.org/all/20250625131652.1667345-1-wens@kernel.org/
> 
> [...]

Applied to sunxi/dt-for-6.17 in local tree, thanks!

[1/5] dt-bindings: arm: sunxi: Add Xunlong OrangePi 4A board
      commit: bbe7cf4bab161a50ce631c9dd7724df333cdf12d
[2/5] arm64: dts: allwinner: a523: Move mmc nodes to correct position
      commit: 6e2662c07a90e9f782158b7d6eda2766f65e9c36
[3/5] arm64: dts: allwinner: a523: Move rgmii0 pins to correct location
      commit: 84c4a16e00f5aadbb1a3bdecc6bbfee35b7c45c8
[4/5] arm64: dts: allwinner: a523: Add UART1 pins
      commit: 64f2f7bc4acb7928b39cac4a9a932e77b966f31c
[5/5] arm64: dts: allwinner: t527: Add OrangePi 4A board
      commit: de713ccb99345be302adf507274d1b190dd2302e

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


