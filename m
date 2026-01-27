Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47AFD2F036
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iLpcUMzrfi1cf21OsQRIeFglEgABcn83FXe046wtc6w=; b=K3DlGyY2ZB9nDkRxIYzSJI/hFW
	Xri/X4PuFsWRCbRmrA9DCentg3Y4ToxnrxGhyGPXGFeYdLyivcjG0qXozZB14rIo3JqaD7PsA6cBI
	5p8mogEyiv0nL5+wy1VYvdT7YNZKNrYqWG4FVCEgUk1vm91M+Gw1oWmw32XUkRyDX3NZC9Zglbphb
	Kp6OXGytHNK9Jya3uXMXhACZ6ETkwJ/9epbLMo92Lp6pWbxPg5+GUpTEPR+TKnnDOVGHcEZihb1Gx
	l5zvJFDw96szoODt+QxzJyWfTi+d2NMtYO92zz9rgw0VdOBIxjKFlAjoHgXVXHGAInKf+Ddi6UZ72
	uoKVIF2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjkK-0000000EMbM-3pdb;
	Tue, 27 Jan 2026 14:08:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkjk9-0000000EMYk-3s8R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iLpcUMzrfi1cf21OsQRIeFglEgABcn83FXe046wtc6w=; b=vujvGTdyKGu+sOwB9NiLH6Yx+9
	pZMjRz6QtgTMxR4KwCmFI6SiPV+n5BAM09uStkt/juZ9MEtngpAnJPV/BR0HPiQSoYbgQVlMR5iiD
	qLq0IDkER5aKog+Fg9/QoQ0ieMfsHB8+S7/2pKsz5Y7Q+wkp7U7Md/YFkYKvVZGs/PGA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vkjjw-004xlG-0i; Tue, 27 Jan 2026 15:08:20 +0100
Date: Tue, 27 Jan 2026 15:08:20 +0100
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
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] clk: vf610: Add support for the Ethernet switch clocks
Message-ID: <2ce32d04-ac62-4e66-bf76-9d99b94c1a4b@lunn.ch>
References: <20260127085150.3040586-1-lukma@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127085150.3040586-1-lukma@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_060833_960889_054C8328 
X-CRM114-Status: GOOD (  15.03  )
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

On Tue, Jan 27, 2026 at 09:51:50AM +0100, Lukasz Majewski wrote:
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
> The VF610_CLK_END has been removed from dt-bindings, as its number had to
> be increased when MTIP L2 switch clocks were added, and defined locally
> in clk-vf610.c driver.

The nice thing about having it in vf610-clock.h was that it was clear
that whenever a new clock is added, the value needed to change. It is
now hidden away. It could well be more clocks are added, the value
does not get updated, and in use we go passed the end of the clk[]
array, and probably corrupt the struct clk_onecell_data clk_data.

I would probably add a comment in vf610-clock.h about this.

Apart from that:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

