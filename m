Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE51CC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 15:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nzFy2OY4fYGG518i7iyc120K9ZQjXyp5GhOOsDRbUY=; b=YyoxFqZK6oIQOXFE2RUNSPjNUQ
	MWM7NAuvtDDZ9kTeyKsDhlrZP2z/Cze+dOFjoQYn2WRvU4VzzF4imGMSPRUUZCQVX0h9cX0Ac+GCs
	TFtN9puEoV5qeaMX8MBqJctqCTXGoO12DaKnK23rse1Vzy2TvYed3Dyi9TBH9cVdjqV2vHaAP3sQk
	4i/oXpSGj5HRHV+dWSttVZxnnsgdt+SFwiJgRuf8Ldxp7Jqy8XJXga5yI6OTET0iggtXp6YqHO+be
	3Dm6yTzf9zjERtSOGpF9xZPVwGc22Vn2K3NdxwJt8Hp9pzaZgPuBNebGhDFIkduIryNhufeG96Xw4
	/kGV87lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzkr-00000008rGE-3A2q;
	Wed, 02 Jul 2025 15:52:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWys9-00000008hrq-2ld0
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Jul 2025 14:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1nzFy2OY4fYGG518i7iyc120K9ZQjXyp5GhOOsDRbUY=; b=c06xWA6+bUVPTvxI+aAmVncxsH
	YuiBmFenj9PdCwrvToLhDu7k0BZdhYcA0nKI1HLyDxk+iXV8eRyH08WEBqto8L4VeOhG3JvYDX3Nz
	MtuSxkapAsO5AC/3qLWU84DI6cEUGcNOZK9iXvF7wR728MCBHUzav/f4HGlVC9cz/gjnzVQPu5rAA
	QEVBVX6o5PusX/UnJp4BcNnYSpearEERrP+q1R0yMAlMVIpsJlDAbyAy0Uumjwwo/qqwz0W8fBAAE
	EwwmqLcs1T4VVywdaSWQeQhvaks8i5Z7hKxw+uro5GEafA369PQnm/IBIJCDt+mlLcWKVL+l6vhRN
	N8mYwOOQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWys6-00000007SRl-2mgT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 14:55:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 939F9A53708;
	Wed,  2 Jul 2025 14:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7004C4CEE7;
	Wed,  2 Jul 2025 14:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751468137;
	bh=odc42PZm0xJO0diX1K58N47iddxW3a0F4HZfOHM34QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4dOc7rRMoTUrPqkvoVH5KlxVpdU6iDMm2rDEi+KlTjIIDv+7QNH9XaqWCWQj4OoT
	 zbzjAWxc3IYGTwZrkS3cvU9VHATYI/yGlBu2sn96cJrffqibdZeCa/0G4jjmoziguF
	 GlZ3vbYwRHql8BA9Q4SCt1HgQ7URRolg7gqp0ShtPK2P37mdoegDMOHpDzVqW/vTRa
	 BrrmyEINlk52COqWZhKyeTsDkIsaKHvntPkZmJYEYD533pltwZ5NWi8gTlrABTWN5V
	 Yucf/dcJQpMPS0K9YHh5kyNeSkz9kiXrM1c4UZgPuQrVSMQEwf4s4UXaij+akTO8KS
	 jFhyFmMdklDiA==
Date: Wed, 2 Jul 2025 20:25:17 +0530
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
Message-ID: <75opnvi46fbmsnmykjwn3gmir7r3uqhzp7tfoua42cado6aopu@dmos2v2qd3jn>
References: <20250609-ep-msi-v19-0-77362eaa48fa@nxp.com>
 <20250609-ep-msi-v19-1-77362eaa48fa@nxp.com>
 <ne5yrjtdevmndqds4uwo2ppq6gay2wuwjouyf33lqr5g3nfkwr@lkwqlwqjqbmx>
 <aGVE6veZm3bL0mVJ@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGVE6veZm3bL0mVJ@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_155539_058323_1E316DE0 
X-CRM114-Status: GOOD (  24.49  )
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

On Wed, Jul 02, 2025 at 10:40:53AM GMT, Frank Li wrote:
> On Wed, Jul 02, 2025 at 04:30:48PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Jun 09, 2025 at 12:34:13PM GMT, Frank Li wrote:
> > > Set device ID as 'vfunc_no << 3 | func_no' and use
> > > 'device_set_of_node_from_dev()' to set 'of_node' the same as the EPC parent
> > > device.
> > >
> > > Currently, EPF 'of_node' is NULL, but many functions depend on 'of_node'
> > > settings, such as DMA, IOMMU, and MSI. At present, all DMA allocation
> > > functions use the EPC's device node, but they should use the EPF one.
> > > For multiple function drivers, IOMMU/MSI should be different for each
> > > function driver.
> > >
> >
> > We don't define OF node for any function, so device_set_of_node_from_dev() also
> > ends up reusing the EPC node. So how can you make use of it in multi EPF setup?
> 
> In mfd devices, children devices reuse parent's of_node
> drivers/gpio/gpio-adp5585.c
> drivers/input/keyboard/adp5589-keys.c
> drivers/pwm/pwm-adp5585.c
> 
> multi EPF should be similar to create multi children devices of mfd.
> 

No, they are not similar. MFD are real physical devices, but EPFs are (so far)
software based entities.

> > I don't understand.
> 
> >
> > > If multiple function devices share the same EPC device, there will be
> > > no isolation between them. Setting the ID and 'of_node' prepares for
> > > proper support.
> 
> Only share the same of_node.
> 
> Actually pci host bridge have similar situation, all pci ep devices reuse
> bridge's of node. framework use rid to distringuish it. EPF can use device::id
> to do similar things.
> 
> Actually iommu face the similar problem. So far, there are not EP device enable
> iommu yet, because it needs special mapping.
> 
> Prevously, I consider create dymatic of_node for each EPF and copy iommu/msi
> information to each children. But when I see adp5585 case, I think direct
> use parent's of_node should be simple and good enough.
> 
> In future, I suggest add children dt binding for it. For example: EPF provide
> a mailbox interface. how other dts node to refer to this mailbox's phandle?
> 

As I said above, EPFs are not real devices. There is currently only one
exception, MHI, which is backed by a hardware entity. So we cannot add
devicetree nodes for EPF, unless each EPF is a hardware entity.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

