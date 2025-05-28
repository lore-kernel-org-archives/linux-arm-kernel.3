Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A38C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+FDShjpx6kGEUB2/dQKTjU6xdyCNeX5trpYm619UV4=; b=vZcA9tb6m954nfWvCBNUwS585B
	KfxLb7Phr1wbzLP4XZcywh65sz9uce+TbPd2obuGLVeV1ltnQld2SxXx+YhNjJ/jELya+ihQvScjd
	zhSC3tUn1gJHM2CDcT+j3YEQ0JKQxmV2Oba3LeSITo5LZXZv5M6CInDwpRPiay1seLBPjU6LZFxaN
	sbIKiyKUDpjFLd2obVdQGlHKspRXKrYF4KUy7TTZYB+4lIp7J7VUfrI0q/D6CiOOifpSLRrW0BuVC
	x0m7cMVoIR1klKmFg6rlmDPv7j6UsIjwPXut5EuXcM4vt+A38GTbKXTTn6GB/1iI8v66kNwRAiKO9
	dZ6gn9lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHuT-0000000DR76-22h8;
	Wed, 28 May 2025 14:37:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHpq-0000000DPQt-3ka7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 14:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=U+FDShjpx6kGEUB2/dQKTjU6xdyCNeX5trpYm619UV4=; b=0g0dZYmb7qFGfQ6Gt46nLap1SM
	L54LEYGcitbtYKGtm9Fz/qwyr1CXW4N6f2R0fuO8qrUfCyopQMDIvPocpm79WXDEZ6nYQVga+Dxli
	tsnaCIBD9NDb0B3YXnWZ5FFmDWioIi3kERl1fFLstxdirVcevQWSL3slMVX/xcjm6J5fzLvljyKX6
	DuK4Lq/+Zgs3yg0vnTiIurv7ny7d2x+Y9Ynr+4A6DwvY/9aZcbAAWJkLUC6TfjccvbKpNqTSjRuog
	bu18UN9MXxuWyUJKrjjFyQjmJRpewfpkHUvev73LP6t2aRCste0h1QQmVmxs7Gwy0RQL8nQ5uYkcl
	GCfODJSw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38612)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uKHpN-0000Ns-0k;
	Wed, 28 May 2025 15:32:21 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uKHpF-0002UB-2v;
	Wed, 28 May 2025 15:32:13 +0100
Date: Wed, 28 May 2025 15:32:13 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: weishangjuan@eswincomputing.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	vladimir.oltean@nxp.com, yong.liang.choong@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, inochiama@gmail.com,
	jan.petrous@oss.nxp.com, jszhang@kernel.org, p.zabel@pengutronix.de,
	0x1207@gmail.com, boon.khai.ng@altera.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, lizhi2@eswincomputing.com
Subject: Re: [PATCH v2 2/2] =?iso-8859-1?Q?ethernet?=
 =?iso-8859-1?B?OqBlc3dpbjqgQWRkoGVpYzc3MDCgZXRoZXJuZXSgZHJpdmVy?=
Message-ID: <aDcebRguDnM7sqVk@shell.armlinux.org.uk>
References: <20250528041455.878-1-weishangjuan@eswincomputing.com>
 <20250528041634.912-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528041634.912-1-weishangjuan@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_073250_931435_E8F80F44 
X-CRM114-Status: GOOD (  13.96  )
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

On Wed, May 28, 2025 at 12:16:25PM +0800, weishangjuan@eswincomputing.com wrote:
> +static struct clk *dwc_eth_find_clk(struct plat_stmmacenet_data *plat_dat,
> +				    const char *name)
> +{
> +	for (int i = 0; i < plat_dat->num_clks; i++)
> +		if (strcmp(plat_dat->clks[i].id, name) == 0)
> +			return plat_dat->clks[i].clk;
> +
> +	return NULL;
> +}

Okay, I think this driver is mindless copying of dwmac-dwc-qos-eth.c
between 24th February and 9th April 2025. I can say this because I added
this function to that driver and later removed it.

Looking at the rest of the code, I doubt this even does anything useful
(hence "mindless copying") as you're not fetching any clocks into this
array, and plat_dat->num_clks will be zero here. Thus, this will return
NULL. Therefore, you haven't thought about whether you need this or not,
but have just copied dwmac-dwc-qos-eth.c and then modified it until it
works for you.

You haven't acknowledged where you derived this code from - you've cut
the header of your source file out, and basically are claiming it to be
all your own work. I know this is rubbish for the reason I've stated
above. This is quite simply plagiarism. I am not impressed.

Thus I will end the review here, and simply state that this is not
acceptable.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

