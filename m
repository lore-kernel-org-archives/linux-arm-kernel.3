Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B25606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 06:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cr9nfXlD;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nLn7iabQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMJJtOaPJzI81KalVBBOZcnAoFG/9Ue++7vqjKuxbS4=; b=cr9nfXlDXHpCWu9nR7jWaIrV3B
	NOiDUSp5Ifd3rOqtdooDqw1XXQaOvsreHnB/jqRS2teQLEtOtqdXCe0pyGZXeJuDboTXC/r+tZRdQ
	oYc2CPzlSwLbOiZgWV72hd7KDr8USqlfm0aV2YSRcROddqJo5PNkv6wu/4qKl0nvuVvOUvN2UvNL9
	lyUfeWEKWMTUJnGL+0phRUe64BTZN7hCg6QpCeRszquHtkrXrnbEXpAOczAvBpMH1Ri+qQkXdbnaX
	jpWaBwfAKjha1iw2zezIQltssreVqX3DVV+ApL9jt06V+xfvPjw74w7yhMKGqG+AK3gx/m9Tg+whh
	jP38gMng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmdN-0000000DVsm-11TK;
	Thu, 22 Oct 2026 06:50:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmdL-0000000DVsO-045S;
	Thu, 22 Oct 2026 06:50:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 81C3143AC6;
	Thu, 22 Oct 2026 06:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7021F000C4;
	Thu, 22 Oct 2026 06:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792651838;
	bh=VMJJtOaPJzI81KalVBBOZcnAoFG/9Ue++7vqjKuxbS4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nLn7iabQcVBxR41nchJsSeKLe50j7FRih7F73CPOfFsH8JkLpmXAv5Z5YmvrWPT2O
	 X8gmEYBo+etLwTgfB/gX4hWPCJISLVJ1o08ddVC5t1dDmwOpNiUeQjA8M9tN2dCz1c
	 7xTjNmNztG9zlLhst/cUbacFaJ/WgoF/U+0HwNNxQ00oaOs9NnV12BVTH89Z/67C1O
	 CBaCtXQz6zVcw0acBIpgXxFlw4WyaYWy+C3WU/cQ+vzM+pu4F17F5lVpyPxgCZcX4q
	 Jj21bl6bVa6YiQpB4Uv8A++R6RfTXJq41IMP5TC9ti4VKQLNs+XaArlPLmCPPTx4la
	 Nb+iPMIZDN2xA==
Message-ID: <79a81f1d-2964-4b2a-80d1-64e01c202468@kernel.org>
Date: Thu, 22 Oct 2026 08:50:33 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] ata: ahci_brcm: Initialize the NSP interface clock
 and reset
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Tejun Heo <tj@kernel.org>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)"
 <linux-ide@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
References: <20261021165555.652102-1-florian.fainelli@broadcom.com>
 <20261021165555.652102-4-florian.fainelli@broadcom.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20261021165555.652102-4-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026/10/21 18:55, Florian Fainelli wrote:
> The NSP probe path assumes firmware has enabled the SATA IDM interface
> clock and released the core reset. The downstream iProc config_AHCI()
> sequence explicitly performs both operations before accessing AHCI.
> Without that setup, a cold boot can access an inactive controller.
> 
> Map the optional NSP IDM register region and enable the interface clock
> before releasing reset, retaining the downstream settling intervals.
> Perform the sequence at probe and resume before reconfiguring SATA.
> 
> Keep the resource optional so older device trees continue to rely on
> firmware initialization.
> 
> Fixes: 3ee2e6dcaa35 ("ata: ahci_brcm: Add support for Broadcom NSP SoC")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  drivers/ata/ahci_brcm.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
> index 29be74fedcf0..2ed60806b671 100644
> --- a/drivers/ata/ahci_brcm.c
> +++ b/drivers/ata/ahci_brcm.c
> @@ -6,7 +6,9 @@
>   */
>  
>  #include <linux/ahci_platform.h>
> +#include <linux/bcma/bcma_regs.h>
>  #include <linux/compiler.h>
> +#include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
> @@ -83,6 +85,7 @@ enum brcm_ahci_quirks {
>  struct brcm_ahci_priv {
>  	struct device *dev;
>  	void __iomem *top_ctrl;
> +	void __iomem *idm;
>  	u32 port_mask;
>  	u32 quirks;
>  	enum brcm_ahci_version version;
> @@ -230,6 +233,25 @@ static u32 brcm_ahci_get_portmask(struct ahci_host_priv *hpriv,
>  	return impl;
>  }
>  
> +static void brcm_sata_init_idm(struct brcm_ahci_priv *priv)
> +{
> +	u32 data;
> +
> +	if (!priv->idm)
> +		return;
> +
> +	/* Enable the interface clock before taking the SATA core out of reset. */

Long line. Please split before 80 chars.

> +	data = readl(priv->idm + BCMA_IOCTL);
> +	writel(data | BCMA_IOCTL_CLK, priv->idm + BCMA_IOCTL);
> +	readl(priv->idm + BCMA_IOCTL);
> +	usleep_range(1000, 2000);
> +
> +	data = readl(priv->idm + BCMA_RESET_CTL);
> +	writel(data & ~BCMA_RESET_CTL_RESET, priv->idm + BCMA_RESET_CTL);
> +	readl(priv->idm + BCMA_RESET_CTL);
> +	usleep_range(1000, 2000);
> +}
> +
>  static void brcm_sata_init(struct brcm_ahci_priv *priv)
>  {
>  	void __iomem *ctrl = priv->top_ctrl + SATA_TOP_CTRL_BUS_CTRL;
> @@ -369,6 +391,8 @@ static int __maybe_unused brcm_ahci_resume(struct device *dev)
>  	struct brcm_ahci_priv *priv = hpriv->plat_data;
>  	int ret = 0;
>  
> +	brcm_sata_init_idm(priv);
> +
>  	ret = reset_control_deassert(priv->rcdev_ahci);
>  	if (ret)
>  		return ret;
> @@ -453,6 +477,14 @@ static int brcm_ahci_probe(struct platform_device *pdev)
>  	priv->version = (unsigned long)of_id->data;
>  	priv->dev = dev;
>  
> +	/* Older NSP device trees rely on firmware to initialize the IDM. */
> +	if (priv->version == BRCM_SATA_NSP &&
> +	    platform_get_resource_byname(pdev, IORESOURCE_MEM, "idm")) {
> +		priv->idm = devm_platform_ioremap_resource_byname(pdev, "idm");
> +		if (IS_ERR(priv->idm))
> +			return PTR_ERR(priv->idm);
> +	}
> +
>  	priv->top_ctrl = devm_platform_ioremap_resource_byname(pdev, "top-ctrl");
>  	if (IS_ERR(priv->top_ctrl))
>  		return PTR_ERR(priv->top_ctrl);
> @@ -493,6 +525,8 @@ static int brcm_ahci_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	brcm_sata_init_idm(priv);

Here, this is called *before* the clocks are enabled, but in brcm_ahci_resume(),
brcm_sata_init() -> brcm_sata_init_idm(() is called *after* the clocks are
enabled. Does this matter?

> +
>  	ret = ahci_platform_enable_clks(hpriv);
>  	if (ret)
>  		goto out_reset;


-- 
Damien Le Moal
Western Digital Research

