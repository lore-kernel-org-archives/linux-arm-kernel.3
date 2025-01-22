Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087F1C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 15:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMfiJSqFcgJPozg0/DMp71+PzAqL2NmPTGoMF+zkaR4=; b=fgUtzD00xpG37LYO11Ksg+FWO4
	Llr09Y8yoHpnyXPKDaq69Mj6uwx9rArKl8XUDBlUH9YOVRMDU/UOHo3vGfyZXwji5Szu+FM8c9DfF
	g5GuRC+1Y32VxyLPB18mwJU6M2q6rAm/8brpfhnId/9MfKjC3SRRKvpxjDfXMdN+F2yuN0sv0DNGl
	iPFX5VbvjqsQ3ZMY20sn5eaq3hqUEZkZA/CZMWA7YoHT009aathXdcokb6MU+5t9d0lLfneJKUpeH
	pJUGz8ieJq9L6Mg6baBHTjRioMivKhAXqIrSAM4hjPGoAnYr4M2spvenVsEvlSkaXIjIVyPmxmAou
	jW7P7xZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tacFu-0000000AVdl-36fY;
	Wed, 22 Jan 2025 15:02:58 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tacEc-0000000AVTl-1JBO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 15:01:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1737558087; x=1738162887; i=wahrenst@gmx.net;
	bh=NMfiJSqFcgJPozg0/DMp71+PzAqL2NmPTGoMF+zkaR4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=icg/oNlQ1DS76oZFUwwzCvLJP5vdPypYh6mfeJ//qedy9X4ifuDstzSTkpnQeVcc
	 2dy//1BoXuP9fjvRdxD7K9BUWeWoblwtgmUjMKne0SendjDAUKHl4fsGupMnaQeQD
	 IX6G4a36NEsocIlSUP5wGaeSpK//ok0LnYEe1z8o8FV3YmsfCCiHnljVs3JYi1u5y
	 EdoPf5icatgAAJfnYwjOgXkX+u+chOOaZVbbRJ9n4UizxnsNgS3Wn+K8PAr6zm+Ue
	 vRRl09BSPslr/17L6wj5Rea2c1aJuFLEbCO5GNd+N2JgRfSAlK3DBtRzkltiBff1O
	 DxW8DPgWtaLqjQB3sw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNKlu-1tqdzB0eBG-00QEWh; Wed, 22
 Jan 2025 16:01:27 +0100
Message-ID: <cc710138-aee9-4d10-9ec5-8a017c19dff4@gmx.net>
Date: Wed, 22 Jan 2025 16:01:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable pinctrl-based I2C mux
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20241217193356.111102-1-wahrenst@gmx.net>
 <20250114231638.511804-1-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250114231638.511804-1-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:kG+8OP9t9fOWgneKzp9htaw0ygOfSraVUkFCj+DfHyJElIT4S/m
 stSSp6mZFo2EPoViO6Ay2dTYkR93QFHNOqjO0WgV2hZzRSqbctS9IsCQsMavZ8bwz6PlILQ
 5zn2fIxgrrm0IXzp5tpiybZqIwXECChhqcrhM5neXifwsqZIBiqZHEyfUbHLCbevd7j8ZAa
 eOoIIMzOZ4FdhRnq7LPxQ==
UI-OutboundReport: notjunk:1;M01:P0:HrtCwjtqiwc=;XrY1I1djlduMYJUvJ6WoRJsnGIH
 VB8uVJ6Lfu/7zIL9yu8bgXNHkVI5xTKn4SPRELWWvbl78arnH8ZNooO4BAQvIOC4NnEZ9smUr
 1f2gJ+Zo/4fHkpWYwqnxCwmTKKUxb8ogCh+pXh5OejZI0mU7EKBm0f5dxIa/J6ZIvbwAbsWZe
 ASLtyZYomqz34RgV5QE1daGSMZn0oRCLxqLgDsRfjUdeDiR+Ufi4YVegDH6YH0+zH4FMeSYsn
 d13WcFW7oB6veyqtf+ok5VDZnvjhaLDDRF0Sy6VPRFOICg54hsnh+MERRAhIbzx/U8yPD7VR+
 MWKudm6/QfF5SFNWU23hro4kMOS/PdFBYrcHAzO4kq6zQ8sKm/Dvq2VN1y8z86PEeMT/uTCdr
 yWPCCh21MgYReavLv7hPUurfxFS5mDh6F2ZjYBJ9gJYpcgbsiZDiN7q6GeyK5FKlybOPvmu6T
 dVi7wULSbzBg0hH70wjr1gf/2Cww2HDx8fst8SoxH3z4nAxYg1hOmyIv4MsSyV6wPJ0YIpo5Y
 +9vh/U+61skCOmV2YIXQCvKDrc5PRU8aLCtkalDhyOGOatAaK/Su64uv5k1GFiZvz5JlT7yF0
 vtOUSPcxNIT4ioMnh8h7rQgoGZmltW8ubsBliHt6uNySq4kmj/i63xp/9gikPCPQ3Ud7WtdmY
 yooClhBqYZGC/KJaXFlszVP1JvcavWYNU6snHOyJfo4uLHXIh/jH2a3CQUpZgT0MoCVg9PA0V
 MqcA0p4MxWfJjkKuQ2RuLMLkVPERarn/uidqd1OrYOnuTeecKWU9rT1QsEV6qiXp00HY7GVB1
 5E2tGMVxKpXJxGJOumRaEiGG/7yaLHptiI8IxYhKa6TpC7qjB0guznPlkhWQsQA0eqa55mYLY
 z5Scn3iRCnuNVp6Eli6PD7FZ1KaXrxz7djhKnM4mn7XZbKIgrU6cSp5k/7jdkUfYemQJXbNbC
 mWNSqNIaqEmAUy4Mc6sihnF1A6YQXn0UlkD6sZ9SRGewqp86iUuH3dD25yLfU5RI+GF2Lc+Yo
 sh2t+kflymLfyfNRJjkIHwpJJu+t3YAcnRcTx73/KGNF+pOf4T2gZMdSCG6Lg1iiu/wh0fSGV
 5Oq9oA/d0rGkO4fiYWOXrXA8fY6ZkALu9/nRau6PprQHGW0S8t5s5w2Hc9Z/u9SFesJPnWl7D
 0aViAkgkhV/YdoCOvKLymvCOgx/h82NYlys/W8BKOv/hAhzisSS333CLVcPN6JeDKEC6/Kxwz
 cZE1QJ8hMjnyl8vvgI5A/GjwHIW6Th0G8g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_070138_649437_D03FEDFF 
X-CRM114-Status: GOOD (  10.60  )
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

Am 15.01.25 um 00:16 schrieb Florian Fainelli:
> From: Florian Fainelli <f.fainelli@gmail.com>
>
> On Tue, 17 Dec 2024 20:33:56 +0100, Stefan Wahren <wahrenst@gmx.net> wrote:
>> The commit 84b1d6cc3e4c ("ARM: dts: bcm2711-rpi: Add pinctrl-based
>> multiplexing for I2C0") introduced multiplexing for I2C on BCM2711-based
>> Raspberry Pi boards. Unfortunately we missed to enable the necessary
>> driver in the defconfig.
>>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Link: https://lore.kernel.org/linux-devicetree/961b3d43-b4c9-4573-82d7-844aa129d994@notapiano/
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
> Applied to https://github.com/Broadcom/stblinux/commits/defconfig-arm64/next, thanks!
i can't find the patch in this branch or in linux-next. Do I miss something?

Best regards
> --
> Florian
>


