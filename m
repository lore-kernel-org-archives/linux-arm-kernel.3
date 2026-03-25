Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33ED109E52E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 23:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6yzGlttx+NXjSJf4aCL4qCZ2swewO2eS0YxkN2Iuaw=; b=ttI19izqyeT1G7943EJ6l4UR2g
	T9vpRNh4eGpRTEPSsVVgyX0dgDyzOOmm/OcyrvD7ztN22g+Lc4t3/uvcEd1Kc6fyIBRCa1nqlkIhr
	xOB7ZqNZVru3hL7tYf5YRCJVUBNP9fJYar/dFqttWX7pX94igBpcQqqI9N168uA0r0CGkk9IMjjG5
	d8ythwNVnqImKa+3jyGrwen2jDzDC/k026RgdFI+u7tyBFagz4gQxTq8tf+xhZOO+69a1KFpZKJfI
	JnASS0XoVZWTpFsfv3T8A34WR0TMhTiYlwiA7WUcNcTbXezeTTohkTPRIu3awU8V2LgqZUvzoQxDX
	d6fcuS2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5XrH-00000004Rnv-3m9h;
	Wed, 25 Mar 2026 23:41:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5XrG-00000004RnS-0FUx;
	Wed, 25 Mar 2026 23:41:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=b6yzGlttx+NXjSJf4aCL4qCZ2swewO2eS0YxkN2Iuaw=; b=M5lZcw4fBkUFqRe1eIpe6LvRwA
	2ouXek52MBk/ibhN25yL4S394q/dCCjdw5Hs0EC13tfh7Irkc3ywd9nE4TCjFB9MYCYcEeOSDZ+qa
	5eGiZ0Z+J3a3PSFRg24Tt98Nq7rpBx77Nu9SstJPtbAs+RDp4rsQ+Yl8qffT1Y7+CBZ9mCK0o21MR
	4a8867X60jSEyOU5VUrxccGzTkxTQHi3StFomFYvQOVocQePOqtsCF60R2ZULlGPJSbJpkeO/6mMr
	/5YQ4+LSO8TGOWyV+EMc9IqN2rFfN9vEbxSprZjKqyyfdeWSQlHW8O7hAyTkpbyfL1jJXrfAOMiee
	qJVZgqlQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Pedro Alves <pta2002@pta2002.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] arm64: dts: rockchip: configure hdmirx in Rock 5 ITX
Date: Thu, 26 Mar 2026 00:41:49 +0100
Message-ID: <23047464.EfDdHjke4D@phil>
In-Reply-To: <1331010f-1446-4892-9d81-2f18b60f6977@pta2002.com>
References: <20260323-radxa-r5-itx-hdmirx-v2-1-c52501909577@pta2002.com>
 <3407927.44csPzL39Z@phil> <1331010f-1446-4892-9d81-2f18b60f6977@pta2002.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_164154_102960_B41D98A9 
X-CRM114-Status: GOOD (  23.89  )
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

Hi Pedro,

Am Mittwoch, 25. M=C3=A4rz 2026, 15:24:45 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Pedro Alves:
> Hi,
>=20
> On 24/03/2026 14:18, Heiko Stuebner wrote:
> > Am Montag, 23. M=C3=A4rz 2026, 10:25:33 Mitteleurop=C3=A4ische Normalze=
it schrieb Pedro Alves:
> >> +&hdmi_receiver {
> >> +	pinctrl-0 =3D <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim=
1_rx_sda &hdmirx_det>;
> >> +	pinctrl-names =3D "default";
> >> +	hpd-gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
> >=20
> > as said before, please also add a pinctrl setting for this pin.
> >=20
> > gpio1_c6 is not part of the main hdmirx set of pins, hence needs an
> > additional pinctrl entry to configure it as gpio and possibly set any
> > additional pull settings.
> >=20
> > And yes the pinctrl-driver does "implcitly" set the gpio-mode when
> > a gpio is requested, but our more modern approach is to always have
> > a real pinctrl entry even for gpios.
>=20
> I am probably getting confused by what you are asking here, but I don't
> understand what exactly I should add. There was already a pinctrl for
> hdmirx_det (which is what the gpio1_c6 pin is) present in the file,
> hence why I did not add it in this patch:
>=20
> &pinctrl {
> 	/* ... */
> 	hdmirx {
> 		hdmirx_det: hdmirx-det {
> 			rockchip,pins =3D <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
> 		};
> 	};
> 	/* ... */
> };
>=20
> Looking at the other boards, they do the same thing, but they call it
> hdmirx-5v-detection instead, but as discussed in v1 of this patch I
> ended up keeping the det naming to match the schematics.
>=20
> Sorry if I am missing something, I don't have much experience with this,
> so I would really appreciate some extra information.

You didn't miss anything - I did :-) .

Not finding an addition to the pinctrl definitions in the patch
I misread the &hdmirx-det reference as the one defined in the core
rk3588-base-pinctrl, not realizing that the rock5-itx one was
already existing in the rock5-itx dts already.


Sorry about confusing you
Heiko



