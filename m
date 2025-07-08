Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6937EC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 11:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bjefy+eTuoifnyHitqNvAKTXJJ586TM5cF+PP/OgpLM=; b=GfKjk5svUyiwgvH15e1QhKwtp1
	HxU5DVopp9IhsKm/EhEx+4Ov/1JvNIocYtFHdXQWoqGeLM4ckr91agQ6ZYNPXcYv49BbFXKCMzvmq
	tyFH9JDILzfXf2Q1r5m/ys5WzkcUJntrF2iKscNwwn8GBp4vPqqTQwkM12YEtsHyil4mwsnXDlxAJ
	LRJlVjYctG9NjP3hJx4uvgs8Bhw36w0cGMUaK8lR9ZrGjE/R0NIuTf0+LHsXLWnXJr4kGa0V9t9d2
	rJKVOkwjY0y+7flYt1qBdJtZ8ov6gD3hJHJw58T1KB2cJnA8W5t1uaJabEfrTHFqxQR8VEYDlh06W
	PW5KWFcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ6s6-00000005ETO-0jpc;
	Tue, 08 Jul 2025 11:52:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ6Op-00000005BES-23Xx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 11:22:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CECEF4654B;
	Tue,  8 Jul 2025 11:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD5DC4CEF1;
	Tue,  8 Jul 2025 11:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751973730;
	bh=zS8WLO6yzQ/N7UZFiFhLD4awTMf8nv++SLoLX1ZDMs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dgo03ckAclZz6xYW8idaHEIuTxYw8BTeOwb7zKfvU94tRQBRmRtwJCqCZxfzkKi/2
	 gEqrwrBMt91NM8rUYsWJxgDZ60gb/jqc76MP5Btx2xrze2Wmbd4w31QODG78CLv6Em
	 DBKmZ4wBLVP8/sQoXyW/I7Yd76HjZmhjwMVI9CK8MrAakkx7wUTR1xjj46JmtqNKrR
	 1scSG69skldwDzAaQWpI446sXz9oazLWepfJpKNAgGi2w5UeqaLYT0FJOX9vu7HLg1
	 VTS4EXqcn7zO2ne2eAGw0L9IFbcKw8PUc3t+oEroIP5xRt2xC1IqpFf8nIdv/LOfNj
	 UvKWUYNhIFaxA==
Date: Tue, 8 Jul 2025 16:51:55 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuah@kernel.org>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, jdmason@kudzu.us, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v19 01/10] PCI: endpoint: Set ID and of_node for function
 driver
Message-ID: <jx3nhhyj3dh5ivga6i3va35rz7n4disz33dtbwvbs4raqb4iww@q6m73lnwkjsf>
References: <20250609-ep-msi-v19-0-77362eaa48fa@nxp.com>
 <20250609-ep-msi-v19-1-77362eaa48fa@nxp.com>
 <ne5yrjtdevmndqds4uwo2ppq6gay2wuwjouyf33lqr5g3nfkwr@lkwqlwqjqbmx>
 <aGVE6veZm3bL0mVJ@lizhi-Precision-Tower-5810>
 <75opnvi46fbmsnmykjwn3gmir7r3uqhzp7tfoua42cado6aopu@dmos2v2qd3jn>
 <aGVN/5yoLumfmlDv@lizhi-Precision-Tower-5810>
 <aGv4slE8/kmxHvlU@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGv4slE8/kmxHvlU@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_042211_580177_B22A52CB 
X-CRM114-Status: GOOD (  35.44  )
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

On Mon, Jul 07, 2025 at 12:41:22PM GMT, Frank Li wrote:
> On Wed, Jul 02, 2025 at 11:19:36AM -0400, Frank Li wrote:
> > On Wed, Jul 02, 2025 at 08:25:17PM +0530, Manivannan Sadhasivam wrote:
> > > On Wed, Jul 02, 2025 at 10:40:53AM GMT, Frank Li wrote:
> > > > On Wed, Jul 02, 2025 at 04:30:48PM +0530, Manivannan Sadhasivam wrote:
> > > > > On Mon, Jun 09, 2025 at 12:34:13PM GMT, Frank Li wrote:
> > > > > > Set device ID as 'vfunc_no << 3 | func_no' and use
> > > > > > 'device_set_of_node_from_dev()' to set 'of_node' the same as the EPC parent
> > > > > > device.
> > > > > >
> > > > > > Currently, EPF 'of_node' is NULL, but many functions depend on 'of_node'
> > > > > > settings, such as DMA, IOMMU, and MSI. At present, all DMA allocation
> > > > > > functions use the EPC's device node, but they should use the EPF one.
> > > > > > For multiple function drivers, IOMMU/MSI should be different for each
> > > > > > function driver.
> > > > > >
> > > > >
> > > > > We don't define OF node for any function, so device_set_of_node_from_dev() also
> > > > > ends up reusing the EPC node. So how can you make use of it in multi EPF setup?
> > > >
> > > > In mfd devices, children devices reuse parent's of_node
> > > > drivers/gpio/gpio-adp5585.c
> > > > drivers/input/keyboard/adp5589-keys.c
> > > > drivers/pwm/pwm-adp5585.c
> > > >
> > > > multi EPF should be similar to create multi children devices of mfd.
> > > >
> > >
> > > No, they are not similar. MFD are real physical devices, but EPFs are (so far)
> > > software based entities.
> > >
> > > > > I don't understand.
> > > >
> > > > >
> > > > > > If multiple function devices share the same EPC device, there will be
> > > > > > no isolation between them. Setting the ID and 'of_node' prepares for
> > > > > > proper support.
> > > >
> > > > Only share the same of_node.
> > > >
> > > > Actually pci host bridge have similar situation, all pci ep devices reuse
> > > > bridge's of node. framework use rid to distringuish it. EPF can use device::id
> > > > to do similar things.
> > > >
> > > > Actually iommu face the similar problem. So far, there are not EP device enable
> > > > iommu yet, because it needs special mapping.
> > > >
> > > > Prevously, I consider create dymatic of_node for each EPF and copy iommu/msi
> > > > information to each children. But when I see adp5585 case, I think direct
> > > > use parent's of_node should be simple and good enough.
> > > >
> > > > In future, I suggest add children dt binding for it. For example: EPF provide
> > > > a mailbox interface. how other dts node to refer to this mailbox's phandle?
> > > >
> > >
> > > As I said above, EPFs are not real devices. There is currently only one
> > > exception, MHI, which is backed by a hardware entity. So we cannot add
> > > devicetree nodes for EPF, unless each EPF is a hardware entity.
> >
> > But how resolve this problem, if a DT device need phandle to a EPF? anyway
> > this is off topic. let go back this doorbell.
> >
> > It needs an of_node for EPF device, I tried many method before.
> >
> > Create dymatic of_node for it? MSI framework still go through to parent
> > of_node to get such information. not big differnece as my view.
> 
> Actually, DMA have simular issues, just 'workaround' it now.
> 
> pci_epf_test_read() {
> 	...
> 	struct device *dma_dev = epf->epc->dev.parent;
> 	...
> 	dst_phys_addr = dma_map_single(dma_dev, buf, map_size,
>                                                        DMA_FROM_DEVICE);
> 					^^^ [1]
> 	...
> }
> 
> [1] here direct use epc->dev.parent's of node implicy. If IOMMU enable,
> two EPF will share one IOMMU space without isolation. If add of_node(may
> dyamatic create one). we should resolve this problem by use epf device
> here. Difference EPF will use difference IOMMU space like MSI.
> 

Unless your platform comes up with a hardware based EPF, we are not going to
have DT node for any EPF. So all EPFs have to share the same DT node of the EPC.
So right now, it doesn't make a difference if you use a dynamic of_node or copy
the EPC node.

Just reuse the EPC node for now.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

