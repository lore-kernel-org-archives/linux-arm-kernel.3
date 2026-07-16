Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455ECC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqNK14fvUgJPkPKSw3F2wEzBp6SPYyPXK1qyOUdckgI=; b=OgSEDYGTPXWrgIh5HBB3Zwv3GY
	sNeSysvdQxyQ19RCvqUQd3bMypQ+U/ZOHpGBcl/qpRmTqvMQFlkA/We4rIij+vOMhAm1P1HLLxqzo
	ieq138vDTodqDIWfzpxGvWGja+Sij4+bXv4Mrg58ZJlXFVyG5J9md+fdwKLOMR1s8W8SyL8p+ZhSv
	tMGVs8FEvBIaY0dbk9pgU6MTZ/5eK1BENdsqZSeXHEtyz5PRjEh3r+1bf5HnF7nuG+xulRcHatUtK
	6sprVDhdqKNvU3JqFGVgdjo/hYkQq6k+onUGXNZeTnAvBNtJOrmjKi/Kq5VySgZBstE+zI/La9uIb
	x4ieZPOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNPX-0000000HXOW-3JGm;
	Thu, 16 Jul 2026 14:50:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNPF-0000000HXKC-0JTe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:49:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4758C60A5C;
	Thu, 16 Jul 2026 14:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D7B1F000E9;
	Thu, 16 Jul 2026 14:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784213384;
	bh=zqNK14fvUgJPkPKSw3F2wEzBp6SPYyPXK1qyOUdckgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K3esabGfmFIKjOLPgAKaolLSygDxiOrWrwG/Ry2KPI0YTB50PTTslkIhpdBVK24PH
	 eqPi1gcalpvP/P65xerJArZDH03ErvYW+Ls2wOb98Y7u5DcbUsk/tJtRVludwWgps0
	 scZvArB+O9fDEE+uh+OlV0FCHOqxjFMxycWqbf1/JDOIgziKpP+JiejFIUc3SOEsBI
	 QVLc3HhonSLz2/9j0TJl/+98YUfTDlqhYNgi9nosmAWXQpfgvrcbVDV1ArAKx5OHJc
	 4serm5zFAq3uG1kEn3yWDECkW50gOHrGA0TsdONZQfTErTY9kPNOSvR6RORaWJAQjQ
	 bJJ1PUEbjZmCQ==
Date: Thu, 16 Jul 2026 16:49:29 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Marc Zyngier <maz@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] PCI: apple: Integrate pwrctrl API
Message-ID: <pbxefv7wotwcaavoas347htdx22rdupfqn6cbuyjf4y2kjlv4p@7xdael6h7d57>
References: <20260707-apple-pcie-pwren-v1-0-5a281b182fe2@cyberchaos.dev>
 <20260707-apple-pcie-pwren-v1-1-5a281b182fe2@cyberchaos.dev>
 <86a4s3p2vy.wl-maz@kernel.org>
 <8a80a170-a508-4a9e-8090-27cfcedb1cd4@cyberchaos.dev>
 <865x2qq4ts.wl-maz@kernel.org>
 <jqaxvdaxfpm5g3tdwdqpuk2ubkwim6ckmlblocvakloqishvmm@c5ofbdbdj7lf>
 <76243051-e391-45d2-b47a-d4a904f0a36f@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76243051-e391-45d2-b47a-d4a904f0a36f@cyberchaos.dev>
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

On Tue, Jul 14, 2026 at 06:57:11PM +0200, Yureka Lilian wrote:
> 
> On 7/9/26 14:29, Manivannan Sadhasivam wrote:
> > On Tue, Jul 07, 2026 at 02:58:39PM +0100, Marc Zyngier wrote:
> > > On Tue, 07 Jul 2026 13:04:21 +0100,
> > > Yureka Lilian <yureka@cyberchaos.dev> wrote:
> > > > On 7/7/26 11:25, Marc Zyngier wrote:
> > > > > On Mon, 06 Jul 2026 23:38:27 +0100,
> > > > > Yureka Lilian <yureka@cyberchaos.dev> wrote:
> > > > > > Integrate the PCI pwrctrl framework into the Apple PCIe host driver to
> > > > > > provide standardized power management for PCI devices.
> > > > > > 
> > > > > > Notably, this allows enabling powering on the WiFi, SD card reader on
> > > > > > various Macs by means of the pwrctrl framework before probing the ports.
> > > > > > 
> > > > > > Previously, a custom solution for powering on the WiFi and SD card
> > > > > > reader was proposed[1], but we can now use the new pci-pwrctrl-generic
> > > > > > driver for this purpose.
> > > > > > 
> > > > > > Link[1]: https://lore.kernel.org/lkml/20220502093832.32778-4-marcan@marcan.st/
> > > > > > 
> > > > > nit: this paragraph and the accompanying link don't belong in the
> > > > > commit message and should be moved below the --- mark or even better,
> > > > > to the cover letter.
> > > > ack, will leave it out of the commit message of the individual commit in v2
> > > > > > Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> > > > > > ---
> > > > > >    drivers/pci/controller/Kconfig      |  1 +
> > > > > >    drivers/pci/controller/pcie-apple.c | 16 ++++++++++++++++
> > > > > >    2 files changed, 17 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
> > > > > > index 2247709ef6d6..af64630d28fa 100644
> > > > > > --- a/drivers/pci/controller/Kconfig
> > > > > > +++ b/drivers/pci/controller/Kconfig
> > > > > > @@ -46,6 +46,7 @@ config PCIE_APPLE
> > > > > >    	depends on OF
> > > > > >    	depends on PCI_MSI
> > > > > >    	select PCI_HOST_COMMON
> > > > > > +	select PCI_PWRCTRL_GENERIC
> > > > > >    	select IRQ_MSI_LIB
> > > > > >    	help
> > > > > >    	  Say Y here if you want to enable PCIe controller support on Apple
> > > > > > diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> > > > > > index c2cffc0659f4..db038a9d4831 100644
> > > > > > --- a/drivers/pci/controller/pcie-apple.c
> > > > > > +++ b/drivers/pci/controller/pcie-apple.c
> > > > > > @@ -30,6 +30,7 @@
> > > > > >    #include <linux/msi.h>
> > > > > >    #include <linux/of_irq.h>
> > > > > >    #include <linux/pci-ecam.h>
> > > > > > +#include <linux/pci-pwrctrl.h>
> > > > > >      #include "pci-host-common.h"
> > > > > >    @@ -825,6 +826,21 @@ static int apple_pcie_init(struct
> > > > > > pci_config_window *cfg)
> > > > > >    	if (WARN_ON(!pcie))
> > > > > >    		return -ENOENT;
> > > > > >    +	ret = pci_pwrctrl_create_devices(pcie->dev);
> > > > > > +	if (ret) {
> > > > > > +		dev_err(pcie->dev, "Failed to create pwrctrl devices: %pe\n", ret);
> > > > > > +		return ret;
> > > > > > +	}
> > > > > > +
> > > > > > +	ret = pci_pwrctrl_power_on_devices(pcie->dev);
> > > > > > +	if (ret) {
> > > > > > +		if (ret != -EPROBE_DEFER) {
> > > > > > +			dev_err(pcie->dev, "Failed to power on devices: %pe\n", ret);
> > > > > > +			pci_pwrctrl_destroy_devices(pcie->dev);
> > > > > > +		}
> > > > > > +		return ret;
> > > > > > +	}
> > > > > > +
> > > > > Why is this done globally while the whole driver works on a per-port
> > > > > basis, and that the proposed DT updates are also per port?
> > > > pci_pwrctrl_power_on_devices takes a struct device as parameter, but
> > > > pcie-apple does not allocate device structs for the individual ports.
> > > > This could be changed of course. But since pci_pwrctrl_* operate on
> > > > the subnodes recursively, it works just fine this way.
> > > Works fine is one thing. Being consistent with the way the rest of the
> > > driver works is another. pci_pwrctrl_create_device() and
> > > pci_pwrctrl_power_on_device() appear to do exactly what would be
> > > required for a single port. They just needs to be exported made
> > > global/exported.
> > > 
> > I'm fine with exporting pci_pwrctrl_create_device() and
> > pci_pwrctrl_power_on_device() and calling them with per-port np.
> > 
> > - Mani
> 
> In theory I do agree this would work to power on the slots, and I can send a
> v2 of the patch doing it that way, but I don't quite understand yet how this
> fits better with the existing driver code: If this is the case, what is the
> difference between pcie-apple and pcie-qcom and why should pcie-qcom use the
> recursive function but pcie-apple not?
> 

For pcie-qcom, it needs to iterate through all PCI child nodes, not just the RP
as we have multiple nodes due to PCIe switch (and switches in some design). So
this per-port API wouldn't work there.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

