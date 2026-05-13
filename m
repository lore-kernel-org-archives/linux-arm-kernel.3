Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426F2CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 18:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yOdBMJX3qkbxuevq7cYEIuXbZzxXoNaeAhX5OITx9c=; b=erQX6BxOdBykT/mFX+q3zJzBym
	gpBGC07mb6FOKMxiYZyVZq8VTO0YPiLDn4RH0kAcgXgnJv9CdOgOQ68En3LKRFLRuaMBl3JLUgF1v
	qNo2Yehx+aenCjhWo9TVBoR/vOGN4slIJb0s1FBAhrs/hMM5SPEAgk2RcyeqKaOmRazv1515NDZAg
	jZZ9YIkJnIuNuaV+glAWEdFvpkjUmPPG0SCFwOb3uRzpZZn373hseH2XbVMeLketmQZBUDOJyC8Hb
	QRBixHek1WrPLEUHLMVWldnke7/bD7jWcBEonbN0pFnGmY4/NXsg2BnY2Zint9HVKdtNk/0dECacS
	lLwnPuGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEjO-00000003VbY-2LJn;
	Wed, 13 May 2026 18:54:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNEjN-00000003Vb6-0JKs;
	Wed, 13 May 2026 18:54:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 202E360126;
	Wed, 13 May 2026 18:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787BFC19425;
	Wed, 13 May 2026 18:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778698491;
	bh=kaP87DtivSczZqw+sjMW+4NPzsWyqMYNWQHZ4e+4av0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALrVBfJOiwW7RyTOVwB8Rf1h2H0oUSpuHSDRe78/sJ+yTDDl/258qnCOPe4zQQigJ
	 lDHOENs8VTopvtUbNfTsb90WFhWSnYZa3LmFkYx78UF7vvlveCMikMvMfQriVEirZl
	 QYxo0bZIYHyMFp1DgzdLxBb1qXLSyUJVVthymizfxMe/s/j7C6+Src4BkUbwcmzwkm
	 whLcjM2JGeJaND5V3MBSpU1iMk4h9xwQZRsD/aOmcPGFjN5Gc4lrg86W6QetVKDAMd
	 hUAxdiVVhsPfaS4mrdgEPAgckVARyI5qj+pU4orYbSg97SnCrKi3+e6GNgLygBzlEx
	 /vARqIqTyoDkw==
Received: by pali.im (Postfix)
	id 8BF08BA0; Wed, 13 May 2026 20:54:42 +0200 (CEST)
Date: Wed, 13 May 2026 20:54:42 +0200
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
Message-ID: <20260513185442.mw3md5te7dhojyd7@pali>
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-7-18255117159@163.com>
 <20260512212531.jupoocz7acv22qyg@pali>
 <581e91fb-2e57-43ed-b79d-19dbf384b955@163.com>
 <20260513072008.vol4htgbzquly2rb@pali>
 <15532890-ce22-4b20-96d9-e7f7c47050d2@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15532890-ce22-4b20-96d9-e7f7c47050d2@163.com>
User-Agent: NeoMutt/20180716
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

On Wednesday 13 May 2026 15:34:46 Hans Zhang wrote:
> On 5/13/26 15:20, Pali Rohár wrote:
> > On Wednesday 13 May 2026 15:00:04 Hans Zhang wrote:
> > > 
> > > 
> > > On 5/13/26 05:25, Pali Rohár wrote:
> > > > On Wednesday 06 May 2026 23:23:44 Hans Zhang wrote:
> > > > > The Aardvark PCIe controller driver waits for the link to come up but
> > > > > does not implement the mandatory 100 ms delay after link training
> > > > > completes for speeds greater than 5.0 GT/s (PCIe r6.0 sec 6.6.1).
> > > > > 
> > > > > The driver already maintains a 'link_gen' field that holds the negotiated
> > > > > link speed. Use it together with pcie_wait_after_link_train() to insert
> > > > > the required delay immediately after confirming that the link is up.
> > > > > 
> > > > > Signed-off-by: Hans Zhang <18255117159@163.com>
> > > > > ---
> > > > >    drivers/pci/controller/pci-aardvark.c | 4 +++-
> > > > >    1 file changed, 3 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
> > > > > index e34bea1ff0ac..526351c21c49 100644
> > > > > --- a/drivers/pci/controller/pci-aardvark.c
> > > > > +++ b/drivers/pci/controller/pci-aardvark.c
> > > > > @@ -350,8 +350,10 @@ static int advk_pcie_wait_for_link(struct advk_pcie *pcie)
> > > > >    	/* check if the link is up or not */
> > > > >    	for (retries = 0; retries < LINK_WAIT_MAX_RETRIES; retries++) {
> > > > > -		if (advk_pcie_link_up(pcie))
> > > > > +		if (advk_pcie_link_up(pcie)) {
> > > > > +			pcie_wait_after_link_train(pcie->link_gen);
> > > > >    			return 0;
> > > > > +		}
> > > > >    		usleep_range(LINK_WAIT_USLEEP_MIN, LINK_WAIT_USLEEP_MAX);
> > > > >    	}
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > > > 
> > > > Are you sure that this is correct to do? Have you checked the A3720
> > > > Functional Specification which describes how to bring PCIe link up?
> > > > 
> > > > A3720 PCIe controller is buggy and needs more timing hacks to make it
> > > > behave. Playing with random sleeps can break its internal logic.
> > > > I'm not sure if it could be safe without proper testing.
> > > > 
> > > > And IIRC A3720 PCIe controller is just PCIe2.0 with 5 GT/s.
> > > 
> > > 
> > > Hi Pali,
> > > 
> > > 1. This driver does not support A3720.
> > > 
> > > static const struct of_device_id advk_pcie_of_match_table[] = {
> > > 	{ .compatible = "marvell,armada-3700-pcie", },
> > > 	{},
> > > };
> > > MODULE_DEVICE_TABLE(of, advk_pcie_of_match_table);
> > > 
> > > If you need support for A3720, please submit the corresponding patch so that
> > > Bjorn and Mani can review it.
> > 
> > 3700 (or 37xx) is family and covers both a3710 and a3720. In most cases is the
> > a3720 dominant and hence identifiers 3700 and 3720 are begin mixed.
> > 
> > > 
> > > 2. If A3720 only supports GEN2, you can configure "max-link-speed" to be 2
> > > in the DT. This will not affect the functionality of this patch.
> > 
> > Whole A37xx supports only GEN2. And in DT files for 37xx should be
> > already there max-link-speed.
> > 
> > Seems that in advk_pcie_of_match_table there is no GEN3 device
> > specified.
> > 
> 
> Hi Pali,
> 
> However, I saw many GEN3 assignments and conditions in the code.
> 
> ret = of_pci_get_max_link_speed(dev->of_node);
> if (ret <= 0 || ret > 3)
> 	pcie->link_gen = 3;
> else
> 	pcie->link_gen = ret;
> 
> 
> static void advk_pcie_train_link(struct advk_pcie *pcie)
> {
> 	struct device *dev = &pcie->pdev->dev;
> 	u32 reg;
> 	int ret;
> 
> 	/*
> 	 * Setup PCIe rev / gen compliance based on device tree property
> 	 * 'max-link-speed' which also forces maximal link speed.
> 	 */
> 	reg = advk_readl(pcie, PCIE_CORE_CTRL0_REG);
> 	reg &= ~PCIE_GEN_SEL_MSK;
> 	if (pcie->link_gen == 3)
> 		reg |= SPEED_GEN_3;
> 	else if (pcie->link_gen == 2)
> 		reg |= SPEED_GEN_2;
> 	else
> 		reg |= SPEED_GEN_1;
> 	advk_writel(pcie, reg, PCIE_CORE_CTRL0_REG);
> 
> 	/*
> 	 * Set maximal link speed value also into PCIe Link Control 2 register.
> 	 * Armada 3700 Functional Specification says that default value is based
> 	 * on SPEED_GEN but tests showed that default value is always 8.0 GT/s.
> 	 */
> 	reg = advk_readl(pcie, PCIE_CORE_PCIEXP_CAP + PCI_EXP_LNKCTL2);
> 	reg &= ~PCI_EXP_LNKCTL2_TLS;
> 	if (pcie->link_gen == 3)
> 		reg |= PCI_EXP_LNKCTL2_TLS_8_0GT;
> 	else if (pcie->link_gen == 2)
> 		reg |= PCI_EXP_LNKCTL2_TLS_5_0GT;
> 	else
> 		reg |= PCI_EXP_LNKCTL2_TLS_2_5GT;
> 	advk_writel(pcie, reg, PCIE_CORE_PCIEXP_CAP + PCI_EXP_LNKCTL2);
> 
> ....
> 
> 
> If you are certain about the relevant information. Is it understandable that
> we need to delete the code related to GEN3?

Ok. So some explanation. pci-aardvark.c is implementing driver for PCIe
controller with codename aardvark. I have no idea from what this
codename comes and what is represents. What we know that the driver was
written for A37xx SoC platform according to A37xx functional specification.
As it is common in SoC world, vendors just buy some IP and integrate it
into SoC. In this case Marvell bought this PCIe controller IP and
integrated it into the A37xx. In past I tried to investigate what it
could be and IIRC my assumption was that it was PCIe IP from Denali.
Denali was acquired by Cadence, and when I compared Cadence PCIe
controller registers and PCIe controller registers in A37xx functional
specification there were large overlap. For me it looked like new
Cadence PCIe controller is an evolution (or new version) of what is in
A37xx. So this was some confirmation of my theory. Linux kernel has
separate driver for PCIe controller from Cadence and for refactoring
there were ideas to merge these two drivers... But there were more
important things, fix issues related to A37xx PCIe, lot of changes
which address these issues were sent to the list but they were not
taken. I do not think that it makes sense to do refactoring or doing any
other changes before addressing any existing issues with these
drivers (like PCIe card is not working correctly).

There are reported more HW erratas for this PCIe controller which needs
to be addressed in the software (meaning in Linux kernel) to make PCIe
card working properly. And there are more design HW decision which needs
does not conform to the PCIe specification and those deviations needs to
be "fixed" or "adjusted" in software (meaning in pci-aardvark.c driver)
to make PCI/PCIe compatible drivers to work correctly.

Now about GEN3. From register allocation it looks like that PCIe IP
supports GEN3. A37xx does not support it (or at least officially). This
does not mean that there cannot be some SoC with this "aardvark" PCIe IP
that is GEN3 capable. Just we see that such SoC is not supported by Linux.
Also as the comment in above code says, by default the speed is reported
as 8.0 GT/s, so changing it to 5.0 GT/s or 2.5 GT/s is needed as so code
some parts of GEN3 code in the driver is needed.

Does it makes sense to remove it? Does it makes sense to spend time on
such thing which does not address any existing issue? For me not.
Because it does not fix any _real_ issue with existing PCIe cards. And
for refactoring it is better to merge drivers as explained above and
IIRC cadence driver has HW on which is GEN3 used.

Now about your change. If you are sure that pcie_wait_after_link_train()
function is noop for pcie->link_gen == 2 || pcie->link_gen == 1 then go
ahead, I have no objects. I have not looked deeply at the change. I just
spotted some change which is touching timing critical code path which
was problematic in the past and broke many wifi cards. So I'm really
careful to prevent breaking Linux support again.

As maintainers decided to not take any new changes from me for this
driver, I have no motivation to prepare any new changes. I will rather
spend my free time on something which will make sense and not be wasting
of my free time.

> 
> Best regards,
> Hans
> 
> 
> > > 3. This patch is a common delay requirement stipulated by the PCIe
> > > specification. If it is greater than GEN2, then msleep(100) will be added;
> > > otherwise, there will be no such delay.
> > > 
> > > 4. For instance, we often come across the situation where some common APIs
> > > are modified, and in many cases, their functionality does not require the
> > > actual development board for verification. I believe that many other
> > > developers and maintainers have modified different parts of the code. For
> > > example, the recent submission:
> > 
> > Switching one API to another is one thing. But changing code which looks
> > to be critical, specially when it is known that hw has bugs, can cause
> > breaking of existing boards.
> > 
> > > commit 750277048afe7ce8ebfc0b120de7dfbc745058a7
> > > Author: Nam Cao <namcao@linutronix.de>
> > > Date:   Thu Jun 26 16:47:53 2025 +0200
> > > 
> > >      PCI: aardvark: Switch to msi_create_parent_irq_domain()
> > > 
> > >      Switch to msi_create_parent_irq_domain() from
> > > pci_msi_create_irq_domain()
> > >      which was using legacy MSI domain setup.
> > > 
> > > 
> > > And many controller drivers have been modified.
> > > 
> > > 
> > > Best regards,
> > > Hans
> > > 
> > > 
> 

