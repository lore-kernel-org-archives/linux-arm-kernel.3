Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321A2EA8109
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 12:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQMAkiZGrqwSgr5mZ517weGZSWnKuFxc8IpWTd0MF0M=; b=CSi0MJDjA4zWb/tx1abnzAmIUT
	eF+Huqo7UByzWXX6fg9QffGMxbEOc/59tA9U1Yc2Q3o0YW3q3Lx/cVbizi7/NsUX1RoZO4bLOTux8
	8W+JrQTnXPn8vFGdmtU6ATFTw+zdZOcRxryJSq5xYSKwgzIxQU5dhes81lSBq9s69mF4TtNX1JEej
	Vz6QP6hGe1wCNvVqMKylxsU9EWJUTvKsj8pbigOjzc/whQlqnMq8wrNsT1XN2gTJ85VlJ0UpGrGKy
	0SNGnMilKFHNHPh005Hmx8Gokv44CvpO0yaWQQV3QOTyitY5NAdlXORQqXnSkPynNR9kVGPR1vHv+
	ymI8pyig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpmtJ-0000000GwQM-3mgm;
	Tue, 10 Feb 2026 12:30:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpmtH-0000000GwPm-0Tqm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 12:30:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jQMAkiZGrqwSgr5mZ517weGZSWnKuFxc8IpWTd0MF0M=; b=G0IXE74WnLyWWegVxKpGZ9+KWe
	5EyQBMB4xTnAyP8jXnvWO7G/S1j2pDUelSQrb4jhmR0b0tk+xHy9vKXWKzP7SpFOM2EYJN65QDqTS
	CEV/UsrU1wA4L0Go1kVbZR/i8WeuAb1PzYg+vwI9hZPrdfDux0Jzza/T0zhVp6BXttvR6cvorAvH5
	2iIPbkIzZUYIii9jb6FBQD+JZtKTIcz1Uu6d7BFKgxMxc5M1mFcOX3GaApNV+cWf5oX6iwB0txSKI
	RVTa24Vm7/YEuppdiupb8HaEyKl/KD7gN1e8JQ4uP4X5KoznLNk3USPLSMM13fMpFbruKO2FO7ZjF
	HhMONwBw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39224)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vpmsz-000000002YE-3X4B;
	Tue, 10 Feb 2026 12:30:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vpmsw-000000002mM-2Z9r;
	Tue, 10 Feb 2026 12:30:30 +0000
Date: Tue, 10 Feb 2026 12:30:30 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
Subject: Re: Re: [PATCH v2 0/2] net: stmmac: eic7700: fix EIC7700 eth1 RX
 sampling timing
Message-ID: <aYsk5pnzVswdl_tf@shell.armlinux.org.uk>
References: <20260209094628.886-1-lizhi2@eswincomputing.com>
 <64bf6b40-b947-4ffa-8d48-4d6341931327@lunn.ch>
 <aYnvwAK3gpxBs-EF@shell.armlinux.org.uk>
 <5dea8ce0.4435.19c471231f5.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5dea8ce0.4435.19c471231f5.Coremail.lizhi2@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_043051_713316_DE9BACA4 
X-CRM114-Status: GOOD (  22.06  )
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

Hi,

On Tue, Feb 10, 2026 at 06:21:40PM +0800, 李志 wrote:
> > -----原始邮件-----
> > 发件人: "Russell King (Oracle)" <linux@armlinux.org.uk>
> > 发送时间:2026-02-09 22:31:28 (星期一)
> > 收件人: lizhi2@eswincomputing.com, "Andrew Lunn" <andrew@lunn.ch>
> > 抄送: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, ningyu@eswincomputing.com, linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
> > 主题: Re: [PATCH v2 0/2] net: stmmac: eic7700: fix EIC7700 eth1 RX sampling timing
> > 
> > On Mon, Feb 09, 2026 at 02:36:11PM +0100, Andrew Lunn wrote:
> > > On Mon, Feb 09, 2026 at 05:46:28PM +0800, lizhi2@eswincomputing.com wrote:
> > > > From: Zhi Li <lizhi2@eswincomputing.com>
> > > > 
> > > > v1 -> v2:
> > > 
> > > For version 3, please include a patch to the SoC .dtsi file adding the
> > > Ethernet nodes. We like to see users of code being added.
> > 
> > In addition to Andrew's comments, before posting another series, please
> > review https://docs.kernel.org/process/maintainer-netdev.html,
> > particularly sections 1.4 and 1.6.1.
> > 
> Thanks for the comments.
> 
> The v3 patch will target the net git tree.

While it may be a fix, given that:

> We will add the ethernet nodes and the corresponding clock node to
> eic7700.dtsi and eic7700-hifive-premier-p550.dts in v3 patch. 
> 
> Please note that the EIC7700 clock controller binding and driver are not
> yet merged upstream, so the clock nodes will not be functional until the
> clock driver is available. As a result, dtbs_check will currently report
> schema warnings/errors related to the clock nodes. This is a known and
> temporary limitation until the clock binding and driver are available
> upstream.

I don't see much point to putting it in the net tree - you're addressing
problems with a driver that is currently not in a usable state in
mainline, so there's no need to rush to have this change in mainline.
I think the net-next tree will do once it re-opens after v7.0-rc1 has
been released.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

