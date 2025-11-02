Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE6FCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 17:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVIWxvbG6hS59cIjcOfk1tNz+O1dirw/jStQigJNNw8=; b=TyJkomHGKQ/zQrcgQdRDsKozKw
	X1kRmfm/yjMsvd9vK9OB8XJJ6wYSx/sLd7p8eK8vKwtILNLgZdKnHIIaleIQK0DlnhPsdviQNsho5
	dc4WravMqhCMF+KANk14okIYNhgYi0zOWLg3vx/+NIh1m1/NEk3CqYoxp5XCKMk6zLbiA2da7QEKI
	niF7N75kxgrA7ELYElUcWWVgK3rg9Uwn5mjdW+Z8ETR0v28jiOoupJmN0jywD4UjaDMsX0+xasekm
	1HCl0oL5WxilfeYs2G9wQUuuMEDEmvXo7RAqH4wnS8KGMxNOurSKlCq5WmlZ8iQ4JITnfz7TawgOh
	OqCi8M1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFbfz-00000008gQM-2UDe;
	Sun, 02 Nov 2025 17:15:35 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFbfw-00000008gOs-3rKK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 17:15:34 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4d01Z91lrSz9tKX;
	Sun,  2 Nov 2025 18:15:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762103729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pVIWxvbG6hS59cIjcOfk1tNz+O1dirw/jStQigJNNw8=;
	b=kiczCTwovFK3kcxFGIgvfX7t7jHPp/LysnFqW8CukOZyAt9lddGQ3LZjsRc5kBbNyeJQkE
	35C0ueF8JCz0yG3IyQpmCn0bFCzpCDOKrClYy+nRQlL/NOMItmREuCjsRRHaNFJJSm6UBW
	yyRGaOsuByxhyHLPHbPURhYEbLg9Y/Vtpx7ea27bu1uJ43EUn62mWBPFiTjIMSqzhTsXz9
	/PjwErrRPgda7/G2Dx93s5x9DRwJZkIM1aMbr6fn1xPpcKkZv7kE4/HcZGG/U/7BcCT/dB
	eQPnaZ5pkUV7XVbP4EL2CidnZ4JR0FZht6OIObCeXliM0b1y9wG0gZFoosE5ZA==
Message-ID: <30dc382c-6b26-4b2a-81ab-67ac5bbf7150@mailbox.org>
Date: Sun, 2 Nov 2025 17:41:38 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 01/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller DomainBlend
To: Ying Liu <victor.liu@nxp.com>, Rob Herring <robh@kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-2-marek.vasut@mailbox.org>
 <20251015132442.GA3241958-robh@kernel.org>
 <5c5bb009-3463-4282-946f-3ae93fab11ec@nxp.com>
 <c712dae1-00a5-4cc0-baef-2ce014bd470f@mailbox.org>
 <AM7PR04MB7046685E946417FD795C810198F7A@AM7PR04MB7046.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <AM7PR04MB7046685E946417FD795C810198F7A@AM7PR04MB7046.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: b47hecses99gtkdixbqohop36pxjecdy
X-MBO-RS-ID: df5e035099bd363f9aa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_091533_123125_0C3746AB 
X-CRM114-Status: GOOD (  18.07  )
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

On 10/18/25 8:09 AM, Ying Liu wrote:

Hello Liu,

>>> BTW, I confirm that two Domain Blend Units exist in i.MX95 DC while they
>> don't
>>> exist in i.MX8qxp/qm DCs.  And, as you can see, this unit supports multiple
>>> modes, this would impact how an OS implements a display driver a lot,
>> especially
>>> Blend mode and SidebySide mode.
>>
>> There is one thing which specifically concerns me about the DB, it seems
>> to be capable of blending two inputs from different security domains, is
>> that correct ?
> 
> For now, I know nothing more than the DT binding description here, i.e.,
> two inputs are combined to one output in four modes. And, DB cannot be
> bypassed IIUC.

I see.

>>> As patch 39 shows, there are 3 interrupts - domainblend{0,1}_shdload,
>>> domainblend{0,1}_framecomplete and domainblend{0,1}_seqcomplete.
>> It seems we currently do not use either clock or interrupts on either
>> domainblend or layerblend IPs, but maybe DB and LB are different and LB
>> really has no clock/interrupts ?
> 
> If you take a look at NXP downstream kernel, it uses
> domainblend{0,1}_shdload IRQs in CRTC driver and I believe that upstream
> driver should use them too.

Can you please tell me what exactly is this IRQ signalling ?

> DB and LB are different. DB is in Display Engine, while LB is in Pixel Engine.
> This pipeline sort of tells how LD and DB are connected: LB -> ED -> DB.
> 
> LB has no interrupts.  And since it processes pixels in Pixel Engine with AXI
> CLK and it can be configured via the AHB interface of DC with CFG CLK, I'd
> say it kind of inherits AXI CLK and CFG CLK from Pixel Engine and DC
> respectively.  See the diagram in fsl,imx8qxp-dc.yaml, you'll find those
> clocks.

Thank you for the clarification. And sorry for my late reply.

-- 
Best regards,
Marek Vasut

