Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AE5D32D7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 09:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRK4dwC2pj8x4oVLThLt6Q7pXDWIdqXmbFkswTXuyXQ=; b=S6KOpgh0CV/Yh2+fcfnGrO+RTx
	uuM0EuDQl+voV7BYRXBo7GnPeVBRQLmyIwYcY75QdVKPyjds1u+1/E/UMgpvG3OtvoLs09C32yvYs
	1+mV0bzhr6zPBlCRG731m+y9hkv3wZ5EcCq+/ouHeIlj1efxmMf56mbDeNc7khKa952HAkpBgO8Hd
	84hBhlsPDTQW37KtDhD8kyrqIQ1ufF82wbC8WdAUdoOTVUkjrkn9sAcDKULxPTFIQsWi5qBRhPCQt
	xSZDXeArxmhUTCkkzbkRHRsz3YZurfyJ0S/alf0ORa/z6m0Y+qJhJ94V7sTaySQrxpfVl7gVtZPxP
	k11Kd6Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnQb-00000002uld-2ru0;
	Tue, 12 Nov 2024 09:43:17 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAnOJ-00000002uOm-0s9j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 09:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zRK4dwC2pj8x4oVLThLt6Q7pXDWIdqXmbFkswTXuyXQ=; b=kPHXM9GXG96w7IN0GlLAObo5lV
	1QxeaPf++7UefKmxBpPnEpLAqQRuJinzjST0By27abht9f83scNlYMNROnKbSrvn7L2hE7FvXXP2e
	z/ex5HCrEDmHwEthspY5FYW5+bKz9C4RcYy61cdClki+DJPerd9SELs1xNW5EkI+gR5JsB6CN8EK4
	AJaWYdBe4GRLaSyrlZJdbRKaU9kGRkQkd5bHVQeL4Ar2hFSQBbNQ4KjgzVUVce7rjIpEHaCif5R7j
	0VwDIWC00Y+V8qfPZP9C+b9cMFuk9W+XtepOdXtmDJXokvAhRp71FJQa+dXEUnD2TiOGgkCI6lH51
	uKTrvLAA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38390)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tAnO9-0003qe-2d;
	Tue, 12 Nov 2024 09:40:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tAnO6-0007MY-39;
	Tue, 12 Nov 2024 09:40:42 +0000
Date: Tue, 12 Nov 2024 09:40:42 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
Cc: lpieralisi@kernel.org, thomas.petazzoni@bootlin.com, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	salee@marvell.com, dingwei@marvell.com
Subject: Re: [PATCH 1/1] PCI: armada8k: add device reset to link-down handle
Message-ID: <ZzMimiRUAV6ecx1s@shell.armlinux.org.uk>
References: <20241112070310.757856-1-jpatel2@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112070310.757856-1-jpatel2@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_014055_286564_068F385E 
X-CRM114-Status: GOOD (  18.73  )
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

On Mon, Nov 11, 2024 at 11:03:10PM -0800, Jenishkumar Maheshbhai Patel wrote:
> diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c b/drivers/pci/controller/dwc/pcie-armada8k.c
> index b1b48c2016f7..9a48ef60be51 100644
> --- a/drivers/pci/controller/dwc/pcie-armada8k.c
> +++ b/drivers/pci/controller/dwc/pcie-armada8k.c
> @@ -23,6 +23,7 @@
>  #include <linux/of_pci.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
> +#include <linux/of_gpio.h>
>  
>  #include "pcie-designware.h"
>  
> @@ -37,6 +38,8 @@ struct armada8k_pcie {
>  	struct regmap *sysctrl_base;
>  	u32 mac_rest_bitmask;
>  	struct work_struct recover_link_work;
> +	enum of_gpio_flags flags;
> +	struct gpio_desc *reset_gpio;
>  };
>  
>  #define PCIE_VENDOR_REGS_OFFSET		0x8000
> @@ -238,9 +241,18 @@ static void armada8k_pcie_recover_link(struct work_struct *ws)
>  	}
>  	pci_lock_rescan_remove();
>  	pci_stop_and_remove_bus_device(root_port);
> +	/* Reset device if reset gpio is set */
> +	if (pcie->reset_gpio) {
> +		/* assert and then deassert the reset signal */
> +		gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> +		msleep(100);
> +		gpiod_set_value_cansleep(pcie->reset_gpio,
> +					 (pcie->flags & OF_GPIO_ACTIVE_LOW) ? 0 : 1);

This looks wrong. resets are normally active-low.
gpiod_set_value_cansleep() should be called with '1' to indicate active
state, and '0' to indicate de-active state. DT should specify whether
the signal is active high or active low.

> +	/* Config reset gpio for pcie if the reset connected to gpio */
> +	reset_gpio = of_get_named_gpio_flags(pdev->dev.of_node,
> +					     "reset-gpios", 0,
> +					     &pcie->flags);
> +	if (gpio_is_valid(reset_gpio))
> +		pcie->reset_gpio = gpio_to_desc(reset_gpio);
> +

Just use devm_fwnode_gpiod_get() here, which will also handle the
cleanup.

To see how this should be done, look at
drivers/pci/controller/pci-mvebu.c which gets the polarity settings
correct too, as mentioned above.

Lastly, as this patch is related to the breaking DT change, it
_should_ have been sent as a patch series (which means the same
Cc list on each patch) so that reviewers can see the full story
and comments on the other patches.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

