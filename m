Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FFEC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lKM+oaZ8kPvzbbTNx0b/hvvG4bLypYVZR5vlhZNkls=; b=jJ7nNyX7G1Hb7bg6J5EQLdt4Mp
	O6Gn7YjBnnQXyqkPJYZA5czvFJmW1JBMabkF3uNUM/6uDzy8ufVuox9d68eAeO6oLD8LQ6i92bSB/
	kXx2hwxvVvzjq83antDh4eURgqq0h6u1XG/YT9H6tCUBgf8movvy7lBqjgN5qkkBfjmQpE8Ktis6I
	Uf7z7itVgPZKzrQhhN6Fy0vJjjE8KBQ3b9zv6sD8kxUup2s2RsncvGxAIzdUGmxiWbpcbDYPTVGM/
	0zNvaQ0pQPJtbJbKUVewW4OpNHuu1nj5BIx5dG59gUfTnfNb7o+4HD9tHIBckTNqMvXtqMaUAdjYd
	UB/3owgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHghl-0000000FSmn-1mf2;
	Wed, 21 May 2025 10:29:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfyD-0000000FM6n-133K;
	Wed, 21 May 2025 09:42:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 71B1D5C4AE2;
	Wed, 21 May 2025 09:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1D4C4CEEA;
	Wed, 21 May 2025 09:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747820560;
	bh=68q/IbPYPxygxx5c/OXPCNRFH7INdTpZGlMiYkPeW1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WntjIGuQPDsKX/mYWYu0FkXFL+RSS/akUgmMVsho09NJNA8oqm6QVXC50ERtC+1cR
	 xxnTBvuXtaEQp7Q9aG1hMX4uE1CE0izhyGwlvuDDggKIG2XtmIW6xcA1JjVW66OTlM
	 ztiGD1J7QLNhQ0Sg5CTY4TM0GxqGRKXy23nUutf9x5bpCpu65I5WJVaELulRNyZ2ob
	 uXTy9Y6hWGRA3P8n37w1yH2TDtxUz5z0IqFLCGvn04Rf432erZzGL8h7KfQl+IlLYN
	 6UqscpWvGfqqr0VRcoLjCArY1LM0NIh/MzMJTOJ5nxL6uYecYR/pDiOxPJgoVd+9iU
	 Qi6qc2T+w9qLg==
Date: Wed, 21 May 2025 11:42:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.or, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, vkoul@kernel.org, 
	kishon@kernel.org, arnd@arndb.de, m.szyprowski@samsung.com, jh80.chung@samsung.com, 
	Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH 05/10] PCI: exynos: Add structure to hold resource
 operations
Message-ID: <20250521-nostalgic-fox-of-valor-f6d725@kuoka>
References: <20250518193152.63476-1-shradha.t@samsung.com>
 <CGME20250518193244epcas5p3cacfbdc3b0e5c32f7a4dd97062a931a4@epcas5p3.samsung.com>
 <20250518193152.63476-6-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250518193152.63476-6-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_024241_325529_9535C587 
X-CRM114-Status: GOOD (  11.20  )
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

On Mon, May 19, 2025 at 01:01:47AM GMT, Shradha Todi wrote:
> +struct samsung_res_ops {
> +	int (*init_regulator)(struct exynos_pcie *ep);
> +	irqreturn_t (*pcie_irq_handler)(int irq, void *arg);
>  };
>  
>  static void exynos_pcie_writel(void __iomem *base, u32 val, u32 reg)
> @@ -74,6 +81,36 @@ static u32 exynos_pcie_readl(void __iomem *base, u32 reg)
>  	return readl(base + reg);
>  }
>  
> +static int samsung_regulator_enable(struct exynos_pcie *ep)
> +{
> +	struct device *dev = ep->pci.dev;
> +	int ret;
> +
> +	if (ep->supplies_cnt == 0)
> +		return 0;
> +
> +	ret = devm_regulator_bulk_get(dev, ep->supplies_cnt, ep->supplies);

No. Getting resources on every enable is making this much less readable.

NAK

Best regards,
Krzysztof


