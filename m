Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F73C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZ+t0r04A9n4IJdQ/W6j5U+mLAScXuxePRrybklmGrA=; b=ZXJsFnODz4Nyh+bgCRdOceTLVh
	jN5P8pRam7aYRBLjAjnpLTT7iusD2HTBdgiy1ASnWGcad4sCiWBtJe1utzprqkkXiatucmpuLiPP5
	AfEZINydZ03Nf+NrYC42FpHAkre1+A8KnxXWblnPv/2/3lxmhirGV0FwDgs51tWHG4Ou0YbaS5yFm
	D6mqdMVJmrlmlWsOtQ06uyLgdLyO0neupvl2qGsPxJ1gN0/bVh08FeAM6Pd/Gw/h+LjIJtKRRIDOq
	uTtexB+myg84+CtmQdh/fvAAJdkxb5fkeC7VHw/45GoYw3Yezjer+Ur/nfJjjlaQ6qWnGWkOg1Ahd
	qoN+EUSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lvx-00000008E11-3MKc;
	Wed, 23 Sep 2026 12:18:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Lvt-00000008E0P-2ReO
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 12:18:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rZ+t0r04A9n4IJdQ/W6j5U+mLAScXuxePRrybklmGrA=; b=XxVN8P+O3R81HeCYbf0axeYl5D
	1Yi3ZTORlkadk2VwAHCOB1VQzJTh3XjFAnInxmVpAYLHXlAgHv+sfR8+o//RkCKdZkBZ2qRSORt64
	b8ITCTINov8ZSRlI7O0w/C3ACuh4GrC/+G1QaTBymgebq6Kob31PHxkc3EKAoh8xSUfgFhFKTJiUb
	wzpAnDLKLNgWG/zX89pEDxOQ2OIjl9nNFR3j0PNlAfxkQlewSG426p6lAEg2JXGpenXI0EMi0sKLl
	wov8e3Hta8+Ps+voQsqHf9Sd5+47G2rfydDArpLBFwaCpg/H7jdBwhGIvWD6kW+oxAWVpEgxCkdOB
	58jSV2lw==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9Lvq-0000000EkKU-0waU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rZ+t0r04A9n4IJdQ/W6j5U+mLAScXuxePRrybklmGrA=; b=MvwxdJ8TIg3NSfmiO5iN5pdkZG
	JUO4RZhctuuY1g0lTouZ0uOHLv5w4RqCHLbA0DXxhwDKOGAocM5rWmVIifmRXQC+WIXDbh9MzSf6e
	JF5C/3399TTWE7+MtoK8/EZDaYwMlJY8BXK2d9zhvyB4vO75g25SqsCYQFIt8vH/Dxr4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x9LvV-006nYe-3Q; Wed, 23 Sep 2026 14:18:17 +0200
Date: Wed, 23 Sep 2026 14:18:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Cochran <richardcochran@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Subject: Re: [PATCH RFC net-next 3/9] net: pcs: xpcs: add custom platform
 register accessors
Message-ID: <be09d6dc-c1c0-4a0c-9836-2b686ad096f4@lunn.ch>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923-qcom_xpcs_nord_emac-v1-3-4b1c682af70f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-3-4b1c682af70f@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_131838_749222_F3E63123 
X-CRM114-Status: GOOD (  19.00  )
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

On Wed, Sep 23, 2026 at 06:37:29AM +0530, Mohd Ayaan Anwar wrote:
> Some XPCS integrations do not expose the standard direct or indirect
> register layout. Allow the platform driver to use optional register read
> and write callbacks for both Clause 22 and Clause 45 accesses, while
> retaining the existing access paths when no callbacks are supplied.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  drivers/net/pcs/pcs-xpcs-plat.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-plat.c
> index e669a7b248ac4677aeb5cd1874108f5c87f837d2..e78a233fb198d940951064a71e8597c6c666bc9d 100644
> --- a/drivers/net/pcs/pcs-xpcs-plat.c
> +++ b/drivers/net/pcs/pcs-xpcs-plat.c
> @@ -24,8 +24,16 @@
>  /* Page select register for the indirect MMIO CSRs access */
>  #define DW_VR_CSR_VIEWPORT		0xff
>  
> +struct dw_xpcs_plat_ops {
> +	int (*reg_read)(struct platform_device *pdev, void __iomem *reg_base,
> +			int dev, int reg);
> +	int (*reg_write)(struct platform_device *pdev, void __iomem *reg_base,
> +			 int dev, int reg, u16 val);
> +};
> +
>  struct dw_xpcs_plat {
>  	struct platform_device *pdev;
> +	const struct dw_xpcs_plat_ops *ops;
>  	struct mii_bus *bus;
>  	bool reg_indir;
>  	int reg_width;
> @@ -169,6 +177,10 @@ static int xpcs_mmio_read_c22(struct mii_bus *bus, int addr, int reg)
>  	if (addr != 0)
>  		return -ENODEV;
>  
> +	if (pxpcs->ops)
> +		return pxpcs->ops->reg_read(pxpcs->pdev, pxpcs->reg_base,
> +					    MDIO_MMD_VEND2, reg);
> +
>  	if (pxpcs->reg_indir)
>  		return xpcs_mmio_read_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg);
>  	else

Ugly.

How about changing pxpcs->reg_indir to an enum, with values indirect, direct.

One patch.

Then look at

	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "direct") ?:
	      platform_get_resource_byname(pdev, IORESOURCE_MEM, "indirect");
	if (!res) {
		dev_err(dev, "No reg-space found\n");
		return -EINVAL;
	}

	if (!strcmp(res->name, "indirect"))
		pxpcs->reg_indir = true;

	if (pxpcs->reg_indir)
		spc_size = pxpcs->reg_width * SZ_256;
	else
		spc_size = pxpcs->reg_width * SZ_2M;

Look how easy it is to cleanly extend this with a new resource name?
And add accessors using the funky mapping your device has. Another
patch.

    Andrew

---
pw-bot: cr

