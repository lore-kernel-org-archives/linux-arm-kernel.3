Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A383EEED628
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHyxKI9VCxH2f6mCdTwUcvzfM+/esiLPnSCsW9XGsQA=; b=pM2Iy6pWPfgSS5tyXPvfjvBxuL
	NijWA8EvYd8P2JnB9Vx0siEaq6KFEJdpm5HqenbHunq8VtqeDgoOT7fahbpE3iui6TTmGbrre7Lql
	pJ5glpwkndSPqzqRFnD9dxehARt1OQHPci25bJqvq16IoA3lbUj3A7V1cNM+3SkgxuUnB7wKjsZC8
	zTdhUhD/uG9w6b1dXtb2osRAqF8JLWJzxpDVDYMcUi8fYT2VLzfnLnyaW/G1qjGK+KKLTurq5Xzll
	xFrieXvPtU1yFAbjiNmDOm33zNZKFNALytKu+hzdYo/pM8rhcoGC62pQsuWZ8mm3yDL1Z6FqRe0o+
	+d/7eqdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbhcw-00000008TYs-3wy5;
	Fri, 02 Jan 2026 16:03:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbhct-00000008TY2-29hH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 16:03:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1767369823; x=1798905823;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MTQLpKingEKtV/seZyycwDzSDN/2m5MELaR7E9Pydjs=;
  b=PuGsBh28YlQFy3ITVKQIcCIIhnK814gmbYR+I38ZljsSKY9FbhN4ZisD
   TMkUvKOgPiKwcSHa3JdNr6AQxuaK4UV+G3hrind+nJjdwj4qJyUzV7Gvw
   u1Pho9/xxvtSu6SlE7RFcUgiwOlZWS79Io4mY+k7k1/IoPmM0lU+um0Wk
   zD1n3KOr2m0FXz2u9eYIMVP4Wu7AxbVRdMLquxfnx283j8ha+zpuJs2X8
   MnE6vBAiQ23Dm20Rvig4yrPs71eG8klzwi9QYq0GtD/6R7lCDTD6ss0AR
   Am2wlsG85r3c0WELVKg7wCTd8LH/duMmn0Zaz7A4jTvstBtUJOD/1XxSc
   Q==;
X-CSE-ConnectionGUID: eZJkrK9NSOiP4Ojlexg/kQ==
X-CSE-MsgGUID: GgMXeHNpTVOSy9Yuy8q04Q==
X-IronPort-AV: E=Sophos;i="6.21,197,1763449200"; 
   d="scan'208";a="218598843"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Jan 2026 09:03:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 2 Jan 2026 09:03:23 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 2 Jan 2026 09:03:21 -0700
Message-ID: <276e53d3-46ae-46c6-ba64-f3337bb963d9@microchip.com>
Date: Fri, 2 Jan 2026 17:03:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dt-bindings: timer: microchip,sam9x60-pit64b: convert
 to yaml
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
	<linux-kernel@vger.kernel.org>, <conor+dt@kernel.org>, <conor@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <krzysztof.kozlowski+dt@linaro.org>
References: <20230525125602.640855-1-claudiu.beznea@microchip.com>
 <20230525125602.640855-4-claudiu.beznea@microchip.com>
 <20230525-straw-fidgeting-4c1099aa16fe@spud>
 <5edf3d3b-6f59-0af3-6414-940a278962bf@microchip.com>
 <20230526-knickers-aim-e01220e6a7cd@wendy>
 <5a5d25a2-e6b5-fd69-f615-cd3d6ed33b9f@microchip.com>
 <20230526-unsubtle-chowtime-ce329d7e5627@wendy>
 <20230608201707.GA3359628-robh@kernel.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20230608201707.GA3359628-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_080343_870745_2929C9A4 
X-CRM114-Status: GOOD (  15.39  )
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

On 08/06/2023 at 22:17, Rob Herring wrote:
> On Fri, May 26, 2023 at 08:55:39AM +0100, Conor Dooley wrote:
>> On Fri, May 26, 2023 at 06:41:39AM +0000, Claudiu.Beznea@microchip.com wrote:
>>> On 26.05.2023 09:23, Conor Dooley wrote:
>>>> On Fri, May 26, 2023 at 04:47:28AM +0000, Claudiu.Beznea@microchip.com wrote:
>>>>> On 25.05.2023 20:14, Conor Dooley wrote:
>>>>>>> Convert Microchip PIT64B to YAML. Along with it clock-names binding has
>>>>>>> been added as the driver needs it to get PIT64B clocks.
>>>>>> I don't think both of these PIT things need to have different binding
>>>>>> files. 90% of it is the same, just the clock-names/number - so you can
>>>>>
>>>>> But these are different hardware blocks with different functionalities and
>>>>> different drivers.
>>>>
>>>> Having different drivers doesn't preclude having them in the same
>>>> binding provided the function/description etc are more or less
>>>> identical. I was confused by:
>>>>
>>>> +description:
>>>> +  The 64-bit periodic interval timer provides the operating system scheduler
>>>> +  interrupt. It is designed to offer maximum accuracy and efficient management,
>>>> +  even for systems with long response times.
>>>>
>>>> +description:
>>>> +  Atmel periodic interval timer provides the operating system’s scheduler
>>>> +  interrupt. It is designed to offer maximum accuracy and efficient management,
>>>> +  even for systems with long response time.
>>>>
>>>> Those seemed like they do the same thing to me!
>>>
>>> They do the same thing, they are timers... But the way they do it (from
>>> hardware perspective) is totally different. With this would you still
>>> prefer to have them merged?
>>
>> Yeah, one binding would be my preference.
> 
> I'd probably just leave them separate if they're pretty much unrelated.
> 
> Rob

I'd love to see this (old) thread revived and I'm ready to help.
In particular this pit64b or WDT pending conversion to yaml which 
generate some errors while running dtbs_check on recent Microchip board 
.dts.

I tend to think like Claudiu and Rob here, hardware are so different 
from so different era, that... well... I would keep them separated for 
the sake of simplicity and future proof.

Claudiu, tell me if I need to help with this?

Regards,
   Nicolas

