Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DFBC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 22:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JofA2Qh9JGaxtMid0/5sEvR2yQLob0lQuZxap80vKqw=; b=K1KlfPfcaC9KSJPEFIL+xySfHn
	hhvOKYednlqXyRw5Ofzipq5ilTyTFw1rRjVQT6Oz4e4jlbb5IhztpM0zsJS1Y7KnEppLBN/Wm7cHZ
	sNz7xEOA6sicZdqv2mBNzFoJp0XJbHMrNSM+yDecDtlXlTlIEjGpT2MOEj7WXMFftAKk/L7bN0799
	8AUMKb75n59UijmqT5nkaRWKK+RgytuEl56EN9srkaHU13hc5cYda971Mbqk+YHdSaCfu78ZAQRQl
	a2VOrXSqIFsiWzsb3oBfxHZUa53bByThMPxgP1qyokZ2FITMX0rvjEQwxJWJ2II7UQyLQw8GICXGp
	+oFvVXAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpabD-00000006O8P-3bJW;
	Tue, 04 Mar 2025 22:18:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpaZd-00000006O3g-44dz;
	Tue, 04 Mar 2025 22:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JofA2Qh9JGaxtMid0/5sEvR2yQLob0lQuZxap80vKqw=; b=Tkh7mn3A+PYTIgV27zWhch/208
	ETUALWlqEqZb9jksjEgNDlpzfKLYqN2rarathziQV8Ntjv+PPBBfpKKage0LcF7B5AYw5QcG4mzHk
	Nds+uv8i40buo1duskWACkkerB1c8+77MtGCmUqDCz/AWnTbCcf/VEohCydBFaftKyZDJ4/Buxmfy
	mPtQZSVrBco/oLg3OHlqc4Wn15Q5yI3xcUjWkH5zHT1Lf0r43ib9TeG6ezMFV4R1zoTZ6I17a2l91
	INcWrZvknMxlFFMkx2w45YdSG5m6sc+nEHFuQA6yVC26YXkNz7i4f39l6AJ1KWr3USk5v0Ew3iEAH
	kPVZlMcw==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpaBb-0006QR-08; Tue, 04 Mar 2025 22:52:23 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, didi.debian@cknow.org, chris@z9.de
Subject: Re: [PATCH v2 0/2] Slightly improve hardware description of Pine64 RockPro64
Date: Tue, 04 Mar 2025 22:52:22 +0100
Message-ID: <2630232.Icojqenx9y@diego>
In-Reply-To: <757afa87255212dfa5abf4c0e31deb08@manjaro.org>
References: <cover.1740941097.git.dsimic@manjaro.org>
 <174104113599.8946.16805724674396090918.b4-ty@sntech.de>
 <757afa87255212dfa5abf4c0e31deb08@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_141714_001746_80693498 
X-CRM114-Status: GOOD (  24.30  )
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

Am Dienstag, 4. M=C3=A4rz 2025, 07:44:59 MEZ schrieb Dragan Simic:
> Hello Heiko,
>=20
> On 2025-03-03 23:36, Heiko Stuebner wrote:
> > On Sun, 02 Mar 2025 19:48:02 +0100, Dragan Simic wrote:
> >> This is a small series that introduces small improvements to the way
> >> Pine64 RockPro64 [1] single-board-computer is described in the DT=20
> >> files.
> >> This applies to both production-run revisions of the RockPro64.
> >>=20
> >> The introduced improvements boil down to eliminating some warnings=20
> >> from
> >> the kernel log, by adding a previously undefined regulator and by=20
> >> adding
> >> some previously missing references to the regulators.
> >>=20
> >> [...]
> >=20
> > Applied, thanks!
> >=20
> > [1/2] arm64: dts: rockchip: Add avdd HDMI supplies to RockPro64 board=20
> > dtsi
> >       commit: bd1c959f37f384b477f51572331b0dc828bd009a
> > [2/2] arm64: dts: rockchip: Add missing PCIe supplies to RockPro64=20
> > board dtsi
> >       commit: 64ef4a4320e7aa3f0f267e01f170f52b90bf0b1b
> >=20
> > I've moved the pcie12v supply up one line.
> > While in a mathematical sense it's true 12 > 3.3, we're sorting
> > alphabetical, so it's 1?? < 3?? .
> >=20
> > And yes I sympathize with 3.3 < 12, but also have come to appreciate=20
> > not
> > having overly many special cases :-)
>=20
> Great, thanks! :)
>=20
> I'm fine with the alphabetical ordering, albeit with some caveats
> described below, but the following part of the patch description
> should also be removed, if possible, so the patch description fully
> matches the introduced changes:
>=20
>    Shuffle and reorder the "vpcie*-supply" properties a bit, so they're=20
> sorted
>    alphanumerically, which is a bit more logical and more useful than=20
> having
>    these properties listed in their strict alphabetical order.

I've amended the commit, dropping this block

> I'm hoping you'll agree that specifying alphanumerical ordering
> for the properties in the DTS coding style is the way to go, just
> like it's already specified for the ordering of the nodes.  I'll
> go ahead and submit an appropriate patch for the DT guidelines.

vpcie0v9-supply =3D <&vcca_0v9>;
vpcie1v8-supply =3D <&vcca_1v8>;
vpcie3v3-supply =3D <&vcc3v3_pcie>;
vpcie12v-supply =3D <&vcc12v_dcin>;

In the end I don't care _that_ much, but personally I find that
alphanumerical ordering harder to read ;-) .

Because in the example above, my mind now constantly shouts
"why is vpcie1... after vpcie3... ..... ooooh right, it's alpha-numerical"

But I can live with it I guess ;-) .
As 3.3 is smaller than 12 afterall.


Heiko



