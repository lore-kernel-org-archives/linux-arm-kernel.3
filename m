Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42526C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 09:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixpb+nHlGGknFBKNLeayHLKvF1B7kEUCeI9moxPdPuk=; b=KyHU9ZuFBG0yz7vSVXSzX8EyZR
	kM16Bf66pzML3XiRrxbQK0DYl158fLB3WtzIrgBidXmqrw1JYqGBTse+nmq0ZrNF3Gx8MtFYbMYXl
	HGF+03Gz4zI6LNG+yYqGh0JUVYoG+3r7++eDfBwe3/59yuly7MZlZqJE2sddwb91wNmUYpLsyoo2D
	IcSSm8cqsD7dyo7eCPsRI/BMNNLHkLwWWI692gFBFMBK+aBlXouAuwHd8bQKSmZuQfDOBSbODLnWB
	WIgAy2OP8KzvCFmv8c3YT7GCIuRxB8+oIi4mu50tSaYNnSj0zCq/AF7FggpFz+V6WVHsqpSeOwcvK
	7G6hSR8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdc6-00000002CaG-1O6H;
	Mon, 23 Jun 2025 09:37:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdS4-00000002AhU-2o8O
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Jun 2025 09:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ixpb+nHlGGknFBKNLeayHLKvF1B7kEUCeI9moxPdPuk=; b=dfDcMwE7Le8vLaO4Wb3lXCQx3v
	YY+rca/uid1CZrhokpjRmriqhLeBqspvIBpuo7gZWyWzGqZSv2r9BN0anyhNoN+jd0g1JylpXB9pE
	s6DPnJ1CaLeh4B0drawNC4UeTINAx4QA7/tFHHY6W2D4WM0H6FMrZvv88bVD/tbzBGoI4Zj8aGIko
	ppZqy8iIQSsou4Fr48yHHrrhRianspVf+m7RYMP3UWJY4+lHm42BSZ6V3yTG/Spp0w5vHpfFc86hK
	+10W/FpZ3yVVBxl7CYRC+Ex1NkBYHMV34tYKmwGwMqHjmD6rxoMPKFsgDVUdT6+F/ZRgoRKXnU6Q9
	SzaGd2Xg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdS1-00000005AMB-38gY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 09:26:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CF8744CE8;
	Mon, 23 Jun 2025 09:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A007EC4CEEA;
	Mon, 23 Jun 2025 09:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750670808;
	bh=WefXIWazEPskl9B0X1xFtEXjeBSL+nY1ELytivVzN98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qw+aUfQSuKHEk4enVIrEz606dRtP6XgNppP2YO4INXtXX0fpKl7h4u8sf/OIVdZnD
	 NV0a4MPutrCtYNNsfopZKOvqLp1uChhTnXU/ifibAjQcX5+vHM+wZYC5u2QZdbBUbG
	 hqLK7QSB1BRJ/asx988F/PfQIVQ/RY4GUmm1JFsgN4/Mo8DqYKJQw5At6VHOYn0S0c
	 /UfP5gASQorEsfU+ZD4hXDXpdiSjND8/UoejeEyZYy69Ux4hUolfJth5AbnALTSJow
	 usdestU/sQ5azXOngEas1a3myuz4c299HGo5Yyo31BePXHs+oevsQhp/8PUPfwE+Tz
	 /Jbrjo0uFvWOw==
Date: Mon, 23 Jun 2025 11:26:41 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v5 24/27] irqchip/gic-v5: Add GICv5 ITS support
Message-ID: <aFkd0cigSKOSqUQI@lpieralisi>
References: <20250618-gicv5-host-v5-0-d9e622ac5539@kernel.org>
 <20250618-gicv5-host-v5-24-d9e622ac5539@kernel.org>
 <87y0tmp6gn.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0tmp6gn.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_102654_299380_C1233013 
X-CRM114-Status: GOOD (  26.20  )
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

On Fri, Jun 20, 2025 at 09:18:32PM +0200, Thomas Gleixner wrote:

[...]

> > + * Taken from msi_lib_irq_domain_select(). The only difference is that
> > + * we have to match the fwspec->fwnode parent against the domain->fwnode
> > + * in that in GICv5 the ITS domain is represented by the ITS fwnode but
> > + * the MSI controller (ie the ITS frames) are ITS child nodes.
> > + */
> > +static int gicv5_its_irq_domain_select(struct irq_domain *d, struct irq_fwspec *fwspec,
> > +				       enum irq_domain_bus_token bus_token)
> > +{
> > +	const struct msi_parent_ops *ops = d->msi_parent_ops;
> > +	u32 busmask = BIT(bus_token);
> > +
> > +	if (!ops)
> > +		return 0;
> > +
> > +	if (fwnode_get_parent(fwspec->fwnode) != d->fwnode ||
> > +	    fwspec->param_count != 0)
> > +		return 0;
> 
> Just add a MSI flag and set it in parent_ops::required_flags and extend

I added that but it does not work (not if we use d->flags as below), it works
if I add it as an

IRQ_DOMAIN_FLAG_*

and set it in irq_domain_info in the msi_create_parent_irq_domain()
call in the GICv5 ITS driver when creating the domain.

> the lib with
> 
>         struct fwnode_handle *fwh;
> 
>         fwh = d->flags & MAGIC ? fwnode_get_parent(fwspec->fwnode) : fwspec->fwnode;

Here we are using the domain flags and I think that's what we want.

If I go with parent_ops flag, I believe here we need to use the parent
msi_domain_info::flags - I don't think that's what we want.

It is a property of the IRQ domain so I think that adding an

IRQ_DOMAIN_FLAG_FWNODE_PARENT

is the best option.

Please let me know.

Thanks,
Lorenzo

> 
> No?
> 
> > diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> > index c2e7ba7e38f7..4a0990f46358 100644
> > --- a/drivers/irqchip/irq-gic-v5.c
> > +++ b/drivers/irqchip/irq-gic-v5.c
> > @@ -57,12 +57,12 @@ static void release_lpi(u32 lpi)
> >  	ida_free(&lpi_ida, lpi);
> >  }
> >  
> > -static int gicv5_alloc_lpi(void)
> > +int gicv5_alloc_lpi(void)
> >  {
> >  	return alloc_lpi();
> >  }
> >  
> > -static void gicv5_free_lpi(u32 lpi)
> > +void gicv5_free_lpi(u32 lpi)
> >  {
> >  	release_lpi(lpi);
> >  }
> 
> Just make them global right away when you implement them. No point for
> this kind of churn.
> 
> Thanks,
> 
>         tglx

