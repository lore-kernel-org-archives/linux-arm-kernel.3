Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB834C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 11:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/h3urZeBSuyLzEKrjaoIhDbStHH8t4huRWNHfTUPVk=; b=eeElJjRdZFbjx9hX6ECXrJS9bZ
	nf9CC9PikLPcsB0YWI9tBkyPuggcAs0rE3WjYfYSt+gpKeA6T8gj9oj7miqjRhWi34YRs8ADqRBTk
	iLWAz5GgKhJSIaRK2AgCV7vvD01HnXyaqI2y5MYyT82jy6svuAGCkeBln9oMECOOjGTRWJq6InlN9
	43AGpp470Ku1yCfzLwci4TVnLgUSeLsnVsPJcD1xRAoZI3Gbq63VgW4TOMfdCrZKEtytTTEjLQ7BI
	iObMZ008x1WHbfKOrKIxTmqYyIJnoEC1hcFu09I7r8JFzWuP7YUoPlEavKmyy0QAA7RIIbvBzqP5w
	MzPUkaYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjq3-00000002FtL-2pRI;
	Mon, 07 Jul 2025 11:16:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjKS-00000002Bks-0gQx;
	Mon, 07 Jul 2025 10:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751885046;
	bh=SjYXX7ZDI39EwB3CpttIlw1Vl4E8XtC1XpyQv46bDcs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MLpkOaTAJLq4MlrgIGANDFNa+JH58OcI6UYNWz/PJEFtQcnmTL/RIx8x27u3R/myf
	 jZMJyaM26Ev9l5IitO46i1LH/ENLfRMgk9batqZ8+o/RlOqpnl4t+a522dY6kyY1ZS
	 tI4r0mziRd2JgKo/oZIP1/oLouUSQeWebAMEVYdxNT3Kf80lzK+HLofHTgTGKdIn1l
	 slcINFRYB82/9SfjGD3s9Nxs2pDgs2XHC0R5dBhjVMiXKEwZtjvl+H4T1JAwvRLieK
	 cNKSbM+nzmOYeTEyE7vv9qBtcud49x8Wvv/atmaSumhHGWzR2RP1XLvaZh1sRjvkMf
	 9xMdydt8MqLDQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6ABA517E06BF;
	Mon,  7 Jul 2025 12:44:05 +0200 (CEST)
Message-ID: <5a196563-9589-4d00-a042-1dbb0295b0a5@collabora.com>
Date: Mon, 7 Jul 2025 12:44:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] iio: Add support for MT6363/6373 Auxiliary ADC
To: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <noname.nuno@gmail.com>
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250703141146.171431-1-angelogioacchino.delregno@collabora.com>
 <ab0a407412c705e409d9d26591543713a092c13f.camel@gmail.com>
 <20250706114455.26748e20@jic23-huawei>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250706114455.26748e20@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_034408_342913_12372616 
X-CRM114-Status: GOOD (  13.77  )
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

Il 06/07/25 12:44, Jonathan Cameron ha scritto:
> On Fri, 04 Jul 2025 13:39:56 +0100
> Nuno Sá <noname.nuno@gmail.com> wrote:
> 
>> On Thu, 2025-07-03 at 16:11 +0200, AngeloGioacchino Del Regno wrote:
>>> Changes in v2:
>>>   - Added error checks to all regmap r/w operations
>>>   - Moved adc_vref addition to different commit
>>>   - Various other fixes
>>>
>>> This series adds support for the Auxiliary ADC IP found on the new
>>> MediaTek MT6363 and MT6373 PMICs, found on board designs featuring
>>> the MT8196 Chromebook SoC or the MT6991 Dimensity 9400 Smartphone SoC.
>>>
>>> AngeloGioacchino Del Regno (6):
>>>    dt-bindings: iio: adc: mt6359: Add MT6363 PMIC AuxADC
>>>    dt-bindings: iio: adc: mt6359: Add MT6373 PMIC AuxADC
>>>    iio: adc: mt6359: Add ready register index and mask to channel data
>>>    iio: adc: mt6359: Move reference voltage to platform data
>>>    iio: adc: mt6359: Add support for MediaTek MT6363 PMIC AUXADC
>>>    iio: adc: mt6359: Add support for MediaTek MT6373 PMIC AUXADC
>>>
>>>   .../iio/adc/mediatek,mt6359-auxadc.yaml       |   2 +
>>>   drivers/iio/adc/mt6359-auxadc.c               | 440 +++++++++++++++---
>>>   .../iio/adc/mediatek,mt6363-auxadc.h          |  24 +
>>>   .../iio/adc/mediatek,mt6373-auxadc.h          |  19 +
>>>   4 files changed, 416 insertions(+), 69 deletions(-)
>>>   create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6363-auxadc.h
>>>   create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6373-auxadc.h
>>
>>
>> LGTM,
>>
>> Reviewed-by: Nuno Sá <nuno.sa@analog.com>
>>
> Applied to the togreg branch of iio.git.  Initially pushed out as testing
> for 0-day to take a first look and see if we missed anything.
> Jonathan
> 

Thanks for that!

Cheers,
Angelo

