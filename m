Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4750CC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 09:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sCKhaBsg8xUAooQ2UnBR99qEvYpdT0zIlTvlGHqxLsI=; b=vW4d/Gz14noLV+We/AX4dBEulC
	7o93YUzibdanCnKv8kXzMWsucIec9YLDJpDcELLy/QdVnH+u+rLZjEkgZV6Aw5+C6EqSNS5TwmElB
	9j54uRyjOgezCC0RlmckWEAd8GS6Zgjw8q4vAUqKVKZVcwwHRQKgfpwOVj03JsWEvCm7c8y5qiVEX
	0LQsJZ0ZT4EeGoJDAEBUP3HLaX4Idlv/PEfhptZ9E7kQi5dnugtb8ptDk/+i1rDzaWfdSW34GEiJX
	BM4LgKOdGAsUDlfraP/BD3lp2IEYUNTave4zF6AXOTigOedEUcOS1PWdg00nGz53tpCtDqDQ2FXp3
	Qv5HVxHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXSH-00000004caS-02Jb;
	Tue, 01 Jul 2025 09:39:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWyS-00000004Yfw-3Fn8;
	Tue, 01 Jul 2025 09:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:Subject
	:Cc:Message-Id:Date:Content-Type:Mime-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sCKhaBsg8xUAooQ2UnBR99qEvYpdT0zIlTvlGHqxLsI=; b=hkGLsjxCizzhbgbP1rKp+l8kel
	WQVPbouyAin+CyviswSrSEQzbsCuz7cNHh7ZZruemyauVZA8z5vjiDsyZu0ljrgCtkeiV33TVfCkI
	BHQoVfikUipGYN+zEHK9o8vlp6AsQ8pfsoP+blcBLd/jftYcnDHNnoZTceTptPMn7mNR4VKRpM8bB
	AooVLFs2z8PExwYDfUwvOdf7WLHtLmHk+5Cq8zx5aEHfv+GolRmy5Ztt71vHjoo/CjM6shgpOdBWB
	y3zyCq6BrgfdgETDkhMEmosNq20O0SevDo988i50/wFS1IirhgfgOYgA7NVQfmiUoMHzD7Dqf7GJ8
	hwQNiidA==;
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWyP-000000071Tx-1Pdh;
	Tue, 01 Jul 2025 09:08:19 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751360887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sCKhaBsg8xUAooQ2UnBR99qEvYpdT0zIlTvlGHqxLsI=;
	b=hwwkWF8SmOXJLw9wzALqdogqAoTe/5RQm7bPFyxQrcWnFMjdT2GuLKk21ZDWysMGviZ5f9
	bFW5nLhOSzTFNd/KKAgJys6NIt5GGPMzTN5ExlBdQ+ttoSfDQf813i2zfAhSjBy5T9S5nm
	29imL8mAXYjoMtwg6ieAmEp4bhhpPxmNV3e4mokzW0Q5uHpiToqxC+UdhwIeghoW2Rr5Yc
	MEgpH9jb0lb+sGuLV3r7uZu3Xe32CPkiZyHDzGbG2mp5HMb9juEXMXYXFjErEa7CJNckxS
	o2HuCpmNUldlDxBTa1/KBP1Tidc4c6apZEkK2BCsDZDzHI0/9eb/zNK1mHafGQ==
Content-Type: multipart/signed;
 boundary=b8323306f1bbbc5afcc52f8f8b6518b1db3b53e34623a0a8a033e4200c2d;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 01 Jul 2025 11:07:51 +0200
Message-Id: <DB0LM56C47LH.YYFY0ZGCVVKC@cknow.org>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <kernel@collabora.com>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: adjust dcin regulator on ROCK
 4D
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>, "Sebastian
 Reichel" <sebastian.reichel@collabora.com>
References: <20250630-rock4d-reg-usb-wifi-v1-0-1057f412d98c@collabora.com>
 <5acizoywvjolaffojiawqlzixiclrqzohuhq55lbsjm6yhhlwi@w2amqugl3ee2>
 <DB0KL629S4E4.3ENNM27XN3IYM@cknow.org> <5039013.31r3eYUQgx@workhorse>
In-Reply-To: <5039013.31r3eYUQgx@workhorse>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_100817_624322_587CE9C2 
X-CRM114-Status: GOOD (  25.21  )
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

--b8323306f1bbbc5afcc52f8f8b6518b1db3b53e34623a0a8a033e4200c2d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Jul 1, 2025 at 10:55 AM CEST, Nicolas Frattaroli wrote:
> On Tuesday, 1 July 2025 10:19:33 Central European Summer Time Diederik de=
 Haas wrote:
>> On Tue Jul 1, 2025 at 1:10 AM CEST, Sebastian Reichel wrote:
>> > On Mon, Jun 30, 2025 at 08:12:27PM +0200, Diederik de Haas wrote:
>> >> On Mon Jun 30, 2025 at 5:36 PM CEST, Nicolas Frattaroli wrote:
>> >> > The ROCK 4D's actual DC input is 5V, and the schematic names it as =
being
>> >> > 5V as well.
>> >> >
>> >> > Rename the regulator, and change the voltage it claims to be at.
>> >>=20
>> >> Shouldn't it have a fixes tag then? Providing 12V where 5V is expecte=
d
>> >> sounds problematic ;-)
>> >
>> > This is basically "just" documentation, as the DT just describes
>> > a fixed regulator (i.e. nothing software controllable). This just
>> > changes a number in sysfs :)
>> >
>> > Note, that the 5V DCIN is a USB-C port, which does not do any PD
>> > negotiation, but has the 5K1 resistors on the CC lines to "request"
>> > 5V. If for whatever reason a higher voltage is applied (which does
>> > not happen as long as the power is provided by anything remotely
>> > following the USB specifications) there also is an over-voltage
>> > protection chip. So it's not problematic :)
>>=20
>> I was worried about and wondered why I/we did NOT receive reports about
>> boards being fried. Good to know, thanks!
>>=20
>> > OTOH adding a Fixes tag does not hurt ;)
>
> to add to what Sebastian already said: I purposefully didn't include the
> Fixes: tag because there is no functional change here. I don't think
> cosmetic fixes are worth pulling into stable kernels unless they're a

Then I agree with you. I didn't realize it was not a functional change.
I guess I didn't (fully) understand the "just documentation" remark.

Cheers,
  Diederik

> dependency of a follow-up functional fix patch, which isn't the case
> right now. If such a functional fix patch does emerge, it can explicitly
> declare its dependence on this patch, or even have our robot overlords
> figure it out itself.
>
> In that sense, I do think a Fixes tag hurts, because it needlessly
> adds to the patch queue of the stable kernel people, and it's worth
> pointing out that while I claim this patch has no functional change,
> that's always predicated on the understanding that it does not
> unintentionally break anything. In this case the chance is essentially
> zero though, but I won't bother re-rolling this for that tag alone.
>
> Regards,
> Nicolas Frattaroli


--b8323306f1bbbc5afcc52f8f8b6518b1db3b53e34623a0a8a033e4200c2d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaGOlcAAKCRDXblvOeH7b
bhLJAP97JDpJXhGMfDQaNL37OzPukLBLbOqLs8V/lgGwI5aFpAEAhggtFpJ3o9PL
NRBJV2vUQPI7/xkFk0EFLqPv3aJFcAo=
=mOO0
-----END PGP SIGNATURE-----

--b8323306f1bbbc5afcc52f8f8b6518b1db3b53e34623a0a8a033e4200c2d--

