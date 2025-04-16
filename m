Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D55C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLdcYW62KrvvJerOGCHyeuwlEDQ19UgL06buz3bTrWs=; b=JOoUu4gKdjOu1PMcBBp/bezwAZ
	mJti2MXBn0W/A15N018ZSzuDUR4qGxBqlj6TFyVnmW6LRbmMyi6ngWSkGyHq2Cb+I34Z+i132R2BB
	fofbsLeDYM0l9uC35BAbWqBu/oXPB3gS8wtDZLIDnX1rzgBxQ+QV6xDHDlYkSTlNKjmGHtmUO4p+e
	MQn9njbeNbydv4wBN4Anj2wRP79h8b8xiUMxoHj0jFjzYPvw37FzcOM7J6/+cljU1Nt0r97x0bVQf
	AQ9/LbZZpvYtzOth49gXikT3yl+XdzsTylVUzFuYdH2dNF1+4pwtuwc4EWId3q0zauPoGrUVfoB/8
	lQSgQN/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55fV-0000000AGkK-0CqK;
	Wed, 16 Apr 2025 16:31:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54zw-0000000A8Lo-1Fys
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Apr 2025 15:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yLdcYW62KrvvJerOGCHyeuwlEDQ19UgL06buz3bTrWs=; b=I/iO+2BEojM0dBj2MLQv4WtcRk
	1trORWrRbtPWens5CEKYNR0kNMACvbmAfji3SXZnKKIzu+VI1teHhq0kN1gZlbUIiLm8aErKU4Owi
	6h2IRsFGOzP0m/zQ7TLIis5MYjZiKDdHzBZ9nd97+pnGiuE38HpULRPY37rZx1qLE9omy2BJ21m9S
	jZUpP9YUSa008Sxb82MtORsvfyWDmoagEYYBwl1d6B9gTTeKzFxox3nu6I9oWM/2oa+rN8EVgJuW8
	txpxhuj0IKJwR0KbIkw9bf6RHFJ4m6/bpwDTx/N5vgrQXWP8H5somBlms0Oy8s5FU9+l1bWisroNU
	loSvo1vg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u54zt-0000000A7ui-0rJd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 15:48:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yLdcYW62KrvvJerOGCHyeuwlEDQ19UgL06buz3bTrWs=; b=pE38ll4tzVmjMwjrgTgJ89l7bv
	8qR11Xf6aAap56g90UXQWw37wr7veCn625eaTTHWNOrQyheqVFfW35Z4nB3aBUyhGrFd+m24KG86L
	uL+x1tVbM8q9F2YzIe2yR4WbbHpBTIYKs5QzSbCNS5F73granIgM9wtJljRSE/TuYh6g1HBGK4TAl
	lht199JlgTZDuirsK6rdO7rNeKgVOmpUdStapsd4NjgS8q6lZMXSjLCpqSz217Y5fOTfS6we7BxWb
	ecncP6w7tYiCRp6MTrabqkXcg9m478O0uTNwCOgIkZjkUTDVG3dpmq6lniKcevAVQTBEVRcNpT0DT
	4Fvavaag==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34616)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1u54zj-0001aC-0e;
	Wed, 16 Apr 2025 16:48:11 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1u54ze-0001WI-34;
	Wed, 16 Apr 2025 16:48:06 +0100
Date: Wed, 16 Apr 2025 16:48:06 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ross Stutterheim <ross.sweng@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Ross Stutterheim <ross.stutterheim@garmin.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@linux.ibm.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] arm/memremap: fix arch_memremap_can_ram_remap()
Message-ID: <Z__RNhf5CJrbv5yb@shell.armlinux.org.uk>
References: <20250414133219.107455-1-ross.stutterheim@garmin.com>
 <20250414142140.131756-1-ross.stutterheim@garmin.com>
 <Z_-B5fAhZzShX34I@arm.com>
 <c7db6fda-bf4e-4d6b-8cca-db82c40ce1b6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7db6fda-bf4e-4d6b-8cca-db82c40ce1b6@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_164821_417329_E3BC4331 
X-CRM114-Status: GOOD (  15.12  )
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

On Wed, Apr 16, 2025 at 08:57:09AM -0500, Ross Stutterheim wrote:
> On 4/16/25 05:09, Catalin Marinas wrote:
> > > Fixes: 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure presence of linear map")
> > > Signed-off-by: Ross Stutterheim <ross.stutterheim@garmin.com>
> > 
> > I think you could also add:
> > 
> > Cc: <stable@vger.kernel.org>
> Done. I also added some other Cc: entries on V3 along with Reviewed-by:
> lines . I'm new here, so I'm not sure I've used those 100% properly.
> 
> > Not sure how Russell picks patches up these days (I used to send them to
> > the patch system -
> > https://www.arm.linux.org.uk/developer/patches/info.php).
> > 
> > It might be simpler with git send-email (that's the alias I had):
> > 
> >    git send-email --add-header="KernelVersion: $(git describe --abbrev=0)" --no-thread --suppress-cc=all --to="patches@armlinux.org.uk"
> > 
> Thanks. I created an account there and submitted V3 through the web
> interface (to avoid my SMTP server appending more stuff on the end).

Thanks, seems all good, applied and pushed out. I'll send it to Linus
tomorrow as it's certainly a serious regression.

I'm surprised Mike hasn't responded...

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

