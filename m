Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4470ECCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 17:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHaqzL7mvC14m8Ho25rFrMU7LT2PL5e7Fk11M4Z3hhM=; b=Z49Am2b5rjWvlwaLuy/GIuLn+y
	N9u0PhfDtAaEtX9hzcsvjqJMlcneHUlDNzZ4poAxiMXkPZqLF8szeKhGvAS7YM210HR72JMdpucwR
	zxtkCqrNrvdaFpldfWCYYos+iv2amHcsoxHuw3Y/jgy+4uel91tWOBxnyaMG1WegT4Toj4tpg7PDp
	KDC83uLrODVFAhQjC11wZ5khsbcBCk54LHbBa68fmw3jLe6zv5h5/Pj8rJVV5EmcjEbLNoWifUUvp
	ERa0gORLH0UmqhQAtf+wRsh333DpescX9TpzyYapM9qYOfsaZRcXMlviGwowOCBtBHLMCtclgABAl
	CPuKoafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhEo-0000000E9ut-2Lwn;
	Wed, 05 Nov 2025 17:24:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhEl-0000000E9uH-2Ys4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 17:24:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B4AE43917;
	Wed,  5 Nov 2025 17:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F78C4CEF8;
	Wed,  5 Nov 2025 17:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762363438;
	bh=zYzES0C46I5oaK/IMxZNYFdLG7G3HDGtdUjOFFV3sZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s8xESqtBwpjaZ4m9f2ZDJN5gPsDifp+UfvU3rzrsSEnf0GikBshBw5nFVFuwF07ck
	 0yBwVY6pmNe9jJeH5oxPaak/+/+HEtErZOVBL1DJnyC0fOcFQs0ygwLPSeu3u03xd5
	 4w0ngjerQEEghhRcnm6x70rCECwLZMn6n5NIp8BCXudGSoXeeOjtOyVOggqmhpUs/g
	 ehWHzELGJtAT9FMLNfUPsYTM6sZqtSYbRFZmEG9QHb2YTdZDrMAzvoOZWhzcrIXnk0
	 EZnAjCx00Jjnj3+Ioa134/nk/7XNVcOWRrmMmmB6+RR8iuCs/ml3MUzfyn1bbfnRSD
	 eLhcmZU6qIgwQ==
Date: Wed, 5 Nov 2025 22:53:44 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, jingoohan1@gmail.com, christian.bruel@foss.st.com, 
	krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com, shradha.t@samsung.com, 
	thippeswamy.havalige@amd.com, inochiama@gmail.com, fan.ni@samsung.com, cassel@kernel.org, 
	kishon@kernel.org, 18255117159@163.com, rongqianfeng@vivo.com, jirislaby@kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v5 4/4] PCI: keystone: Add support to build as a loadable
 module
Message-ID: <fkzokskbjklt6atqrpwc46zsjr5ptpuynzhx4kvfurr4h37kae@rwcqljsjvzl6>
References: <20251029080547.1253757-1-s-vadapalli@ti.com>
 <20251029080547.1253757-5-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251029080547.1253757-5-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_092400_942566_71EE9E2D 
X-CRM114-Status: GOOD (  27.13  )
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

On Wed, Oct 29, 2025 at 01:34:52PM +0530, Siddharth Vadapalli wrote:
> The 'pci-keystone.c' driver is the application/glue/wrapper driver for the
> Designware PCIe Controllers on TI SoCs. Now that all of the helper APIs
> that the 'pci-keystone.c' driver depends upon have been exported for use,
> enable support to build the driver as a loadable module.
> 
> Additionally, the functions marked by the '__init' keyword may be invoked:
> a) After a probe deferral
> OR
> b) During a delayed probe - Delay attributed to driver being built as a
>    loadable module
> 
> In both of the cases mentioned above, the '__init' memory will be freed
> before the functions are invoked. This results in an exception of the form:
> 
> 	Unable to handle kernel paging request at virtual address ...
> 	Mem abort info:
> 	...
> 	pc : ks_pcie_host_init+0x0/0x540
> 	lr : dw_pcie_host_init+0x170/0x498
> 	...
> 	ks_pcie_host_init+0x0/0x540 (P)
> 	ks_pcie_probe+0x728/0x84c
> 	platform_probe+0x5c/0x98
> 	really_probe+0xbc/0x29c
> 	__driver_probe_device+0x78/0x12c
> 	driver_probe_device+0xd8/0x15c
> 	...
> 
> To address this, introduce a new function namely 'ks_pcie_init()' to
> register the 'fault handler' while removing the '__init' keyword from
> existing functions.
> 
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
> 
> v4:
> https://lore.kernel.org/r/20251022095724.997218-5-s-vadapalli@ti.com/
> Changes since v4:
> - To fix the build error on ARM32 platforms as reported at:
>   https://lore.kernel.org/r/202510281008.jw19XuyP-lkp@intel.com/
>   patch 4 in the series has been updated by introducing a new config
>   named "PCI_KEYSTONE_TRISTATE" which allows building the driver as
>   a loadable module. Additionally, this newly introduced config can
>   be enabled only for non-ARM32 platforms. As a result, ARM32 platforms
>   continue using the existing PCI_KEYSTONE config which is a bool, while
>   ARM64 platforms can use PCI_KEYSTONE_TRISTATE which is a tristate, and
>   can optionally enabled loadable module support being enabled by this
>   series.
> 
> Regards,
> Siddharth.
> 
>  drivers/pci/controller/dwc/Kconfig        | 15 +++--
>  drivers/pci/controller/dwc/Makefile       |  3 +
>  drivers/pci/controller/dwc/pci-keystone.c | 78 +++++++++++++----------
>  3 files changed, 59 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index 349d4657393c..c5bc2f0b1f39 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -482,15 +482,21 @@ config PCI_DRA7XX_EP
>  	  to enable device-specific features PCI_DRA7XX_EP must be selected.
>  	  This uses the DesignWare core.
>  
> +# ARM32 platforms use hook_fault_code() and cannot support loadable module.
>  config PCI_KEYSTONE
>  	bool
>  
> +# On non-ARM32 platforms, loadable module can be supported.
> +config PCI_KEYSTONE_TRISTATE
> +	tristate
> +
>  config PCI_KEYSTONE_HOST
> -	bool "TI Keystone PCIe controller (host mode)"
> +	tristate "TI Keystone PCIe controller (host mode)"
>  	depends on ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
>  	depends on PCI_MSI
>  	select PCIE_DW_HOST
> -	select PCI_KEYSTONE
> +	select PCI_KEYSTONE if ARM
> +	select PCI_KEYSTONE_TRISTATE if !ARM

Wouldn't below change work for you?

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index 349d4657393c..b1219e7136c9 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -486,8 +486,9 @@ config PCI_KEYSTONE
        bool
 
 config PCI_KEYSTONE_HOST
-       bool "TI Keystone PCIe controller (host mode)"
+       tristate "TI Keystone PCIe controller (host mode)"
        depends on ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
+       default y if ARCH_KEYSTONE
        depends on PCI_MSI
        select PCIE_DW_HOST
        select PCI_KEYSTONE

- Mani

-- 
மணிவண்ணன் சதாசிவம்

