Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EF3C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3UErYnrVYZ1g9kUUb3a1dfR1/w+hPH2Q/0/oF/UJJM=; b=nh1gWNQJo4/QfCjpiQWkXuGqoz
	uXhjuqqO23qZDUC159fu4uZ7frkH0gvMl7W8v1i6MFDM/Z9l/rvEOvr3vtlxYd/hVJSgBmmnbb+RS
	z+o/bn5FexKzrC841qLC9uXLaEg8bAX6tgspHt2wFETYdzfZmYuH8Uip61WDYd24JdRF4+AuSRXpD
	/WcWaAAYvzTMaTp0he4gf2M8jByCn3Mxqcw1ur1cbVpZsbBHURVWnrRXdo8T3Q8S/rk45ONFmwlGL
	hBJwPoqEnKDL8UyVUa7Bj+4vmOUoQoMy9dAqxZATmOfYptDAnNPreQm2o8QLuEp2JsbkXzONZd+gg
	d5XVzusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrb9-00000004HcY-2Odu;
	Tue, 24 Jun 2025 00:33:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uToXW-00000003zkn-2egI;
	Mon, 23 Jun 2025 21:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=U3UErYnrVYZ1g9kUUb3a1dfR1/w+hPH2Q/0/oF/UJJM=; b=NBBdcAa17Q+xwBYcEk2T6MBbry
	w7IWwueFxcfmjTlpHwOGRhXYx5Fuy0Z+BbUbgg9Va1yENMiAG2uL4ZAFmI+LKgJ+qMR9O+Rj+DMnM
	Mf6QJ+ALWgWZxJL4mGvlqr+tVfF3BKK3cgqEO6LzZI+CDS1eSTU5cC12HQJpqCwRRPQihZJCcGQui
	/fNd/rcdv0yWaazQDq9y4npbIarXGCzCMf+996ZwLU1wH0rpbucuPRZ30hdnZoE2y3j56zr0bMGiq
	8+7rqqKvZUQR5xEbiDf5zgOdHekB+imCHSnFp81KD5lQJE4FZmUu6UHVyfSzKbdzxpQTYftX/b7Mh
	Sty6zhGw==;
Received: from [185.15.108.45] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uToXM-0006NM-Cv; Mon, 23 Jun 2025 23:17:08 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>,
 Alexey Charkov <alchark@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 XiaoDong Huang <derrick.huang@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
Date: Mon, 23 Jun 2025 23:17:06 +0200
Message-ID: <12692993.O9o76ZdvQC@phil>
In-Reply-To: <90b7a1b6-bc49-414d-9cde-e6fad46d2650@kwiboo.se>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <dd1d0676-4eaa-4df7-b557-676b3de9a52e@kwiboo.se>
 <90b7a1b6-bc49-414d-9cde-e6fad46d2650@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_141718_688693_21670710 
X-CRM114-Status: GOOD (  22.35  )
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

Am Montag, 23. Juni 2025, 23:07:53 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Jonas Karlman:
> On 2025-06-23 19:40, Jonas Karlman wrote:
> > On 2025-06-23 17:02, Piotr Oniszczuk wrote:
> >>
> >>
> >>> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com>=
 w dniu 23 cze 2025, o godz. 15:58:
> >>>
> >>> On Mon, Jun 23, 2025 at 1:19=E2=80=AFPM Alexey Charkov <alchark@gmail=
=2Ecom> wrote:
> >>>>
> >>>>
> >>>
> >>> Okay, I've bisected this.
> >>>
> >>> TLDR: Linux and u-boot seem to have nothing to do with it, opensource
> >>> TF-A doesn't work, binary BL31 starting with v1.09 do not work. BL31
> >>> v1.08 and earlier work fine.
> >=20
> > v1.09 added support for 1 GHz hrtimer in addition to the normal 24 MHz
> > rate. Mainline U-Boot may only support use of 24 MHz hrtimer, unsure
> > what impact the hrtimer rate has. Mixing blobs with/without 1 GHz
> > support is known to cause issues. At one point the latest rkbin tree may
> > have contained incompatible rk3576 blobs (mixed 1 ghz vs 24 mhz rate).
>=20
> Clarification:
> Following boot1 parameter activates use of 1 GHz hrtimer, see [3].
>=20
> This parameter was added to rkbin repo before all blobs was updated to
> fully support use of the 1 ghz mode, and is the source for incompatible
> blobs I referenced above.
>=20
>   [BOOT1_PARAM]
>   WORD_2=3D0x100

which I guess is something we don't do in u-boot at all right now?
Which would also mean, that something may have broken with the 24MHz mode
when the 1GHz thing was added. And nobody ever realized that because the
Rockchip thing uses that boot param for all of them?


>=20
> [3] https://github.com/rockchip-linux/rkbin/commit/cbbc6868221fb416d4f0d8=
6a10e493dbbbc1f117
>=20
> Regards,
> Jonas
>=20
> >=20
> > Did you try with newer blobs, i.e. ddr init v1.09, bl31 v1.19 blobs [1]
> > and mainline U-Boot [2] ?
> >=20
> > [1] https://github.com/radxa/rkbin/commits/develop-v2025.04/
> > [2] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/=
rk3576
> >=20
> > Regards,
> > Jonas
> >=20
> >>
> >>
> >> just fyi:=20
> >> to confirm: replacing only bl31 to 1.08 makes all good
> >> with perf gov. clocks staying on 2200/2300
> >> clock estimations are predictable, constant and estimating constantly =
2400
> >> ux is =E2=80=9Elike=E2=80=9D on 3588
> >>
> >> Alexey: many thx for finding root cause component!
> >>  =20
> >>   =20
> >=20
>=20
>=20





