Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2061C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 12:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30P0mS+0MFmck9EFC/85NlKC+HMHgYOVgWAeHcXr+5M=; b=qAp3jjwWoqoCeOKwcYE7yeWW+h
	EA1GaR5fSJqu5ycTWWOcNut/FQpl6EP2b0lW4m4lsBEnwj1Q5pmp18XUhD8zAbehTj+/03VFi0gLR
	jgFPW5a7u2s6axAqx+5qVHcVKSjc5mwnK9ChW1eGQnGHeXDOqzH2fWbxnoUYaWG5BSfmE9vr8ul1u
	bdcApSKfa0EZSLt2KwpTHD3vIn2+FVJsM/JBd1i1R7FwUYd8tbBCuIMkq8hbVKYqQ4GrlU0yWwrzU
	X9aPDAi10Tz9feZT1D8RHdVqaPC/fgZQ+4CPYTnuOkx9DhR7iwqutAVHSCGxeyREUZc1i5d5l4bkQ
	jsK7fuig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26ak-0000000HImt-3x8f;
	Thu, 03 Sep 2026 12:30:54 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x26ah-0000000HImD-36XR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 12:30:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 683231A197C;
	Thu,  3 Sep 2026 12:30:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 387AC602B8;
	Thu,  3 Sep 2026 12:30:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C87F11C7A19D;
	Thu,  3 Sep 2026 14:30:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788438648; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=30P0mS+0MFmck9EFC/85NlKC+HMHgYOVgWAeHcXr+5M=;
	b=KJzdzXBfRkaqEJ7b7KhYBHtYs6HDd4TYF3uCKmxvH5wyvYkQCA1OtOXtozzK//ytVxdF5K
	LUjPG9h5vAhCyJ5MDHzPGvO6gyTiHe7Pol1hH9V3MIy2kCxI3Uf97aUibXjc7zhATC+bs4
	TP7hiTZMqO/EpHqqSMCiAcHsS+K4s4CuHARIHoTA2oY3PKCNt8VgJK4YRb4MBguR/yQrl6
	nG7DMkA+JYI/uBSf9RcRcLrDTVy47EKnF3ALs8+9i3endbpZosg2PV7k+HzeSfDAAM4ChB
	ryXW4QXB7glSmbWN9RO/jeXi6bMTD60qFcFdrwPVbE5kDCXhjvaRG2RRmqc/Ug==
Message-ID: <8611dff3-56ea-4798-8303-b0a8af84580e@bootlin.com>
Date: Thu, 3 Sep 2026 14:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add UltraRISC DP1000 GMAC
 support
To: Andrew Lunn <andrew@lunn.ch>, Jia Wang <wangjia@ultrarisc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260901-dwmac-ultrarisc-v1-0-f19454814bcf@ultrarisc.com>
 <20260901-dwmac-ultrarisc-v1-3-f19454814bcf@ultrarisc.com>
 <910be156-b631-4b62-972a-79d9a9e38697@lunn.ch>
 <178842162417.2701756.3296149694160507506.b4-reply@b4>
 <1622b0a7-5516-4e72-b5e1-60c12b65b52e@lunn.ch>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <1622b0a7-5516-4e72-b5e1-60c12b65b52e@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_053051_945525_5610298A 
X-CRM114-Status: GOOD (  16.52  )
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



On 9/3/26 14:10, Andrew Lunn wrote:
>>> This looks to be 90% identical to dwmac-sophgo.c.
>>>
>>> Do you expect any further changes to this driver? Is everything
>>> supported? Are there more clocks? A GPIO for WoL?
>>>
>>> I'm just wondering if the common code should be pulled out, or even
>>> dwmac-sophgo.c made generic so it can handle all plain boring devices
>>> which have RGMII delays and not a lot else.
>>>
>>
>> The probe boilerplate is indeed largely similar because both drivers
>> use the common stmmac platform helpers. However, their platform-specific
>> requirements differ: Sophgo requires additional TX clock handling and
>> other configuration, while DP1000 requires fixed TX and RX delay
>> handling. ACPI support under development is also intended to use the
>> UltraRISC glue driver.
> 
> ACPI is going to be fun, since nobody does ACPI networking.
> 
> But how big is the change to the glue driver? I expect the change will
> be minor, a call to devm_stmmac_probe_config_acpi(), in addition to
> devm_stmmac_probe_config_dt(). Anything else?

I agree that if ACPI support is added, let's try to make it part of the
core.

> 
> One problem the stmmac driver has is cut/paste glue driver
> development. The same code is repeated again and again. Russell King
> spent a lot of time and effort trying to reduce the duplication. So we
> should not be adding more duplicated code unless it is actually
> required.

It seems to me that all the RGMII handling could be made much more generic,
as this is commong pattern in glue drivers :

dwmac-sophgo has the "has_internal_rx_delay" field, and dwmac-eic7700 has
both has_internal_[r|t]x_delay.

With this third one, it makes sense to start sharing that logic across
glues.

Maxime

