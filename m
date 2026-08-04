Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE4AC55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 08:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGYKfrI5isPzD/w3MdT2BkoFUO0HJ31kKGZjjuIKRPA=; b=RHgQFtNOWKj876VXsGK6vvY/tO
	n7IqqcYgdVoIsgO26r/1ZnpaqHQgVXLGi/fwUEHIpxJR5+48i8uK56AAzzIkD3oMsESGiC44DyDwt
	DFFVQJv2E0pZvBQRmq3H4eePsJ2z/WGEzEHv+15QMc/b7X2h/GqBaEKhL0tkyi58DAdjjgz0ZetyP
	1Zml4YN31LtpXTM0qqL1iXSYj17JC+Nt+R/h/IMRHj30JX53+uIqhPrEH1YNEAu81bygKd4mLmAsO
	GMs0gTqMblC7aQUF1XQvlSR0Ea0V4Jg+z6rutCi24zbVfxmzUwDT3qwdRtG8ALz8yQZEEb/REqWwc
	B4QwZmcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAYd-00000001LjZ-0t9I;
	Tue, 04 Aug 2026 08:31:31 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrAYa-00000001Liw-2jOu;
	Tue, 04 Aug 2026 08:31:30 +0000
Message-ID: <42363af0-a2af-4f8b-8ad2-834539c979b0@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1785832273;
	bh=p2hRbF6OR9u6soQD8uwd3KG20dyyAPFIEut3UyAAn20=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=TxqyMj3z1Lg2uE0F//7bjxqsXG1z7qyHSQ/66bPbAUtMFaPEBrytueMpUZpuZy/Qc
	 mRmdKvaYJ5Fvb1d8aVSO1M2Bct0I0AbM9nlq/Q7ynqP7UZAka/+kXnAxSBBf24+YpH
	 oJo6XkMgCCF0ivRjz7XUkw654IL4NXB8uGzEVmF8=
Date: Tue, 4 Aug 2026 10:30:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH v8 0/8] Add VIM4 MCU/FAN support
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20260702-add-mcu-fan-khadas-vim4-v8-0-244feee91a36@aliel.fr>
 <713c728a-f68f-41fa-a64b-09ccecef9157@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <713c728a-f68f-41fa-a64b-09ccecef9157@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_013129_128353_7CCA382E 
X-CRM114-Status: GOOD (  13.88  )
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

On 7/8/26 3:42 PM, Daniel Lezcano wrote:
> On 7/2/26 11:55, Ronald Claveau via B4 Relay wrote:
>> The Khadas VIM4 board features a different MCU variant compared to
>> previous VIM boards.
>> While it shares the same I2C-based communication model,
>> it differs in some ways:
>>
>>    - A distinct register map with its own volatile/writeable register set
>>    - A fan control with 0–100 levels instead of the 0–3 levels previously
> 
> That means for a eg. 100 ms polling, the first one takes 10s to reach
> the max speed, while the second takes 300ms, right ?
> 

Sorry for the delay.
Yes I defined levels 30-100 in the DT as the MCU register description
stated that:
`Note: the parameter value of fan normally open is 0x1E~0x64`

I didn't find any issue with the stress test, but I will address your
concern with a smaller list.

>>    - A fan power supply gated through a regulator
>>
>> This series adds support for this new variant by:
>>
>>    1. Refactoring the khadas-mcu MFD driver to use per-variant data
>>       structures (regmap config, cells, fan platform data),
>>       and adding the khadas,vim4-mcu compatible string.
>>
>>    2. Extending the fan thermal driver to retrieve the fan register
>>       and maximum level from platform_data,
>>       and to optionally manage a power regulator for the fan supply.
> 
> Through which tree do you expect patch 5/8 to go ?
> 

MFD seems a good candidate as this patch depends on it.

-- 
Best regards,
Ronald

