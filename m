Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8728C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 10:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvH7kPRqDnGEpR7MN/c0OEfUDsiKTUq2RFU3G+hwaFA=; b=aVGUxxTKDL+7mvKz+IPAmf5Pl9
	7E+kCT1xxn7gqexDY/S/EEeAbvD5xyEHp/GMkdxeFLiBCi/t6Ucss+7gTdllbbqzKuaVm+KBk6WLO
	jx1mObfn9FSUcQs/iUMfSR0ejJUrNHxH33+0r4yY2TjcA2ruaVm1pFSnVgi3ahxFq37Bf3O7r5LO9
	pv3NccjlO2oqjDMSUoneNoL4zUCZDUE3TpYGk3acq89BJKvErzoq7xU24B8RYFhD56kVTJTpVx/Bj
	roNLproIkQ26TbbJPuc49sJfaGEwtqrt/2hpcUS6DIgeZzDdXSjLGJn4WLz4GbSrsHpVxOYglzyJP
	gA7FXJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdS5J-00000008ew3-1ck3;
	Thu, 30 Jan 2025 10:47:45 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdS40-00000008epK-1ETa;
	Thu, 30 Jan 2025 10:46:25 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5da135d3162so936582a12.3;
        Thu, 30 Jan 2025 02:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738233982; x=1738838782; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvH7kPRqDnGEpR7MN/c0OEfUDsiKTUq2RFU3G+hwaFA=;
        b=W2fi5/zv/txQVs56QbEtVO6t39SzVbfZ/aqInuyhkR+ZaHe4pphpn9rKb7wNyJFRLX
         BEkNNzIC2AfJ7JEeeQpwlIxUgbvLEUDRAV/qxW+UqkqEbGJ5QVWRZW1WmYuZu+DEhpfo
         8ZHMlo2VmAmttjYh0R8a3qAFHC1JKomOUHuHCpVTUxteqWAUxyHoO8RziuMDyJGkqfO7
         crUoX9J01irgMI8wKYGAwPlwgtaifLrEl0qncMgzezazcJ7aHL66JbbS0lBP8S3Och1o
         v3wsX2cYIK/YBprXcfRQrUk7zzr5TU5nDlsgg9et+oRSimT5sbyrZNwQnozQ4B4gJpJG
         WEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738233982; x=1738838782;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvH7kPRqDnGEpR7MN/c0OEfUDsiKTUq2RFU3G+hwaFA=;
        b=nKRxFg3fcOTuv1XDBryAqoqVTE7imr1l3NLZySmIesvu+vHOuuLB/B8utn3D7MrTz1
         U2CyqQtkxVzsvVTs41tgCkTzrj8c0TaiMlrhXQAF/ZVHry8gXjslUOMbvqWKlRiOnrl5
         duhxyXFKJODAbvCrPBwOV6k4wKUutJPsej/Po50lXTCwjDe/9NFzXagBwZLZZiO8Bbm9
         N53asIJajzm2cCWqyw+I+M3Fqa2B2HUJyJ258tAM4bqLKy64SiR7BoGddevvAxGtM8d7
         d/4VGna5A6I+KSuaLtYbF3gZdXDE0ns2WiXlqv3S7/m407pqjiBDObf3QZU97kCUuq3D
         XOaA==
X-Forwarded-Encrypted: i=1; AJvYcCW9/OzA0YH2zkdROqsfXPh7xdPTHqEkWGe2kdjyAyoXm6SuAa9/1EYYGqa6MoQjV+YBBR1FkDbtDsrdEvv1faQ=@lists.infradead.org, AJvYcCW9CaOZSc1ah71fG0n4MuWi6I0T31hX374oSpgvE4qTPzyTr+G/zeDnXDuSFBt5Cs8Sxu1RhiAwO2s6QN2mAdEQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7VNeMdJG6itEB7e4GATyC0/QNEeihm5uJjn795qK1BEuo2K3f
	SnXN3cmrcnGKJgGMS1XrboCi9ajGUsL24c5kgrhxMqWIGkardXHe
X-Gm-Gg: ASbGncvf6giVeKuumNHb/H1Hma3a3fSTdt/Cx8TZ5GJlJ5y1gTGQNOfUSZBg3T+m4/m
	9ikSCmUgtTk5EEgrsIVYKo2Avq+etlbpyqY3hmn5UOWQVHZPucbYp7jhZa9VhZEUw7IJc5W0WjW
	ZFokAontHRagBkzGaztwrCJdo0rxaN7tISR1fOdcdl9SMWFdP69k8BkNeDunAl8WR7vKOV6z0xN
	0iDCAj8RdCvmL8xs8p7h0eDKgSxscGIHrwosjeiG0CrE3wKmkRkjEY7t2DDburEm43bFauFRfnl
	hHcF0VmJgU30F9rRd5BMFwpzuYbiePVT3JsY2cuZdw8RYFogWnXnKx9PonBfiDZK09Hc000t
X-Google-Smtp-Source: AGHT+IEqE7nySufMnirHCjAVfxj7jngqk9FZNYT/ymSENzVPV3ZLZzx1oB1e3XlK0q5RDTVUp4kFhg==
X-Received: by 2002:a05:6402:50ca:b0:5d0:b2c8:8d04 with SMTP id 4fb4d7f45d1cf-5dc5efcab34mr5837467a12.18.1738233982119;
        Thu, 30 Jan 2025 02:46:22 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc725aae6esm854530a12.1.2025.01.30.02.46.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2025 02:46:21 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <8541055.T7Z3S40VBb@trenzalore>
Date: Thu, 30 Jan 2025 11:46:09 +0100
Cc: linux-kernel@vger.kernel.org,
 Diederik de Haas <didi.debian@cknow.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>,
 Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <278CF0E0-7277-40F3-942C-6FA61AA759A0@gmail.com>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <5969581.LvFx2qVVIh@arisu> <CE4343FE-94AA-4F84-8C43-8366013AED84@gmail.com>
 <8541055.T7Z3S40VBb@trenzalore>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_024624_354257_AA0BA075 
X-CRM114-Status: GOOD (  18.89  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova =
<detlev.casanova@collabora.com> w dniu 29 sty 2025, o godz. 17:50:
>=20
> Hi Piotr,
>=20
> On Wednesday, 29 January 2025 09:48:51 EST Piotr Oniszczuk wrote:
>=20
> I suppose you tested with my hevc branch, which is not really ready =
yet (Some=20
> ref frames will work but usually, it won't) Can you confirm which =
branch/commit=20
> you based your tests on ?

Indeed  - i=E2=80=99m using your rkvdec2 hevc code from: =
https://gitlab.collabora.com/detlev/linux/-/commits/add-rkvdec2-driver-hev=
c with iommu from =
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/com=
mit/bc47c445bfd9586115e9bcf5f231c5a5c5f0f828
and =
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/com=
mit/9a9fd791513bc0d02c2242c88f23b41bd47de30a
=20

>=20
> For the iommu, do you see those errors like that only on 356x or also =
on 3588=20
> ?

3588 has no any iommu errors.=20
I see iommu errors only on 356x
=20

> The hevc branch should have the iommu patches to fix that kind of =
things.

I=E2=80=99m using:
=
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/com=
mit/bc47c445bfd9586115e9bcf5f231c5a5c5f0f828
=
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/com=
mit/9a9fd791513bc0d02c2242c88f23b41bd47de30a

I see there is: =
https://gitlab.collabora.com/detlev/linux/-/commits/add-rkvdec2-driver-iom=
mu
Let me update iommu code to above branch and report back here how it =
goes in 3588 and 356x


>=20
> (but note that hevc support is really new, so it may have bugs with =
buffer=20
> allocations)

It is already great work.
I=E2=80=99m awaiting for hevc in 35xx during last 2+ years :-) =20

>=20
>> If anybody hints me for way/tool to analyse of playing/failing =
samples to
>> catch: what encoding specifics makes given sample failing to decode  =
on
>> rkvdec2 - i'll be more that happy to provide details=E2=80=A6 (doing =
simple
>> mediainfo <file> shows no differences for me=E2=80=A6)
>=20
> Few features are supported for HEVC as of now:
> - No scanlist support (only default 16x16 blocks will work)
> - Long term reference frames are also not configured yet.
> - hevc 10 bits is also not supported yet
>=20
> These are specific to the encoding and mediainfo won't really give you=20=

> information on that, except maybe on the 10 bits format.
>=20
> You can also checkout YUView (https://github.com/IENT/YUView) to get=20=

> information on media files structure, but I have had issues with HEVC =
support=20
> lately.

oh great. will do and report!


