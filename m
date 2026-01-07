Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B313ECFD648
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOJKf63ci0E2lOe7oWIa3IAL+UO+d20xkV6A9YbWmpE=; b=FNSEzV+u6h/1UaNOPnCZ0hIPAh
	gwoQfaCCMsKz+Xf0F17+M1gT5VmeBMh+0rT7KB+UgJuoif4b5af6DCMezpiLtCMQp2+T+BZsryc5P
	1Ss8QUhIIplofiRZtQbpAKR9mJQzzNAez3RQDoMsTS+hgfX++IVPduBEDKZ297F2wfGMTubl9E5Pa
	+1frh2ops4zqH0DMdjp/v0M7lIZJM1KFjuTwI6qE26yxMQIG35bZqt0O5L0OhHC4FMDUMoQBUEbbK
	PgTrm9T+Zl3SBjVcipWTI/D6GwXyF95RxWfEJzYy5Ia32X7MwGTFvoavpG5EWCgRHA9CMZbYBedxd
	uKwfVkiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUxo-0000000F8Wt-2Tij;
	Wed, 07 Jan 2026 14:56:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUxm-0000000F8W4-2LqA;
	Wed, 07 Jan 2026 14:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=hOJKf63ci0E2lOe7oWIa3IAL+UO+d20xkV6A9YbWmpE=; b=yB/rgB+5GKbzLTz+D1ec0L1Hxx
	iIrnYXxjDvUdlw4FhLC7p9ZIXz/zlKvKciuBK/xtj/5zqYgOLmEHgwMC+i/CQ+ArmmmPcJIhBb1ZH
	GsD5zmsfjsY2aes5ZaiYwcO6pcerokwY9Epd4iKfPxeDVGbbJpDpb4gDFgdfyOJbjaUu2Bugk9Llb
	bxvCPmlfmhNowbFvHXOn1YuLRoWOr5zkLVZ2mCBevaZpzbseGJPpYQM1pVhnQwdIqrglUOAW4hPGd
	VonhyPv5MJVJ3eJe0c+3rYtI+HJGjOa7B375+xBu3qzSrg6Ae4f7zr0hhTOlqTGt5C7a8sHDvIb7g
	jIy1qgzw==;
Received: from i53875b57.versanet.de ([83.135.91.87] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vdUxb-001OK7-Jx; Wed, 07 Jan 2026 15:56:32 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chaoyi Chen <kernel@airkyi.com>, Alexey Charkov <alchark@gmail.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Kever Yang <kever.yang@rock-chips.com>, Jonas Karlman <jonas@kwiboo.se>,
 John Clark <inindev@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>,
 Jimmy Hon <honyuenkwun@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Michael Riesch <michael.riesch@collabora.com>,
 Peter Robinson <pbrobinson@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3576 evb2 board
Date: Wed, 07 Jan 2026 15:56:31 +0100
Message-ID: <1907895.QZUTf85G27@diego>
In-Reply-To: <1956308.1xdlsreqCQ@diego>
References: <20260107070322.323-1-kernel@airkyi.com>
 <daa61083-ddc6-4454-9bea-d4ea2a4a9d91@rock-chips.com>
 <1956308.1xdlsreqCQ@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_065642_600198_6814B2D6 
X-CRM114-Status: GOOD (  28.70  )
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

Am Mittwoch, 7. Januar 2026, 15:54:47 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Heiko St=C3=BCbner:
> Am Mittwoch, 7. Januar 2026, 11:04:42 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Chaoyi Chen:
> > On 1/7/2026 5:57 PM, Chaoyi Chen wrote:
> > > On 1/7/2026 4:21 PM, Heiko St=C3=BCbner wrote:
> > >> Am Mittwoch, 7. Januar 2026, 08:56:04 Mitteleurop=C3=A4ische Normalz=
eit schrieb Alexey Charkov:
> > >>> On Wed, Jan 7, 2026 at 11:04=E2=80=AFAM Chaoyi Chen <kernel@airkyi.=
com> wrote:
>=20
> [...]
>=20
> > >>>> +       vcc3v3_hubreset: vcc3v3-hubreset {
> > >>>> +               compatible =3D "regulator-fixed";
> > >>>> +               regulator-name =3D "vcc3v3_hubreset";
> > >>>> +               regulator-boot-on;
> > >>>> +               regulator-always-on;
> > >>>
> > >>> If this regulator supplies a soldered-on discrete hub and is requir=
ed
> > >>> to power it up, won't it be better to describe the hub in the device
> > >>> tree (see binding at [1]), make the regulator its supply, and perha=
ps
> > >>> drop the "regulator-boot-on/regulator-always-on" annotation here,
> > >>> letting the regulator core deal with its enabling instead?
> > >>>
> > >>> [1] https://github.com/torvalds/linux/blob/master/Documentation/dev=
icetree/bindings/usb/usb-device.yaml
> > >>
> > >> Yep, it would be nicer to it this way.
> > >> A live example can be found in the Rock 5 ITX [2]
> > >>
> > >> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/tree/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts#n1266
> > >=20
> > > Thank you for the great example. BTW the hub used here is CH344. It
> > > looks like we need to add a new binding :)
> > >
> >=20
> > Typo... It is WCH CH334.
>
> I don't think you need a new compatible at all :-)=20

Please ignore everything I wrote :-)

I just looked farther into the usb bindings.
So yes you'll probably need a binding for your hub.


Sorry about the noise
Heiko



> When you look at the usb-device.yaml linked above you'll the compatible
> already defined as a pattern:
>=20
>   compatible:
>     contains:
>       pattern: "^usb[0-9a-f]{1,4},[0-9a-f]{1,4}$"
>     description: Device nodes or combined nodes.
>       "usbVID,PID", where VID is the vendor id and PID the product id.
>       The textual representation of VID and PID shall be in lower case
>       hexadecimal with leading zeroes suppressed. The other compatible
>       strings from the above standard binding could also be used,
>       but a device adhering to this binding may leave out all except
>       for "usbVID,PID".
>=20
> Which will match everything VID + PID combination, so you just need
> to use the VID+PID from your hub.
>=20
>=20
> Heiko
>=20





