Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B76D3A697
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ar9OhxoAhlsVrdr4yEALxcch1UzmR8/RO9WPA/0wzAs=; b=ODMdRCHcA9IFXp+F+VIJ2i5QVM
	gJDAwbczSIqWyTFkS9QFsuJ+kZjHN/xuRgG40oSPln092sdgmvwriLdRwZcRoADVFjBzu8Nebjt20
	f23UWW+l4RvMTgeQar1K22Ai7pWy1kT0QKxJaJSvFrESWgyYaZ2z7a+yGnMIdulBUE9lrbYvafiEQ
	6xSUs3HOk4uFfL6qqCeF/He2dedAqtbEYiwJcw+QI4umV+3wqejLnASGwd+30hz/ZsCL+HPX1Qqqs
	H1yz6bLAoyA8MXTlqNSCs+HToVNTLnY03IHOwM2S0rzJ+YCz8DNKlpvPwNyS8L/XvLH76Bne/cP63
	zF82UTKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5sfn-0000000FkLs-20EY;
	Tue, 29 Oct 2024 20:18:39 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5se8-0000000Fk8h-1mlA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:16:57 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2B01789187;
	Tue, 29 Oct 2024 21:16:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730233013;
	bh=ar9OhxoAhlsVrdr4yEALxcch1UzmR8/RO9WPA/0wzAs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WDLJ8/T7qdqbh9TU9iY8jrWdf1nchk8L0g2jvT4cfW7AQJD8nDZIrJwrjy0FKAHJi
	 f/JKoSzhzc+xGX1SVPGWRfItrjRRtyEYmclopqU5NjAWHoRRRTlKkAZeMBfwAYwP2C
	 T4LqjD6OJlzTrvz2xi1ULmf2+nsTSVL589+j0/j0Dcb0ttdfbNAM4Nu/zWQ/YpAPHO
	 CycTmQh9hB2YzKIYUFNGfxCKMelC6fVH80CkKcEPJ+Cl2WaTziBsyt3OgwNqtdFwda
	 WWmmVstEMDobAsWNTbpsDrHVUMByRSjw/GoCWEqVKOYUgZKS03G8rlKw4QquM6oTZj
	 v5uX3dBOe3bsA==
Message-ID: <e521394a-a7e1-495e-8a67-637f30d7866d@denx.de>
Date: Tue, 29 Oct 2024 20:07:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ARM: dts: stm32: Add IWDG2 EXTI interrupt mapping and
 mark as wakeup source
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Antonio Borneo <antonio.borneo@foss.st.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-watchdog@vger.kernel.org
References: <20240623195136.81522-1-marex@denx.de>
 <43c2cd64-2c70-43f3-9470-b6f8bcaa8027@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <43c2cd64-2c70-43f3-9470-b6f8bcaa8027@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_131656_793141_E6994B58 
X-CRM114-Status: GOOD (  14.71  )
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

On 10/29/24 4:16 PM, Alexandre TORGUE wrote:
> Hi Marek

Hello Alexandre,

> On 6/23/24 21:51, Marek Vasut wrote:
>> The IWDG2 is capable of generating pre-timeout interrupt, which can be 
>> used
>> to wake the system up from suspend to mem. Add the EXTI interrupt mapping
>> and mark the IWDG2 as wake up source.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: Antonio Borneo <antonio.borneo@foss.st.com>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>> Cc: Richard Cochran <richardcochran@gmail.com>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Thomas Gleixner <tglx@linutronix.de>
>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> Cc: linux-watchdog@vger.kernel.org
>> ---
>> V2: No change
>> V3: No change
>> ---
>>   arch/arm/boot/dts/st/stm32mp151.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/ 
>> st/stm32mp151.dtsi
>> index 1804e202eb425..68846699b26fd 100644
>> --- a/arch/arm/boot/dts/st/stm32mp151.dtsi
>> +++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
>> @@ -355,6 +355,8 @@ iwdg2: watchdog@5a002000 {
>>               reg = <0x5a002000 0x400>;
>>               clocks = <&rcc IWDG2>, <&rcc CK_LSI>;
>>               clock-names = "pclk", "lsi";
>> +            interrupts-extended = <&exti 46 IRQ_TYPE_LEVEL_HIGH>;
>> +            wakeup-source;
>>               status = "disabled";
>>           };
> 
> Applied on stm32-next !!
> (late but applied ;))
Woohoo ! Thank you.

