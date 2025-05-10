Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD10CC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 16:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLIN5fxRX4VOtH6/6HLlKgRiyWKCDkOklPEcf7jmrxQ=; b=SNjJyOvC8GOdV7auFiYcBitWYn
	kDw6CAHxCgZYMRGh5tJg8at/Io1puqlLpuwoDKYITI7AJTrPWj4kohDSuj+6nn/dp7reneGfhzyoz
	tkwRIi+WUQk5KsaQqA3MJtqlwDf8pFROTLozBJ+SJJPUfEEgXelg6ORcxHBKJHo4RIp+GGHJHtBuy
	cKFcfpEm+nuADOZf7EBJgzBty2iJ/S3NILcSjooDxG34mWn/TgayjKdzzx9XpCJszEp5gzV8kVz6f
	1us2JGgZEY7wUi851hnGXhic7FdYP3NhoWHvNvt8e7SPmIR3F9e+JQ/FcIe02RN66t9HhwqMHhgfP
	Opf6KCmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDmxs-00000006A9p-20g8;
	Sat, 10 May 2025 16:22:16 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDmpy-000000069T5-2Opf;
	Sat, 10 May 2025 16:14:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=JLIN5fxRX4VOtH6/6HLlKgRiyWKCDkOklPEcf7jmrxQ=; b=WF/gySV5cbJfWSI0l5mxymQ0NC
	TdmvJNEqSyZ9xgsaK3ykNDAizyDrVJWiBS32MJhm/xd2vyg2dJLsOfiFLk3InaRMXw1jzryunuzxF
	6K5kEkUvgbMQovLYcjAPB6YpQvOZhqmwa6w6sZ5rULhxfpLnIyGr5otfY7fqun1WkWTlQhGFuKBCb
	+I+yb81C+s6BUyq2xhMnPbXZ/wMYfLhTE7Uvg1QTWvPl8JF3aLfMtDT4cMhYCHfhT4TGXza3HnDts
	jLCLZ3MhqBPfCFklDqv9prIlH+1cW9NO1wK5022wjMPMGafEmdyHI6CZv6UW+Q2Nkamus+YzA+LmQ
	XAZqsdGg==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDmpZ-0000dK-JW; Sat, 10 May 2025 18:13:41 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	Frank Wang <frank.wang@rock-chips.com>,
	Yao Zi <ziyao@disroot.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Johan Jonker <jbx6244@gmail.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Junhao Xie <bigfoot@classfun.cn>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>,
	Rob Herring <robh@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	linux-kernel@vger.kernel.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: Re: [PATCH v7 0/5] rockchip: Add rk3562 SoC and evb support
Date: Sat, 10 May 2025 18:13:29 +0200
Message-ID: <174689356073.2086280.3221223912483379818.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250509102308.761424-1-kever.yang@rock-chips.com>
References: <20250509102308.761424-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_091406_608925_EA6982F9 
X-CRM114-Status: GOOD (  11.86  )
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


On Fri, 09 May 2025 18:23:03 +0800, Kever Yang wrote:
> Patch series v6 remove USB and watchdog nodes, for relate patches not
> land recently although they have got review tag. Let's make the main dts
> get land first and then add relate dts node back when the driver patches
> get land.
> 
> Patch series V5 remove [v4 1/7] which had taken by Manivannan, and move
> scmi-shmem from soc node to reserved memory.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: rockchip: pmu: Add rk3562 compatible
      commit: 01ccbe64f9e5702a530cca614f203d71462c67e1
[2/5] dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
      commit: 472a4e77a2070ffbf47eb6c934ae56d362eae992
[3/5] dt-bindings: arm: rockchip: Add rk3562 evb2 board
      commit: b7016249819f5b61c5e59cea36e8c261091b48b3
[4/5] arm64: dts: rockchip: add core dtsi for RK3562 SoC
      commit: 29d0ba2d31b88fae0841daea3e3e1382d1b6687d
[5/5] arm64: dts: rockchip: Add RK3562 evb2 devicetree
      commit: 77f1ddac57404cc8e8e73e08ad405cd1f7b353ac

I've moved the PD_foo constants to their numerical values temporarily
and prepared a patch to move them back after the 6.16 merge window.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

