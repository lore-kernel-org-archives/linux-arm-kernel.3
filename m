Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06A9CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 23:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=43dmYeJ/z+ZxlGAmge5piW4Cp5LEqx3lnTOjZcqfDnc=; b=sD0Tis7LuO7BeL/KiXSbWznYVG
	dR8u6MIfIWyZjl0wbbqf/KL0xWgODCzooUsKUI4sWgJQhw/XXYj8zmcIGpJ43653TPeHaDdUcMuY8
	QPJbNRMFWCrvbjlvk3+3KkBIwe+bLd1tPbe4VKVgsrOHVBSeilf1ptUDPodqlF8gMNataUNWt1uim
	ZHJKgWfWlY6KH3sgiGAGWh1/OuqJ9I4kXjyHQDnu/uVCjYluXFOi6TMxht7Ma7W/sJC1nuytFv/xZ
	gbdOZzZ5ojCL07oAnMQg5/bN1tVXEWB2bVDYqy+LLhXmHsL34ny73tm4AsKJbW1i7SULz/tddhY+W
	5yGbtOHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHrUA-00000004D72-1ZDZ;
	Fri, 16 Oct 2026 23:37:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHrU7-00000004D6t-2ePd;
	Fri, 16 Oct 2026 23:37:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E7CE743262;
	Fri, 16 Oct 2026 23:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF301F000C4;
	Fri, 16 Oct 2026 23:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792193830;
	bh=43dmYeJ/z+ZxlGAmge5piW4Cp5LEqx3lnTOjZcqfDnc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nTmYIRN4QNxbA3F470LzUbUhvzUkwGOw2235mQrsCYOqOPtJc4PF9rRHdFO7lIKxp
	 eG+GwMr5zt32zIMJNboTIR+ysq9AXOC4c4Ice9fsdvr+8mZse44UWuY/Qh1+4W8DKE
	 WZoKr9B4NydAfnHF3eVC5HXgveDBJS7LBeO0qhnGZsiEYdx2C6ddkAPGukp5+dFLih
	 EbIdiDlqJBljTpnMjh78LQIEwrFRHrNRkJszxoChmXqK2T+898EiYUeNFx84F5yTYq
	 2ax24A07eEMvGbQFVjtwHykeLzcj9efN2SO0GDyiigog0ddHIlBformmepc2SfR5tI
	 iX78LGI+5JP1A==
Date: Fri, 16 Oct 2026 16:37:09 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, David Wu <david.wu@rock-chips.com>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v11 3/6] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
Message-ID: <20261016163709.00cc7c12@kernel.org>
In-Reply-To: <20261008175225.3375274-4-coiaprant@gmail.com>
References: <20261008175225.3375274-1-coiaprant@gmail.com>
	<20261008175225.3375274-4-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri,  9 Oct 2026 01:51:57 +0800 Coia Prant wrote:
> +config PCS_XPCS_PLATFORM
> +	tristate "Generic XPCS controller support"
> +	default PCS_XPCS

Why the default? Surely there are platforms with PCS_XPCS enabled
which work today == don't care about the new code?

Linus is known to hate _any_ new symbols defaulting to enabled
on olddefconfig.

> +	help
> +	  Generic DWXPCS driver for platforms that don't require any
> +	  platform specific code to function or is using platform
> +	  data for setup.
> +
> +	  If you have a controller with this interface, say Y or M here.
> +
> +config PCS_XPCS_ROCKCHIP
> +	tristate "Rockchip XPCS controller support"
> +	default ARCH_ROCKCHIP

Same here.

> +	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
> +	select GENERIC_PHY
> +	select PM_GENERIC_DOMAINS if PM
> +	help
> +	  Support for XPCS controller on Rockchip RK356x SoC.
> +
> +	  If you have a Rockchip SoC with this interface, say Y or M here.
-- 
pw-bot: cr

