Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD131607F6FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TQlE38bl;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=QFYBVzxR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L38WitxfSqxFzIlzs1i93G62+S2UwcYyS3oEsrBG3S8=; b=TQlE38blfcOSN86+AOtgdh2YhZ
	bY5Ndf2lN7bP/+xhcLKWxbPrux/2OSGtX7xJRxDTmxuGn6+hNPcnJgH/MGtr4gVAyz3ZN3Gqzmqvh
	aA4L1NLAsAoQwOeP05SILk7xK0Xbuqh/RXphS6zUk8ZYprrdV8uBc9mLmCl0CYIzpq3lvFeCwo0Ln
	kZPUNA6maSnJPdbMXbur6uJS+lGE1cJPtSgl1+h8uhbYlIcZZs7zOzkTCqpiKH94WZg+T+yro3/GH
	tVafWjbjR4+E1WLLS83LyvOk6ZPy+1ieCrkfPrEMDkxD/l+y/cqhryKJxGYhJRLrXcGOfLvAN8klE
	x460ll5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsc2-0000000GhhZ-3fmS;
	Mon, 02 Nov 2026 14:02:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsbz-0000000Ghgk-3oV5;
	Mon, 02 Nov 2026 14:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=L38WitxfSqxFzIlzs1i93G62+S2UwcYyS3oEsrBG3S8=; b=QFYBVzxRz9TqhAsSgdZjkgLffM
	xwiWRe8MKZApYOUWjyQBybEuU0nGiO1sEduE0dumhcyaJT9MUgPk1tIv/klO+J2APdop+ozo62rF2
	IvuqSmZi8NMzPaiM7rmulpZpiiy2ygSDZjPs2bEpYR2zDJHIqSRJiP9Da3z3h56iULOUO5HySLcnT
	EOGBKglillPZ7B7jAAHjhBFwnd50YFKd9Hbb9ADpDuABBHQ1nfd8He42qSMSltzh3O/o51+YRhFHj
	yelLiTfbP8363g7j7/Mx+01/QReNoakEL6KOE4Jzsv3Oc5x++61QcR45C8t3FWLDg1ApQX1nC0Kl3
	OMLiRYqA==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Yaozhong Li <yaozhonguwl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Yaozhong Li <yaozhonguwl@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: enable SD UHS-I on Firefly-RK3399
Date: Mon, 02 Nov 2026 15:02:08 +0100
Message-ID: <11288903.zapYfy813O@diego>
In-Reply-To: <20261101154407.3949-1-yaozhonguwl@gmail.com>
References: <20260922055011.14972-1-yaozhonguwl@gmail.com>
 <20261101154407.3949-1-yaozhonguwl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_060211_968675_A299EDAF 
X-CRM114-Status: GOOD (  13.01  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Am Sonntag, 1. November 2026, 16:44:07 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Yaozhong Li:
> Hi Heiko,
>=20
> Gentle ping on this one. It still applies cleanly to current mainline.
> Please let me know if you would like anything changed.

to change would be the the commit message, it is way too verbose and
quite confusing.

Also as can be seen in wifi-module datasheets, they seem to call their
main supply " VBAT - Main power voltage source input", which is
vcc3v3_sys on the firefly, so the sdio block should get an appropriate
vmmc-supply too.

The gist for a commit message as I currently get it would be like:

=3D=3D=3D=3D=3D=3D
Contrary to the naming, vcc-sdio is actually the io-supply routed to the
sdmmc controller - as can be seen in the schematics.

The schematics also show the wifi block's VBAT main input source coming
from VCC3V3_SYS and it's io-supply is the already correct vcc_1v8_s3
although the datesheet is mixing namings up a bit.

Adapt the supplies for sdmmc0 and sdio accordingly and enable the sdr104
UHS mode that now becomes possible

With UHS enabled sequential read goes from 22 MB/s to 60 MB/s with a
64GB SDXC card. WiFi remained associated at 5 GHz, -50 dBm, with no
kernel errors.
=3D=3D=3D=3D=3D=3D

includes adding the correct sdio vmmc-supply.

Heiko



