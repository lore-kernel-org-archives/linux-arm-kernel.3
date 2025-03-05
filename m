Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4275C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 16:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TN7dJ7nISnXyySEUqU25KmhCCTIJAKDIXS/YmlH1ZlU=; b=0b1EUrdvnk7yPZoO6lVNA52KqL
	SctN4hjttjHKVv4wVmTPl9wsfZihH3czmOAW1bz54kb2d23VBGPxZh4PBphbWNFDqM+NwDSiaAHH3
	TniU9o7f4Wz014uwU6/8NvvpS16gpSKOd+gx/Uav92elrJfibHy5EqOsiohMlSf66WM78XyaBmQC5
	x3XHMiOaUSEn9qEht2i5Hm82V1UKrGU6Fucz3BRxgwaoYcQKroK3Fh5zHZHtoJc+/Vun9SC7Q75VC
	2dbspHw7VbnXRYhPTzumxdG24ApYQqIoKVdlLZU2w3hIuAemi61Cgrxt7kxUODcIilG9Y5Iwum0PB
	2Uzv17GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tps0N-00000008jU3-3QCZ;
	Wed, 05 Mar 2025 16:53:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tprym-00000008jKy-3p60
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 16:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TN7dJ7nISnXyySEUqU25KmhCCTIJAKDIXS/YmlH1ZlU=; b=HYpthG3SK0gNmpxM9M9mhQVTPb
	GDksyXbwoGdiCvuwvytIQSRJDRRTgTAkO7n8hGTC9PEJJMAHy78cuazAX2EsOD1LF9tFXDCjGNHwJ
	vmvlHKJ3ARxPltYtZlfMB5Nei2jsiFwqNgMCWHb4i9sjpwdmmT/CWn2q/WNQZKFg7XxKw+kSvcylG
	f4JgPEszRaWjtpLW9NGiZrh67E9fN0Wlqj6mkeAo8NPPNjd/mfpxcsoRAeNGKjaabfrRNBrXaw9rx
	7RDEGMBmI3aPj5wiOx0CEdD90uF2rHZhigj8EZOrWS/5KOYI2UoV4BNy3JcHck4ibmF/nOEEqvhEu
	62QW/zYw==;
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpryj-00000000dpv-3MTD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 16:52:19 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e5491eb37dso6392853a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 08:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741193535; x=1741798335; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TN7dJ7nISnXyySEUqU25KmhCCTIJAKDIXS/YmlH1ZlU=;
        b=MYkAJquus7Gw1RVjCbrt0x0Uqu4Pd1YfDU/5rQwHlSLjBNf2YjjRM/+pP/kTHzE3tc
         Cd66+ghZIO6j510jhCtCwm4F3Ww8CAJahxGkez/oty3e0W0c4YMNNBTjIxzlmMFH8r2z
         2TCkqUNhYUZ4qdaxF5jz3z6250YyWik9UnWeUgHlTZGiwUKiKlu6GhOLIOtDZePxcr/9
         noxpcaOjgtK2ZEImfEYPOSyzqix6yNbKBTz6OHyM8xJ78ZM0JC5qbCaDBQiu3P7+HkUZ
         FmJDBsJkGdFOdRdrwlQNpq9brCGySZcc2+MEMsPe6jI7I0sIiyH1mnkUuY8jN7Lg6LYS
         jWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741193535; x=1741798335;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TN7dJ7nISnXyySEUqU25KmhCCTIJAKDIXS/YmlH1ZlU=;
        b=IkHxbFWRQmJZhSZY6nQ1lJamrMdAmnWT+fPIInjIWY+Se/FMQJsfyPSCOYxa/R5lNj
         AkEMv5Uaym/f0w/WqFwtajDCQNnr+acOpGNkHBWxaf5X2Dm+1iHGf8oSanTmh7/tka6V
         MMDNYjNdtHaEo+FDdTA/WdGTZDlTgI0m+iRja4k3Fmd0dooeP374xlOwnT6YRzBQ2ID3
         Z2LIgyp6SjHJpDWWtPArvIg2j5tHMmwJpfMriLfl7tPyrvfhFfG6/kHX8ET9q2WJt2Gu
         g1ArlbfAUFrg0H/BXzV8RFsE31ZPlL6DnXgD6a3297ijj/hkTT2+hLReDGenfQiLCpQi
         PLjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjskpXsTZCAh7yeTRQDaJ6jIlAJfebppzPtWckLlBaPeMa0E3Yyvc/NgJsUr5t+i8AmslewMlrL0t6AK+RyO/w@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl1aNOan7rrkcqj+eAarYVmgS1aKqIQ6I2U+gKuF/WKBjdKjh6
	E7AlX+ff1aB/CPEM9Wtr0NQ4efxZIIw93tSTiy/wq2qCJwuinbmy
X-Gm-Gg: ASbGncsyW7c6hhK12/BBh/6uu801HQ8pj58kF6Fa89+cPG9lWzl3kIURAkCBLOzwq7q
	A2yzm8S6A/1JuAUKqQGcOpsjjhyO5gYqt1R3HDt3eHIDiHAd3VcJY/t36UAJbUKW7vj6+fQm+rD
	z1Baoh6WotsZjr5PKrKbzA/hKmiu2vZMSlpK9w1KaQE8BhjGNGgVnWz2ZgqkKcp7HbNSVn2uokk
	nmI0D5FOSF5cGiLGVDQ4AtDlBtHvvfQCf3woYsfeY37EweDyVn8JFINNipsXDZl7AHGkzyzo5Nh
	I9oEtPg9su0fZ6L/XmIdhL7/P0T7KqU1UjMhpPPo7rZXPYr5bR7zbMzn/KFi9Vkf4p7heFdqXec
	ZF6JyEOIPe48Z0qahwW8=
X-Google-Smtp-Source: AGHT+IGa33gWH8DfappKMWnwXtxakFLXNeMsVDV2sfglAO9PuEomgg6n3nyUhy0aaBLlS6tO2n4JYg==
X-Received: by 2002:a05:6402:2356:b0:5dc:d10a:1be8 with SMTP id 4fb4d7f45d1cf-5e59f405bafmr4178199a12.19.1741193534946;
        Wed, 05 Mar 2025 08:52:14 -0800 (PST)
Received: from [192.168.50.244] (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5992d29e3sm1978178a12.31.2025.03.05.08.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 08:52:13 -0800 (PST)
Message-ID: <51cefa7f-df05-49d4-9006-59ed216915a4@gmail.com>
Date: Wed, 5 Mar 2025 17:52:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/10] dt-bindings: mfd: brcm,bcm59056: Add compatible
 for BCM59054
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
 <20250304-bcm59054-v6-2-ae8302358443@gmail.com>
 <20250304141933.GA2543583-robh@kernel.org>
From: Artur Weber <aweber.kernel@gmail.com>
Content-Language: en-US
In-Reply-To: <20250304141933.GA2543583-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_165217_923899_52954D80 
X-CRM114-Status: GOOD (  12.49  )
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

On 4.03.2025 15:19, Rob Herring wrote:
> On Tue, Mar 04, 2025 at 07:20:33AM +0100, Artur Weber wrote:
>> The BCM59054 MFD is fairly similar to the BCM59056, and will use
>> the same driver. Add compatible and specify the allowed regulator
>> nodes.
>>
>> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>> ...
> And drop the allOf below.
> 
>>   
>>   required:
>>     - compatible
>> @@ -30,6 +31,27 @@ required:
>>   
>>   additionalProperties: false
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: brcm,bcm59054
>> +    then:
>> +      properties:
>> +        regulators:
>> +          $ref: /schemas/regulator/brcm,bcm59054.yaml#
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: brcm,bcm59056
>> +    then:
>> +      properties:
>> +        regulators:
>> +          $ref: /schemas/regulator/brcm,bcm59056.yaml#
>> +
>>   examples:
>>     - |
>>       #include <dt-bindings/interrupt-controller/arm-gic.h>

"Drop the allOf" as in, drop just the "allOf" line or the entire block
with "if" statements? If it's the latter - wouldn't that break the
bindings for the "regulators" subnode?

Best regards
Artur

