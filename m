Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44BCCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 09:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bBCEPU2/0tv/K9YmbIdh5G90E4fXWa6Xx5dfbkFTiY=; b=jUAVUeGjIbBPKUBmirO4iJcvHr
	qq75nQ85lqxtLcLnaWZH3grGo9f9+zSSU4jMUtnwlE3d4RqOxRzfFNnMDcezxZVUQ2yh5oA+Uc+dC
	egPjNhgtcr7Cb8BwHuPnuIIM3imu0BWyhS01+4UvRgbnzGr5s18vX3pPnRJTej3GowqTPo/cbODed
	yiDl0aJGrzYcZZNFI9MtvmgGnTXxSFrMxCUcHqnp3Uqqr8sWeat7wiWYRDixYHe+73TSpfAbLtqFT
	SnnOtTOusMD/Wdeh74g1ZYBA8347ciSMp2UeKxhxFq/3+JSTZgvJGr2jC+kcnABweY0P9TBFvF2OX
	eqaCf3Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXQQ-00000002NRY-1NZ9;
	Fri, 19 Sep 2025 09:29:06 +0000
Received: from mail1.nippynetworks.com ([91.220.24.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXQN-00000002NQY-0QYp;
	Fri, 19 Sep 2025 09:29:04 +0000
Received: from [192.168.8.153] (unknown [94.228.36.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ed@wildgooses.com)
	by mail1.nippynetworks.com (Postfix) with ESMTPSA id 4cSnJ75j6rzkd2v;
	Fri, 19 Sep 2025 10:28:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wildgooses.com;
	s=dkim; t=1758274139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/bBCEPU2/0tv/K9YmbIdh5G90E4fXWa6Xx5dfbkFTiY=;
	b=feONaI8Lw64SjaoDRMMiIvlGMwvLCFWYcp5EFABRsaS8yWkOIE3/uxBdPMBw+ds7phhE+u
	ILyaf27i9LOJdFQlkn02/HVKGg25a+4nn6RKmIG0wQIrPnPfw25MmbNo4kesaYOzxNnIlu
	+oIoDq8x2vqMfIeswxMTGhjx06poDfs=
Message-ID: <da24e503-cb43-45e7-99ff-38eab11a203b@wildgooses.com>
Date: Fri, 19 Sep 2025 10:28:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: correct uart mux for Radxa
 ZERO3
To: FUKAUMI Naoki <naoki@radxa.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250917114932.25994-1-lists@wildgooses.com>
 <FBB5B30DE8FEABD7+59ee6f48-2ad1-45dd-8cf1-8b58a03513a9@radxa.com>
 <adbc2396-d5f0-4dd6-a65e-0dd78a58b9a4@wildgooses.com>
 <2325560.3ZeAukHxDK@diego>
 <0DB47BC84E90B0E6+694b1274-4826-4ec1-9aa2-ca8aa790f61a@radxa.com>
From: Ed W <lists@wildgooses.com>
Content-Language: en-GB
In-Reply-To: <0DB47BC84E90B0E6+694b1274-4826-4ec1-9aa2-ca8aa790f61a@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_022903_335304_156607FE 
X-CRM114-Status: GOOD (  19.68  )
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

On 19/09/2025 00:57, FUKAUMI Naoki wrote:
> Hi Heiko, Ed,
>
> On 9/19/25 01:18, Heiko St=C3=BCbner wrote:
>> Am Donnerstag, 18. September 2025, 17:23:04 Mitteleurop=C3=A4ische Som=
merzeit schrieb Ed W:
>>> Personally, and I'm saying this as a user who is technical enough to =
fix the definitions, it
>>> took me
>>> quite a few days to figure out what was wrong with the definitions an=
d understand the intricate
>>> tree
>>> of dtsi includes, to finally figure out why I couldn't just do a "sta=
tus =3D "okay";" to enable the
>>> UARTs... (which is roughly what is shown in several radxa supplied ov=
erlays to enable uarts on
>>> various boards)
>>>
>>> So my vote would be to correctly define all the hardware for a given =
board. Then users can
>>> simply do
>>> a status=3D"okay" to enable and off they go.
>>
>> And I'd agree with that argument. Setting up the needed pinctrl settin=
gs
>> for the peripherals described in the device documentation
>> ( https://docs.radxa.com/en/zero/zero3/hardware-design/hardware-interf=
ace#gpio-interface )
>>
>> is the sensible thing to do. While keeping the peripherals itself disa=
bled
>> and for the user to decide which peripheral to enable.
>
> I'm not strongly opposed to this policy, but I thought if you're going =
to do this, you should do
> it for everything, not just UARTs.
>
> Best regards,
>
> --=20
> FUKAUMI Naoki
> Radxa Computer (Shenzhen) Co., Ltd.


I would most definitely be in favour of doing this for all peripherals! Y=
es please!

I have a selection of Zero 3W and E devices here. We are going to potenti=
ally use them in an OEM
capacity, and I might have some I2C devices to plug into them in the futu=
re, and for example would
like to get the I2C working on the pins (is it 2 and 4?). It will be at l=
east some weeks before I
can work on that, but if you want to offer some support to fixup at least=
 that device I won't decline!

Thanks for making these boards

Ed W


