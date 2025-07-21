Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B49C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQau27tiFbgxeFSGF9XUGR95YzgyQaSOU0OlzzUWZMQ=; b=Hy6URWNUUGqOzS275FrjjsqxUW
	NeUff3JpIOMyqWVBOhb7iC1xF18A7onlnqo1UbBv1rHbV7lZdVu/bKgiWeICz5/uvNI7js9wuH5TM
	XKYKm1Th1NwLkJQ/YwCxcxHs6UOOCy0OUpIjtGySSEaQAPtEIyKtttSqCI5c3lsw1jf3NNDEaLzCu
	tgQKt74KFzbmPEZKXZi5d43Ae7qSj4GzZgUFEIl+hBDzIwkBEfDcNQGWYMDOCBMQQJEU4Q3UxjZ0q
	w2mgad4EsGRIDk5hY/+v5MT0v/qr8DY44CL1HBFPrHqKNkDvUwk+aejMaqipemrGRKGkZBBHpkWeA
	QC6kg0ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvi4-00000000S4v-2uNb;
	Mon, 21 Jul 2025 18:58:00 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uduw4-00000000OTe-1IKN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 18:08:25 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-748feca4a61so2566081b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 11:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1753121303; x=1753726103; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OQau27tiFbgxeFSGF9XUGR95YzgyQaSOU0OlzzUWZMQ=;
        b=YQkzg2Rhh5lwTHbFiUk1dm5JoX9tUfMaPinnD9aIlUu8++vaxVB4tYCXcMcSVSQZKj
         EhpOJzr2kLV1PInin1/dOSap8opssyhstbCF6xRIE9F/PNbrFzQi9Yw7nDhjmI7s68ob
         DchhrwkfV0FaMh+LhHcrUZ9fUegBN3cCPx7PU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753121303; x=1753726103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OQau27tiFbgxeFSGF9XUGR95YzgyQaSOU0OlzzUWZMQ=;
        b=cFjHIcmHaMIo+Lw1Kr/E4bRnchmads7a3kbGKqOmxYaLAlPd/E0MnHSK5PDCaa0kmt
         Jh0yUtDtAcABDkAg3TCQWDJTTMFSHDqm/fgOL0utLFx3U5xqZXOFy3Zx8lv0fCskKImJ
         PnOiieomDPEx8y6gOvRlr1zERGqqBq7ycUrA7Kr7xTSiVnWa1ebV2BRpy3nM1+ehNLYN
         ooMsuIGaCKcM6YkRXgHAsKnN9Jxn11rRXWUL+RZ0BDLMP6qXTCfEJ/i5QCQXThW6OiBw
         nMv0rsREZ3CZSWi7Srw7qgqVUuZQ1FSPUjARZXuUNEDirbss5eXpyVvnquVsxYgW31m2
         KcpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9e0RhnUndr4WFRsc1NTJug/gtzSbUBx2FqhZTJXcGT7uF4RDunLgZBz+XNKKVtREg9SQhd+uXcuqv370KYg4K@lists.infradead.org
X-Gm-Message-State: AOJu0YxaZHD/OvoOJNFoBwfRLzM0XvXGN9w3nMgneAKWWJ2Gg8jTy8oz
	erJgIEbSFmPx8y1zEgFjuvbdZ6HhshmdoAT5IiSt7bzKtJHWLEX39usQP/kXvuL7VA==
X-Gm-Gg: ASbGncvt4PCvvBZ9e2VKbvlZ96tabg4A12ZSLND/b9eTI0y8kQgkSbz2Lr4KFweZ4k3
	RGNZe8iShjV9lznGWEkKFVP3I12xTa8Q4+0ZDh1f3zwq39q5uzb1w3OLwkJMHWSRKLDmjRXiVtv
	nLZpv7Mby8pf9EGmycNFOl0fOvQRho36k0BeWjDA4+N4z/sKir9NONt3VQYqu7aBsgfsjD0dP//
	byI47HtHdpysB6JmtQexgYdI9+JV7Yz3FfWjp9PMXd9ZDDxhNkPtQy1CgdXSZJxxXfmz0mEF3aB
	iEDk/mfVrTkZOXbvUqE4SnDh3FMcEwULO4yNeq2OxSf5KJ5Nhm8Tuo0QeDYBz/oue6kh3PxaWPd
	23VTT4HdajpeXpUBkCnTHORD56zBzptFhofEcoPdorwgM3Mf7ZHuht0jZ7jA3Tke8kRSvvE5JT7
	RL
X-Google-Smtp-Source: AGHT+IH3Pl8hly1TQfln2anufJFdUC5B1Ir4HZCUoycIdoSWzeF9avLSYC/Imq9DCATPu80vE9gR5A==
X-Received: by 2002:a05:6a00:4b43:b0:749:8c3:873e with SMTP id d2e1a72fcca58-75724876b0bmr33128549b3a.24.1753121302713;
        Mon, 21 Jul 2025 11:08:22 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e24c8sm5845796b3a.15.2025.07.21.11.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 11:08:21 -0700 (PDT)
Message-ID: <7bebb6b5-d527-4621-9438-8a8d0ab9d970@broadcom.com>
Date: Mon, 21 Jul 2025 11:08:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/4] dt-bindings: net: document st,phy-wol
 property
To: Andrew Lunn <andrew@lunn.ch>,
 Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>,
 Tristram Ha <Tristram.Ha@microchip.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
In-Reply-To: <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_110824_396243_F4338DCC 
X-CRM114-Status: GOOD (  22.98  )
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



On 7/21/2025 10:07 AM, Andrew Lunn wrote:
>> Regarding this property, somewhat similar to "mediatek,mac-wol",
>> I need to position a flag at the mac driver level. I thought I'd go
>> using the same approach.
> 
> Ideally, you don't need such a flag. WoL should be done as low as
> possible. If the PHY can do the WoL, the PHY should be used. If not,
> fall back to MAC.
> 
> Many MAC drivers don't support this, or they get the implementation
> wrong. So it could be you need to fix the MAC driver.
> 
> MAC get_wol() should ask the PHY what it supports, and then OR in what
> the MAC supports.
> 
> When set_wol() is called, the MAC driver should ask the PHY driver to
> do it. If it return 0, all is good, and the MAC driver can be
> suspended when times comes. If the PHY driver returns EOPNOTSUPP, it
> means it cannot support all the enabled WoL operations, so the MAC
> driver needs to do some of them. The MAC driver then needs to ensure
> it is not suspended.
> 
> If the PHY driver is missing the interrupt used to wake the system,
> the get_wol() call should not return any supported WoL modes. The MAC
> will then do WoL. Your "vendor,mac-wol" property is then pointless.
> 
> Correctly describe the PHY in DT, list the interrupt it uses for
> waking the system.

+1
-- 
Florian


