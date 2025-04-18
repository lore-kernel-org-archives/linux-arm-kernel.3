Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A657C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 08:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zXkVO/L/HV+fnApmnOg4jqoQW+6ALcgNwo09wyCcY8=; b=okXlVczGl6Sk4YXkRSeJJs5FPt
	aJNsjR/PYO8xLhcmvXS2XcjAiapxd6VnpixIV4kjyIQh8IT/ZcAJTJNtbqXrivamUCJaU+uPmJjiC
	Ti+Dj/AZQD/pY0aKxTrVo0KIUVkHLGOVbCiG2gBu3HGPnDDciwqworDnJ8X4O2TwdEzPcHbMzwLyW
	mwe79maqRqArW+83fz5P+e92pJxHZY6u/vULisqImVeliWEoGHxyuwYZMlijHiOPorpudXZgBWk60
	UxaoKO3dePLUM7HEUKvM9fBw/gawX3DAGy3nh+9mRLotrKCzw4tS3KBZu8ccvoxxAnKkaGy3OlhQ4
	tZz9vxkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hY9-0000000Fh6t-2wVk;
	Fri, 18 Apr 2025 08:58:17 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hKf-0000000Fep7-1eli
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 08:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1744965855; x=1745570655; i=wahrenst@gmx.net;
	bh=8zXkVO/L/HV+fnApmnOg4jqoQW+6ALcgNwo09wyCcY8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UNW2tfwCXPBYNAbHzwcDzF4BQAPUpaxJ+a/RpTdrKNJGGP4BDGmtZPR9maqTdn3u
	 BNkI4JpXgVvYCHfwzhDYYcvTTE9QLFvtrZBwbMdddgJr3Wso2ngvqo1d3lyYnHWaA
	 nf+MTdqaB6KQbCs9UPxxmFp2DOxfczQoGYDacV84DhxN5kfyGgRWIxPG+UEJlFGjs
	 X7GxU4FPLk0geMibU3PAMlHtalAWwKxgKaWCmBnIgSJmXQ9GocnWS3X8z8PMPfNuz
	 +mZXBcsYd7vcZwnXhE4XO61riOMCDJN2yhjQ7MhA4ng5/LGceWwu7XuKH8a7HlYw5
	 Nk2B3jf6LEfjH7PUQA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUowV-1uWTWh3AYL-00Oj6t; Fri, 18
 Apr 2025 10:44:14 +0200
Message-ID: <38f36d00-e461-4fc5-a98b-9b2d94d93c69@gmx.net>
Date: Fri, 18 Apr 2025 10:44:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v6 4/7] net: mtip: The L2 switch driver for imx287
To: Lukasz Majewski <lukma@denx.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Simon Horman <horms@kernel.org>
References: <20250418060716.3498031-1-lukma@denx.de>
 <20250418060716.3498031-5-lukma@denx.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250418060716.3498031-5-lukma@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:k39CviP8heJ+cbDTMlGNDWVxe30Oaz+7P6chPR/R4ICdRZqNw+z
 w/zCZFcy4g1D1pCDNzXJ05yHw2NoXY3FmqmnVJS+ZIpegbzfb/8aj+oTJlX9MoiQUrPqIAT
 md+AvrcLreCrD0JB1ijeWbeTtc5pRxBGmSYlS/nhAYIC+1aCK7jEUKnHh9RWOuz/3NHDFfg
 srlKEG0AK00xezPEj0mZg==
UI-OutboundReport: notjunk:1;M01:P0:8h78fwPHcSI=;S13FLM+D4E+XSp5tNWT+4GFFIAZ
 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
 bLmAa+pF0qfXl7xORUobqIvNwRxCK8k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_014421_740955_C9AD46F4 
X-CRM114-Status: GOOD (  14.16  )
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

Am 18.04.25 um 08:07 schrieb Lukasz Majewski:
> This patch series provides support for More Than IP L2 switch embedded
> in the imx287 SoC.
>
> This is a two port switch (placed between uDMA[01] and MAC-NET[01]),
> which can be used for offloading the network traffic.
>
> It can be used interchangeably with current FEC driver - to be more
> specific: one can use either of it, depending on the requirements.
>
> The biggest difference is the usage of DMA - when FEC is used, separate
> DMAs are available for each ENET-MAC block.
> However, with switch enabled - only the DMA0 is used to send/receive data
> to/form switch (and then switch sends them to respecitive ports).
>
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
After changing the IRQ name part mention in patch 1, you can add

Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

Thanks

