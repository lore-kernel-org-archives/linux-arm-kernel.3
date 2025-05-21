Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D11FC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 20:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikuvPDaOLm0StfnXr7w+08f21aSqgFYDc4cSp6gqdZo=; b=JgNEjytBR1pOf05Zak5q0RRv39
	gjDisaW8mEzbGP7qN4M6B+umCg8sbzaLUvR70z0G29oZkQEcL9+GHmdt/fdojqviz8FdxGKQKpt/R
	Un4D/udN6D3PezLYNduqJ7C990X6rebx5uHegaTGNiUylrbSyO5kOTx0lwtYuvP3b0LCppO3p88ly
	BMWkcYDpjfeijEIssehizhlJX8/2B2arJKS0C69R42lPqf2x7rjOU7KSw8xuZE2+fP59WXFWKB6BN
	GHkYIe6xVYPD6rTANQIlTmJsUjhz0C1W+2vXmItJMOX4xwarjAsfnHXZQOccBYOVdk12ZqVs7XJzH
	JZLgistw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHqGV-0000000GnX5-3FWt;
	Wed, 21 May 2025 20:42:15 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHqEM-0000000GnPH-1WjN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 20:40:03 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uHqDo-0008EG-1p; Wed, 21 May 2025 22:39:28 +0200
Message-ID: <3ba28773-61ec-4e1e-949d-e8285525d1d2@pengutronix.de>
Date: Wed, 21 May 2025 22:39:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] MAINTAINERS: add maintainer for the Ka-Ro
 tx8p-ml81 COM module
To: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>,
 Shawn Guo <shawnguo2@yeah.net>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
 <20250417-initial_display-v6-3-3c6f6d24c7af@gocontroll.com>
 <aB26FRq/Ets5fiRK@dragon>
 <PA4PR04MB7630F5874577DA12FCBE1537C58AA@PA4PR04MB7630.eurprd04.prod.outlook.com>
 <aB3DuZMBIwsFXrVz@dragon>
 <PA4PR04MB76309AE2C6E2C774DF8FAE29C58AA@PA4PR04MB7630.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <PA4PR04MB76309AE2C6E2C774DF8FAE29C58AA@PA4PR04MB7630.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_134002_406320_27B23801 
X-CRM114-Status: GOOD (  19.76  )
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

Dear Device Tree Maintainers,
Dear Maud and Shawn,

On 09.05.25 11:03, Maud Spierings | GOcontroll wrote:
> On 5/9/25 10:58, Shawn Guo wrote:
>>>>> +KA-RO TX8P COM MODULE
>>>>> +M:	Maud Spierings <maudspierings@gocontroll.com>
>>>>> +L:	imx@lists.linux.dev
>>>>> +S:	Maintained
>>>>> +F:	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
>>>>> +
>>>>
>>>> I'm not fond of such changes, as MAINTAINERS file could be bloated
>>>> quickly by individual DTS.
>>>
>>> Is there some way you would prefer to see it? I don't really know of a better
>>> way.
>>
>> There was some discussion about getting ./scripts/get_maintainer.pl pick
>> up the Author: field (in DTS header area).  But I'm not sure where it
>> ended.
> 
> I feel like that would be wrong in this situation too, it would pull in
> Lothar Wassmann, who has nothing to do with me upstreaming this. I have
> seen him around on the mailing list but given that Ka-Ro are not
> upstreaming these themselves, I feel it would be weird to pull him into
> this.

We can add multiple authors. Authors not wishing to receive mail can always
remove their name or blackhole their mail address via the mailmap.

I am not leaning strongly in favor of either way, but I am bothered a little
by b4 nagging me about adding MAINTAINERS entry for device trees that I've
added. It would be nice to have a guideline here.

If the current guideline is not to add MAINTAINERS for device tree, then
this patch that has generated no feedback so far could use some attention:

https://lore.kernel.org/all/20250113-b4-dts-mainainers-check-v1-1-794ed5749a94@pengutronix.de/

Cheers,
Ahmad

> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

