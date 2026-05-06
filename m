Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0EECD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pm0+Gh1N3CQZmo80V9svpnAeqF+PlXCFFDOgCkyNM1Q=; b=jUlRfkUOnIY9V0NR/r1cee2tJg
	P8SBcFpsavZHmAqM35G/yEMxW1Ix67CWKNIYOVFWg5/mI5c5S38rGNlcOTqbWpEtWZecRkmw1IU1j
	TeQzCEpzqr73U2mNRC4D4zpgzpHKsE0SoYJ7NSyrgy68TzUHn8xy9WNrq0po0iXZlBOlzzNAV91L0
	Dg/PXmioS2FiFdXE3IUyjAvTcSjFOA8/e+WhbIhSMjp4+wTE9Qw5NpuIWN7AXkQmiROt2g75+eEGm
	eFg+6pfPsPPOYba13cCgPkOo29khByehy71otWM8mF7sPdJlgfhIBqdJfR2Ao9sG3fq7COsCurSWm
	ETMB/urw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKd1a-000000012NX-22sX;
	Wed, 06 May 2026 14:14:54 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKd1X-000000012MC-3ViU;
	Wed, 06 May 2026 14:14:52 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.82])
	by APP-05 (Coremail) with SMTP id zQCowABH2AvSTPtpLvWNDw--.25404S2;
	Wed, 06 May 2026 22:14:42 +0800 (CST)
Message-ID: <4a43edb8c7ae3f96f77272db89ec6450ffa28876.camel@iscas.ac.cn>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8188-geralt: enable Wi-Fi
 card
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>, Hui
 Liu <hui.liu@mediatek.com>, 	linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Date: Wed, 06 May 2026 22:14:41 +0800
In-Reply-To: <CAGXv+5F6BSmqq5HEybuCSwt75LVzh5gvs2wQpqy3vgfLi60Dcg@mail.gmail.com>
References: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn>
	 <20260504072748.2580172-2-zhengxingda@iscas.ac.cn>
	 <CAGXv+5F6BSmqq5HEybuCSwt75LVzh5gvs2wQpqy3vgfLi60Dcg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: zQCowABH2AvSTPtpLvWNDw--.25404S2
X-Coremail-Antispam: 1UD129KBjvJXoW7try8Xw1Dtw4DWF47JrWfuFg_yoW8uFWxpr
	1ktFWUtryUGrs7JF45Xr17JFW5Ar1fJwn8Cr1xXFy8tr15Ar1jqr98Xr909w4UJr48Jw1F
	qr10vry7ur1UZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07j8KsUUUUUU=
X-Originating-IP: [112.94.100.82]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_071452_249317_42B62974 
X-CRM114-Status: GOOD (  22.51  )
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

=E5=9C=A8 2026-05-04=E4=B8=80=E7=9A=84 15:34 +0800=EF=BC=8CChen-Yu Tsai=E5=
=86=99=E9=81=93=EF=BC=9A
> Hi,
>=20
> On Mon, May 4, 2026 at 3:28=E2=80=AFPM Icenowy Zheng
> <zhengxingda@iscas.ac.cn> wrote:
> >=20
> > The mainline pcie-mediatek-gen3 driver does not have code managing
> > downstream device power / reset.
> >=20
> > As the Wi-Fi card on ciri is a fixed device, set the related
> > regulator
> > to always-on and use GPIO hog to set the status of its reset pin.
>=20
> The plan now is to model it as an M.2 E-key slot (even though the
> chip
> is actually soldered on the main board).

Interestingly I saw a "PCI_PWRCTRL_GENERIC" driver in 7.1, although it
does not support toggling #PERST now -- maybe this should be done and
used instead? (Well it looks like the driver had existed for some time,
but it was for "slots" previously)

Thanks,
Icenowy

>=20
> I have some of the patches ready, but I'm still working out the USB
> side of it.
>=20
>=20
> ChenYu
>=20
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > ---
> > =C2=A0arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 11 +++++++++++
> > =C2=A01 file changed, 11 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > index 8e423504ec052..c25780098103b 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > @@ -544,6 +544,11 @@ &mt6359codec {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mediatek,mic-type-2 =3D <2>;=
 /* DMIC */
> > =C2=A0};
> >=20
> > +&mt6359_vcn18_ldo_reg {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Used by WLAN */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regulator-always-on;
> > +};
> > +
> > =C2=A0&mt6359_vcore_buck_reg {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 regulator-always-on;
> > =C2=A0};
> > @@ -1145,6 +1150,12 @@ pins-en-pp3300-wlan {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 outpu=
t-low;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 };
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wlan-reset-hog {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 gpio-hog;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 gpios =3D <145 GPIO_ACTIVE_HIGH>;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 output-high;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
> > =C2=A0};
> >=20
> > =C2=A0&pmic {
> > --
> > 2.52.0
> >=20
> >=20


