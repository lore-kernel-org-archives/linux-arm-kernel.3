Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5566CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41E29IfUrYfauL1mCc1Q/S0cQ+IXf5WDP3dpcn7Vhxs=; b=cCXWkXUaADNAvQrdeoiGhhQGRK
	4i1Jgqt3yXUSFey10ST2QZWXxkGuuvRhmXawG2/4kh0vM0UsnILvwfUosHtO0r9dHQQ7pdMNxLT7y
	nLfK9MzOGZ4mjXYBRp0g5G4KIb/2+dZtAjGJ3HrZluuzYJsn+Jazjd8r9fAZcCw2jjNr2c75qVZiO
	YxE1m2IkRyv236q4cdBZUaMViGrcR0iS2duFQNC+epsQEOYh43By9RYw4Xy0wxdJuqvtbbYdFLBau
	Tk1tk2mnsaZMq6uq2Efw2oxWlx1ArXdj7HDF4+UPpAKr8JtkOl0NOFHKeBAihi4aor9bIHZv8Pdit
	E0wn+DEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrBe-0000000Dg0h-1QJI;
	Mon, 06 Jul 2026 21:49:10 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgrBc-0000000Dg05-1XS1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:49:09 +0000
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so18307135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374546; x=1783979346;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41E29IfUrYfauL1mCc1Q/S0cQ+IXf5WDP3dpcn7Vhxs=;
        b=Hzx9UuBkrsweAHX+6czGitUUHfE7Q0u+bpHqkFG1vSq66tFZOXeBJ+MIH0ihvY3uaX
         z3UD3855Kh+Tw35sPP+sSdj4PMwoqUc2g0ud2etZETsKiYyTWoOQaQOopU2tyyaIkTaA
         +xMIifybxA4sZE5mpz6yVLMYGc7U/1w0LXsNduiZ9Vyxtkc6WwpjPldz3eT4xTbtdT3h
         SUMFjLkJFdDzHNexLMU30n7SMjY+JTkJ7/qCpSzXF6G1wUUN0R+Csa6UwlItuRJ7w7OX
         ZQF01CNP3eIMZfjz37r+pCDM94/PRhoUyZp6SQCI/P1n3CEgbhG+tNdcpU9gbWdvvclF
         aiaw==
X-Forwarded-Encrypted: i=1; AHgh+Rqy5xLCibdcsINaj36Y4NEDTLz7BNA5fYKQGaY4ZPm3//p8p3PNVIze5lzIlGSxEYKD2lItI4CoVL2+MWk7L74p@lists.infradead.org
X-Gm-Message-State: AOJu0YzOI+UFuptSI2S+dA3EtvXKc4d379sRnfGJDfUuzGTpv+aPwnEG
	Px2+0fYF8hB5gnzUQKTzusumEvi1FdJrCVlnii7qNxI2YtbIcArQCT0s
X-Gm-Gg: AfdE7cnBwCK6oZ+YbMMHhAQC9cc1qCOzj3M4+sVHRnVzHpGBtxX9HcYm9Gv3GHLmMvU
	fJihAAoSOeEmIvC7Y6OYfjCSDJzoF+jVdRbHvlcRvY16B8RjhuIOtA1/KyNBYgVIsdi3aOZ1p/6
	6q2UDOpP8mY/Cg5tPfupeUTaI3N5MoV9jJ8bCgjilJO6djmsYAu3TAlIekB5Sd7HFvQmBeDkyDS
	t4HZS30mJkGRzX4jnZYA7sr/UFcIuDDXgwlWeML16enl/V2HBFr1WWJMW4aHzX84BT1v9n2FH9Q
	9XjySIGKymxz775NEzh6HrDpi91/FiXD8IBtg6ajgXiFMv4dQIPYjqsT6iRHDW9Ye/UW66Ew2x2
	jhsnSdhsUYh2aynJee4CKpp5SgLQ7dPZ2IeNjozIjUZM5OuS+Jl3Qnjd0gDU07bjhhBelzMfThO
	Xu9UE9xzGy1eBA3JrvxZj/6tAxLPrpnjzViqUgG4KPlb7LKCQyFUNLcVC3FP3cJxH/0NqSseQFS
	wwHICEsa/FAfOqOW2ne
X-Received: by 2002:a05:600c:3145:b0:490:e974:e006 with SMTP id 5b1f17b1804b1-493df099f12mr26072885e9.29.1783374545908;
        Mon, 06 Jul 2026 14:49:05 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0faee30sm1797975e9.10.2026.07.06.14.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 14:49:05 -0700 (PDT)
Message-ID: <fc88dfa5-30e2-4e94-907c-58de0cd8447d@reactivated.net>
Date: Mon, 6 Jul 2026 22:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: Remove non-functional EL2
 virtual timer
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Marc Zyngier <maz@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com, andrea.porta@suse.com
References: <20260619204832.586079-1-dan@reactivated.net>
 <878q898ulx.wl-maz@kernel.org>
 <223cd514-41b3-45b9-8617-b54d379d5091@broadcom.com>
Content-Language: en-US
From: Daniel Drake <dan@reactivated.net>
In-Reply-To: <223cd514-41b3-45b9-8617-b54d379d5091@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_144908_419040_056BD605 
X-CRM114-Status: UNSURE (   7.57  )
X-CRM114-Notice: Please train this message.
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

Hi Florian,

On 21/06/2026 21:03, Florian Fainelli wrote:
> We have an internal bug tracker item pertaining exactly to the virtual 
> timer interrupt connection however it affected a sister chip (77122) and 
> not 2712 AFAICT, now checking with the design team whether the same 
> happened on 2712.
Did you receive any update on this for 2712?

Thanks!
Daniel


