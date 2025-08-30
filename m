Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F19CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 22:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References
	:Message-Id:Date:Subject:Mime-Version:From:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wI2C0ic7Ljq97ZAPKSCFlEsmd9p0E8uFvvNo1wwrQLY=; b=niADqyQLniLrupuRpROx8e64hq
	ZQlZtWqWF4JMkbvEpIRGbL3fz6xyb7/OOyZ8CRz1TzgJfAqlfJGTzAsu0eiQvaTAjabS7GJz4mMps
	n80MevLTfSni7K7LdafV/re2K9hB0OcQiAvF5wEXigHta/JUOqrkV5XUrdu7jHt4HLRgOpgDEUHW4
	4xNWhjaSoKLHWW4z5d+KPtw9T7q6fUrnuixMKQCIrGKVB2VCMTHNHv7MjWHU2D7JXRNCJy9+lBp6E
	NrEByhxGx1JgvOpzbOhxCq1xgMsWLGzUKYERlCqsdOfIIpT/Jdsehfuy+ylDe9j3JR3HaEAa1+iDB
	qkcBz5GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usU22-00000008Ua6-0sQn;
	Sat, 30 Aug 2025 22:26:46 +0000
Received: from chumsalmon.baetis.net ([209.222.21.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usTww-00000008U6R-1N3F;
	Sat, 30 Aug 2025 22:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1756592489;
	bh=PHHa9DYJXHmkMKGNgwfkJoajblJ2zg1bqfQoS17QsXk=;
	h=From:Subject:Date:References:Cc:In-Reply-To:To:From;
	b=fCHcki9xdG3Dvrq2syz9niM89EurPYsCQfzVB9C4tRpXoHcsQt7GtBKdF9lX2/662
	 D1BJ6upsinoIgPJkDDD1+xQsO4XubDIZilP1wF8bdyRb1RYfT2LLRtOHQYpb5BAdy9
	 by2xmgQcsAgfrSTiT4824AYbdhtk01dB5w8xpRaABkmtZP+6q04CrLpV0IwcdJSGEJ
	 LnBE3b9peOpeN9+DlFfyUpGCSf4HQN/90EykaqxtN8izOmJ9De6pStlw3dGkqOCZW2
	 CfEOjV2AM8mv11At0Ij0pHYzutIbpICOQKmUnomTyL6kv3e2WAQtJJGUV3D/FIRHKi
	 0mJsbcNapKzzg==
Received: from smtpclient.apple (unknown [IPv6:2600:1000:b0ec:e674:574:f959:86e5:7770])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id ED14527E468;
	Sat, 30 Aug 2025 22:21:28 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Erik Beck <xunil@tahomasoft.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HINLINK H68K
Date: Sat, 30 Aug 2025 18:21:18 -0400
Message-Id: <5285B176-5178-4F6F-8FB6-B898AC0EC939@tahomasoft.com>
References: <021c2e76-cbde-4a2e-a165-a61223cdff93@lunn.ch>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <021c2e76-cbde-4a2e-a165-a61223cdff93@lunn.ch>
To: Andrew Lunn <andrew@lunn.ch>
X-Mailer: iPhone Mail (22G100)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_152130_429232_663BA0A9 
X-CRM114-Status: GOOD (  10.64  )
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



> On Aug 30, 2025, at 17:38, Andrew Lunn <andrew@lunn.ch> wrote:
>=20
> =EF=BB=BF
>>=20
>>> +&gmac0 {
>>> +    assigned-clocks =3D <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
>>> +    assigned-clock-parents =3D <&cru SCLK_GMAC0_RGMII_SPEED>;
>>> +    assigned-clock-rates =3D <0>, <125000000>;
>>> +    clock_in_out =3D "output";
>>> +    phy-handle =3D <&rgmii_phy0>;
>>> +    phy-mode =3D "rgmii-id";
>>=20
>> Please change phy-mode here to "rgmii". This change will yield an etherne=
t
>> speed throughput change of a factor of 100+.
>=20
> Rockchip by default do bad things with RGMII delays.
>=20
>  tx_delay:
>    description: Delay value for TXD timing.
>    $ref: /schemas/types.yaml#/definitions/uint32
>    minimum: 0
>    maximum: 0x7F
>    default: 0x30
>=20
>  rx_delay:
>    description: Delay value for RXD timing.
>    $ref: /schemas/types.yaml#/definitions/uint32
>    minimum: 0
>    maximum: 0x7F
>    default: 0x10
>=20
> Try setting both of these to 0. And then use 'rgmii-id'.
>=20
>    Andrew

Thank you!
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

