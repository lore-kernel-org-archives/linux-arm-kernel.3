Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE6FC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0oCvf1fmqu014f3i21FkaEwfd+AIiy8ZD6OncmIF9c=; b=cwxPkFBLHJJu9a9e9iPUXcl6An
	2wo2xtZorZo7g32aRay2rl75Yg91RtgCw7mssJmd04XXWE7+fQuU2BjZYHUMGLcc782+0kHydfM1K
	c73Ye+ZZ4Hbmgzz6Uw5q4dN8gK47+nsqlzbtSsb5PrzQl5wCp14wHuBRdCNgC2WDIL7SNn6OtIcX/
	DDK6MwU7176mURMADUbhbQErB8kRPQAw42VkMiOfb36/I9ooe7vPLNMnewwZCzgS38K88B2DREWpM
	Ch2lE/aDPD37Ij7l180MAw0BU6bBclRq0vHGPKDQdSwWY5Nio50KFtf/ksaiRl1x07N129z2tlsTN
	YhAQucuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xCv-00000008ohF-1Hkm;
	Mon, 31 Aug 2026 08:17:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xCs-00000008ogD-2xJB;
	Mon, 31 Aug 2026 08:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=n0oCvf1fmqu014f3i21FkaEwfd+AIiy8ZD6OncmIF9c=; b=yRaPNrA40oj+waTkRbZd89GD0o
	cvG0YR6TeYkX7+4FfW2Ezf3DW6rE7R4cMPwZznSoqLmfjEfRgAV3q2rQ8ccyoPyGFDRCV4QnHpZ4w
	7xn6fQ6RcmtGCFmh8LaZCFQpfeZszWx1Weo2wNddolJ/6A5BRbJGypZ4UDSgfGNl2A3JlNrCGxaJW
	/Q83tn31R+EVlmNmZ4BSkP3oeC/hopDgCUf/9hu68Bd/Lno1vSOwLRXKecKu8ZfhCUGKod+bWPxCw
	7exQzTwKOpXFbW6BNefw6sEbQDJLDIHm5p8i2kfdwBcnKtRz55qhSbo8vvhsS1c439pPQ33WyXXle
	WRCvGs5w==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Vladislav Leonov <vlad@zlab.su>, Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Joshua Crofts <joshua.crofts1@gmail.com>, Simon Glass <sjg@chromium.org>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Fix RV1106 SAR-ADC support
Date: Mon, 31 Aug 2026 10:17:17 +0200
Message-ID: <5330090.ejJDZkT8p0@diego>
In-Reply-To: <20260831025557.6ee7c42e@jic23-huawei>
References: <20260823122039.20831-1-vlad@zlab.su> <20260831025557.6ee7c42e@jic23-huawei>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_011730_806266_68806816 
X-CRM114-Status: GOOD (  22.12  )
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

Hi Jonathan,

Am Montag, 31. August 2026, 03:55:57 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Jonathan Cameron:
> On Sun, 23 Aug 2026 15:20:31 +0300
> Vladislav Leonov <vlad@zlab.su> wrote:
>=20
> > This series fixes the support for the RV1106 SAR-ADC in the
> > rockchip_saradc driver and its device tree bindings.
>=20
> I debated how to apply this.  Technically patch 3 is a fix, 2 is an enabl=
er
> and 1 is also a fix, but one for something that we just effectively patch=
ed
> out from running in patch 3.
>=20
> So in the end I'm thinking take this the slow path for next cycle.  Shout
> if anyone thinks this should go in during the -RCs and whether all 3
> should do so or just patches 2 and 3 (leaving us without driver support f=
or
> now).
>=20
> Applied to the testing branch of iio.git

I guess I should shout then ;-) .

DT-Binding patches are sort of independent of the driver change and
are considered API which should not change after the fact.

Our DTs (but also ones possibly contained in firmware somewhere) are
validated against the binding and it seems the correct compartible goes
from=20
    "rockchip,rv1106-saradc", " rockchip,rk3588-saradc"
to
    "rockchip,rv1106-saradc"

As the fixed commit is part of 7.3-rc1, I guess it would be nice to
have patches 2+3 in 7.3 and patch 1 can wait for 7.4 .

We don't need the driver support (dt-nodes just doesn't bind to
anything), but it would be nice to not proliferate the wrong binding in
an actual release.


my 2ct :-)
Heiko




