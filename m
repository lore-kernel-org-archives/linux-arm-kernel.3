Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B76C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 14:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VeV3NM4oY+ysrk2RS/UJf6iUg3xL3TNcy89m5JcraFk=; b=ycuSPbC6V7To6JMciqQRZIFyUh
	KV6FVU5eVixFCRFjaKQL3Ehh/+r6iZVa4RyL8IkEW/B0YHcHjMSfnftaEB/Xgpyj+DnV+gee879zm
	wsm6s1ydUrH9HVvAKly5JjZ41auUyvksa7CZbou3nRRagyfWjah6gPSYUtuB/PFGbSqMfi9W+P6pI
	zjicJALBXbcJxA9+EUkyf+jU3DP+qAdyRYnZzl8d1gGJBGiPpR457kkgeCt9471o/G8dksvfOQiTn
	IYEjew4oYA9+Uye9SGs0d6XNbTH0FsacDqZ3qqRvQWkiTKCd7iko3J/1hWKac2IqE+M8bJZokDbf4
	x/WBN2Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPln-0000000AOym-3aKj;
	Thu, 17 Jul 2025 14:39:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNwF-0000000A9DY-3fA5;
	Thu, 17 Jul 2025 12:42:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EF5B45D06;
	Thu, 17 Jul 2025 12:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0E99C4CEE3;
	Thu, 17 Jul 2025 12:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752756135;
	bh=ZBY36t6x50q8YzRo+BWSKkd27H/7AfalmvHRzL44imU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pjK5XcOQBtD8/L1ha67M2mu0f609rbwi7BfOqhatr1LcEPBfC1s3ow72ilT5tERiO
	 mzR8YMBo4AJ5Vlw8cHTNNPx+CiMgz2Q8M5It4a7caKGpUu5uVJWn+JRBWb5p7wZf4X
	 Chhy1h2Awqn4RxoC9mBUKEkiplJ3gsSTlUfDI41FVjtDn8yOgkFY58I4TDxq5B2I7K
	 wPQrybzH/jnHJU1pzUVKxKL0RqSYB+R4XkT202uXP77PdkWNOBcgqRNHQOuVW2pKsx
	 ocD27OmpjCu6FAUKTvEjtmfbP60vVEqtvTER3+qlJkZyNXtE/DlT+uhRQqK1pQbWm8
	 m9xpMBL6obipA==
Date: Thu, 17 Jul 2025 18:12:06 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>, nsaenz@kernel.org
Cc: linux-kernel@vger.kernel.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:BROADCOM STB PCIE DRIVER" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 1/2] MAINTAINERS: Drop Nicolas from maintaining
 pcie-brcmstb
Message-ID: <bulofvsxrn7qm7vcuxhweqwlzaf7rkvzsmyg4ox67gi6gc55lg@xl2hlxd5fii5>
References: <20250624231923.990361-1-florian.fainelli@broadcom.com>
 <20250624231923.990361-2-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624231923.990361-2-florian.fainelli@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_054215_930869_0649DB28 
X-CRM114-Status: GOOD (  13.82  )
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

+ Nicolas (who was not CCed)

On Tue, Jun 24, 2025 at 04:19:22PM GMT, Florian Fainelli wrote:
> Nicolas indicated a long time back that he would not have the bandwidth
> and indeed, has not provided any review or feedback since.
> 

Nicolas, I hope you are fine with this change. So I'm going ahead and merging
it. If you don't feel so, please let me know.

- Mani

> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 41d95e7c60c6..439edc5babb3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5093,7 +5093,6 @@ F:	include/linux/platform_data/brcmnand.h
>  
>  BROADCOM STB PCIE DRIVER
>  M:	Jim Quinlan <jim2101024@gmail.com>
> -M:	Nicolas Saenz Julienne <nsaenz@kernel.org>
>  M:	Florian Fainelli <florian.fainelli@broadcom.com>
>  R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
>  L:	linux-pci@vger.kernel.org
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

