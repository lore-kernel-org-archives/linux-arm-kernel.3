Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FC3F483DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 18:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLO8YzzuAKl5rA0eEh2jedBICwEZQxOzsCwuyt/lU3A=; b=Cqppln0SbsRbd0VjnKmjOzpe/D
	6ly8LsjRHRxVbTlgnjsWXM+CiDg4zXmKi21HJcF1/mdOmw0WOxPbcH6bPA32WgkoTEoT7jheK7z8i
	ZSBBBqjYPuMlcFPGtGqWnP2glP3vM1VPSUJJwXcAVLsGk+juVlW4YygET92fPHrdCxK/xVikrFNqq
	NsB8MiQjPMYAADg5Fn+lHfeLTaxAQ/a3JWGdhVnD+UTN0UTi6boLROMoWwI5iZMG3OJYUheRCkIdj
	qsEaYTgh+b9XCS08xjk8WG9uITBUbWhmIpcHWUYbeSvy8xCLjYLs3C/fodGcAYK8gdgjk/k3mHMDc
	vkC+kjpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jjm-0000000HJKC-3N0W;
	Mon, 23 Mar 2026 18:10:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jjl-0000000HJK0-3OBd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 18:10:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4040C600AC;
	Mon, 23 Mar 2026 18:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B69DC4CEF7;
	Mon, 23 Mar 2026 18:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774289448;
	bh=iVvTcdKll6gMBptqBQmi6VsqODBKiqmmTsTaVZJIq/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uw6D/G+gitcATb6T5R2/KenbIfxV3Aj+UM3cql2sI3weUahY2d2pIeS6N83j+I2ji
	 zSJXp8Eovcfwe4k4zdUhK1foE2qFa7Y3VvYpa0lZdAIBnOzgQIfnaHIlN/aQKS4iSV
	 Y5pyxyzT2tLw906EBvx4d4kvEwRy1EzivQfBX77tXyLxIeHWZCyHx/55CcvUL+fBMq
	 HmtLajqr8dni9WQei7UM5bALLx/5QohGHu+sT/pUmDPIq6AZzRpYiq+FDS6+9d5MB1
	 XntvHcDWxSQLlvyxa7d1GLw2HK3IYe4PmTSDrKrCIQx5Bm5E1jNvryB9k2WHghI2/d
	 eGdd/ZrAz4YaQ==
Date: Mon, 23 Mar 2026 18:10:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Kexin Sun <kexinsun@smail.nju.edu.cn>
Cc: linusw@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	julia.lawall@inria.fr, xutong.ma@inria.fr, yunbolyu@smu.edu.sg,
	ratnadiraw@smu.edu.sg
Subject: Re: [PATCH] spi: pl022: update outdated references to
 pump_transfers()
Message-ID: <ef33990e-fb6c-4bb2-b8d0-4ca5b31c8722@sirena.org.uk>
References: <20260321105940.8143-1-kexinsun@smail.nju.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4wW3C1gq+wpyJQ64"
Content-Disposition: inline
In-Reply-To: <20260321105940.8143-1-kexinsun@smail.nju.edu.cn>
X-Cookie: Money is its own reward.
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


--4wW3C1gq+wpyJQ64
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 06:59:40PM +0800, Kexin Sun wrote:
> The pump_transfers tasklet was removed when the driver
> switched to the SPI core message processing loop in commit
> 9b2ef250b31d ("spi: spl022: switch to use default
> spi_transfer_one_message()").  The kdoc of
> pl022_interrupt_handler() still describes the old flow: scheduling
> the pump_transfers tasklet, calling giveback(), and flagging
> STATE_ERROR =E2=80=94 none of which exist in the current code.  Rewrite

Separate issue but STATE_ still do exist in the code, just unreferenced.

--4wW3C1gq+wpyJQ64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBgiMACgkQJNaLcl1U
h9AdOAf/Z3F5/GiYsrPnhwQny9JtH1UJbMnqe7bgTXcfR7pIi7sO8i3pGbj7l2Mw
kCMqgq+4G1iSp/1PrOE1uZLjP3cLD/FneQHgKQ6tQkCNMn39HkgkEmAKuRg0T3/d
DkoVrt/sCEpFV2JoTjUAnWRx/S+ALxQSV5BU+5bA9W3T144f23rAfjgiV882cN55
pIdVv8r4JgyRMJUIaSNWRwnlmRAZ8aLfjXzLJbh2IoSX89VSz5xSW3Y8i0ZOPZ1S
i6NUUjvzbkHnwzUqMDBeWBCzLXu8hzhuj6POZ1dttCN71KfgwiFatk9pW2bVyVSh
VaGgQ/2vS5ijHkmXpuWFF+B/8B6cQQ==
=mECC
-----END PGP SIGNATURE-----

--4wW3C1gq+wpyJQ64--

