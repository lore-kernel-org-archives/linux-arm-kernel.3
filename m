Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78385C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbp4EtOkuC+0iVMNyfHjqvPw/lKMjNnZSdESNc6UztA=; b=gi4A3QSv94z/apSH/i3E6Cy1x/
	TUzKvxMCKzG0Nd1cKBBJRla/1jw5BBQUuK+pPRpNetWcYRbEnoKZ94gzKvt6vI9d+GCWv/XQsyu07
	8Vf1oZWQWM5TfG4BwvVKiNzmQI88tkU9MlkTe+i5tWi298jPZcVO2sEYGiN+Wqlh+obsdqyFmwe56
	acBo0T4mWWXCZGhXJC0FALakFEAeezy5NFzhOXmOwtpcx/9ZV8jEgaLy7X0dbYuIMRat1LQUPmKM5
	dFafI9yktd1ejyUU5zg2iChmgj7fix70vY7I10kR5kUeFDXr65ohsVQOYM0Btd1T5k0imtgqQO8o/
	9TubE1eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVxL-000000091f1-3kYj;
	Thu, 30 Jan 2025 14:55:47 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVw2-000000091VG-3uz5;
	Thu, 30 Jan 2025 14:54:28 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ab68d900c01so168455866b.0;
        Thu, 30 Jan 2025 06:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738248865; x=1738853665; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbp4EtOkuC+0iVMNyfHjqvPw/lKMjNnZSdESNc6UztA=;
        b=BrThh7VR/CGjTpkj53gliYLlb3K6plnw/OGhC0UY6/x4aI3TXoy6MVygC4lXqJnWdu
         1+ZGXrr9wdx5abpY/IK1aHH8WJGOi1Rt+f7t8guIT7GfHrpEkgjJDbSGe34OBtVfeiax
         JUSWfHfX8psyOQaM68gv6c8wMEJcFDJXkFyhAOJ21O7x9x4bV0HdgiPnSunZ+i0XQUiC
         DwjsCzt9xKJKcZy7mPsWafPfR2dZywZz9osTOHRuFuA7L9Cmt/NGABPUfqfYk2893LID
         U5sPkQ1a3jjF1d1t4Ch7LA29n+nWsoN4mhtO4tDQhst5dvxLgGc7aqa9qg0HLIeobj67
         WGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738248865; x=1738853665;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbp4EtOkuC+0iVMNyfHjqvPw/lKMjNnZSdESNc6UztA=;
        b=uoo3icRrgYQfDP5Kxvt5Iqg6RXxP5BMiPgdl4YdqXQ/2z9v+oV0bbtyxBm18R7Eb/O
         mSitfsxVFqSApvZaRRvH4QH1dcAIF1WFV5KACyAJuospJg7ZpGRMO99si8seMAu/AfwO
         HOjHlobM07MkH+3DO+ec7c3ZbJQHf8OKZdMLhLT/w1WA8TEVmrKDR4853a4m5t4bu1ef
         di7pWoL+vXE6yvsPBeNdGShPCtkt8pcAohhPNQ/71kpysHsKpZwfQr9lP2S9HKCXT+O6
         DSIkdemojMPQYhmfxHzYwaxPmY9fmprSLJN2bXES93VrS0MkpDabeAxEVHETdbZVETC5
         526Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3NICVqKAhaKyjgivg6fD64axbORXO0rRH9R2LEDl4lx6zSWuqC0iTUuC2hA+mHC9rCHhstcOLhduydqVf5Tfs@lists.infradead.org, AJvYcCXoVbHgabLVgS/jr8JJI2j7dbZ9tHGda4q1Rf3sUh3GTHj9nohXAQvxI8dror2U3u7TtgRJjyeuBb7P0OYoR+w=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdxUa009oloTb6eElBOmnV2JzVUXONMxS2r0UMOPdO9ZuT/QhN
	7is+v5NHkYp7ywmFV4vX+BB6/natphiixxmJpCopWJIEhVXF09EQ
X-Gm-Gg: ASbGncsm7GG+1mWnLznNTq2to7w8e6DSYvJNbG0rjP9dy19v/bV4BZVYRqW31kdg/96
	6ZU1zEmX3O6I2Ha6XxPjV+NqyQzdfUYatEqi9bRiGFpMS2UlcMcN9lLLnoQlANVM77Tmr5hP2BR
	LmyuInkXhOaG+RuBG6J4FbS6QJoSTwJAfroIQoNhWkCNM3q8CY4GF61aHI3qVQsMs1MmoZ2P5z7
	LPrkOZXlJC1CcASI1PTw6GK9y/YqzeOAHdSPJ1Z1ZowAR0FU8JxN+SgB6W2YnkNeZzYm0v0A5Id
	wyfESkTbBMDZGYV1wWipxeB7WqSnoIgBdlmqpDT/Dp0L90YXoX4c8oUJOMIS/Rd1foGANgOY
X-Google-Smtp-Source: AGHT+IEscLo+ZglJ4iQ8yhcikhYDyTBbGC16YkQrOwamLjmGj9mpYIbrbWr8u+H0RMfLebwCb6ojRw==
X-Received: by 2002:a17:907:1c13:b0:ab6:8bb8:af2e with SMTP id a640c23a62f3a-ab6e0cc500cmr358429766b.26.1738248864471;
        Thu, 30 Jan 2025 06:54:24 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a2fe78sm129297166b.125.2025.01.30.06.54.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2025 06:54:24 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <278CF0E0-7277-40F3-942C-6FA61AA759A0@gmail.com>
Date: Thu, 30 Jan 2025 15:54:10 +0100
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
Message-Id: <B8B4C7CF-B2C4-48CE-84AD-52DF6002D17B@gmail.com>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <5969581.LvFx2qVVIh@arisu> <CE4343FE-94AA-4F84-8C43-8366013AED84@gmail.com>
 <8541055.T7Z3S40VBb@trenzalore>
 <278CF0E0-7277-40F3-942C-6FA61AA759A0@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_065426_973971_DFDDF088 
X-CRM114-Status: GOOD (  10.80  )
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

Update to my last email:=20

> Wiadomo=C5=9B=C4=87 napisana przez Piotr Oniszczuk =
<piotr.oniszczuk@gmail.com> w dniu 30 sty 2025, o godz. 11:46:
>=20
>=20
> I=E2=80=99m using:
> =
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/com=
mit/bc47c445bfd9586115e9bcf5f231c5a5c5f0f828
> =
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/com=
mit/9a9fd791513bc0d02c2242c88f23b41bd47de30a
>=20
> I see there is: =
https://gitlab.collabora.com/detlev/linux/-/commits/add-rkvdec2-driver-iom=
mu
> Let me update iommu code to above branch and report back here how it =
goes in 3588 and 356x

I updated to =
https://gitlab.collabora.com/detlev/linux/-/commits/add-rkvdec2-driver-iom=
mu and basically i see no change (the same iommu errors on 356x; 3588 =
all clean)  =20

>=20
>=20
>>=20
>> You can also checkout YUView (https://github.com/IENT/YUView) to get=20=

>> information on media files structure, but I have had issues with HEVC =
support=20
>> lately.
>=20
> oh great. will do and report!
>=20

Huh - here in need to switch to Linux as on maxOS i have issue with =
ffmpeg ver. mismatch in YUView
Will report next days=E2=80=A6.
=20

