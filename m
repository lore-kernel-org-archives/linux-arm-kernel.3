Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F40C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5fxKwOtV0w/VF0Z/prwVeCYeXxPC0FBGZeVJgEqWiU=; b=C2uTp6faI5/zQiUCp18WYj82AE
	CGmujeDD06mmmTzES7VHdi6bQUfrf/pbmv2Vfp2nUfMaZ1LDhoXXyIesK9HGGpS/36y2J1/i9o83L
	03jPwyGjHRQczr0cob5tsiA+LJuET6Ly3T5D6FncC+UggtzQHgmzmf2GsUSykN21AWFE0oaGZpzsO
	XwVCUXIu4Bh5Esp+CdjOIdbrD+sYkeyfEIoJnyh2TbDymX+kP0ILVdh0mBsO17LrtcujqY9gO2txR
	ILJrGsLaTmr8ktKEYOBR1AAqsmhWjtb9KtRvXq6kb2PARzZna77yAY7P0kx09Z9l+qH8lBou2dDVN
	upo+m0ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHghk-0000000FSlz-2FWg;
	Wed, 21 May 2025 10:29:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfx3-0000000FLxW-1VjA;
	Wed, 21 May 2025 09:41:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 411B86000A;
	Wed, 21 May 2025 09:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C36BC4CEEA;
	Wed, 21 May 2025 09:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747820487;
	bh=+2ACf2EVUznzds3MDpxXdhMN6A2gN/hs5eEw4sfUYDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lcfS6tBaeh1ph8fLFgw+Mz//8rf1DUFHHXN3rXWNj51CElqQ6DP+LG/MepdP7wJUO
	 /7jVlQ1uejYjHZBfKkXwNcnohWb+bVw+rcmaDQiQWaLltKAyORjspTh2oLV3j8MQjk
	 Mi68gOYvOXxPZamX6GKA0DcKY5nC0ye/v1eadSFN7+y+O64FrrOTfy96J7gytVB8Oo
	 ZzCF+vARlOq9p6isPWAcn9r4dxIe3I/qTp9/eYYrIabXF2pfmKg+e2yO/LcWL2WQIt
	 Gfox0cdL72JffPforo3G681RVmJcjMzlhKUBMEwFbe/lv1BfZrZhKnNAfB9tPTawxR
	 9ipeqIDz4iRGQ==
Date: Wed, 21 May 2025 11:41:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.or, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, vkoul@kernel.org, 
	kishon@kernel.org, arnd@arndb.de, m.szyprowski@samsung.com, jh80.chung@samsung.com, 
	Hrishikesh Dileep <hrishikesh.d@samsung.com>
Subject: Re: [PATCH 02/10] PCI: exynos: Remove unused MACROs in exynos PCI
 file
Message-ID: <20250521-succinct-roadrunner-from-avalon-f1fa4c@kuoka>
References: <20250518193152.63476-1-shradha.t@samsung.com>
 <CGME20250518193230epcas5p3dfb178a6528556c55e9b694ca8f8ad6c@epcas5p3.samsung.com>
 <20250518193152.63476-3-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250518193152.63476-3-shradha.t@samsung.com>
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

On Mon, May 19, 2025 at 01:01:44AM GMT, Shradha Todi wrote:
> Some MACROs are defined in the exynos PCI file but are
> not used anywhere within the file. Remove such unused
> MACROs.
> 
> Suggested-by: Hrishikesh Dileep <hrishikesh.d@samsung.com>
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> ---
>  drivers/pci/controller/dwc/pci-exynos.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
> index 1c70b036376d..990aaa16b132 100644
> --- a/drivers/pci/controller/dwc/pci-exynos.c
> +++ b/drivers/pci/controller/dwc/pci-exynos.c
> @@ -31,8 +31,6 @@
>  #define EXYNOS_IRQ_INTB_ASSERT			BIT(2)
>  #define EXYNOS_IRQ_INTC_ASSERT			BIT(4)
>  #define EXYNOS_IRQ_INTD_ASSERT			BIT(6)
> -#define EXYNOS_PCIE_IRQ_LEVEL			0x004

Fix order of patches. Why renaming something just to remove it? No
point.

Best regards,
Krzysztof


