Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3827C54E92
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SA95wLW2o8GDDGcSkPyneoypMi2+uXrbOJ9yq/i2RY=; b=bm5gMneC6vcGc9nPrveFFR2vJU
	UbgJvdfBB4GUkJ1XIB7zpC2rM9uAlHMSVSMWU+t5ujgy+ou8/YXtUEKw8RivWsn3YpycvSn0JZyb6
	uAoJoIDTbZbaiyj3n/g4ccvHIz+jLz1TkMDnI4eJqTwQGFT56in6NyC6bhZ055SeRoDcmb++7A/2u
	is5gY1YIA7cNtCSUHgDx5U05c/ymJbV+SbiCE9ZdpxD1+ANT9O00mBonY0UUQLFeLhLhofgzriUW2
	zXKzjbaPsWGQ9u6JaAtvTTcQkMZF42pqCFjB8hQBLi5TfOPxqlS8OLaCyMkXNMTj1E8Ol7qBxbA1O
	W88369BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHghe-0000000FShe-1xRh;
	Wed, 21 May 2025 10:29:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfpH-0000000FKco-1zXI;
	Wed, 21 May 2025 09:33:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE1035C48B0;
	Wed, 21 May 2025 09:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16532C4CEE4;
	Wed, 21 May 2025 09:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747820006;
	bh=LO1Ga9BqywoKA5/tkG4lU/4FfpBVnRF8ud6CdXRAeEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=limWBBwdIVKd11QilI9brElBRTvN1t8GNaQ/k6R8ky+uF0CoAvdxsuzcB3K1+yTVE
	 ZPZMhNiJ5QtsNy9lKxOQG3PsD26LeEFNG1KIDtFASu9YVtEcvjmy37Armt85fk+gBR
	 TOjBfvjURC0z9iZytH1o7eBmzEZpJ9CD+JKwfXmRjvRk5NK/+QH0Y9UHH0107SKQZR
	 bczqbsEAM95KOPNVf9iWMQbGp29Gyu3Pxhky9or877ayyRY4S3Yb45xoynnGP+BqMN
	 EcA28eLeGe0cB4fbCmJPNkV6lxOwCq/hYZss64SKRHeYD2HrY70hpBueE+OlTU30lp
	 KeLTNdYHSfqJQ==
Date: Wed, 21 May 2025 11:33:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.or, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, vkoul@kernel.org, 
	kishon@kernel.org, arnd@arndb.de, m.szyprowski@samsung.com, jh80.chung@samsung.com
Subject: Re: [PATCH 07/10] dt-bindings: phy: Add PHY bindings support for FSD
 SoC
Message-ID: <20250521-quirky-tanuki-of-tact-a79b86@kuoka>
References: <20250518193152.63476-1-shradha.t@samsung.com>
 <CGME20250518193252epcas5p3e4d1d329f1e5616e842801ceb26728b6@epcas5p3.samsung.com>
 <20250518193152.63476-8-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250518193152.63476-8-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_023327_550767_881AF7FB 
X-CRM114-Status: GOOD (  12.26  )
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

On Mon, May 19, 2025 at 01:01:49AM GMT, Shradha Todi wrote:
> Document PHY device tree bindings for Tesla FSD SoCs.
> 
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> ---
>  .../devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml  | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
> index 41df8bb08ff7..3a5bff0fb82d 100644
> --- a/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos-pcie-phy.yaml
> @@ -15,10 +15,14 @@ properties:
>      const: 0
>  
>    compatible:
> -    const: samsung,exynos5433-pcie-phy
> +    oneOf:

Drop, that's just enumm unless you already add here more?

> +      - enum:
> +          - samsung,exynos5433-pcie-phy
> +          - tesla,fsd-pcie-phy
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

You need to list the items and constrain existing variants. I do not get
why exynos5433 gets now two MMIO ranges.

Best regards,
Krzysztof


