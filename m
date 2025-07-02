Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7C3C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 12:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIhKbMlkmPCs5iG0Sqbwbqh+Tw22ETV28HpUZ2yFS3c=; b=WMgwVtX8u+nPgDNTPHRom/Z0NO
	pnwG/XH+1l8d7gjqLRvtncbyOTgCdEgfVxP+mw2b1Gzm7B5+Hdz3Chz4Fa6LtyCxjd0dW0GK2ftrJ
	SvLVMSS26XUW4um0LT5QNNEDuv3d+l/UPnKP3mWpZZmDtY9j0QrT+Mf+O9XmDo25Aoa75WdUW7Fn4
	SPxjb/VPWdUdE6reJLJ1Ma7oLvfDnx0xQf5uIb7vBRu8khyvQn04r2pdNtZ3Ht4Ov4XVSzlx7Kr+4
	PWUiTzei8Gd2eo5/nC5/BLpqDX6RC7SvjCgXwHhXCmP6UHojV3/y7EO+n9JKBTdGfgj7anfVSh8wF
	ApLeK+yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwqY-00000008LgL-1szW;
	Wed, 02 Jul 2025 12:45:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwcp-00000008Kd3-3fWs
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Jul 2025 12:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uIhKbMlkmPCs5iG0Sqbwbqh+Tw22ETV28HpUZ2yFS3c=; b=c23pUok3wwDXPD+7B9YdMt/32x
	F1jVdl6OAz0Gfv5WwIVqyKuQ0b99XZJBOYJWKC8XhX1Cc+8jV3vv6XbxolaBKItOl+JtWs5EyGGDn
	v3OQ4OAVqELl+pKpnXcvnFdl/hjJwJdJFMCSJf8Yge6I3pV5+4Ob6hJhGDsyZH1EMDSiR/Y+YgGCX
	ut6bE6beVbmUvczVBGpgwVkoa+tgFv8ftw682O0+ZK4EFGvj/fwt4+9gkLJ4b0C8eqWR96TuZPYF6
	/rnK6Y8IUWYW4lJeZzeP07qdptFMkyVbOI+XiIemTbo2l7GrDu+ka8O4aU6c01p3oFCG8iw5XKxd6
	WonMtpVQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwcm-00000007MNM-2I58
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 12:31:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8818845EC5;
	Wed,  2 Jul 2025 12:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0877C4CEED;
	Wed,  2 Jul 2025 12:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751459497;
	bh=HyLomZoUIsBZI28vt4NzRZMuAo9iSJ1mkcus3zmJ/uI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQIOuCNMICguAzeBgxu+HHL77MCyaObg/26HSEUCrXWPkUd23kVGSO+krBqrgQDjE
	 mqpEtRaeIZTNVpMnC7ZSpNLLvoKTfdwSnMAVI6e+ddliSNa4hjOxsmEmAimZUFx9Lt
	 XjHN+M2S7/rCFQ+9QG1fl2Akq4wqY2suSIJr9x3bxPv3Ge3YAhOIvKQpq+YvdJ8Alr
	 5FGix2e4Cql3/KPuymrOlR3aEWS3ik5beTXLqXMe1PPIjuw+DmAbw+2FLOWnRdAHhd
	 Pr6Dw818Pd5W32CmctWaoz/Q8YfP+nMAAw9KII2KckiGPrFrt1HPC9IXKuGhBg7o4+
	 RUy6Keg7shOYA==
Date: Wed, 2 Jul 2025 18:01:18 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
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
Subject: Re: [PATCH v19 04/10] PCI: endpoint: Add
 pci_epf_align_inbound_addr() helper for address alignment
Message-ID: <n6wdkexskwjd7k5zwaaqeb36zdsxzcshsm7f5czv44rmocswex@pzbpehep2teu>
References: <20250609-ep-msi-v19-0-77362eaa48fa@nxp.com>
 <20250609-ep-msi-v19-4-77362eaa48fa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609-ep-msi-v19-4-77362eaa48fa@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_133141_014950_9095A549 
X-CRM114-Status: GOOD (  26.75  )
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

On Mon, Jun 09, 2025 at 12:34:16PM GMT, Frank Li wrote:
> Introduce the helper function pci_epf_align_inbound_addr() to adjust
> addresses according to PCI BAR alignment requirements, converting addresses
> into base and offset values.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v15 to v16
> - none
> 
> Change from v14 to v15
> - change out address type to dma_addr_t to fix below build issue
> 
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502082311.G1hWGggF-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/pci/endpoint/functions/pci-epf-test.c: In function 'pci_epf_test_enable_doorbell':
> >> drivers/pci/endpoint/functions/pci-epf-test.c:726:42: error: passing argument 4 of 'pci_epf_align_inbound_addr' from incompatible pointer type [-Werror=incompatible-pointer-types]
>      726 |                                          &epf_test->db_bar.phys_addr, &offset);
>          |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                                          |
>          |                                          dma_addr_t * {aka unsigned int *}
>    In file included from include/linux/pci-epc.h:12,
> 
> Change form v9 to v14
> - none
> 
> change from v8 to v9
> - pci_epf_align_inbound_addr(), base and off must be not NULL
> - rm pci_epf_align_inbound_addr_lo_hi()
> 
> change from v7 to v8
> - change name to pci_epf_align_inbound_addr()
> - update comment said only need for memory, which not allocated by
> pci_epf_alloc_space().
> 
> change from v6 to v7
> - new patch
> ---
>  drivers/pci/endpoint/pci-epf-core.c | 44 +++++++++++++++++++++++++++++++++++++
>  include/linux/pci-epf.h             |  3 +++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/pci/endpoint/pci-epf-core.c b/drivers/pci/endpoint/pci-epf-core.c
> index 95fb3d7c1d45e..33e14a6b1549a 100644
> --- a/drivers/pci/endpoint/pci-epf-core.c
> +++ b/drivers/pci/endpoint/pci-epf-core.c
> @@ -481,6 +481,50 @@ struct pci_epf *pci_epf_create(const char *name)
>  }
>  EXPORT_SYMBOL_GPL(pci_epf_create);
>  
> +/**
> + * pci_epf_align_inbound_addr() - Get base address and offset that match BAR's
> + *			  alignment requirement

'Align the given address based on the BAR alignment requirement'

> + * @epf: the EPF device
> + * @addr: the address of the memory

'inbound address to be aligned'

> + * @bar: the BAR number corresponding to map addr

s/map addr/the given addr

> + * @base: return base address, which match BAR's alignment requirement.

'base address matching the @bar alignment requirement'

> + * @off: return offset.

'offset to be added to the @base address'

> + *
> + * Helper function to convert input 'addr' to base and offset, which match

s/convert/align

> + * BAR's alignment requirement.
> + *
> + * The pci_epf_alloc_space() function already accounts for alignment. This is
> + * primarily intended for use with other memory regions not allocated by
> + * pci_epf_alloc_space(), such as peripheral register spaces or the trigger
> + * address for a platform MSI controller.
> + */
> +int pci_epf_align_inbound_addr(struct pci_epf *epf, enum pci_barno bar,
> +			       u64 addr, dma_addr_t *base, size_t *off)
> +{
> +	const struct pci_epc_features *epc_features;
> +	u64 align;
> +
> +	if (!base || !off)
> +		return -EINVAL;
> +
> +	epc_features = pci_epc_get_features(epf->epc, epf->func_no, epf->vfunc_no);
> +	if (!epc_features) {
> +		dev_err(&epf->dev, "epc_features not implemented\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	align = epc_features->align;
> +	align = align ? align : 128;

From where this 128 byte alignment comes from?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

