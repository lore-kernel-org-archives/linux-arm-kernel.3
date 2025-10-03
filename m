Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A19ACCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 18:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pZwuT/JLNXJewD2NH2HpDVLKQgrPsuLUQV2Ho86TzI=; b=dNh2ajLBIJPsZuj40xUu+nJAUv
	mpnoUYMYArLDk8COS4A2D4yW99e89P51EUYcPtLgDUcdg/1dGMyuZuXnQWAlWmghdRKrj22VoUoIe
	/dH+hd11Sd42KChMMj1ZDYVEK1XjJjtHaVBzTRbN7hs5cEXMh/zm000McskGbSgZWnYTVPD+X/wud
	ROnAxT9spE7l8MaA0iY82iwauj5OKbMjdSxSn3Y+T94OvXpT80gZaQLEqkBkNUqdfk6nvYAFArnuZ
	0YlaLcasrcAbSKv/q5eExcEGQso934gTm41GPZYVGV/AnvJH2vugdRewkbd1hcyV2Xm8TSugZHyOZ
	yXu+5rPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4kSP-0000000CvYa-2QUz;
	Fri, 03 Oct 2025 18:24:41 +0000
Received: from out-182.mta1.migadu.com ([2001:41d0:203:375::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4kSM-0000000CvYD-2Jvu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 18:24:40 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1759515872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1pZwuT/JLNXJewD2NH2HpDVLKQgrPsuLUQV2Ho86TzI=;
	b=ohtHXZcrdHCQRHZiN02OlCl0z3COcDpmx2RJFlgqqfGnMnnTAkQhBddhayj9xpSE/NUgDf
	ewxf87lAqgOPpJYLxMBTg+pjpvOs0qdpnsoW3LHa1OfUS5zTyvhW6c+CABkWzuEF9teVW6
	3Qo+QcWKihEQrFEyPjWQ+1hEazUl875JRSBgG4QRABl2TxZsn47zqrQQtlAFWpKQlx/YNt
	dL+vEZxLF/ZRL8d70ZXnzMkm0RDpt+DOHafIFIZ0hQXGOt+x2nd34wzYF3oP2Fq48OX+mf
	5qxnWUG2+ba36i5woRHH7yfEsQGEBPLCm4Au43JMIs1SnRIPA5lnkKnyEMC3bg==
Content-Type: multipart/signed;
 boundary=350687d2fbade414a961dffd460dfe7fc1681636fdd689bcf31c7eb97d01;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 03 Oct 2025 20:24:22 +0200
Message-Id: <DD8WBG9LXET7.189BAJGVYEOIR@cknow.org>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>, "Nicolas Frattaroli"
 <nicolas.frattaroli@collabora.com>, "Heiko Stuebner" <heiko@sntech.de>,
 "Sebastian Reichel" <sebastian.reichel@collabora.com>, "Sebin Francis"
 <sebin.francis@ti.com>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Jon Hunter" <jonathanh@nvidia.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] driver core: fw_devlink: Don't warn in
 fw_devlink_dev_sync_state()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Diederik de Haas" <didi.debian@cknow.org>, "Ulf Hansson"
 <ulf.hansson@linaro.org>, "Saravana Kannan" <saravanak@google.com>, "Rafael
 J . Wysocki" <rafael@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, <linux-pm@vger.kernel.org>
References: <20250925115924.188257-1-ulf.hansson@linaro.org>
 <DD1XOHE6P5OC.2JUQRAGAE1KTU@cknow.org>
In-Reply-To: <DD1XOHE6P5OC.2JUQRAGAE1KTU@cknow.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_112439_214432_91358F6F 
X-CRM114-Status: GOOD (  10.52  )
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

--350687d2fbade414a961dffd460dfe7fc1681636fdd689bcf31c7eb97d01
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Sep 25, 2025 at 3:59 PM CEST, Diederik de Haas wrote:
> On Fri Sep 12, 2025 at 8:32 PM CEST, Saravana Kannan wrote:
>> Please don't just disable fw_devlink using fw_devlink=3Doff. We want to
>> fix any issues you are hitting with it. I might even delete this "off"
>> option sometime. It was meant as an early debug option.
>
> I want to test all my (Rockchip) devices to see if they 'need'
> that parameter to 'silence' the warning. I have a (vague) recollection
> that some don't need it (for that).

Not trying to revisit the discussion, only to report that data.
All tests were done with the 6.17 kernel and no 'fw_devlink=3Doff'.

Device				sync_state warning
Rock64 (rk3328)			yes
RockPro64 (rk3399)		no
Quartz64 Model A (rk3566)	no
Quartz64 Model B (rk3566)	yes
PineTab2 (rk3566)		yes
NanoPi R5S (rk3568)		yes
Rock 5B (rk3588)		yes

Cheers,
  Diederik

--350687d2fbade414a961dffd460dfe7fc1681636fdd689bcf31c7eb97d01
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaOAU2QAKCRDXblvOeH7b
bi+jAQClFJxngtaff7fByP/1aLRZByopcFs8SEZdCfX0NZgpzwEAjcnsnhLYGu4J
P6cjkclQbHy9mZ8x+FljMgEw+7fw2A4=
=1PVj
-----END PGP SIGNATURE-----

--350687d2fbade414a961dffd460dfe7fc1681636fdd689bcf31c7eb97d01--

