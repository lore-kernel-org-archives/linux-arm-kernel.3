Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C06CCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 17:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXt6c1/Cg732915mGHBQzdD2qDCV46lfKJ/44Pi9hdQ=; b=GgCyNr0urYAF8oUMUjM71o4XYa
	5O0AdLsnC4rSy6e785PvZjljfLRU7sezZ5qVHb8Eon8AQe1obu67hMLMu32u5JN377hgwV+X7pepz
	gPxyjgkh8c79m5GYfapMoXogKAsVNs8LrggOrRzyNLZ/8uoiemNgJhCkRW4uug+Z9VYChaO3lKvBM
	dQX9bDo5Onf4BYgZjacISEAkGR7R18nrFx7ymRjLNAB4du85fNIxN8dYebgGitdzmGUDtZDptXfLG
	4px2zFE7gOpAs7pb8Sliz25K3YhgFjE6ySBt2P1yP9yuUniPkzHtNfJUy/wfeDZvz6o1ONu2gPWz8
	3Az045xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NSD-00000007tE8-3aD0;
	Sun, 21 Sep 2025 17:02:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0NSB-00000007tDj-1ATy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 17:02:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 905B143CF6;
	Sun, 21 Sep 2025 17:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339E8C4CEE7;
	Sun, 21 Sep 2025 17:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758474142;
	bh=GDIRBW2DYpqe0b8KOgrutzQSfAz/bITiNwSGWti6DSc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=LmCLZUUgFCdwJZMjC4yFmzfLl65O2lH3474hraDuq10F+wEc60l3nHSAUvtxw5wl+
	 pUYQHDwswuOXH0FnTcVrEJt0ETKO6vUDlWN7914SxR4/nPMCrhwWfjEjXMRR/dUJe/
	 YrFSxkr6Nd5DUOGIXd2cilXLG94uDvKoi//dbfKAMcqf9avSbPqDOXjsXoAT7S9v/p
	 uTjqS2mC5cddVHv8liiT4AZN8unWmvfIj9VzuqaJAp+l65Z1quVE39rG/vAJI0MtU5
	 CnAVlITmTgmsYALKGih+eiGWn0ha35ifMxOp0AKQQh3YGSyyr04enYprlUOgzTNY29
	 yDU/x9kZkilQw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250917182150.93359-1-nicolas.ferre@microchip.com>
References: <20250916080545.9310-1-nicolas.ferre@microchip.com> <20250917182150.93359-1-nicolas.ferre@microchip.com>
Subject: Re: [GIT PULL v2] ARM: microchip: clk for 6.18 #1
From: Stephen Boyd <sboyd@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Conor Dooley <conor@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, arnd@arndb.de
To: arm@kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, nicolas.ferre@microchip.com, soc@kernel.org
Date: Sun, 21 Sep 2025 10:02:20 -0700
Message-ID: <175847414087.4354.17261652271034200852@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_100223_338779_F6E2136D 
X-CRM114-Status: GOOD (  14.87  )
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

Quoting nicolas.ferre@microchip.com (2025-09-17 11:21:18)
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
>=20
> Dear clock maintainers,
>=20
> Here are the first clk changes for 6.18.
> I don't think they have conflict with changes for the deprecated round_ra=
te()
> to determine_rate() topic.
> In this v2, I address the issue highlighted by 0-day robot: build issue. I
> added a patch that is already included as well in an pull-request to arm-=
soc:
> https://lore.kernel.org/linux-arm-kernel/20250916150328.27015-1-nicolas.f=
erre@microchip.com/
>=20
> v1 --> v2:
> - addition of the patch "ARM: at91: pm: save and restore ACR during PLL
>   disable/enable" as the first patch of the series to avoid build error i=
f clk
>   tree is merged before arm-soc. Branch bisect-able. Exact same patch
>   in both trees.
> - a new tag (clk-microchip-6.18-2) is created and deployed for this
>   v2 pull-request
>=20
> Thanks, best regards,
>   Nicolas
>=20
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d5=
85:
>=20
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-m=
icrochip-6.18-2
>=20
> for you to fetch changes up to 652b08afba69d5d26fe91098eb832b1bcc0f91c2:
>=20
>   ARM: at91: remove default values for PMC_PLL_ACR (2025-09-17 19:15:32 +=
0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

