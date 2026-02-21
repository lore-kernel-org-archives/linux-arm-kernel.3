Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B42AC61DC5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 14:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uhfJ1Pxx4Iu09gywIbE0eSWU1tjth9StdzXC/hs4LA=; b=yNLSySUjEmNe35PDVzJUz0anKW
	uVgqjoco5pJfBRG/6htBbI+ta3Br8M84JVBroNbGo/9jbnQqwD2fNNUrkVRkuQ+21InKWvqivTDGS
	tbg0V9YIXJyKu2wl15R4c90PPIMmxbZ9uikvWpehC/LyDhA7dz4bmal+YBVSG7Rn/x4w+FbmMuY0u
	t7fx51gYeQ2aXaO8zZYJGUAEJUpXazx2184YPjCHKRkfOT1cjMqwoYSrJRWgKUZDUncv9ih9mM2+2
	gG1xlo85Z7yIe+GTwGFQgkps6H+VY4k1MnVpaJ6Ofg7+y+SpTfn+eh2i+YeU7u63KahRkkcqc6PcD
	DtAipmtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtnud-0000000G5yJ-47rg;
	Sat, 21 Feb 2026 14:24:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtnud-0000000G5yC-0uUy
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 21 Feb 2026 14:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8uhfJ1Pxx4Iu09gywIbE0eSWU1tjth9StdzXC/hs4LA=; b=LsCahb28Fmam2lKEbcDWdmWqZH
	6qzrg8iRJjUGHaLUOAdf3tqNcBsGX9lM/aS8po2AIHpBmz66dzw+xfJf/duQ5LCcc/9FhMgGniV40
	hmnbFszXChcvlunyJEbalYIfVxIlgUDQPgzOCUUzSO6EhOcXNGOsENPeYNCugBi6K9Fz8A5dbnnR9
	kIiGE2ObKvNEsyDwN97BxrIkdWf/cWB8dUSti9UHWq3Ej4epW++oE76/3pcgoXYEiezo7qDXAz+nI
	Yv6TDbOz0MhfFPrU1zzcbkyAOFZazQ0IfXB0Uh1VkUienjFV/0GheTXaQFX0OvCfZeoJHpPW0TlpJ
	pelqos4Q==;
Received: from mout.gmx.net ([212.227.15.18])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtnuZ-00000003SwE-3T0L
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 14:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1771683878; x=1772288678; i=marvin24@gmx.de;
	bh=8uhfJ1Pxx4Iu09gywIbE0eSWU1tjth9StdzXC/hs4LA=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MXb7e08U68ZCRi5UjoMFFFuFXBINNZFfvbZpa3DulBjApvBGIomJg4DJWknwF3Cq
	 rYY8IjJ7QrYoEphKuQxe3RbnYeypWcbvbcb4Ed1QmqQcIi1gT3Z/RZ4+MqWM6Krag
	 7oGzFVf/pSuSUsStrHkqHCQ8JnB/I9BdDMkGIYeNQAtiAYXLXOoY0ltgbiW87Glg5
	 48o9XkW559HoaSbmPgg0axwWT1VBcikk3iS6vsRGbSKGAMJtFtyUaE2XRv/N3QyxG
	 XiYDKWTQUK0CEWTzc9PV6IBThvumBsistd1KmhI2h4wv4A4ZUFpem39zt+3R+Ggw3
	 j84ufzIl/eoz2Qut2g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from N8016W05.fritz.box ([109.250.32.146]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MWRVh-1wDsA23Ufj-00J53l; Sat, 21
 Feb 2026 15:24:38 +0100
Date: Sat, 21 Feb 2026 15:24:35 +0100 (CET)
From: Marc Dietrich <marvin24@gmx.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: Thierry Reding <thierry.reding@gmail.com>, Arnd Bergmann <arnd@kernel.org>, 
    Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
    devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: tegra: paz00: configure WiFi rfkill switch through
 device tree
In-Reply-To: <82f24afb-1fd2-bfc9-2215-4526aff372ba@gmx.de>
Message-ID: <07c024a6-d2f9-5805-4ae7-cbc89cda53bf@gmx.de>
References: <aY_BpRQmLdqOOW2K@google.com> <82f24afb-1fd2-bfc9-2215-4526aff372ba@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:9xBt4YMS+6XTZHwMMvxb9JV14txIfE2NlvbDl7MAJPYzGkSWm9N
 7yfQPP7/0xFpd5VCH8/rX435vNj+J0AzAoWw/v+fATnwewh5x9nKYGBErEP4CjIgwN4PMcW
 tfolYm4GWbxgmNWNEp7/IzahFxRK+FfNYDbV3gW8QXllKjmPIU25ugigtXHe/APjOHHlHtS
 68uy2UHcn1jBr6hiT8WEA==
UI-OutboundReport: notjunk:1;M01:P0:WLzckopqBok=;sXYJ1OBsZ4Ljgd14f+QnCPscOwq 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 8n1mZDDU4+qLNnKl9WBNPP24xyHgp
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_142448_070972_AEEC19AB 
X-CRM114-Status: GOOD (  16.76  )
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

Hi Dmitry,

On Sat, 14 Feb 2026, Marc Dietrich wrote:

> Hi Dmitry,
>
> On Fri, 13 Feb 2026, Dmitry Torokhov wrote:
>
>> As of d64c732dfc9e ("net: rfkill: gpio: add DT support") rfkill-gpio
>> device can be instantiated via device tree.
>>=20
>> Add the declaration there and drop board-paz00.c file and relevant
>> Makefile fragments.
>>=20
>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> ---
>>=20
>> This is not tested on real hardware, compile tested only...
>>=20
>> arch/arm/boot/dts/nvidia/tegra20-paz00.dts |  8 ++++
>> arch/arm/mach-tegra/Makefile               |  2 -
>> arch/arm/mach-tegra/board-paz00.c          | 56 ----------------------
>> arch/arm/mach-tegra/board.h                |  2 -
>> arch/arm/mach-tegra/tegra.c                |  4 --
>> 5 files changed, 8 insertions(+), 64 deletions(-)
>>=20
>> diff --git a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts=20
>> b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
>> index 1408e1e00759..d1093ad569e6 100644
>> --- a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
>> +++ b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
>> @@ -706,6 +706,14 @@ vdd_pnl_reg: regulator-3v0 {
>> 		enable-active-high;
>> 	};
>>=20
>> +	rfkill {
>> +		compatible =3D "rfkill-gpio";
>> +		label =3D "wifi_rfkill";
>> +		radio-type =3D "wlan";
>> +		reset-gpios =3D <&gpio TEGRA_GPIO(D, 1) GPIO_ACTIVE_HIGH>;
>
> I guess this can be removed, as it should trigger the LED, which is alre=
ady=20
> included elsewhere ....
>
>> +		shutdown-gpios =3D <&gpio TEGRA_GPIO(K, 5) GPIO_ACTIVE_HIGH>;
>> +	};
>> +
>> 	sound {
>> 		compatible =3D "nvidia,tegra-audio-alc5632-paz00",
>> 			"nvidia,tegra-audio-alc5632";
>
> I'll give it a try and report back.

rfkill (and LED) works as expected. With the reset-gpio line mentioned=20
above removed, you can add my Tested-By.

Thanks!

Marc


