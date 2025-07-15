Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D17C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 09:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dn9j9avwFidQxU2bCX0UIziQTEnB16DYh3Wd/7lUs1Q=; b=w1atgZH04/WcjoyobJnFobj8HK
	qmMgN5Euvq3R8YnrmMZno3+a7a3TIMDqe+bJrdBzxppX5t8afuXZ1IyECp7ORw57iG17b6bbnVLX6
	3v5psN9/YShNkG+ej6ODVWCnqpir8GBu53BuIGto4c0ZAPnCA7w5K0rwqnvcMTytXngbuIMJXECiy
	+mcaCbOoIfz47oUS6WTyjVWhC9XP43BuAbPihb2Kn8+9H2zChT+Jy4IhDPZmYH3bGixaSxx2FPWNH
	g54ImDmUP0p5D7zsdi7hPxI+x1F96udpvQIsrbOPUVp1HD9JaWd6xhk/2mWoOLVFftCKC5DfDJDd/
	Bh6tF0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbrs-00000004f3d-3E2I;
	Tue, 15 Jul 2025 09:22:32 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubb7r-00000004XPr-3Vdy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 08:35:01 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1752568494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dn9j9avwFidQxU2bCX0UIziQTEnB16DYh3Wd/7lUs1Q=;
	b=t9UsxVY6mXLFPCJpyr5YZ/a+GWum9nHB2cHNy+irWcyW8uPXld7KsWybnukiHlRBofOCVf
	w4AgPUuSUsTRsUrcZlP26RteB+xEZgFHE8yX12cnAb8g8mesnWWu7vKMXI8/T86OBOX+/E
	l8M5SdeVR+5IsGx07C6IzsYhKS9Sc6dTXFPAXQGJ1gz9/M47KnhGNBzm8HdFIIOuMbvl8V
	3dBDkvtZFiQDPpxh62HhrYFttoHOq/vhKSz63/okaXVh7vLtyByb8fNyhQjuJ0dba9Fb2k
	XAolqQq/V429pazWA1JEX78DbAR9B89oaUwjNQf1cWnwjF6hkzrvzg9PaqwlVw==
Content-Type: multipart/signed;
 boundary=31e8725035cdaae867651e5f629dfe5e1cdfa919bc8e4b5fe9769c11329a;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 15 Jul 2025 10:34:43 +0200
Message-Id: <DBCHOEMXSOZW.JRB0UTWSPG4J@cknow.org>
Cc: "Heiko Stuebner" <heiko@sntech.de>, "Kever Yang"
 <kever.yang@rock-chips.com>, "Hans Verkuil" <hverkuil@xs4all.nl>,
 <kernel@collabora.com>, "Dragan Simic" <dsimic@manjaro.org>, "Rob Herring"
 <robh@kernel.org>, "Yunke Cao" <yunkec@google.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, <linux-rockchip@lists.infradead.org>,
 "Ezequiel Garcia" <ezequiel@vanguardiasur.com.ar>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Frank Wang" <frank.wang@rock-chips.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Jianfeng Liu"
 <liujianfeng1994@gmail.com>, "Alexey Charkov" <alchark@gmail.com>, "Ricardo
 Ribalda" <ribalda@chromium.org>, "Andy Yan" <andy.yan@rock-chips.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Hans de Goede"
 <hansg@kernel.org>
Subject: Re: [PATCH 8/8] media: rkvdec: Unstage the driver
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Detlev Casanova" <detlev.casanova@collabora.com>,
 <linux-kernel@vger.kernel.org>
References: <20250623160722.55938-1-detlev.casanova@collabora.com>
 <20250623160722.55938-9-detlev.casanova@collabora.com>
In-Reply-To: <20250623160722.55938-9-detlev.casanova@collabora.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_013500_536160_8A73A5B0 
X-CRM114-Status: GOOD (  11.62  )
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

--31e8725035cdaae867651e5f629dfe5e1cdfa919bc8e4b5fe9769c11329a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Jun 23, 2025 at 6:07 PM CEST, Detlev Casanova wrote:
> The TODO list for unstaging being empty, the driver can now be moved to t=
he
> main media folder.
>
> Also add myself as maintainer.

I've tested this patch on a Rock64 (rk3328) and RockPro64 (rk3399) and
did not notice any regressions. And I no longer see this warning:

  rockchip_vdec: module is from the staging directory, the quality
  is unknown, you have been warned.

Tested-by: Diederik de Haas <didi.debian@cknow.org> # Rock64 + RockPro64

Cheers,
  Diederik

> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  MAINTAINERS                                               | 8 ++++++++
>  drivers/media/platform/rockchip/Kconfig                   | 1 +
>  drivers/media/platform/rockchip/Makefile                  | 1 +
>  .../media =3D> media/platform/rockchip}/rkvdec/Kconfig      | 0
>  .../media =3D> media/platform/rockchip}/rkvdec/Makefile     | 0
>  .../platform/rockchip}/rkvdec/rkvdec-h264.c               | 0
>  .../platform/rockchip}/rkvdec/rkvdec-regs.h               | 0
>  .../media =3D> media/platform/rockchip}/rkvdec/rkvdec-vp9.c | 0
>  .../media =3D> media/platform/rockchip}/rkvdec/rkvdec.c     | 0
>  .../media =3D> media/platform/rockchip}/rkvdec/rkvdec.h     | 0
>  drivers/staging/media/Kconfig                             | 2 --
>  drivers/staging/media/Makefile                            | 1 -
>  12 files changed, 10 insertions(+), 3 deletions(-)
>  rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/Kconf=
ig (100%)
>  rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/Makef=
ile (100%)
>  rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvde=
c-h264.c (100%)
>  rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvde=
c-regs.h (100%)
>  rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvde=
c-vp9.c (100%)
>  rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvde=
c.c (100%)
>  rename drivers/{staging/media =3D> media/platform/rockchip}/rkvdec/rkvde=
c.h (100%)


--31e8725035cdaae867651e5f629dfe5e1cdfa919bc8e4b5fe9769c11329a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaHYSqAAKCRDXblvOeH7b
bqCZAPsEcQhHp1n/MQnvFCLsexjxPRpuv36uOmPgYq3iZ8tgYQEA8+gXctndsbuB
3iimQ6yPbpe40td5BCY2Y6XWce3fWg4=
=lFcf
-----END PGP SIGNATURE-----

--31e8725035cdaae867651e5f629dfe5e1cdfa919bc8e4b5fe9769c11329a--

