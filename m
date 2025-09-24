Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231DACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 10:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZCn/N8gb13dMyE8VkaFH0j2WUDKpll8BmLZY4GIH5Y=; b=4u/o33B5ajUrWTstwnHu1bSftD
	1TFoWR/L18Rq4lNHDhkKbQkslA1lRjTGB6kxPVOsbJ/hOvOAv0mvxzowiwKUDYt5cq4H3j8YXjnoV
	+qHh6UMWUTRS2t4cXVovXJ0jDLufog72DPsok/rdfX2JoEA/KLUp0650NFvE3TYeuPOfJu3vvMUwa
	liwoWnDcSYAqcCrxUy7jmbxawmA/FqN9m/wrFOFzTyHGHwqgle6D35cGmRp7QDsqZ9wq1fahMPhTX
	0+5r+ieOemCZGZ0HpeyltkPRijBQCkjxgSu9bteWPg7IadLEzF6TmMaMcuz0HqoqKVexIYoYxYVAz
	7MH03/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1NCw-0000000GihH-3158;
	Wed, 24 Sep 2025 10:58:46 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1NCu-0000000Gif2-18MY;
	Wed, 24 Sep 2025 10:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1758711510; x=1759316310; i=wahrenst@gmx.net;
	bh=eZCn/N8gb13dMyE8VkaFH0j2WUDKpll8BmLZY4GIH5Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SiQaQDkO6qXPx8QFeHaA768TZHSLavamR4aaf15T/2YamjIpXMVzMrJvZyocU41m
	 Mk3ZSBZsGYGda9IYHpt7u7Dfnp+B5C7FCwLNnYcqQVocdyJDxPxIi45fCE0IPnTJ0
	 xk5Rz9MYU7W6nzTcyJYSCEwgoeJ+sQkBHQxJJ3dDayYg4JCk2bE6W7G7bhWTsRmR2
	 PpeQMOYJwqI78sXZ6zgQbsj1rNrQXYCGSQVpg4iFBG6CLQLyjJFduhoJUqgEnVUra
	 P96jfDIKp5nIlPmccwmHFWNf10/vAmdeu6PtsOjc2pP2iDnSRZmsUQbEoge3RMaC4
	 hxU95pX9G4Lb3AhIfQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([79.235.128.112]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCsU6-1vACuM2sgi-00Di3w; Wed, 24
 Sep 2025 12:58:30 +0200
Message-ID: <62e92749-4373-4dfb-8570-7b41b4c131fb@gmx.net>
Date: Wed, 24 Sep 2025 12:58:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: Enable RNG
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Andrea della Porta <andrea.porta@suse.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250924090105.1061910-1-pbrobinson@gmail.com>
 <545e2819-9654-449e-aa57-636bee88c744@gmx.net>
 <CALeDE9NjF2xnc3rLi_SK2FPMSf2codQxBwqF+Q4XEuGMd6i8Cg@mail.gmail.com>
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
In-Reply-To: <CALeDE9NjF2xnc3rLi_SK2FPMSf2codQxBwqF+Q4XEuGMd6i8Cg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FlBuXIfEhf1PedGVJBrJx9tbGpRoySpDnZRFnqLML0D7JncatU+
 Y4k6G1KfXudzFDBcbLK+lEyg9EkGlJ0a//UYNFyM9ImcVC1MyAiZOp09lCoIf88ncnJcNW1
 d00r8gvLtrkHcM+zshhosV2ofHXic/1kMVtNZbOFrQkrOAt/0BDcA2e0auZIDH0QkPBeSKW
 xLhC98sUsxJp61s+HKZBQ==
UI-OutboundReport: notjunk:1;M01:P0:MyEpqRd9OE4=;yAFCwjO5TkzWhrZt3fZyQtvSz4j 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_035844_595889_A9BE71C0 
X-CRM114-Status: GOOD (  13.67  )
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

Hi Peter,

Am 24.09.25 um 12:53 schrieb Peter Robinson:
> On Wed, 24 Sept 2025 at 11:48, Stefan Wahren <wahrenst@gmx.net> wrote:
>> Hi Peter,
>>
>> Am 24.09.25 um 11:01 schrieb Peter Robinson:
>>> The RNG is the same IP as in the bcm2711 so add the
>>> device tree block to enable the device.
>>>
>>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>>> ---
>>>    arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/bo=
ot/dts/broadcom/bcm2712.dtsi
>>> index 4cd51d80d40d0..6976a88c262f4 100644
>>> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>>> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>>> @@ -226,6 +226,12 @@ system_timer: timer@7c003000 {
>>>                        clock-frequency =3D <1000000>;
>>>                };
>>>
>>> +             random: rng@7d208000 {
>>> +                     compatible =3D "brcm,bcm2711-rng200";
>>> +                     reg =3D <0x7d208000 0x28>;
>>> +                     status =3D "okay";
>>> +             };
>> thank you for the patch. I know the order is already messed up, but
>> could you please try to add it after uart10?
> Sure, can you let me know the preferred ordering so I can understand
> what we're aiming for overall?
Sure, all nodes with an unit address should be ordered ascending by unit=
=20
address.

https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
>
>>> +
>>>                mailbox: mailbox@7c013880 {
>>>                        compatible =3D "brcm,bcm2835-mbox";
>>>                        reg =3D <0x7c013880 0x40>;


