Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1E4CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 07:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQmFM69C4mxOALzSJ5phbdau72i7voT3uFS0QSMXyFs=; b=qTE38J56SuYzZrcnozv0va8uYE
	8lmg60dFoWzQC5MNj/6ZdtB53R3ymVb6v4RiHhRjOJbv3kqSFgnEt1SnToggx3wBW5x+K6SLPQ5Df
	0AfueEIdj34SzngDGU05euR74SGOX6ItBbLPA58A7iBDWGYM4OmAkdpGbfvINL6UfbeoMmPloeG4n
	A4VUwCMSDCr1jHKj26y/goaTi9zmXOwJNWpThMBzIMsoopwhU9vBSwkyBuuo9ln/T9przgE2xRnMJ
	n6YRDvvEsVuJPGPp86cs4v7PzLAOU9WCNyiJDK+xWfEYiBTabbg1D1plWwtb3HvubELw/zkF2lRiC
	jcb8gJhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3tG-00000001Xtw-1mlw;
	Wed, 13 May 2026 07:20:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3tD-00000001XrA-18A0;
	Wed, 13 May 2026 07:20:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E3CE41968;
	Wed, 13 May 2026 07:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988B6C2BCB7;
	Wed, 13 May 2026 07:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778656818;
	bh=IZC58uKnwZDOpHbW9eAHW46rxtkXxkQRHztEtG6TFdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UeqzWDBD200D0E+7cWQ3ItPGbmCACk6cc388fKQYM6SpkFcVR1e8ZNTJgWXUPhMmX
	 l3NYLvHnKckuDA+dhS61j8Su067jIKnk8isBYPN3qNxv21Bamz2d6hlYALks8iqN75
	 wKTyPTttdTlnZVLdii+WgJsejlUHYdfTeMa6bo2x/1nW2YttqBQUjcEh7iqVZ5aA+T
	 QR5S1YiO60Mb99Nl3pftTrEhk5BuUzdZNTZdSNOcWRbgAevxypH39Bh32rcscHovtk
	 ug93xrUEKct4PDJxwRDjzPG5QW1eBAzX5stvC9Wn/HGg5ftwandsAhq/qAW9o6/MGJ
	 0UgKqu9mpLspA==
Received: by pali.im (Postfix)
	id BA3B5BA0; Wed, 13 May 2026 09:20:08 +0200 (CEST)
Date: Wed, 13 May 2026 09:20:08 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, vigneshr@ti.com, jingoohan1@gmail.com,
	thomas.petazzoni@bootlin.com, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, claudiu.beznea.uj@bp.renesas.com,
	mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] PCI: aardvark: Add 100 ms delay after link
 training
Message-ID: <20260513072008.vol4htgbzquly2rb@pali>
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-7-18255117159@163.com>
 <20260512212531.jupoocz7acv22qyg@pali>
 <581e91fb-2e57-43ed-b79d-19dbf384b955@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <581e91fb-2e57-43ed-b79d-19dbf384b955@163.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_002019_356410_6B7C14AA 
X-CRM114-Status: GOOD (  40.61  )
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

On Wednesday 13 May 2026 15:00:04 Hans Zhang wrote:
> 
> 
> On 5/13/26 05:25, Pali Rohár wrote:
> > On Wednesday 06 May 2026 23:23:44 Hans Zhang wrote:
> > > The Aardvark PCIe controller driver waits for the link to come up but
> > > does not implement the mandatory 100 ms delay after link training
> > > completes for speeds greater than 5.0 GT/s (PCIe r6.0 sec 6.6.1).
> > > 
> > > The driver already maintains a 'link_gen' field that holds the negotiated
> > > link speed. Use it together with pcie_wait_after_link_train() to insert
> > > the required delay immediately after confirming that the link is up.
> > > 
> > > Signed-off-by: Hans Zhang <18255117159@163.com>
> > > ---
> > >   drivers/pci/controller/pci-aardvark.c | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
> > > index e34bea1ff0ac..526351c21c49 100644
> > > --- a/drivers/pci/controller/pci-aardvark.c
> > > +++ b/drivers/pci/controller/pci-aardvark.c
> > > @@ -350,8 +350,10 @@ static int advk_pcie_wait_for_link(struct advk_pcie *pcie)
> > >   	/* check if the link is up or not */
> > >   	for (retries = 0; retries < LINK_WAIT_MAX_RETRIES; retries++) {
> > > -		if (advk_pcie_link_up(pcie))
> > > +		if (advk_pcie_link_up(pcie)) {
> > > +			pcie_wait_after_link_train(pcie->link_gen);
> > >   			return 0;
> > > +		}
> > >   		usleep_range(LINK_WAIT_USLEEP_MIN, LINK_WAIT_USLEEP_MAX);
> > >   	}
> > > -- 
> > > 2.34.1
> > > 
> > 
> > Are you sure that this is correct to do? Have you checked the A3720
> > Functional Specification which describes how to bring PCIe link up?
> > 
> > A3720 PCIe controller is buggy and needs more timing hacks to make it
> > behave. Playing with random sleeps can break its internal logic.
> > I'm not sure if it could be safe without proper testing.
> > 
> > And IIRC A3720 PCIe controller is just PCIe2.0 with 5 GT/s.
> 
> 
> Hi Pali,
> 
> 1. This driver does not support A3720.
> 
> static const struct of_device_id advk_pcie_of_match_table[] = {
> 	{ .compatible = "marvell,armada-3700-pcie", },
> 	{},
> };
> MODULE_DEVICE_TABLE(of, advk_pcie_of_match_table);
> 
> If you need support for A3720, please submit the corresponding patch so that
> Bjorn and Mani can review it.

3700 (or 37xx) is family and covers both a3710 and a3720. In most cases is the
a3720 dominant and hence identifiers 3700 and 3720 are begin mixed.

> 
> 2. If A3720 only supports GEN2, you can configure "max-link-speed" to be 2
> in the DT. This will not affect the functionality of this patch.

Whole A37xx supports only GEN2. And in DT files for 37xx should be
already there max-link-speed.

Seems that in advk_pcie_of_match_table there is no GEN3 device
specified.

> 3. This patch is a common delay requirement stipulated by the PCIe
> specification. If it is greater than GEN2, then msleep(100) will be added;
> otherwise, there will be no such delay.
> 
> 4. For instance, we often come across the situation where some common APIs
> are modified, and in many cases, their functionality does not require the
> actual development board for verification. I believe that many other
> developers and maintainers have modified different parts of the code. For
> example, the recent submission:

Switching one API to another is one thing. But changing code which looks
to be critical, specially when it is known that hw has bugs, can cause
breaking of existing boards.

> commit 750277048afe7ce8ebfc0b120de7dfbc745058a7
> Author: Nam Cao <namcao@linutronix.de>
> Date:   Thu Jun 26 16:47:53 2025 +0200
> 
>     PCI: aardvark: Switch to msi_create_parent_irq_domain()
> 
>     Switch to msi_create_parent_irq_domain() from
> pci_msi_create_irq_domain()
>     which was using legacy MSI domain setup.
> 
> 
> And many controller drivers have been modified.
> 
> 
> Best regards,
> Hans
> 
> 

