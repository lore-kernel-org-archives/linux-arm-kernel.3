Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39751C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 18:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eaq4HSPeUV6URGSqLp1bUMmIJ6pdUNEqKc+Y3suvYiw=; b=Tqv6Oc5gg8cKw2/x0oxJtV42rq
	YnBrZU4/J+URyhQPQRiEHKbe5HNbi4k6PqHOd2Z8E/ajAFwlgSjZI4eQ7m5Q2IQNsed3h7SUyB12P
	BLCWM/q2L0orKNelMizQ3VI0O2YS9lj7OfbzKrHkiJVKD4g66lmGKgyuUZER//mtT77VztgOZRdSw
	Pzc7FZEF73IVuytQpEwY3/mvcDlsei6T1OdjKgWGNJiKEV7Ot1mhHrwCAk+uBD4twJQ95X4+l8thA
	tlTBkbxnZiBgQBo/G/S8DO6HBl4xsxyr5sRGQ12Er6InEhFPkTTb25ADBbyqsjcS+0vYApCVrBli3
	NboA1wNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Nmz-00000000XHN-2ugc;
	Fri, 25 Apr 2025 18:28:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8NYc-00000000VVs-3OzS;
	Fri, 25 Apr 2025 18:13:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6ACAEA4D41E;
	Fri, 25 Apr 2025 18:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF013C4CEE4;
	Fri, 25 Apr 2025 18:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745604829;
	bh=+R7PIio0jdtEKpan0a9pq9Eg4ukFgKIiHhho8TZ3TVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eWawd3FCDXLQyP3oEO5T2ceR+TcSbYfbLR3o4X4X4ik9GlDlD5RaZn0/m5DVZHrDj
	 Kl+1DjYkvmLsI8kgTz9/0kk1+f+Bxr8FX8DvB9y66tz3SCtgoaFj8nMCOS+nRmvhpR
	 aK1Kj1OR3QFhqyh5pH96Y/mItoaIC8GdoZC3tngiDyUlnLF1Nz8uQmrVLIf6nYt++a
	 A7F/42LG/xOgOBA80oR1s8EL70PNiq/iVpIn681FTDQh48eHs44IFV3p4m+gFYztq9
	 54yBDjRarWqBmz96F2LClKtL6JKLeiUxs/QSsejfrupm45Rlo8FVZ/jUMsRqjZuDgm
	 XwH0m3MgSRYGA==
Received: by pali.im (Postfix)
	id CD881880; Fri, 25 Apr 2025 20:13:45 +0200 (CEST)
Date: Fri, 25 Apr 2025 20:13:45 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	heiko@sntech.de, thomas.petazzoni@bootlin.com,
	manivannan.sadhasivam@linaro.org, yue.wang@Amlogic.com,
	neil.armstrong@linaro.org, robh@kernel.org, jingoohan1@gmail.com,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/2] PCI: Remove redundant MPS configuration
Message-ID: <20250425181345.bybgcht5tweyg43k@pali>
References: <20250425095708.32662-1-18255117159@163.com>
 <20250425095708.32662-3-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425095708.32662-3-18255117159@163.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_111350_910066_AC5C1A5D 
X-CRM114-Status: GOOD (  10.47  )
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

On Friday 25 April 2025 17:57:08 Hans Zhang wrote:
> diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
> index a29796cce420..d8852892994a 100644
> --- a/drivers/pci/controller/pci-aardvark.c
> +++ b/drivers/pci/controller/pci-aardvark.c
> @@ -549,9 +549,7 @@ static void advk_pcie_setup_hw(struct advk_pcie *pcie)
>  	reg = advk_readl(pcie, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
>  	reg &= ~PCI_EXP_DEVCTL_RELAX_EN;
>  	reg &= ~PCI_EXP_DEVCTL_NOSNOOP_EN;
> -	reg &= ~PCI_EXP_DEVCTL_PAYLOAD;
>  	reg &= ~PCI_EXP_DEVCTL_READRQ;
> -	reg |= PCI_EXP_DEVCTL_PAYLOAD_512B;
>  	reg |= PCI_EXP_DEVCTL_READRQ_512B;
>  	advk_writel(pcie, reg, PCIE_CORE_PCIEXP_CAP + PCI_EXP_DEVCTL);
>  
> -- 
> 2.25.1
> 

Please do not remove this code. It is required part of the
initialization of the aardvark PCI controller at the specific phase,
as defined in the Armada 3700 Functional Specification.

