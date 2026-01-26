Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138A6D13C3E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 15:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bxk/uEW0KP9Vda/3cxHnt1EEylgRwLtuxYT78ZkzzY=; b=nAm9kcteWExHT+YzpeK33DILA9
	NxxV2kpFDgtJHjRWIZw8bflYp+LTwcjhHpPWWK4a0WEI+Bt6GUh+38AIHNbhAGJ662/PwM9Iu/Tw1
	JydB7ZAS4D4h4PqXoUZrLghoGDMM3n53NU5JllDjfr6lXE3iCDNMGun/l8coTNSb00Csk0zDXDrJs
	pUAPzCqUDUSrU9VV+REc5g92iqPgvSH95xbGGf4lp7EclTODoXJQ6V2ok0rnGtnn5OemV8JB/8g/3
	YEWsyP+Kd3FUKo0web7n/C+Iijs7q4lJ9X5biesYQhJG8kzuHq2K6CTOo3CKC4wqfPB086H+KtmQ8
	2jkveC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkOsJ-0000000CnLF-0Y8F;
	Mon, 26 Jan 2026 15:51:35 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkOsG-0000000CnKE-0tkq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 15:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9bxk/uEW0KP9Vda/3cxHnt1EEylgRwLtuxYT78ZkzzY=; b=UWtxI+NqF4QX3O6jvd5PPFrtDN
	K+ZF4VGYEsIYqw8+VZzdlv4Uo7iX7Ey7HGGCQoLuIPOxjXTVTXylucK0Hf0vLG1OmU4FajWSnOvfI
	KOmsEKJtkYs301A7+C/V2d+9VrwYD3leQ8nX7rvukWWq9VC5VihVczGeiHjBhHFlYoPg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vkOs4-004oFs-Hw; Mon, 26 Jan 2026 16:51:20 +0100
Date: Mon, 26 Jan 2026 16:51:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH v2] clk: vf610: Add support for the Ethernet switch clocks
Message-ID: <7671b833-f823-44cd-b5af-0b473a8ae23e@lunn.ch>
References: <20260126115349.1750578-1-lukma@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126115349.1750578-1-lukma@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_075132_255909_65B8427B 
X-CRM114-Status: GOOD (  16.91  )
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

On Mon, Jan 26, 2026 at 12:53:49PM +0100, Lukasz Majewski wrote:
> From: Lukasz Majewski <lukma@denx.de>
> 
> The vf610 device has built in the MoreThanIP L2 switch. For proper
> operation it is required to enable ESW and MAC table lookup clocks.
> 
> The MAC table spans from 0x400E_C000 for 0x4000 and it is necessary
> to provide clocks for each AIPS1-"slot", which size is 0x1000
> (hence four separate entries).
> 
> Those can be enabled via clock gating CCM_CCGR10 register (0x4006_B068).
> 
> This patch also adds VF610_CLK_ESW and VF610_CLK_ESW_MAC_TAB{0123}
> macros definitions for L2 switch.
> 
> The VF610_CLK_END has been removed as its number had to be increased
> when MTIP L2 switch clocks were added.
> 
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> ---
> Changes for v2:
> - Squash clock DT bindings to this single patch
> - Replace VF610_CLK_END with VF610_CLK_ESW_MAC_TAB3 + 1

I'm not sure this is the correct thing to do. Normally these _END
values are there so you don't need to change any code when new things
are added to the list. 

Why not just keep VF610_CLK_END at the end, with the value of 196?

    Andrew

