Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBB4C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XESgz9twUHyVSNhT10Q8A1sgdFSZwNrxK44V9F1wSyY=; b=2/sCOoHjhqYlNVevaAJxzIYbwM
	9whZ+vBnbQNu+1HztR6Uu8suNEzN19EcpXwoZIm119HlKtBbRPiZIg6hoQPb7ZNqxfNvDCwb21Sjp
	uNeZY5S7xipvrD5GCo9FVEogk+3vbBDTdzsc2Fp7sJzcPdjbDcBcpAUO30rGtAxLuYzjQKvIAgpLC
	lGfonQgZzo0sRoSKKfW5hgxWFIKjhfFWRhx09VLOoBQfUjbwsdZtbHmXRaXo1PPHmGOsGvEC+jdJl
	wE8jxSFzwCFgvwkeiWncQQ94UBCht+7MP/FyxUfbV4lqutsobHAKoffa9X+G23AMLTqeL5CEJpI0N
	J7Qq94VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tienD-0000000CNX4-45pi;
	Thu, 13 Feb 2025 19:22:36 +0000
Received: from out-185.mta1.migadu.com ([95.215.58.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidpo-0000000CCre-2r96
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 18:21:14 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1739470860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XESgz9twUHyVSNhT10Q8A1sgdFSZwNrxK44V9F1wSyY=;
	b=eXD6QVlYZCbI39CJiNBmZxKbgLZ2ZCMbIqo5aN5UQVanZSN4yEzDI1esH2bv+uVa38TxLZ
	mmrKt8pr/HZCYCbXLhpBKn24BB+oY9Vb/AReXJTnvu/Q5vtlplefGmm/MPSUIRaDucFEk9
	Jx/cDOnq1am34NKE+8zffc3EXqCMrxA1zXL/57UTcAYDeMhx0+f5G6NPbXrMf97jbzn2Mn
	vpBj9GNNzVZtO+lYy0EA6kzgYd02oxDqyBvuATvINC69xS4Jf6PvSIo5+W9cfGni0p4xu2
	5PkqQJomY2vFcVhw7OEItbHb8jPP9PgRje7X2FhhzxSmQR7BxA0dSfUw4SvHPg==
Content-Type: multipart/signed;
 boundary=d6b2ac2338a7d3d651a174d59cac49ab75295950d69be1697baac74a02d3;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Thu, 13 Feb 2025 19:20:49 +0100
Message-Id: <D7RIYCL3ZCLT.2NAZXUAH4EQC9@cknow.org>
Cc: "Piotr Oniszczuk" <piotr.oniszczuk@gmail.com>, "Damon Ding"
 <damon.ding@rock-chips.com>, <heiko@sntech.de>, <robh@kernel.org>,
 <conor+dt@kernel.org>, <algea.cao@rock-chips.com>, <rfoss@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <hjc@rock-chips.com>,
 <kever.yang@rock-chips.com>, <dmitry.baryshkov@linaro.org>,
 <vkoul@kernel.org>, <andy.yan@rock-chips.com>, <krzk+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <l.stach@pengutronix.de>
Subject: Re: [PATCH v6 00/14] Add eDP support for RK3588
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <5044FFCB-B325-40D0-BA82-03AF64EAF029@gmail.com>
 <D7RH63Z1VBBD.1AIOQJIWPZIXS@cknow.org>
 <m3ovwhg3h2njsjpuj2wdahxex6zq2udmxonublgmnlrdfred4z@zxtyd6xvhram>
In-Reply-To: <m3ovwhg3h2njsjpuj2wdahxex6zq2udmxonublgmnlrdfred4z@zxtyd6xvhram>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_102112_861842_5B5B7E67 
X-CRM114-Status: GOOD (  18.22  )
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

--d6b2ac2338a7d3d651a174d59cac49ab75295950d69be1697baac74a02d3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Feb 13, 2025 at 6:33 PM CET, Sebastian Reichel wrote:
> On Thu, Feb 13, 2025 at 05:56:55PM +0100, Diederik de Haas wrote:
>> On Thu Feb 13, 2025 at 3:54 PM CET, Piotr Oniszczuk wrote:
>> > I=E2=80=99m playing with hdmi0 port enablement on radxa rock5 itx boar=
d with 6.14 mainline.
>> >
>> > rock5 itx has 2 hdmi ports: hdmi0 is wired to rk3588 typeC1/eDP1 eDP w=
ith ra620 eDP->HDMI converter and hdmi1 from hdmi/edp tx1
>> > (see page3 & page29 at https://dl.radxa.com/rock5/5itx/v1110/radxa_roc=
k_5itx_v1110_schematic.pdf)
>> >
>> > I=E2=80=99m on 6.14-rc2 with applied:=20
>> > [1] Cristicc hdmi code (https://gitlab.collabora.com/cristicc/linux-ne=
xt/-/commits/rk3588-hdmi-bridge)
>> > [2] eDP support for RK3588 (https://patchwork.kernel.org/project/linux=
-rockchip/list/?series=3D927765)
>> > [3] Add eDP mode support for Rockchip Samsung HDPTX PHY (https://patch=
work.kernel.org/project/linux-rockchip/cover/20250205105157.580060-1-damon.=
ding@rock-chips.com/)
>> >
>>=20
>> I don't know if it's relevant, but while HDMI0 got enabled for quite a
>> few devices in 6.13, it did NOT get enabled for Rock 5 ITX.
>> I made a local patch (which does the same thing as was done for Rock 5B)
>> but I have no idea if it actually works (I don't have the board).
>
> I don't have the board either, but the schematics suggests that your
> patch is not correct. On the Rock 5 ITX the RK3588's first HDMI/eDP
> port should be enabled in eDP mode to be used with an eDP panel via
> connector J11. This series is needed for that.

Ah, then there was more to it then simply being overlooked/forgotten.
Thanks for the clarification :-)

Cheers,
  Diederik

--d6b2ac2338a7d3d651a174d59cac49ab75295950d69be1697baac74a02d3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ644BQAKCRDXblvOeH7b
btWkAQD7Rnz8K732UfDax3W2h4oUDuihiz5E2yvEznxKy0T19AD/Y9CH2/9L+kd9
PlmYF17ranxTt4f2UCjh5/ZVNS9Mdgw=
=MIH8
-----END PGP SIGNATURE-----

--d6b2ac2338a7d3d651a174d59cac49ab75295950d69be1697baac74a02d3--

