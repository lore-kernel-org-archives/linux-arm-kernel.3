Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA341075273
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 08:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ay74TMh014iR7nkSfjsS4NxcUBQqZWrWwmUFvdZ+uTc=; b=hc5N+LrCKu5nwrJUEH5TWZcfSm
	RbD+p6dLrfwNm/9Jp2a4a4W03rZ13GgILtnG0QSXU/6idZA2eGZg+YaU1BBhygTEWtFdbdR1uf8xg
	u7XzrDnYOrAVTiEQOPJb37wmhqjhPGoqxSvGTRW5gnwbDPFFVHCd2v6wsHDuc69GN6789ld1XqvpH
	Jdl/gP36AKq3ArroZDBCKQY0czMJ2DDW80kd8ixe/12rhcIWitrdz/5oq5TpatwyQmYhaL4/6iBYE
	A3HVgmVfiEK4YIBFmZlZBZIc++R8KnrhUNrGUj/bqgmPrad1WqAmraU6LLQV87WbDDJBT5/iY91wi
	Q0Bp0ZiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38XP-0000000ADS3-00U2;
	Thu, 19 Mar 2026 08:15:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w38XL-0000000ADRh-3HBb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 08:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ay74TMh014iR7nkSfjsS4NxcUBQqZWrWwmUFvdZ+uTc=; b=N8U5LMwOvrosPl6nOVMMteuKVW
	sTe7HQrBy06spxIvUzVkz3BHiznipoV4TylXKQYaLjUGrXcqsJV6zFjMqADDLaBTU/l1Jx2fnM92R
	JqNXoaJTFHHkd9ibx2CqvxaH+R6STvuSBF8c81fGugte8jjRpjqYFxptpFfKdUJXC/42DnXYObj6H
	UkOO6fUS5YTkP+SbcbBfqrqGQdQ4e+pgTe107Mr3yS/Pi0wMVk3wzI7fBu/JZK48rYbo35sh29dZE
	FQlyzRoj/XXnTzBCuqgYkunW0rilS/w0qDqpk7ErNsUr4KtuGJ3GYtEG+85jmcVLDJX8PAkK93F4n
	04y9qy3w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45380)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w38Wt-000000004SZ-48nU;
	Thu, 19 Mar 2026 08:14:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w38Wf-000000007z5-1pDU;
	Thu, 19 Mar 2026 08:14:41 +0000
Date: Thu, 19 Mar 2026 08:14:41 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	bcm-kernel-feedback-list@broadcom.com, richardcochran@gmail.com,
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	john.fastabend@gmail.com, rohan.g.thomas@altera.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	andrew+netdev@lunn.ch, horms@kernel.org, sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	weishangjuan@eswincomputing.com, wens@kernel.org,
	vladimir.oltean@nxp.com, lizhi2@eswincomputing.com,
	boon.khai.ng@altera.com, maxime.chevallier@bootlin.com,
	chenchuangyu@xiaomi.com, yangtiezhu@loongson.cn,
	ovidiu.panait.rb@renesas.com, chenhuacai@kernel.org,
	florian.fainelli@broadcom.com, quic_abchauha@quicinc.com
Subject: Re: [PATCH net-next v7 4/5] net: stmmac: Add PCI driver support for
 BCM8958x
Message-ID: <abuwcYH791D_oJp_@shell.armlinux.org.uk>
References: <20260313222206.778760-1-jitendra.vegiraju@broadcom.com>
 <20260313222206.778760-5-jitendra.vegiraju@broadcom.com>
 <abSXP3gMFQEiC5Lm@shell.armlinux.org.uk>
 <CAMdnO-LYAPfyvM4vgmGcZgy-aagHSkP+VDmpRskNU-414j3gnQ@mail.gmail.com>
 <CAMdnO-+YWowCDh4iB9EZ=eqUidE6Mu4TOqjwyoMgyEaG=pBLBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMdnO-+YWowCDh4iB9EZ=eqUidE6Mu4TOqjwyoMgyEaG=pBLBg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_011523_842755_4EBDD384 
X-CRM114-Status: GOOD (  19.34  )
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

On Wed, Mar 18, 2026 at 11:12:23PM -0700, Jitendra Vegiraju wrote:
> Hi Russell,
> On Mon, Mar 16, 2026 at 1:34 PM Jitendra Vegiraju
> <jitendra.vegiraju@broadcom.com> wrote:
> >
> > On Fri, Mar 13, 2026 at 4:01 PM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > > +
> > > > +     plat->suspend           = stmmac_pci_plat_suspend;
> > > > +     plat->resume            = brcm_pci_resume;
> > > > +     plat->bsp_priv = brcm_priv;
> > >
> > > Populating suspend/resume means that plat->init and plat->exit
> > > will only be called on driver probe (former), probe failure (latter)
> > > or remove (latter). Please consider using these to ensure that
> > > all appropriate resources are properly cleaned up in all cases.
> > >
> >
> > Thanks for pointing this out. I will check resource cleanup more closely.
> After reviewing the need for  plat->init and plat-exit, I don't think we need
> these handlers as this driver with fixed-link doesn't need to restore any device
> specific state such as clocks.

Huh?

plat->init and plat->exit have nothing to do with "restoring" anything.

plat->init is for platform specific initialisation.

plat->exit is for reversing the effects of plat->init once plat->init
has suceeded, and will be called should the probe fail or on device
removal.

So, where you have:

static int foo_probe()
{
	do init stuff();

	ret = stmmac_dvr_probe();
	if (ret)
		goto cleanup;

	return 0;

cleanup:
	do cleanup stuff();

	return ret;
}

static void foo_remove()
{
	stmmac_dvr_remove();
	do cleanup stuff();
}

Using ->init for "do init stuff()" and ->exit for "do cleanup stuff()"
will simplify the code, and actually make things more correct.

Currently, you have this in your remove path:

+       pci_free_irq_vectors(pdev);
+       device_set_node(&pdev->dev, NULL);
+       software_node_unregister_node_group(brcm_swnodes);

but in your probe error path, you have failure paths that leave
the swnode connected to the device, and you don't call
software_node_unregister_node_group(). Thus, it seems to me that
your cleanup path is buggy.

My suggestion of using ->init and ->exit means you have slightly
less to think about when stmmac_dvr_probe() fails - although if
you still have to do appropriate cleanup within ->init if it
partially fails.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

