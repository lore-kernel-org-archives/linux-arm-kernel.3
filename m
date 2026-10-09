Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F095DCA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fz4v9C4NJeucclJ4dP4f/7Y/qrP44cVlU8hrb155EX0=; b=BOfkyv7fkvjQHj/D+V9LrbRLs6
	57QoSd9mdcz3044zzhcEvl70GPhsMISx/ddjrewwmpI/irqAIJb6EPd18HrqHGmzwDALj11MmHBDB
	5Fv2AzeXEsv/Xyl/iNvpJnEXAwCad+OWetX3gulcst4UcaVMexMJjEz603Gn7Qvs8W78/Y4XPpYVF
	rI5pRc+plX3IIFdBvnA95ZiAGDCQgvqPUK3LdvYzlE9xRH4bnQ2CAonnu36n4gWcjadjHWfjjCan8
	Znbwdhit6+uuLP0FbMGCxGSiLLFLHi+oj9M7hwtpBrVOBTa8S/wkHFq6RkBCUtBFi0z+aNq2nLMlQ
	OiTY0WJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7uE-000000064dq-26s7;
	Fri, 09 Oct 2026 10:32:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7uD-000000064df-2une;
	Fri, 09 Oct 2026 10:32:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F21E60DBB;
	Fri,  9 Oct 2026 10:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7EC1F000FF;
	Fri,  9 Oct 2026 10:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791541968;
	bh=Fz4v9C4NJeucclJ4dP4f/7Y/qrP44cVlU8hrb155EX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IlRHztSPGHLNnIEqKiOzckUamhY3gEriL98qwKunMtuXg52gXtbU/pABUzt1GmZoi
	 bsPPguajRRS2afjxnAXk4Mh+XMPrXcQ6Z5dGzzyWWkjM5aqpcVOEwS5c+p+VlgxJYk
	 xqsPDgkAJRl1bJjife2FkYh+f+DpEgHcWj1so7nfGyMXqwTzOe+fiGJoDc6tXYl8+a
	 OOUjJ7O2ovUus+WjJRiJQCga2LHfjk6v3IghycjItQMW84hfawikzlzZpLx0yPs6Tg
	 86TlwUso9zQAxtapPRSHlN+Y30z33bcpJ76knV38aZgiLA5a8EZGpH3yOcjKkx9VlR
	 L2LWs8SfGPnFw==
Date: Fri, 9 Oct 2026 12:32:44 +0200
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
Subject: Re: [PATCH 0/3] phy: aspeed: Add ASPEED PCIe PHY support
Message-ID: <20261009-vociferous-puma-of-amplitude-1c4dde@quoll>
References: <20261008-aspeed_pcie_phy-v1-0-96764937aef0@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008-aspeed_pcie_phy-v1-0-96764937aef0@aspeedtech.com>
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

On Thu, Oct 08, 2026 at 07:28:18PM +0800, Jacky Chou wrote:
> Add the ASPEED PCIe PHY binding and driver for AST2600 and AST2700
> SoCs. The PHY provides the physical layer used by the PCIe controller
> when it is configured to run in root complex mode.
> 
> The driver registers an ASPEED PCIe PHY provider through the generic PHY
> framework and programs the SoC-specific PEHR registers from set_mode().
> For AST2600 this selects the root complex port type. For AST2700 this
> also configures the posted/completion credit values, local scaling,
> device type, internal reset selection, and downstream port setting
> needed by the controller.
> 
> This series also adds the devicetree binding for the PHY provider and a
> MAINTAINERS entry for the ASPEED PCIe PHY driver.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> ---
> Jacky Chou (3):
>       dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
>       phy: aspeed: Add ASPEED PCIe PHY driver
>       MAINTAINERS: Add ASPEED PCIe PHY driver

And changelog plus versioning are completely missing.

People sometimes wonder why maintainers are grumpy. Easy answer: you
do not respect their time.

Best regards,
Krzysztof


