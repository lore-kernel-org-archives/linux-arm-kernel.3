Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2086AC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 04:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFLeyFg8qvhA+CoVyWobyqZmkhTRasnUPNKk8+PwL8Q=; b=p4pF8Z9462i6Ysa1yn8Dso/KwP
	ZY97qjYtKVydAjFdMj/BFlxGFeNPFn1ocAIMXTyEOagNfZo/WRnbtJHrT21FFWmsfg6Mo6eCj2T5l
	CPZxBmsQVtzJLeJg78GJCwRyMhrfNx0lZIqV4a8G8YEk6vMaVb213P7fwiDA5xuMfSwLdF1y7gZM8
	JgQ0KbyITQs1U2HUdB3dGDKydkgyEQ6ytd6q48mv4bIpRF4J4UA28e2zZ3RN0BIKnzzqGTzMG8JI6
	BTWTPMi6wokpaDVy6hi73QZdrEJg1w1fmZfA1m0y1cDAji+dG13noJWu2Ef/OgPqpSX+KGRCxINDH
	idbBGWdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUHLj-00000007Rtj-2LQG;
	Wed, 25 Jun 2025 04:03:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUHJT-00000007RlL-3jgl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 04:00:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6C836116E;
	Wed, 25 Jun 2025 04:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19BCC4CEEA;
	Wed, 25 Jun 2025 04:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750824042;
	bh=3knVkmzjeB1aYkBJciYzDKyPEWCxuge1R6dKhWJvBcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sBr5dcepNEQgPiRg3aaI/tOgzPBOPr6ZvrJJamIx77DLo+9nA/3P0YctklKIDpPgk
	 GVgjcQZPPDQo8k/1JJWkLGuYvOHk2Ec3sWXraK+bXtoLMKw/NBYJnrE5XgpNoBXNRM
	 +SA1hpeV+Cv/l0SzOmGGHtFioAgWm9GbHdatVZtm1IYur/9FCnDMr50my/rQ8JPTzk
	 VOXoKAkPCtBWdsfe+Yld1NzyP7dmRUN+R1+h5q6keBuzDwQUMCfnhCEkWtS2aYrRpu
	 emtMVAvw6xPvsun4VXM0pkq19W9i4LIX8GqygUiSuq5BVoS5Vz72U9+9zVLN/DeiMH
	 H2UjHxxWO23CQ==
Date: Tue, 24 Jun 2025 22:00:31 -0600
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, p.zabel@pengutronix.de, 
	johan+linaro@kernel.org, cassel@kernel.org, shradha.t@samsung.com, 
	thippeswamy.havalige@amd.com, quic_schintav@quicinc.com, 
	Christian Bruel <christian.bruel@foss.st.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v12 0/9] Add STM32MP25 PCIe drivers
Message-ID: <3bmw76gzqjq2nmjvj7tb6gi5x233zzfrhv44uyjopl2lxyzbkh@zg5skeu62nbh>
References: <175068078778.15794.15418191733712827693.b4-ty@kernel.org>
 <20250624222206.GA1537968@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624222206.GA1537968@bhelgaas>
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

On Tue, Jun 24, 2025 at 05:22:06PM -0500, Bjorn Helgaas wrote:
> On Mon, Jun 23, 2025 at 06:13:07AM -0600, Manivannan Sadhasivam wrote:
> > On Tue, 10 Jun 2025 11:07:05 +0200, Christian Bruel wrote:
> > > Changes in v12;
> > >    Fix warning reported by kernel test robot <lkp@intel.com>
> > > 
> > > Changes in v11;
> > >    Address comments from Manivanna:
> > >    - RC driver: Do not call pm_runtime_get_noresume in probe
> > >                 More uses of dev_err_probe
> > >    - EP driver: Use level triggered PERST# irq
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/9] dt-bindings: PCI: Add STM32MP25 PCIe Root Complex bindings
> >       commit: 41d5cfbdda7a61c5d646a54035b697205cff1cf0
> > [2/9] PCI: stm32: Add PCIe host support for STM32MP25
> >       commit: f6111bc2d8fe6ffc741661126a2174523124dc11
> > [3/9] dt-bindings: PCI: Add STM32MP25 PCIe Endpoint bindings
> >       commit: 203cfc4a23506ffb9c48d1300348c290dbf9368e
> > [4/9] PCI: stm32: Add PCIe Endpoint support for STM32MP25
> >       commit: 8869fb36a107a9ff18dab8c224de6afff1e81dec
> > [5/9] MAINTAINERS: add entry for ST STM32MP25 PCIe drivers
> >       commit: 003902ed7778d62083120253cd282a9112674986
> 
> This doesn't build for me with the attached config:
> 
>   $ make drivers/pci/controller/dwc/pcie-stm32.o
>     CALL    scripts/checksyscalls.sh
>     DESCEND objtool
>     INSTALL libsubcmd_headers
>     CC      drivers/pci/controller/dwc/pcie-stm32.o
>   drivers/pci/controller/dwc/pcie-stm32.c: In function ‘stm32_pcie_suspend_noirq’:
>   drivers/pci/controller/dwc/pcie-stm32.c:83:16: error: implicit declaration of function ‘pinctrl_pm_select_sleep_state’ [-Werror=implicit-function-declaration]
>      83 |         return pinctrl_pm_select_sleep_state(dev);
> 	|                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   drivers/pci/controller/dwc/pcie-stm32.c: In function ‘stm32_pcie_resume_noirq’:
>   drivers/pci/controller/dwc/pcie-stm32.c:96:24: error: ‘struct device’ has no member named ‘pins’
>      96 |         if (!IS_ERR(dev->pins->init_state))
> 	|                        ^~
>   drivers/pci/controller/dwc/pcie-stm32.c:97:23: error: implicit declaration of function ‘pinctrl_select_state’ [-Werror=implicit-function-declaration]
>      97 |                 ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
> 	|                       ^~~~~~~~~~~~~~~~~~~~
>   drivers/pci/controller/dwc/pcie-stm32.c:97:47: error: ‘struct device’ has no member named ‘pins’
>      97 |                 ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
> 	|                                               ^~
>   drivers/pci/controller/dwc/pcie-stm32.c:97:61: error: ‘struct device’ has no member named ‘pins’
>      97 |                 ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
> 	|                                                             ^~
>   drivers/pci/controller/dwc/pcie-stm32.c:99:23: error: implicit declaration of function ‘pinctrl_pm_select_default_state’ [-Werror=implicit-function-declaration]
>      99 |                 ret = pinctrl_pm_select_default_state(dev);
> 	|                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 

Hmm... I see two issues here. First is, wrong pinctrl header used. The correct
one is:

#include <linux/pinctrl/consumer.h>

Second issue is the driver accessing "struct device::pins" directly. The "pins"
member won't be available if CONFIG_PINCTRL is not set (which is what your
.config has). So either the member should not be accessed directly or the
driver has to depend on CONFIG_PINCTRL. The latter one is not acceptable. It
also looks weird that only this driver is accessing the "pins" member directly
apart from the pinctrl core. So I think this part needs a revisit.

Christian?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

