Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E398DC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 22:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nlwas3DwFjCfvrdUu+/G6DY1kui3FvZP2pV8o9eVc3Q=; b=oK5VdOH8zmrOPQUTHyVyrjsaLV
	U1jUop6U/BvybSXFXtuO64goN2+10BnjkVXEIC0cd3VjdEk38ECd1i+NoGLMyBK2Re8DD6b+WJkcV
	xYBKRj2aModCyM31/O3NKUUBxtOBLE+7lwyG6xKY6zc4xqPAhd8NkseIogMAfEZagf+PAY7vH2wMl
	FgywkWFtrez5bEZ4YiItVgzi2xIF5PeHddfj4hBZ/MhkHBBX4M2KlsRSYpDgYYB7wmceweKMHr52q
	gsF760TYvbV2LsCM2JL2OF7hrWO+MUP6PCBzTrWCY7c83+tahHf6WCqQyaCXQG8tR3XYVuMr6T/Wl
	+KN4zo1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5BTB-0000000B4N2-0RwS;
	Wed, 16 Apr 2025 22:43:01 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5BPn-0000000B3sS-1hFM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 22:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1744843165; x=1745447965; i=wahrenst@gmx.net;
	bh=Nlwas3DwFjCfvrdUu+/G6DY1kui3FvZP2pV8o9eVc3Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XQqh+P8+PkSdW9SX48kqfAlucl0K3a6YymgcUaxN1fgYS7QrQZSOyE4pAMmapFNe
	 byCBEH0rbY/CVi23wW341uJN5hhs5qsuCptNc/X8MFPBZ4nzMI+tOGuennfIZK74T
	 2edCdekf4DzkylGq/U+Xrad8njWKS4H3djFXHGOw8wadGGazzKIx8TnlZLdh64/M1
	 Qe2OHKeQ+bTkryF5gol/eb1q9meEHL0U5bN/ttVZeCCzZVLxZ0FiVCfYElChTRF4d
	 cx4MRwkUYvuNbY+MAkeWwpEclanOmGYmOPQUJiE/obd7X1o9FHoRA2wK8qTfRQg3G
	 RX70WJ2jxqsCjO+YnA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbzuB-1uielG0VGp-00gVPk; Thu, 17
 Apr 2025 00:39:25 +0200
Message-ID: <6511c88d-7876-4f69-81f1-1206056d061a@gmx.net>
Date: Thu, 17 Apr 2025 00:39:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v5 2/6] ARM: dts: nxp: mxs: Adjust the imx28.dtsi L2
 switch description
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lukasz Majewski <lukma@denx.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Simon Horman <horms@kernel.org>
References: <20250414140128.390400-1-lukma@denx.de>
 <20250414140128.390400-3-lukma@denx.de>
 <06c21281-565a-4a2e-a209-9f811409fbaf@gmx.net>
 <2c9a5438-40f1-4196-ada9-bfb572052122@lunn.ch>
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
In-Reply-To: <2c9a5438-40f1-4196-ada9-bfb572052122@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2DQfa/1BzaIm5QWQ4icl0vbZnH/GHqqbwF4kMTdqWgMb/6zSMPK
 wd1ROmb6SjnV0gMM0So2NhHWW9Phs0qFXRyAGxVGvbAMSl5qeL6gGudlQen0WUK11oGVHie
 t1UufVoIdntlOLHUWT1UjJnR08FeM6966aVRIJ0DMAH3d7pE8GkoJo8gJwCGvDdN3fBMHco
 CYA84rTkV0LDV72kNGTog==
UI-OutboundReport: notjunk:1;M01:P0:dRVddgF5sOg=;TyBy9LdOd4S+gyg60RqverJ7zZh
 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
 UJ7soJFLEqFJKhUG0L6EyM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_153931_742671_6572CDE9 
X-CRM114-Status: GOOD (  18.87  )
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

Hi Andrew,

Am 16.04.25 um 23:58 schrieb Andrew Lunn:
>>> -		eth_switch: switch@800f8000 {
>>> -			reg =3D <0x800f8000 0x8000>;
>>> +		eth_switch: switch@800f0000 {
>>> +			compatible =3D "nxp,imx28-mtip-switch";
>>> +			reg =3D <0x800f0000 0x20000>;
>>> +			interrupts =3D <100>, <101>, <102>;
>>> +			clocks =3D <&clks 57>, <&clks 57>, <&clks 64>, <&clks 35>;
>>> +			clock-names =3D "ipg", "ahb", "enet_out", "ptp";
>>>    			status =3D "disabled";
>> from my understanding of device tree this file should describe the hard=
ware,
>> not the software implementation. After this change the switch memory re=
gion
>> overlaps the existing mac0 and mac1 nodes.
>>
>> Definition in the i.MX28 reference manual:
>> ENET MAC0 ENET 0x800F0000 - 0x800F3FFF 16KB
>> ENET MAC1 ENET 0x800F4000 - 0x800F7FFF 16KB
>> ENT Switch SWITCH 0x800F8000 - 0x800FFFFF 32KB
>>
>> I'm not the expert how to solve this properly. Maybe two node reference=
s to
>> mac0 and mac1 under eth_switch in order to allocate the memory regions
>> separately.
> I get what you are saying about describing the hardware, but...
>
> The hardware can be used in two different ways.
>
> 1) Two FEC devices, and the switch it left unused.
>
> For this, it makes sense that each FEC has its own memory range, there
> are two entries, and each has a compatible, since there are two
> devices.
>
> 2) A switch and MAC conglomerate device, which makes use of all three
>     blocks in a single driver.
>
> The three hardware blocks have to be used as one consistent whole, by
> a single driver. There is one compatible for the whole. Given the
> ranges are contiguous, it makes little sense to map them individually,
> it would just make the driver needlessly more complex.
>
> It should also be noted that 1) and 2) are mutually exclusive, so i
> don't think it matters the address ranges overlap. Bad things are
> going to happen independent of this if you enable both at once.
>
>        Andrew
i wasn't aware how critical possible overlapping memory regions are. I=20
was just surprised because it wasn't mention in the commit message. As=20
long as everyone is fine with this approach, please ignore my last comment=
.

Regards


