Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A7FCA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 18:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXVZJKbB4RX23BYBiT5VVTmKX2+wNkS9HnOJ0KN/2vo=; b=N2p0blqIE2oRKiCeWTsa5icJ/j
	h60l3pcHYQddgs4k5ysEG2gkH0Zu/XI9+5YV3/w4yM4xzacHvM05OnVR466MgzR8weRfv28KScjSf
	wvHZyqmdm7d8Awi6GHOYFu2IfzypTgmXtFNuNIANp30KDkLs+uJbwYL+zbIaWHuAOodmMk6hXXivI
	lqjazytHSnLHVwqfGUpWXAF32CTfCkwXswlmmKOdrhqtvxmlSBFemZKUWmNJy/cu9OszNerzg2mQ7
	kdK1XlGrY3DL8MQL/U+NsBuxNP9AVke59XxVyDm8SIqTbtRc9J0XSaXwaevoISz8hburL8hytJtYS
	G0VcIFMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utscJ-00000007Mhl-3DVu;
	Wed, 03 Sep 2025 18:54:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uto3Z-00000006g7N-2aHd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 14:01:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756908109; x=1788444109;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=+Ou7/TJXaHnviKBEr5ILfWD+oVZwfeeOf3QKT9caAkE=;
  b=LPm4cwEAk6pT57vIIyOGFFHYJXpIzJzJFphUa9+zLjHYYmXxk4VlwpAI
   IYSlEuR6kFpAJcUSCIy42MOEADwZ3z9IUH/bS7FHwDkQnkzO+32Xd+47+
   lRB2R+RTAR7+7aTTai/FF3raDAPWyl+xsRKltlsIRokx7s/JcHKnWELby
   fM0OWX1DQYD9wFMuG5cgDe+gRTyRtPw0Dd1laTmHeIp+H5+g/JccVwbUe
   XliSDDXmjTG/mTw3V6N6DobSXf8yM3bXqNRlNw911mrOCB9aTXmI3g69o
   ZIYBP/vJqneMdg4OcWuuXzigLhNPy/0h+vQ0bWkL1daC4U0oQ3vo0VM9V
   Q==;
X-CSE-ConnectionGUID: v8Jh6wOIR5q2UVBlaHd94g==
X-CSE-MsgGUID: Ky7Vg2BiRuyQ5qmJAKasTw==
X-IronPort-AV: E=Sophos;i="6.18,235,1751266800"; 
   d="scan'208";a="46572767"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Sep 2025 07:01:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 3 Sep 2025 07:01:14 -0700
Received: from [10.150.206.75] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Wed, 3 Sep 2025 07:01:09 -0700
Message-ID: <50ca5062-5bbd-4c72-83c6-1d9abc6bde2e@microchip.com>
Date: Wed, 3 Sep 2025 16:01:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v8 00/10] arm64: lan969x: Add support for
 Microchip LAN969x SoC
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Vinod Koul <vkoul@kernel.org>,
	<linux@armlinux.org.uk>, <alexandre.belloni@bootlin.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <olivia@selenic.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<andi.shyti@kernel.org>, <lee@kernel.org>, <broonie@kernel.org>,
	<gregkh@linuxfoundation.org>, <jirislaby@kernel.org>, <arnd@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <o.rempel@pengutronix.de>,
	<daniel.machon@microchip.com>, Robert Marko <robert.marko@sartura.hr>,
	<luka.perkov@sartura.hr>, Vinod Koul <vinod.koul@intel.com>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
 <175327377884.189941.15214972441246653208.b4-ty@kernel.org>
 <bac5390f-725a-43db-a2b6-17a68d0d733c@tuxon.dev>
 <20250903-gratify-sustained-9acc011bc3c9@thorsis.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250903-gratify-sustained-9acc011bc3c9@thorsis.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_070149_927232_E1295777 
X-CRM114-Status: GOOD (  16.30  )
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

On 03/09/2025 at 15:16, Alexander Dahl wrote:
> Hello,
> 
> Am Thu, Jul 31, 2025 at 11:05:07AM +0300 schrieb Claudiu Beznea:
>> Hi, Vinod,
>>
>> On 23.07.2025 15:29, Vinod Koul wrote:
>>>
>>> On Wed, 02 Jul 2025 20:35:58 +0200, Robert Marko wrote:
>>>> This patch series adds basic support for Microchip LAN969x SoC.
>>>>
>>>> It introduces the SoC ARCH symbol itself under the ARCH_MICROCHIP symbol
>>>> which allows to avoid the need to change dependencies of the drivers that
>>>> are shared for Microchip SoC-s in the future.
>>>>
>>>> DTS and further driver will be added in follow-up series.
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [08/10] dma: xdmac: make it selectable for ARCH_MICROCHIP
>>>          commit: e56982021f5303b2523ac247e3c79b063459d012
>>
>> As this one depends, as well, on the first 3 patches in the series (Robert,
>> please correct me if I'm wrong), and there are still discussions ongoing,
>> can you please drop it until all is clear on the first 3 patches?
>>
>> Otherwise, applying only this patch will lead to AT91 XDMAC driver not
>> being built for SAMA5{D2, D3, D4}, SAMA7{G5, D65} SoCs. Linux is not
>> booting on SAMA7G5 SoC only with this patch applied.
> 
> Second that.  Just tested v6.17-rc4 on sam9x60 and DMA is not working
> at all because this driver can not be selected anymore.  This must be
> fixed before v6.17 release please!

Yep, I'll try to fast forward patch 02 of this series before 6.17-final 
(this instead of reverting XDMA patch).

Regards,
   Nicolas

