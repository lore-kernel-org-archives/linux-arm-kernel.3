Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D67C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 14:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImBTaS60ReQfPO3xJ1M0jsrctwI6Qkx+rm26vovRU+c=; b=3R7Hnu/vr8ecNnDFd0Mq2QX+LO
	Gv47O47EGwQ0ACBdGxopXi2aa8WG5Z1M0goxrwa0+4nVjrkfRC3gdFJ3SN6RNeooIkelE72dJ4+Ri
	VJTz4O+DkU3P6XRB9FLCecgc1vp24rngnlvefHg+sX52umUbv+ZLDhwGnq7yaJJI763yyW7Bbsncf
	7XWtTuecF+tGwqzroFh3s/QJFxt5jzjjd/CBldtpkiAD4rwqotwm5JtDEJkpxlSPH08k2+8dr6u6M
	/6zdcoowXA58j1ClMFLP9KEcJ1Huw2N6FrCzXINmHmm17HHpEFIna/EwQh3H0VfJKDaZVo8CxXulG
	IHKIJ3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMsL-00000008fPt-3QO5;
	Wed, 12 Mar 2025 14:16:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMqh-00000008fKb-1IsM
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 12 Mar 2025 14:14:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ImBTaS60ReQfPO3xJ1M0jsrctwI6Qkx+rm26vovRU+c=; b=oXkszHwKj+xK0zqCwNFR8KaR35
	3xZiGK0irrgGOvZC3A5jPqvgxRThU5Mbla0c1+uD5jG4KO8ib0duQayIwAit3jJ+//br/s42NvQUd
	y2a+rHoRCjfOndfgELxSj4CzJ1ncXFOPGpveUK2WhqRlWxiVn95al4GpIrIZxv0y3ZcSuF0TALCzQ
	TyMXhVHk0F9bnNZq+H2cF6UeZVPZFMp63knlGXe7DZAL8ShWNLbGBZ+XaTWDNW7oMcU59Ag4ZuIPj
	RageH8g1REpFqWmzcnkD03esOiueZkVROE9SIsTVlh+j4Rwn4VfO1IQ9SHbC9tT7q8alp3oCwg0we
	ZxCRlQZw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMqd-00000002PH0-46Rp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 14:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ImBTaS60ReQfPO3xJ1M0jsrctwI6Qkx+rm26vovRU+c=; b=0KECc+VKF/xF+po574Br51EcqU
	rKsuJR05I2Rib4V8sTHdibditYvhflqHuKJw4tEouph7q7HAJKy9fILY9hxuGU7PA+D0rivkI/XP+
	NdokiTNjJmycXeI4eL0RRDT7SwwJnI0COOEWFlkNDVGrNY0jQfFemzimP6jHo6+3F3KrgVzBwGoum
	z+nAzj/tKzLsfB/hSIdpgVtL0F9UcV3J8qBJoowxHqMAPJw7VyM0C91qrmcdU9Win9uHRagazBECG
	Gc/e+AizK9xGM2cmFZMbdUJ5KpSYjYtUJNhgdQ9WYN1PExnUwuBixARrKAQff+sW3IpHfY0vS6Dhc
	Ho0hgDRg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32982)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tsMqL-0005i4-2X;
	Wed, 12 Mar 2025 14:13:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tsMqJ-0004bc-09;
	Wed, 12 Mar 2025 14:13:55 +0000
Date: Wed, 12 Mar 2025 14:13:54 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Suraj Gupta <suraj.gupta2@amd.com>, radhey.shyam.pandey@amd.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	git@amd.com, harini.katakam@amd.com
Subject: Re: [PATCH net-next V2 2/2] net: axienet: Add support for 2500base-X
 only configuration.
Message-ID: <Z9GWokRDzEYwJmBz@shell.armlinux.org.uk>
References: <20250312095411.1392379-1-suraj.gupta2@amd.com>
 <20250312095411.1392379-3-suraj.gupta2@amd.com>
 <ad1e81b5-1596-4d94-a0fa-1828d667b7a2@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad1e81b5-1596-4d94-a0fa-1828d667b7a2@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_141416_166410_BA014A46 
X-CRM114-Status: GOOD (  18.69  )
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

On Wed, Mar 12, 2025 at 02:25:27PM +0100, Andrew Lunn wrote:
> > +	/* AXI 1G/2.5G ethernet IP has following synthesis options:
> > +	 * 1) SGMII/1000base-X only.
> > +	 * 2) 2500base-X only.
> > +	 * 3) Dynamically switching between (1) and (2), and is not
> > +	 * implemented in driver.
> > +	 */
> > +
> > +	if (axienet_ior(lp, XAE_ABILITY_OFFSET) & XAE_ABILITY_2_5G)
> 
> How can we tell if the synthesis allows 3)?
> 
> Don't we have a backwards compatibility issue here? Maybe there are
> systems which have been synthesised with 3), but are currently limited
> to 1) due to the driver. If you don't differentiate between 2 and 3,
> such systems are going to swap to 2) and regress.

We've discussed this before... but because the author doesn't post
regularly enough, it's not suprising that context keeps getting lost.

Here's the discussion from 20th February 2025 on a patch series that I
commented on on 19th November 2024.

https://lore.kernel.org/r/BL3PR12MB6571FE73FA8D5AAB9FB4BB3CC9C42@BL3PR12MB6571.namprd12.prod.outlook.com

Suraj Gupta - you _must_ be more responsive so that reviewers can keep
the context of previous discussions in their heads to avoid going over
the same points time and time again. If you can't do that (and it's a
good idea anyway) then you need to supplement the commit descriptions
with the salient points from the previous patch series discussion to
remind reviewers of the appropriate context.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

