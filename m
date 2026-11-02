Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4720B606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iPKt1Upi;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pHUjGXyx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aK8g5gPWYY5ZSiatoKUDyldSfIMdc1sHYx/BgeG2gvc=; b=iPKt1UpijaUXK9
	hiawkb/46eFcRk9E4AeYsowyzSWA58JAfaosozEmzpNmeB4QT00UnuEeUzHTiDdRbN+8UeWy4Sr0W
	lFQcgwKDRhktMiiqWCwND3pb30ZOpD5ETFSZa1XL1dtX5h7yrdlkciKNBlzFmkqhWPBe+9wmqNep/
	YevIu/18VZoURtMW3G2pqW3wd+dGHpE9o3TU7lRIFF2ezGnssgETzf5Xs2GKU2CFlFdmM8O6phOfQ
	BNvqin6bznt+mhlIz4pHrwFWEifG4kLtnAZ4UakJ22436Xl3XwByNCZHvqFfDjBNK5aOP81RADHi7
	TqQdGjmjPnnFCd6BFLSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNp9z-0000000G9Mq-0tlk;
	Mon, 02 Nov 2026 10:21:03 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNp9x-0000000G9M2-0sj7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:21:02 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso183596a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 02:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793614860; x=1794219660; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aK8g5gPWYY5ZSiatoKUDyldSfIMdc1sHYx/BgeG2gvc=;
        b=pHUjGXyxjZIN22Q1lOPiG+z82vh8GzHBpBppG4L+LSSXof4rgvwYy5pL70uW6O+yAm
         bHpP+qAijZPypHCT3xvQp8heLFaWSO0X7kVuSSmKqxwcreMAnzdv+SMnNuFG6lQpVpl4
         agy5+3XNeHt+UHjd/w5dvgfMApV7LnlzuH8ciZtdHKDofKhXLNn7fBNi+c84D7iHY88d
         vacZAQYTwmDGY2HjqSupTTFW6hQyDOdZ5u796IrFzKpPZecF0PiUjSCTZ803oTqojR7u
         zDscq8raJrhX7LfQjAb9c9ZGiyds8gzLyBA8D6MRRwgA3RJZ2MrvLhwbJJuaP/uk/yze
         AZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614860; x=1794219660;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aK8g5gPWYY5ZSiatoKUDyldSfIMdc1sHYx/BgeG2gvc=;
        b=oWdAD8WsU2se1vPSK33XdydRal3oeMtRG2p/LzaM918WoZGzcbrAi48Ns/MFaHFlfR
         6fGPPDtZGZNDzCdsOXXSIe51sDvvnVYSnckP9r6mJyV61ftOFRTtkSHv7ryO5yVvAfcj
         re67Ztpk0utJ1VLDyrmv1FSkT0IZFdHlDVy4N8WyeGi74Tb2MQwFWk6D7yybvJQR9cAp
         vpg5tv/PVPDcKNXod5lMGYcyCrm1f10BrEKGCD2GZKwSve0F93TP7lcp/yW3IoymK0Fz
         ATGZgUGH3Tt8t8PiVtre/hhgIkGziV8/JRYe6ThtbnfTAsE2JZbYKDbcpl7XcVQ+nqe0
         QOcw==
X-Forwarded-Encrypted: i=1; AKwUvBzrP6cKulJypDag/32o7/EaaXOuEqoe0z/tw04Nfp8f+LAtvHAeV68ajrvPOa5f7NxYONy2ac/voaNN40eXaVmm@lists.infradead.org
X-Gm-Message-State: APuU4Z9fjIgZFz/X80G8YfRrNyMFsT194XRgBOTBtWyzST+dFD8iTFR2
	hTIOBN7QnEdppkffMZ9j4ApQKUYBzfTLGMV/VH1fFwtEMrJoeedtWc6w
X-Gm-Gg: AYBFou1VQ7I5FWX3Vii0MXmyPSlhHcHb1ux8A2m6DjQ19h3lnbqq879HuN4cNIWmEt8
	XMR6CZTE8N9TpH7hZKhQQgkPMhb1shjaWa3wTG5Ajd59nlSdWXd58jlDOV+SWrai6E1QunwZkom
	iUV+KMZWif0FXMSRVBpznu1fxOTWuym5eXtg6jB1/2m/2LPUIlQ137MZs6dlDzDmBEnragR72gz
	dI9QXIO+IFT3+l+jeaJbMcIbegmfZC4RKL2C2O+PGLU7IxK3d5kFIMG+Usn2sNIlYg7/OWcEtl5
	uiUmgUWp46lf8Ir6bIgUnqNubHfi5E6WC+VtaFl/ZoEWFR5m/9lT7Ik+UR6t/YPxJMlT4p0uQZV
	waH93Uph2gj2YBcrkNOl6uqGEtCiwE0wVcB2hxJJ6SmzdBcbgMyEPKCiXxzI2s41KIgeY1iLeRA
	MmBFuipqQD9gmGiKF4H0UtK95rVIK637DZiVyXjBtCEdYV/a0QmkOhtd8et9mOzrOvtWRljGxsR
	2RkYCpH9DA6jZuSm1uP+E4XMQc2zuYsNj+YzJrvMk1i9zP58yzwA1Z+ganQtSuQTbDDw1LfvO8R
	1a3I00FCHVhSnulsnvn6HcuQrzfXVLim54GyiHt1VImNCoi2w5NApxHe1gxf13YfnB+h2zhKNwX
	3GKWE
X-Received: by 2002:a17:90b:1b02:b0:3ae:3c0b:159b with SMTP id 98e67ed59e1d1-3ae8973603bmr6808844a91.24.1793614860072;
        Mon, 02 Nov 2026 02:21:00 -0800 (PST)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm13811378a91.14.2026.11.02.02.20.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:20:59 -0800 (PST)
Message-ID: <0f0324f4-48d8-471e-b35f-7f2d541a70ee@gmail.com>
Date: Mon, 2 Nov 2026 18:20:56 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cwweng@nuvoton.com
References: <20261030031501.130290-1-cwweng.linux@gmail.com>
 <20261030031501.130290-2-cwweng.linux@gmail.com>
 <20261102-bald-mysterious-alpaca-13b8fa@quoll>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20261102-bald-mysterious-alpaca-13b8fa@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_022101_256294_16B92E75 
X-CRM114-Status: GOOD (  23.08  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



Krzysztof Kozlowski 於 2026/11/2 下午 06:03 寫道:
> On Fri, Oct 30, 2026 at 11:15:00AM +0800, Chi-Wen Weng wrote:
>> From: Chi-Wen Weng <cwweng@nuvoton.com>
>>
>> Add a devicetree binding for the Enhanced Analog-to-Digital Converter
>> (EADC) found on Nuvoton MA35D1 SoCs.
>>
>> The controller provides eight external analog inputs which can be used
>> as single-ended channels or as four fixed differential pairs: 0-4,
>> 1-5, 2-6 and 3-7.
>>
>> Describe the four hardware interrupt outputs, ADINT0 through ADINT3.
>> ADINT0 through ADINT2 are associated with the corresponding conversion
>> interrupt flags, while ADINT3 is shared by the ADIF3 conversion
>> interrupt and the ADCMPF0 through ADCMPF3 result-compare interrupt
>> sources.
>>
>> Also describe the functional clock, optional reset, optional external
>> reference supply and optional DMA request.
> 
> Don't repeat the patch contents.
> 
>>
>> Expose the controller as an IIO channel provider through the
>> DT #io-channel-cells property. The cell identifies the logical EADC
>> channel selected by the reg value of the corresponding channel child
>> node.
>>
>> Restrict the channel binding to features supported by the MA35D1 EADC
>> hardware and use the common single-channel representation for
>> single-ended inputs.
> 
> And here even more.
> 
>>
>> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
>> ---
>>   .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 175 ++++++++++++++++++
>>   1 file changed, 175 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>> new file mode 100644
>> index 000000000000..97144a8eeb5c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
>> @@ -0,0 +1,175 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/iio/adc/nuvoton,ma35d1-eadc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 Enhanced Analog-to-Digital Converter
>> +
>> +maintainers:
>> +  - Chi-Wen Weng <cwweng@nuvoton.com>
>> +
>> +description: |
>> +  The Nuvoton MA35D1 Enhanced Analog-to-Digital Converter (EADC) is a
>> +  12-bit successive approximation converter with eight external analog
>> +  inputs and one internally connected VBAT input.
>> +
>> +  The external inputs can be used as eight single-ended channels or as
>> +  four fixed differential pairs: 0-4, 1-5, 2-6 and 3-7. The internally
>> +  connected VBAT input is not described by a channel child node.
>> +
>> +  The controller provides four interrupt outputs, ADINT0 through ADINT3.
>> +  ADINT0, ADINT1 and ADINT2 are generated by the corresponding ADIF0,
>> +  ADIF1 and ADIF2 conversion interrupt flags. ADINT3 is shared by the
>> +  ADIF3 conversion interrupt flag and the ADCMPF0 through ADCMPF3 result
>> +  compare flags.
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-eadc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    items:
>> +      - description: ADINT0 conversion interrupt output generated by ADIF0
>> +      - description: ADINT1 conversion interrupt output generated by ADIF1
>> +      - description: ADINT2 conversion interrupt output generated by ADIF2
>> +      - description: >
> 
> Drop >
> 
>> +          ADINT3 shared interrupt output generated by ADIF3 or by the
>> +          ADCMPF0 through ADCMPF3 result compare flags
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: adint0
>> +      - const: adint1
>> +      - const: adint2
>> +      - const: adint3
> 
> "int" is redundant, so honestly names should rather go away completely.
> 
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Thank you for the review.

I will shorten the commit message in v4 and keep it focused on the
hardware aspects that are not obvious from the binding itself, rather
than repeating the properties added by the patch.

I will also simplify the interrupt description. The detailed ADINT3
source information can be kept in the controller description where
needed, rather than repeated in the interrupts property.

For interrupt-names, I agree that the current "adint0" through "adint3"
names do not add useful information. The interrupt outputs have a fixed
ordering, so I will remove interrupt-names from the binding and use the
first interrupt by position in the driver.

I will address these together with the other binding changes in v4.

Thanks,
Chi-Wen


