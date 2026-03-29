Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB91DFC97E6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 18:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkB3zjZHS6vwd8b3RjjpKkeR3qneJxmhLMAiJQwBqNQ=; b=uhYla3zrsAyLz4MvPL3j3CXfy9
	6gxa4T0fFASIDLVJglzvgqNzteFCybV806O+vypZh4JeC/LjnshFKAHzdJa/Qi9TsE5V1BhY/K1Hg
	LCUwyK6j2wUj7H2aYIh0O0GDCl/R14QEufkee52wqtewvOQ3N7j/ZmSylR2KeCueRaqgSF7cl00kS
	vPm7V3dWx/zlmVePYaoXKZoIIT0pM1FqJVr+KXMNCxd842XzjNOGKFryEJ+x6NKf7MQODPOctOBJf
	F62njP7ry1GVqmTqKhsKvSqmEnS+EQmpjfhND5O6F2jUIw8xznML4B5Jp/X6WHHySXyEXgwYYOhm9
	czaMAgJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6vEP-0000000AFlB-2jiF;
	Sun, 29 Mar 2026 18:51:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6vEL-0000000AFkO-1sqw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 18:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MkB3zjZHS6vwd8b3RjjpKkeR3qneJxmhLMAiJQwBqNQ=; b=TCX48G0oF8y68pyA/xRADyxEkq
	jROR84zUloQc8DGevldQokQgi6xVTEQQhemuENKvZzLxppUHSfIODkj5rGEp/eAx5TifM36relQ3J
	Va0kGHW6imY3KKE+Z+RnFfVHwJuFhg7CEfCbLLerxkUaPjDur0NAkmoQjn82KfSzt+gk/fox6kCuN
	ZWHbg9L48Q4jPv89fY1tyj2/GKZv328BqM1Ahl2CWGjQ453e9oGiLk4YFQV/HQE/qjk+mAM08jn7l
	2pS5ZsvysQ0797dn8zG3S1ffpZMrCyf0K8l0N2jLBk2Sn3/UVShJ4iefMLZsA4FFhfdRTaNi5rSBG
	Tb1eIhPw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48698)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w6vEF-000000008CD-24t8;
	Sun, 29 Mar 2026 19:51:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w6vED-000000001wx-10vu;
	Sun, 29 Mar 2026 19:51:17 +0100
Date: Sun, 29 Mar 2026 19:51:17 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 00/10] net: stmmac: TSO fixes/cleanups
Message-ID: <acl0pTqJ97o0PRxY@shell.armlinux.org.uk>
References: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
 <20260329111123.740bada9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329111123.740bada9@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_115125_485413_2AB72AB1 
X-CRM114-Status: GOOD (  16.18  )
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

On Sun, Mar 29, 2026 at 11:11:23AM -0700, Jakub Kicinski wrote:
> On Sat, 28 Mar 2026 21:36:21 +0000 Russell King (Oracle) wrote:
> > Hot off the press from reading various sources of dwmac information,
> > this series attempts to fix the buggy hacks that were previously
> > merged, and clean up the code handling this.
> 
> We have a limit of 15 outstanding patches per tree.
> Please follow the community guidelines.

I see that restriction was newly introduced back in January.

> While I have you - you have a significantly negative "reviewer score".
> You post much more than you review. Which should earn you extra 24h
> of delay in our system. I've been trying to ignore that and prioritize
> applying your patches but it'd be great if you could review a bit more.

Sorry, but given the effort that stmmac is taking, I don't have much
capacity to extend mental cycles elsewhere.

This two patch series wouldn't have exploded into ten (or maybe even
more) patches had someone not pointed out the problem with
suspend/resume interacting with disabling TSO... which prompted me to
look deeper and discover a multitude of other problems. Should I
instead ignore these bugs and not bother trying to fix this stuff?

Honestly, I'm getting tired of stmmac with it sucking lots of my time,
and I suspect you're getting tired of the constant stream of patches
for it - but the reason there's a constant stream is because there's
so much that's wrong or broken in this driver.

So either we let the driver rot, or... what?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

