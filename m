Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7726C44516
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhWr7DyYHBMitYnhvrVIDsh6S5Eu/wdCCtdb6dUizGM=; b=YGrpwK1Do3bdaB7NMSArgBWCP0
	NuaaLl1D7IjtBRsbRFg1LRBlHwNy2JOE4lTinJYLdBDXMLKhL6ApxX+zJqZ8s7klr035E9MzjptoJ
	DXDa41juoni29ulIaS3KjLlJgg9zhW1nb+SpLhSZKlkTcbgSUjDCMrnHrVLGLdfyoBWNZbKCkrC1P
	DOiWcGfNXyRcRTGskb3i6KM9zhLWvHCvM4dp4xZTBAy4zgGcNvhlxXME4CPgs70SCePDCWzljSgMb
	Em2aaqNoh8PrwUJl7I8B9i9GYm4SZX6ALDhBCGifHL3RlWBSZDsdQ9Fz1RpMo6Wcfatw2irAc0cIO
	PVkEpTZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfA4-00000001sRU-2CeQ;
	Fri, 17 Jul 2026 09:47:16 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfA1-00000001sQS-0ph2;
	Fri, 17 Jul 2026 09:47:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AF573C2B9F7;
	Fri, 17 Jul 2026 09:47:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ED31560361;
	Fri, 17 Jul 2026 09:47:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 225EE11BD0424;
	Fri, 17 Jul 2026 11:47:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784281627; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=NhWr7DyYHBMitYnhvrVIDsh6S5Eu/wdCCtdb6dUizGM=;
	b=mROS9WP4u4nxqxbIO1iWw/9DeCH9lbJu8Ab/BWzz1frh9hKmb/fwE9chdLymD9nlntHSf/
	c7+0UJEJqVsC54NRjD7lwGZxzQImUznXSEfrXk7wOzMS0MnMWg1+WKv8tU3rTFQteBAqKZ
	LYZQlalnWyWA/aJAPXymyEPxp+iYv51idDSlRh7ZoccNo7i6WNCRObiMOkfAaA5T+Czauc
	GTQzX39riEHKT1Csj4bAkmQeEiiQkwZseNtYmj2Fn0TUILcsuiW1jMykBndqLgwaiyN12C
	BtnzMtBsN/b05Z5ZFlSbSguapSTmgRKeeoMOPepO/PNW9SKHwq81DCWj4Ot4PQ==
Message-ID: <da7d4ee0-8122-4839-b807-5d23ee6aeef7@bootlin.com>
Date: Fri, 17 Jul 2026 11:47:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: dwmac-rk: enable the
 reference clock for output mode
To: Jiaxing Hu <gahing@gahingwoo.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, heiko@sntech.de, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
References: <20260717065933.2629501-1-gahing@gahingwoo.com>
 <20260717065933.2629501-3-gahing@gahingwoo.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260717065933.2629501-3-gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_024713_411126_E665A6F6 
X-CRM114-Status: UNSURE (   6.49  )
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

Hi,

On 7/17/26 08:59, Jiaxing Hu wrote:
> rk_gmac_clk_init() only requests the refout clock group for RMII. The
> ArmSoM CM5 has an on-module YT8531 RGMII PHY with no crystal that needs
> the SoC 25 MHz reference (clk_mac_refout), so in RGMII the clock was
> never enabled and the PHY did not respond on MDIO.
> 
> Request the group whenever the SoC drives the clock (clock_in_out =
> "output"), not just for RMII. The clocks are optional, so other boards
> are unaffected.

You've taken my review into account (thanks :) ), but you're failing to
address Andrew's comment.

The PHY should be the one requesting the MAC to output the refclk, in
that case the MAC will act as a clock provider, something like this :

https://elixir.bootlin.com/linux/v7.1.3/source/drivers/net/phy/air_en8811h.c#L1156

The PHY then requests the clock (probably an optional clock).

Maxime


