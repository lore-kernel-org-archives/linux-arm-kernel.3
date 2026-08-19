Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C7AC5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 07:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/LEMdd4b4q+MJn4DbfrTQFwIX+8AdaX54d5wOW06Us=; b=4Ax2tP8ix77ZSYcshDPo8YampS
	8mNibtBGrVsPENZUICFxkbhg0u5x9Fx4726/kCBMKLEvUvsC3e1l+tWEHsIBBPl5rKKqVX52Cshpi
	6yLsjniE1WRaRx18sEdIfkNJCXJIatgKKowGLcmV5LmU6kywuhoc3BOnjaYDnrFuati4ZKhNtx4kd
	6eqrlU9/FhBEfo6wodwsyOZec2evZvxusW97j02cH1z0TMSpgUE2HHpdyZ3XOr8Gaes+PTUmfUjQO
	jt7HOYzxykqRPGJVKRLd4NKVmepRy7JKLwxscDjJAFacMPhxhZbkLJ7DxdhrKr1MVjDDIOQ9NkvZa
	oq6osEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwavP-00000009Dkr-0XBa;
	Wed, 19 Aug 2026 07:41:27 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwavL-00000009Djo-2Eyr;
	Wed, 19 Aug 2026 07:41:25 +0000
Message-ID: <ef9ca9f8-6cb0-437e-b73d-976059dc6f82@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1787125277;
	bh=L8oGbzvk2V4mXRjUq7cwdbEYnJjsfG23S7DPzRl86To=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=qKmMfScE5JTlY4Eeq4wPokXB0h4AnwPIaDvDXAUMzt7Be4I6uiG35n7+JUe+kGXqP
	 Km/Uw9FDV759IrI86dJ5RG5sZR+ovUxraZkswtTiBytqB9feg4nSeAs4Uaf7xDt3cj
	 E6V2AqegDBzwimHL63vAJWItPSyptRfLCtAEan8U=
Date: Wed, 19 Aug 2026 09:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: linux-kernel-dev@aliel.fr
Subject: Re: [PATCH v9 4/6] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, mfd@lists.linux.dev,
 Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
References: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
 <20260805-add-mcu-fan-khadas-vim4-v9-4-75df78710b9e@aliel.fr>
 <64e146aa-4907-495d-b394-7cecb1727816@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <64e146aa-4907-495d-b394-7cecb1727816@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_004124_041875_2207D978 
X-CRM114-Status: GOOD (  11.84  )
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

On 8/7/26 4:34 AM, Daniel Lezcano wrote:
> On 8/5/26 10:06, Ronald Claveau via B4 Relay wrote:
>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>
>> Replace the hardcoded MAX_LEVEL constant and fan register
>> with values read from platform_data (fan_reg, levels[] and nlevels),
>> as new MCUs need different values.
>>
>> The cooling device's state is stored as an index into levels[],
>> and khadas_mcu_fan_set_level() writes levels[state] to fan_reg,
>> rather than writing the raw state value as before.
>>
>> Optionally acquire and enable a "fan" regulator supply
>> at probe time and on resume,
>> so boards that gate fan power through a regulator are handled.
>>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
>> ---
> 
>  * Through which tree this patch should go ? (assuming there is a
> dependency on other patches)
> 

I think this patch should go through MFD as this patch depends on it.

>  * How this will behave with 100 levels with the step wise governor ?
> For a 100ms passive delay and 100 states, it will take 10s before
> reaching the full speed

Yes the VIM4 MCU accept values from 0 to 100, but here I'm giving a list
which is (0, 30, 40, 55, 75, 100), so 5 steps to full speed.

-- 
Best regards,
Ronald

