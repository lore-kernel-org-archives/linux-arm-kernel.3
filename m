Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9296DCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 19:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYwARVPisZSYEZYwHAOweWHtqLufsiN/mavyT2AdKjo=; b=rz5+pI/5gy2zhX5749O/2sd5oh
	Ze9573dERhGuTmFcQrZX0N8tqFmJ9pICFAv/aO4z7G2BnnIiwXR7/HoEsMrvIvYDFlIyXpN5lcthS
	5Jde9flTE+NlfYKKt97Q/u8axPD/AOGrxeWm1LuxuSLaqkhfzsPo1soYgvOQI6uZetCfTBrrCThbp
	nyaW/tIm4LFwO1UC9/33FaEFotCv50lbH1RZdp6tGG1OkUPbrrRlKL9rs6MGO+T5jFFpBLxR/nRGE
	yXbRjVHc+XcIF39Tbaj588wWrimNLTSf0ZEnqG9CRQ3lg7IWDnHUtZ2AkzAl4F/nSNUpx7lZn210j
	r79+KO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRv3-0000000BOeF-13Zs;
	Tue, 19 Aug 2025 19:22:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOyO-0000000AzWP-2C3k;
	Tue, 19 Aug 2025 16:14:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DEF1060209;
	Tue, 19 Aug 2025 16:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E8BC116B1;
	Tue, 19 Aug 2025 16:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755620047;
	bh=7mkf/EqhebSrqdh5k2QADksG30ir99A1YyktolOn9J0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HSm0Q3pjLsLdY1MXZuiq4rwR2K/cBlGRf5KZAcZXIpQzdPvDjh+SRvBLRB3WyTdgo
	 R9AFdkpqETBYl1rexcCKiX7hI3cFquQYDWtI1d+Gzd/sSPVeeDxXWoRRMv4AKy/kCc
	 KQUB2is0f46tmM0GyZ5byyG9xif/Kd5JkCI/Yivt1219xxOjn39l+EHgb5dX9xia2a
	 +rgP8tSBk30N6scO2PQC7qElTHEwc0pbucR81nTMxC68WfZlnT5UgKmnz05agZoYHU
	 BH/sauRG8oubY6Gi+iDVHetexvJc4AkG4vhPGgyK3WPqc8RStjY1WDLjx2L6x+cFZe
	 BuigNcKYViDYg==
Date: Tue, 19 Aug 2025 21:43:58 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Cyril Brulebois <kibi@debian.org>, bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] PCI: brcmstb: Add a way to indicate if PCIe
 bridge is active
Message-ID: <6maieqyzt2c73l7pbk37owh7dfjybnhgq746h5zxjhvmp3f472@dx4ibad3en6f>
References: <20250807221513.1439407-1-james.quinlan@broadcom.com>
 <20250807221513.1439407-2-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250807221513.1439407-2-james.quinlan@broadcom.com>
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

On Thu, Aug 07, 2025 at 06:15:12PM GMT, Jim Quinlan wrote:
> In a future commit, a new handler will be introduced that in part does
> reads and writes to some of the PCIe registers.  When this handler is
> invoked, it is paramount that it does not do these register accesses when
> the PCIe bridge is inactive, as this will cause CPU abort errors.
> 
> To solve this we keep a spinlock that guards a variable which indicates
> whether the bridge is on or off.  When the bridge is on, access of the PCIe
> HW registers may proceed.
> 
> Since there are multiple ways to reset the bridge, we introduce a general
> function to obtain the spinlock, call the specific function that is used
> for the specific SoC, sets the bridge active indicator variable, and
> releases the spinlock.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>  drivers/pci/controller/pcie-brcmstb.c | 51 +++++++++++++++++++++------
>  1 file changed, 40 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 9afbd02ded35..ceb431a252b7 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -30,6 +30,7 @@
>  #include <linux/reset.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
> +#include <linux/spinlock.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
>  
> @@ -259,6 +260,7 @@ struct pcie_cfg_data {
>  	int (*perst_set)(struct brcm_pcie *pcie, u32 val);
>  	int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
>  	int (*post_setup)(struct brcm_pcie *pcie);
> +	bool has_err_report;
>  };
>  
>  struct subdev_regulators {
> @@ -303,6 +305,8 @@ struct brcm_pcie {
>  	struct subdev_regulators *sr;
>  	bool			ep_wakeup_capable;
>  	const struct pcie_cfg_data	*cfg;
> +	bool			bridge_on;
> +	spinlock_t		bridge_lock;
>  };
>  
>  static inline bool is_bmips(const struct brcm_pcie *pcie)
> @@ -310,6 +314,24 @@ static inline bool is_bmips(const struct brcm_pcie *pcie)
>  	return pcie->cfg->soc_base == BCM7435 || pcie->cfg->soc_base == BCM7425;
>  }
>  
> +static inline int brcm_pcie_bridge_sw_init_set(struct brcm_pcie *pcie, u32 val)

No need to specify 'inline' keyword.

> +{
> +	unsigned long flags;
> +	int ret;
> +
> +	if (pcie->cfg->has_err_report)
> +		spin_lock_irqsave(&pcie->bridge_lock, flags);
> +
> +	ret = pcie->cfg->bridge_sw_init_set(pcie, val);
> +	/* If we fail, assume the bridge is in reset (off) */
> +	pcie->bridge_on = ret ? false : !val;

s/bridge_on/bridge_in_reset

This callback is not necessarily turning the bridge ON/OFF.

> +
> +	if (pcie->cfg->has_err_report)
> +		spin_unlock_irqrestore(&pcie->bridge_lock, flags);
> +
> +	return ret;
> +}
> +
>  /*
>   * This is to convert the size of the inbound "BAR" region to the
>   * non-linear values of PCIE_X_MISC_RC_BAR[123]_CONFIG_LO.SIZE
> @@ -756,9 +778,8 @@ static void __iomem *brcm7425_pcie_map_bus(struct pci_bus *bus,
>  
>  static int brcm_pcie_bridge_sw_init_set_generic(struct brcm_pcie *pcie, u32 val)
>  {
> -	u32 tmp, mask = RGR1_SW_INIT_1_INIT_GENERIC_MASK;
> -	u32 shift = RGR1_SW_INIT_1_INIT_GENERIC_SHIFT;
> -	int ret = 0;
> +	u32 tmp;
> +	int ret;
>  
>  	if (pcie->bridge_reset) {
>  		if (val)
> @@ -774,10 +795,10 @@ static int brcm_pcie_bridge_sw_init_set_generic(struct brcm_pcie *pcie, u32 val)
>  	}
>  
>  	tmp = readl(pcie->base + PCIE_RGR1_SW_INIT_1(pcie));
> -	tmp = (tmp & ~mask) | ((val << shift) & mask);
> +	u32p_replace_bits(&tmp, val, RGR1_SW_INIT_1_INIT_GENERIC_MASK);

This change doesn't belong to this patch.

>  	writel(tmp, pcie->base + PCIE_RGR1_SW_INIT_1(pcie));
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int brcm_pcie_bridge_sw_init_set_7278(struct brcm_pcie *pcie, u32 val)
> @@ -1081,7 +1102,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
>  	int memc, ret;
>  
>  	/* Reset the bridge */
> -	ret = pcie->cfg->bridge_sw_init_set(pcie, 1);
> +	ret = brcm_pcie_bridge_sw_init_set(pcie, 1);
>  	if (ret)
>  		return ret;
>  
> @@ -1097,7 +1118,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
>  	usleep_range(100, 200);
>  
>  	/* Take the bridge out of reset */
> -	ret = pcie->cfg->bridge_sw_init_set(pcie, 0);
> +	ret = brcm_pcie_bridge_sw_init_set(pcie, 0);
>  	if (ret)
>  		return ret;
>  
> @@ -1565,7 +1586,7 @@ static int brcm_pcie_turn_off(struct brcm_pcie *pcie)
>  
>  	if (!(pcie->cfg->quirks & CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN))
>  		/* Shutdown PCIe bridge */
> -		ret = pcie->cfg->bridge_sw_init_set(pcie, 1);
> +		ret = brcm_pcie_bridge_sw_init_set(pcie, 1);
>  
>  	return ret;
>  }
> @@ -1653,7 +1674,9 @@ static int brcm_pcie_resume_noirq(struct device *dev)
>  		goto err_reset;
>  
>  	/* Take bridge out of reset so we can access the SERDES reg */
> -	pcie->cfg->bridge_sw_init_set(pcie, 0);
> +	ret = brcm_pcie_bridge_sw_init_set(pcie, 0);
> +	if (ret)
> +		goto err_reset;
>  
>  	/* SERDES_IDDQ = 0 */
>  	tmp = readl(base + HARD_DEBUG(pcie));
> @@ -1921,7 +1944,10 @@ static int brcm_pcie_probe(struct platform_device *pdev)
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret, "could not enable clock\n");
>  
> -	pcie->cfg->bridge_sw_init_set(pcie, 0);
> +	ret = brcm_pcie_bridge_sw_init_set(pcie, 0);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "could not un-reset the bridge\n");

I believe Bjorn asked you to change this error message to:
'could not deassert the bridge' or similar, but you ended up changing the
unrelated error message below.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

