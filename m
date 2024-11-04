Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40F4D1BDC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 16:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGXE4eDYjk2lR2ubbk00XXdKNVfRlNdbyZKN2+XEphI=; b=NSHItH9sDjU9RbVLUDLwUThLEH
	+5JLRjH9Xld/t2NkrnUKMof+KVVe+ZWfiqHiaaRriZ6uuYF4Jv/D2Z4oF7IJykead6aTnopDBHnfy
	BHtFcyEmn3logid2QpuYtCXQjD0NfumcFUdPJ7dzJbr+95PvJTtMYELQIcS7abzxhAx8dlfp88oA8
	dmS+E52xAPpMB2Nfsbc7pf0Afx/3YD/JXznhRhridwK2jaynZTkybNkHCdeCjwcdHrg8GI6hkDldB
	74nNTEiLNlX+0kkDCHkauotq6z/Tf+0/oUe+SDgNuyJIA1Im4HZytAFeeLsL4fPGOQl2APKuHmlXn
	Ecm8ACaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zef-0000000EKmz-014a;
	Mon, 04 Nov 2024 16:10:13 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zaF-0000000EK0H-3hzq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 16:05:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6E2460006;
	Mon,  4 Nov 2024 16:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730736335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bGXE4eDYjk2lR2ubbk00XXdKNVfRlNdbyZKN2+XEphI=;
	b=oWBrESDjrkJ+vex81zeexplceHDPwXDVOl6tJO1sOBfkZdIDzT7P+MMRlsRP9DbqB1hrSg
	Og3p5pVD7P1CtF7HDKs7Cf1Tey7iOj3vUaEr8cqMOXC4SkkKPp0Oeft+MWR+Ixmhs7BZv8
	Y3WvpiXl9jyw7LnvZj80kF//6X6izUlkrewdxYzwnTGeEnfoNp/gKC6POszbZRLpOnzu6h
	UvJYpqGa3LAlBke1UZic4dHZrV2joV6cRTjSBgKMTD80KAlurBItXgQ6nvYwuZYjfDurhJ
	KbHc3ZLihnhXfUYtjU6DT9jf9M4cp1yz5WltPqtSZQpTyMWsGFLXH5oAnNrO6A==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rob Herring <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: marvell: kirkwood: Fix at24 EEPROM node name
In-Reply-To: <CAL_JsqLLRSEaDv=Zm_LQH9cpgH2prh21+cmovgSR=pzQTuRtZQ@mail.gmail.com>
References: <20240910215914.823546-1-robh@kernel.org>
 <CAL_JsqLLRSEaDv=Zm_LQH9cpgH2prh21+cmovgSR=pzQTuRtZQ@mail.gmail.com>
Date: Mon, 04 Nov 2024 17:05:34 +0100
Message-ID: <878qtz9e7l.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_080540_082047_F35E47BC 
X-CRM114-Status: GOOD (  11.39  )
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

Hello Rob,

> On Tue, Sep 10, 2024 at 4:59=E2=80=AFPM Rob Herring (Arm) <robh@kernel.or=
g> wrote:
>>
>> at24.yaml defines the node name for at24 EEPROMs as 'eeprom'.
>>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>> ---
>>  arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Ping!
>
> Are Marvell platforms still maintained?

Actually I just applied it this morning, and was about to notify about
it.

Applied on mvebu/dt

Thanks,

Gregory

>
>>
>> diff --git a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts b/arch=
/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts
>> index 9c438f10f737..2bc4b68bd723 100644
>> --- a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts
>> +++ b/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts
>> @@ -44,7 +44,7 @@ sata@80000 {
>>                 i2c@11100 {
>>                         status =3D "okay";
>>
>> -                       s24c02: s24c02@50 {
>> +                       s24c02: eeprom@50 {
>>                                 compatible =3D "atmel,24c02";
>>                                 reg =3D <0x50>;
>>                         };
>> --
>> 2.45.2
>>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

