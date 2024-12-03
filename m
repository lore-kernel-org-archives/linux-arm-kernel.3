Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D868E69EA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 11:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jOrlgDBwSC9mM8oelPeMw0+wbuO3Fb+HA9uerFd0F1M=; b=yPiTeGHDtnUepc
	QR2iczz3R2gU/Tq4lz1BCO1NLzOQc3ee1x6M8sUdvO2hnuYLQKFtaBRPatYaobE9Kzu4s3G3jCnIN
	2ZOCTPWmkQ187bg3/RHg1kGCeN6TaYZ/oT/yIa1VXnFtgG578jx5jPQnQrMx8GZnkCnOCv17t6h/s
	Lm07/pn710XBA+lG6/shGRvR5NGPIhe3bsVdg3j+rbeTr6bfi0OAXmrMUaeL6Le4aXGYoInIjnWzW
	LUdFcARnlll76Fvw/s8KVXWbV1M2GfKfJxLwVF6oe4XfoKDX8tOdNL4UY8J2x4MNWf3CD7iKvoGby
	ZuviF4Aw6JmiuxOXq8mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQl0-00000009CeM-2pxW;
	Tue, 03 Dec 2024 11:07:54 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQVd-0000000994A-05pu;
	Tue, 03 Dec 2024 10:52:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1733223114; x=1733827914; i=frank-w@public-files.de;
	bh=jOrlgDBwSC9mM8oelPeMw0+wbuO3Fb+HA9uerFd0F1M=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=iOEWZZCiy9t2Oxr7wLKHTBi/lyeg9Upo0+HyO79C5O6or06CDFFkIR2eAQIRq/L2
	 RZwV0HSt/CQ5uNQSYhJ0kffb0icLv516fhLiXh1m3qEvTTvKDnrL+amuMiD3UHJ6y
	 it7qgITWliH74N0fDCgeuNPJgJZ5llFux1LvDybqNmALvNllmW75wzZqaos7IcCdG
	 l+xdDQ+deqH+U0yRJgTYH3jJzq7a80iTsKgpaY1QkFqrSk7scvQE2P36oJiVzA8YO
	 QAoHmxbJT5tVmXZRMWSajVGTuIiopptqAyImjv/HJq8LWZdCHRkxebwfvQQ9RV6bu
	 Dxq6xw/G69Xjlyi9EQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([157.180.225.184]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8hZJ-1tN7TU3eEb-00HJha; Tue, 03
 Dec 2024 11:51:53 +0100
Date: Tue, 03 Dec 2024 11:51:54 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_03/18=5D_arm64=3A_dts=3A_mediatek=3A_?=
 =?US-ASCII?Q?mt7988=3A_add_fixed_regulators_for_1v8_and_3v3?=
User-Agent: K-9 Mail for Android
In-Reply-To: <016b77dc-2d33-4639-b241-2574ad877971@collabora.com>
References: <20241202122602.30734-1-linux@fw-web.de> <20241202122602.30734-4-linux@fw-web.de> <016b77dc-2d33-4639-b241-2574ad877971@collabora.com>
Message-ID: <371B3F0C-D468-45C8-B1F6-F4619B7C72DD@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AVZ5ZUm8ptySUab2O2As99HWvCQXqqik2NguTeurSgHy51Tzxde
 vlfJK6+tcdhrqDgfilpQGR9fkBnPhhrXzeXLiGPAx5aglfRyqtjlD84KvLhHLWUerAye2e2
 UU+8GUTwnyt7Zb8cYf8TRmBO+KBD/JnT7ChJFYsBKoL1BIdscZYgxSAV7whKhigx1XML4MF
 0byLMKqzKMDn9Q1VO08ZA==
UI-OutboundReport: notjunk:1;M01:P0:RWkNNlChsdE=;rocX9nU54qiIa+fq9H7GdY62buo
 nl7nEx7rz587xlZ9MxauS/Ih5pM8w36fKob9HPdpZu9wSPFzl5GSwPKhsIpEqHuwtNGV0hfU3
 tTIOlQFVlJ/0p3PurWja9HHIwjc+iGarGOVm91HIhUeWoZaMB1b9I1RydV2yWkDVEwCcRyUSG
 bWhmXScFez/uzpTqFIS07OjVyQSW5fr8YN43rBhmvzbHrthsdcFyZWo0R2q3KhGkvEJSYOnsX
 0FyvbZ8bLj76Ned3xb+cO0GojM9IujJbcqKtSOU0OZbcRIDL+bmt0mIgd02H0Dda51VmGhH9c
 07c6M/4ujoK6q07GD+d7esyGW1ao88QD95zFrKqBgTmXnOBEQECdMQTVciTcJAIR44uYxI28B
 WtQ+GDNPeSwpcj3BfnuqND9e8ibXYOxUkrkh3OLijGFXJbHUcfHcXwUFdPpY3zSV+HkpjxS3S
 M28pSZ++f9JfzM/IYd0YqS/YrN62NusypkYaXcBumMjZct9siYFGJhgN84WNxOWPjKJ9BAqNH
 VaEgElqmWDBBD9VisFFNtcULy8zfSbAE/2bal6hIpCZ4G2yLTPUpLDd9/oajF6StU6A0L6HJz
 /vPWlRdm97yXSw5nhnd47W2atuqxEI+9Us6d2vt5gyrJ8+sJc+NuI/j51FWAPYZrQsdojMElN
 eel3hxXJsMLvyl33kLngwikF+i2Jybca4WlYIy7+TFx9eWg5G4po9Y4t0eUCPelagumoF3bg3
 E9ulxye8Wo0IG2PwNamtZ87VqlTth7BSZI82eGCdlYUFYNfThUEQdTGuLomZlOTpDfKIhByZd
 AscxHRMU0nEUcu2fex0jjBjg6bXHOpEGqB8o7o62tqQIQrCath4gXSl1fbeDq03NiggCGteuP
 YWxK6VJ0eOC843vp6HPWmdyqWGUdADbOY4EUcSKA1iTqzmH44WOkrIhwqsMROS2Kp5+oK+6jH
 3J+fCVLfnvUkvm+51W6LPaGzCvJVMqsPv/Y9XOzttBm9iqXyIGCe3MBu47nzQ66qUMbRQQTO4
 yFq3dYZC9eP7P9xnuTDjH1qxYHqv9uLBHU5WYeli0QIXZufE3NiqRwIN8XWy0RjByHAP5oFvS
 HhZLXRpPx9RJbtAGTI6CKo04czMaPn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_025201_354858_F7FDC806 
X-CRM114-Status: GOOD (  12.58  )
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
Reply-To: frank-w@public-files.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Am 3=2E Dezember 2024 10:40:54 MEZ schrieb AngeloGioacchino Del Regno <ange=
logioacchino=2Edelregno@collabora=2Ecom>:
>Il 02/12/24 13:25, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Add regulator nodes used for mmc to Bananapi R4 board=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>
>If you're adding the eMMC regulators, I assume that there's an eMMC, or t=
hat even
>if there's no device in some version of the board, these two regulators a=
re always
>assigned to the eMMC device - right?

Like BPi-R3 there is one mmc controller mapped to either sd or emmc=2E I c=
an move the regulators to the dtbo,but then they are defined twice (at leas=
t 3v3)=2E

>You should, at this point, do exactly that: you can leave the mmc0 disabl=
ed and
>only enable it in a DTBO=2E

I enable it only in dtbo=2E=2E=2E

>&mmc0 {
>	/* eMMC gets enabled by DTBO if present */
>	vmmc-supply =3D <&reg_3p3v>;
>	vqmmc-supply =3D <&reg_1p8v>;
>};

Problem is here that sdcard uses only the 3v3 twice

https://github=2Ecom/frank-w/BPI-Router-Linux/blob/6=2E12-main/arch/arm64/=
boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd=2Edtso

And emmc needs both

https://github=2Ecom/frank-w/BPI-Router-Linux/blob/6=2E12-main/arch/arm64/=
boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc=2Edtso

Only defining the vmmc-supply in dts and set only the other in dtso is pos=
sible but but imho not nice=2E

>Cheers,
>Angelo
>
>> ---
>> v2:
>> - move mmc regulators to board dts of bpi-r4
>> ---
>>   =2E=2E=2E/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edts   | 18 +++++++++=
+++++++++
>>   1 file changed, 18 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edts=
 b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edts
>> index d914eae2b524=2E=2Edf53512c6890 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edts
>> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4=2Edts
>> @@ -8,6 +8,24 @@ / {
>>   	compatible =3D "bananapi,bpi-r4", "mediatek,mt7988a";
>>   	model =3D "Banana Pi BPI-R4";
>>   	chassis-type =3D "embedded";
>> +
>> +	reg_1p8v: regulator-1p8v {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "fixed-1=2E8V";
>> +		regulator-min-microvolt =3D <1800000>;
>> +		regulator-max-microvolt =3D <1800000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>> +
>> +	reg_3p3v: regulator-3p3v {
>> +		compatible =3D "regulator-fixed";
>> +		regulator-name =3D "fixed-3=2E3V";
>> +		regulator-min-microvolt =3D <3300000>;
>> +		regulator-max-microvolt =3D <3300000>;
>> +		regulator-boot-on;
>> +		regulator-always-on;
>> +	};
>>   };
>>     &pio {
>
>


regards Frank

