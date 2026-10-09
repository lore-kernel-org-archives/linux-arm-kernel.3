Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB183CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtCYHP8bkaekZ1veqlqX8aXKZ4Lf0sSj0bK6Dp/TMpg=; b=ZPbMdHplarfPzUmhOlWIWAdRke
	Z254Y3XSn6i5wMz/41LF3+vT1LUTf2qA61u9sMgsUj82z2a4QKzOMDTyKQRwNNfB+hToZZXvVkrTy
	qsuPXvUOceYD1eR/xxtFC0Q6dbWhBcUJPmxysKdMSjc4QFgISrZhM331QHilGObfhouoeOqUm4a9F
	a4bgCSafUummYu/ttRiCy583+q2dpHQGOdDgshjFXINJfGoP6uk8ee685Km8/CAEJZTaZWJcrtJpe
	DMoFX7wsb3U5X77MCQlyaPKX3zYJYxzHXm+grsemiD90EXRPP8XWd+8H92GHSSJ5ndKtJQzla2vO3
	GRdvrrEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7up-000000064ia-0DH9;
	Fri, 09 Oct 2026 10:33:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7uo-000000064iM-0FK6;
	Fri, 09 Oct 2026 10:33:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DE4660DBB;
	Fri,  9 Oct 2026 10:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683DE1F000FF;
	Fri,  9 Oct 2026 10:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791542005;
	bh=HtCYHP8bkaekZ1veqlqX8aXKZ4Lf0sSj0bK6Dp/TMpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WaUM1kYadguyw8AItenfIPKE+2el6/RQ4bJ8E+TYjvKl4Il9CdtIZWShD9/VD3/it
	 9aq9OUbP4tKmDKhdenx9cC6kzeXTgCt9UYIAHBj6J6Ti39TqubXCUVZr4QEx1jpy+H
	 zToPjLf2lBqGro4dxedF+SQG8Eku5lZRo4Fcgf1MCRcIdQAarEQ7GqlR9AwcVqs9I9
	 FawLC9aanhudklh9wqqfnJwTw2Nf81SrEjiD69L+UXoRlcEQmaDJb0DqeTU2M+0RhU
	 uy+RjX84pLmZm7sNntHuNsG6Zd/Z+Id6/WbBTF4sngHLNcVLuMHgaUytAjHDb5l2bO
	 IFvu16Cb/XBpg==
Date: Fri, 9 Oct 2026 12:33:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, linux-aspeed@lists.ozlabs.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] phy: aspeed: Add ASPEED PCIe PHY driver
Message-ID: <20261009-cherry-caribou-of-glamour-adaba4@quoll>
References: <20261008-aspeed_pcie_phy-v1-0-96764937aef0@aspeedtech.com>
 <20261008-aspeed_pcie_phy-v1-2-96764937aef0@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008-aspeed_pcie_phy-v1-2-96764937aef0@aspeedtech.com>
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

On Thu, Oct 08, 2026 at 07:28:20PM +0800, Jacky Chou wrote:
> Introduce support for Aspeed PCIe PHY controller available in
> AST2600/2700.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
>  drivers/phy/aspeed/Kconfig           |  12 +-
>  drivers/phy/aspeed/Makefile          |   1 +
>  drivers/phy/aspeed/phy-aspeed-pcie.c | 237 +++++++++++++++++++++++++++++++++++

And unlike 10 previous versions, this wasn't even built!

Best regards,
Krzysztof


