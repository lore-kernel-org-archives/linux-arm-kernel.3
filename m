Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4763E6F09F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5mJaz6KAlyzeBK3jbtp9RwB6XmiK/tWRemlbfO1E9M=; b=jvPdVVeGNneIh3NJKknLP9s7MC
	DDH2mkQav5JsX05wtdmQkW0Gdty0+uJPcdcdxd5gR+/QLAlJC0suJk2a9dHPUyyacZskwikmTGV7H
	oPWgZhHPLc9wylfDCpLyXop2VJe+qt8rTsbWchB1Kf9lT/HVYi8PG//aQPoHBIAXl4tJ/yz/c9U+h
	Ya9DqrB48w90Lf0zN+V8vOEWsmn6dPR3e0mJgFYIEoHP/DiL4eOebo5Oh3s51emk8aY1JIOEf+Mm5
	glpqC0mCTRnJu5n9wYUp57An4pB0LDXCD5IZPy8Jn9v0EOc1DPsWbcuIPfQH9EhLw5a8UJkZS7fmw
	ZoxdMUuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4nF-0000000FjJg-3EEA;
	Tue, 23 Dec 2025 15:59:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4nC-0000000FjJ5-3AXB;
	Tue, 23 Dec 2025 15:59:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A760F415EA;
	Tue, 23 Dec 2025 15:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66062C113D0;
	Tue, 23 Dec 2025 15:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766505561;
	bh=FbWzgepLOv260NOsYwp6cw6dEnGFg6D/tQJ2zegwDW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UeDI8oUbunx4UBfNA6d7KG5fyjjI9KmunMraw0Wx9LS4Hp16nLeZZBz8kyIj52oUv
	 9uRuyPnv20E20eYGmaepK4E7hP/ltzOo6PshS9Z0Dh8yZjmxIzUN8d68qs4Y5FB6ge
	 Zo+5vkJwIxesmQ56/duA4lb4JqSm7FFcHyOxdkLNsHjnhAvhYjqFFUeI3bQuTuR9sL
	 6WA8iJPckwmgiYiynonJ8g3Pb8ONVPP5B0L7ezwkZ2UYiOxDuGAfjV+Eec2asCYsSP
	 rlqz5MfZzR8AJHivVawcVr7LwfVLNerplK5SK43XjEeA16sT09SmSdaJFLylwvGwSw
	 +wThtapcDsxgQ==
Date: Tue, 23 Dec 2025 21:29:12 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-aspeed@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 7/7] MAINTAINERS: Add ASPEED PCIe RC driver
Message-ID: <kbads4vnfjf2ce6sks7bvjmhpt73fmvdmrikxwp7y6wjw3flse@5yer3aegbfo6>
References: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
 <20251216-upstream_pcie_rc-v7-7-4aeb0f53c4ce@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251216-upstream_pcie_rc-v7-7-4aeb0f53c4ce@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_075922_813873_C3D2A947 
X-CRM114-Status: GOOD (  11.74  )
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

On Tue, Dec 16, 2025 at 09:50:06AM +0800, Jacky Chou wrote:
> Add maintainer for ASPEED PCIe RC driver.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  MAINTAINERS | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aff3e162180d..c327ea375746 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3900,6 +3900,18 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/media/aspeed,video-engine.yaml
>  F:	drivers/media/platform/aspeed/
>  
> +ASPEED PCIE CONTROLLER DRIVER
> +M:	Jacky Chou <jacky_chou@aspeedtech.com>
> +L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
> +L:	linux-pci@vger.kernel.org
> +L:	linux-phy@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml
> +F:	Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
> +F:	drivers/pci/controller/pcie-aspeed.c
> +F:	drivers/phy/aspeed/Kconfig
> +F:	drivers/phy/aspeed/pcie-phy-aspeed.c

PHY drivers and binding belong to a separate entry. So I've removed these while
applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

