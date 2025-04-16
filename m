Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8450BC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJcMjS1cfW8OWQZ2P9+TBPMrANTKkbwu55CZuBVjxbU=; b=VCZHoUqMO4bwT8VeweVUdZNE7w
	qqsh5Sqn4V2fYR7A/UQS19XvEK092AHixMfH9XuLVeTKS0c4zxhwsprKYuTqB/OKSfT8fFQbMEugl
	Cbp15eRgvbuyt1kBk06W/ngLbB5LYjReLWEQQ1GJ0gJoBck6vTSggDr2jMjHPUMhWNcDYLfDnVlX2
	B7RTR+MQHboZ30Je9bHfuchrqfBNtO3E5Xl77LS1ezGCVtpfmyMRGbhshhhlVr66fxYXgGlKuM07i
	289drt7oD/sp1F92F5BInstbN0aXBuyPmmZNq3fNqCN94keVE4RMiqnPf33LxdcqwQ9k1tyL3sMy/
	oEAbqclg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54SU-0000000A2FC-3SbD;
	Wed, 16 Apr 2025 15:13:50 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u53Ni-00000009n4C-3HLG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 14:04:52 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1u53NE-0003zg-Oo; Wed, 16 Apr 2025 16:04:20 +0200
Message-ID: <fcdb9283-07aa-4d50-ac4d-317b0a4e5f7e@pengutronix.de>
Date: Wed, 16 Apr 2025 16:04:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] ARM: dts: microchip: Remove additional compatible
 string from PIO3 pinctrl nodes
To: claudiu beznea <claudiu.beznea@tuxon.dev>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240814061315.112564-1-manikandan.m@microchip.com>
 <20240814061315.112564-3-manikandan.m@microchip.com>
 <605ff021-0770-4363-9734-ad8114a429f9@tuxon.dev>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: lsc@pengutronix.de, "kernel@pengutronix.de" <kernel@pengutronix.de>
In-Reply-To: <605ff021-0770-4363-9734-ad8114a429f9@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_070450_820764_CA4CF101 
X-CRM114-Status: GOOD (  15.79  )
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

Hello,

On 8/24/24 16:32, claudiu beznea wrote:
> 
> 
> On 14.08.2024 09:13, Manikandan Muralidharan wrote:
>> The driver data specific to each pinctrl GPIO bank compatible nodes are not
>> the sameand declaring additional compatible string as fallback has no
>> specific purpose

That's incorrect. A compatible for the old IP core means that the new
revision is still compatible with it and old drivers should work for either.

> , hence, removing the additional compatible string from the
>> pinctrl nodes in DT to comply with atmel,at91-pinctrl.txt documentation.

The correct resolution would be to add an extra compatible to the
binding instead of breaking non-Linux users of the device tree.

>> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Me and Lars stumbled upon your patch, because it broke the barebox
bootloader console on SAMA5D3 boards after it was imported.

Fortunately, the system still booted, because the first stage bootloader
sets up SD host controller pinmux without referring to the device tree.

We'll submit a driver patch on the barebox side, but please keep DT
compatibility in mind with similar changes in the future.

Thanks,
Ahmad

> 
> Applied to at91-dt, thanks!
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


