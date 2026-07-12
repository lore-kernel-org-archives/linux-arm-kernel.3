Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F5BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 08:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7El/GvvQcgfO05yr3MPYiblRZfsw0etG5ZwJOy721U=; b=rNUBxgeidhPLJP2usj4w+kj28S
	zYn4VXUlndtYKcb/naT/H/JhJEMYtq+axGWQOVfcF+Q+3jlLzLelom2SVshpKYNLfF8Qp1D9D6S9k
	+56NYEFqQ8YP/IMeTkc68WShZklNKjML4uSGwKcxVZicCug4i2Tjyh3gJ5UMe3AHcCSz9UCMthSPO
	StYI53AZcP5g/KiAxqp5FYhCUl5iMmaMTeQBTUDpvLGRS2rrvi1WLeUokKcqNZsTzgd4DNVAMhZlj
	G3TSkgYT6idghnZiquRqtsvp+H0+d2qyuy/jtc125n7sz2pn6G5/7SLloC1JEWqL3KOpYnwOwofFa
	DTZFL2oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wipyt-00000007Hai-3Ksk;
	Sun, 12 Jul 2026 08:56:11 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wipyq-00000007Ha2-1frs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 08:56:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1D4874E40D6A;
	Sun, 12 Jul 2026 08:56:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC3B560341;
	Sun, 12 Jul 2026 08:56:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 743A811BD39CB;
	Sun, 12 Jul 2026 10:55:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783846561; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Y7El/GvvQcgfO05yr3MPYiblRZfsw0etG5ZwJOy721U=;
	b=eBTmwlyq5grs9SuLbAKD5Y75NROGxAC1QetQ5b7HUGAnFwTASj+WWM9Y2Iot07rey7XZXP
	dJ0YFCv8Carw54kXlnGxJE/UfFRe1GE5u6FuZv37KeO3KFh7WR4Cf4O4tbdJcYj5mg6bz7
	0Cjqq3AkI+EXauwXN+Fl+CLvRiO597RuxtO5GpSkyHIwkww0pu4ABAmGHXuH7iniyCLzWC
	n2O7JocA0WdizEixyG5XtkjLeNAqVVNlcFbJwOzKWAy9/XtXLivw47muUa7buKjuXB15J8
	R37JSbRS8ynuqRJaJJsnMzV+lKRWSBvpjNNQF+/zwqu25Hkx79lJHJ5MNvk+6A==
Message-ID: <bc78469c-3f45-4234-88b0-49f050d651db@bootlin.com>
Date: Sun, 12 Jul 2026 10:55:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Failed to reinit phy of spacemit-dwmac when reset-gpio is present
To: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Yixun Lan <dlan@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 E Shattow <e@freeshell.de>, Han Gao <gaohan@iscas.ac.cn>
References: <20260712045233.800748-1-inochiama@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260712045233.800748-1-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_015608_573744_5B01C56C 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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

Hi Inochi,

On 7/12/26 06:52, Inochi Amaoto wrote:
> TL;DR:
> 
> The DWMAC on Spacemit K3 is failled to register phy after the reload
> the driver module (rmmod then insmod). Because the reset-gpio is
> asserted while unloading the driver and is not desserted before reading
> the c22 id, which leads to a fault.

You're not the first one facing this type of issues, this is a long standing
source of issues. The problem is partially hidden by the fact that often times
the bootloader deals with the PHY reset (like the case you're facing)

Take a look at these discussions :

https://lore.kernel.org/netdev/cover.1761732347.git.buday.csaba@prolan.hu/

and maybe more intersting, Russell suggested an approach on how we could potentially
address this here :

https://lore.kernel.org/all/aTBeVTlsElGXUCSN@shell.armlinux.org.uk/


> ---
> --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> @@ -196,7 +196,8 @@ &eth0 {
> 
>  	mdio {
>  		phy0: phy@1 {
> -			compatible = "ethernet-phy-ieee802.3-c22";
> +			compatible = "ethernet-phy-id001c.c916",
> +				     "ethernet-phy-ieee802.3-c22";

Indeed that's merely a workaround :(

Maxime

