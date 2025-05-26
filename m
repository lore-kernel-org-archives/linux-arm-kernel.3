Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E14DC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 06:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXLBbRXb9JjyhEWZwNFKMW2jVBUOhwFOuXiY7E3i2cs=; b=n66ZIf7c8ce4dgRBbbuiFRFuUu
	JZPJhI28LF+lwC1Tft9mgytQQAalRkcVR0Pr5gd5iNyq+IfEQBYGPChBY5icZOpv9Z0FCiJNjVM9F
	hAxdjGu0/ZfF5FkFR7u4AI5R3hKIpXD7E10BcZ2xOmrHFzXMxi+yMOiG9FykVxgWyOlaOoL3uiGZx
	2EdCIBdXwctoDTXC3ncIQhOMDpnyPLv84iO6N1BjS4CkQIgtnV4K3/zJ9m+NC5HFn3dk6N0H1R2Q3
	e9ci3eEeBGrOHYNftba30+qFvQu1VtuP1NOXOuE0jrjoLVOIIWlvNGmYXU9/wKvY9xvs96b9mnkZw
	SbjcKSig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJRcl-00000008EUN-0Oda;
	Mon, 26 May 2025 06:47:51 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJRZz-00000008EAT-08sc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 06:45:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1748241881; x=1748846681; i=wahrenst@gmx.net;
	bh=bXLBbRXb9JjyhEWZwNFKMW2jVBUOhwFOuXiY7E3i2cs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BSwwCZ4AyWMShrQcY8p9qbW1mJ9tWwzAYiyfDbW95pioE9oElatTbabXVEs9uZfy
	 hH80/TASN7N+ysfNxz28xXrq5w067XiSQpDiVfMJHCt79374ScM2Gk1AyVjfRwNNi
	 YgyeuJ7hY7CiltKGx3oNCQKrgYKbfSYQO+4E1cs7xGSnOSz4KGEinRuHK9LFlBcei
	 8wqzcnuLjx/xxKvD3fPmwFeL8EXcvqjaz9d1+s7lvYY96w3yzBVVTZrL+qzIeionx
	 DfBOhoeUnpRI7VWVNtGif1G9jsS7xTKGetPCA/AUYEf642ZPA4J2SpJ7W74XVTipo
	 44iHId3YMhV+cUhXEA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([91.41.216.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnJlc-1uiuRJ1sii-00caSY; Mon, 26
 May 2025 08:44:41 +0200
Message-ID: <b2ea6b7f-3623-4486-82a0-cab97053a53e@gmx.net>
Date: Mon, 26 May 2025 08:44:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
To: Andrew Lunn <andrew@lunn.ch>, Christoph Stoidner <c.stoidner@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250524112315.695376-1-c.stoidner@phytec.de>
 <047c963e-f24d-4995-aea0-4a8cf8e343f5@lunn.ch>
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
In-Reply-To: <047c963e-f24d-4995-aea0-4a8cf8e343f5@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:d3SViVT6UuD8sACbcKXL3zBeEF4rxfGJnzrZMMPpEW9ZXSe6eOF
 5GeBk3c/4PdlPLjATAHrB27ytUMLTffZzerpfT6bAw5Ke1vTdZCUIA+xrT9p/uS9oeAeKhd
 ehucj2IAlY0wVnJTpBzXAYYTEEtSOsrfvnP7FsGnYfAjXjCOAQM67Xt4ZCGXGB2jguYPEIz
 +3B+2sN8eCHOh/rlTGhMw==
UI-OutboundReport: notjunk:1;M01:P0:b2r4lkKUbQI=;8Re9IFuguwVF2R67lDE6iNYKuLA
 D9vBYrKBB+hiM8tycVGy4JIV30ozIP9QC2yHiMX/yy6tGHDSu5ghzFODU2qH1iSHi0jKdaJpV
 ND/T/Wp9Jm0ZQAlF9slVTAh7T5B+gApn+BzeGFM7SqlL49fZZVWREH0cTXHhLMSKkI+mCSZLQ
 SRflpR/yNI7mDdnXyYXmlEU1A+L1EvzP9Wgd4WTk6rFBf02yBtWQqakpbNpOBeA4D5AzArQcz
 8fVZBeQr+BHLNOSj4CZMnxLoEeJRcEg9E94FB61J/tgOO+AMVGjeobiL1e0yt3AGL0LkU9dNb
 ya2j6E7hIKQyu8kcApbNLrRhMuNIGiMldU5yDN+G9mKBH5Bt+STZweSgQt2xH7Jbjp7Fv/P6F
 YoveI/FD74Pahto+1FrJLf42ePTgsJ2QBoX81QesSIAeRLu3kt0a/Cub3yLgNBr2w11TGjhHn
 bmVGjmgL9adrDTM/v4ccDAtA6UgCKBvqhbOBI3xMqN4/U4vrr5LSTYtWSDlqwDKhQFx+o9YUH
 4XOo3A50taxZQekBsSC7EtrdCtqhsDMfN+2Uv+GYo35SogcH+Okm5Vj08p9UWyUizGnj+wfSI
 +VWAZrBBhuXu3N2sX+4RrwSUTA8FzaUNA6C8GXs/smln9b/eHoWG8GorpsykkWT7oI9cpaMat
 Od5fSxf7siup8tlpAifLmy9PA3huGGJgtrEkB3+ZWHMePt6NFdnuWMvLqSPpV8XTqV0+Q/vXW
 AUimH8VxglDQfAAYOWy19DZRtC9zEebQVpvcIqLjE/WLQ8CdwQLtDRB1UfgENjw+Ov60iTunc
 fFCG4YLiZMqAGee6G0uKFvncicoDnhNcMmFK3G4uE5hGbxNumEVL7TSomv++WtNGXGd3xwEwE
 Nxj4bAxwLspaO7vBlW3al5xo/cQR7z38JV3pRjay0vAwt4fOmb8slOat+yODSAdN89OCefDC0
 pM8UoDP4FVxQbSj76KNnPM9rb9tyi8fn/rMDR4L0Zq8PyqjFa2zbC1AWlhUqjYUxwTNL6HbCI
 gDTkxWQ/bmqi2YyJOQRMQqOduLE8jM2SNoyD7okHmcPozFnsvTAsH68gr5LH2ANPLT40yN17D
 zoA/cpZYc2KN0l9QZd4otdCqkM7v0vIsdI0m3AVGH54R8YnTTSIZ5V7m8R7+AjuWi77VoiZkR
 4fIgPL7Kb/Aex94Ub0sNdoUy0N6el7KR450BKQ7kKcfbiu0uAvXosMoq377O0T1BJNrXA0yHs
 L3+WxnGfBzBFS1DVEy7PEnJPVGzc7q4fUj7/I89X8b069Csf4ybJoJ94iStmEUGW13kd6s7R4
 6PjyEYK0DHpGMg9QW3YZX1HU8o7UEuTtxnXyyjSDDHmVqQCPaZ/di79EwXVSAFADv22sZfKT1
 I50sXxw9ohyVvksQD0G7waqL9HVw7YLeABRPPdxRkZ5ghtv5tUIXOXQphtdQ1JwrsT6ZnGODd
 AzXICHA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_234459_493301_ECD905A8 
X-CRM114-Status: GOOD (  10.16  )
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
hi Christoph

Am 24.05.25 um 19:44 schrieb Andrew Lunn:
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arc=
h/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> index 88c2657b50e6..b481097f08a4 100644
>> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
>> @@ -68,6 +68,8 @@ mdio: mdio {
>>   		ethphy1: ethernet-phy@1 {
>>   			compatible =3D "ethernet-phy-ieee802.3-c22";
>>   			reg =3D <1>;
>> +			reset-gpios =3D <&gpio4 23 GPIO_ACTIVE_HIGH>;
>> +			reset-assert-us =3D <30>;
> Is there anything in the datasheet about needing a delay after the
> reset? There is a DT property for this:
>
>    reset-deassert-us:
>      description:
>        Delay after the reset was deasserted in microseconds. If
>        this property is missing the delay will be skipped.
is it the time until the PHY finished its post reset stabilization=20
(datasheet to call it T2 "reset to SMI ready")?
>
> Anyway:
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>
>      Andrew
>


