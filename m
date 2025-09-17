Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDF9CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 04:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6iKUJefCEfN6dN0bjyWGNmIlwawpbU6TIZlivM2qAv0=; b=4pzklc44FshEOpinXhdkS/r/E5
	bOJp5ChfYH2toW+9PYedxOF8xEwU8a3e4dcMaeBdpddxhB64ptNhIT/hasQwMh/VdIeOAvjdw5Su3
	ic/dFYHIx/2eL1anAZZjjU9ZG4ukaWn5qWysmEE1ZvngGCmAqC7l+leqoZ7Z+Daujd+nDCtKavLm+
	vv8CYS/qqm8/W7ehJz+P/DgzDCAhXZS3SSw4uaKxy1nsslqhAKvXlBgpJeR37AbTkn11s3cmt9h/m
	YXbG4vPhElg70iwGGqD1+h56eh0xOt4s062OEGlr6+uDUmHySjB6RrU4m3Os1V17RBVD/7x71F4NF
	8CMT95Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyk6x-0000000ABCW-00zB;
	Wed, 17 Sep 2025 04:49:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyk6t-0000000ABB2-2VVH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 04:49:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32ECC43286;
	Wed, 17 Sep 2025 04:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00976C4CEF0;
	Wed, 17 Sep 2025 04:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758084578;
	bh=6iKUJefCEfN6dN0bjyWGNmIlwawpbU6TIZlivM2qAv0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kgixDBAV4DcV+vsxuyDQuN9mAKXk+Fwp1Rj7x5YjbvblULsWAjF/aqf4SdHA+PpDb
	 xk6vGGX2Pdx3p0E6YVCaxuf9Npu0VVrTCj+g6jBSg4IS/a+GDGRM0aEzmu6edX0sb+
	 TT0qZcVpdp0GVLpmFTHtS2mZjfEa8B03vsV1Kh5dlnL8V6JkVuZxgJJstbKNy4AUDl
	 PJP3twPd6gCUe25poKni14DRAuiG/qn+PKKys2pNGF20j8V0BePISlvbx/+kDqj6GY
	 NTzE0nbNhO6j5bAs55i9Ua3Eo4y5mz5bdi9u0ho52p1NplYz4sR4/DrcwyfKSj2soL
	 eEeRl/PG2KFpQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0695ca65-536c-48d9-ad1b-49452e67a6f9@microchip.com>
References: <20250916080545.9310-1-nicolas.ferre@microchip.com> <0695ca65-536c-48d9-ad1b-49452e67a6f9@microchip.com>
Subject: Re: [GIT PULL] ARM: microchip: clk for 6.18 #1
From: Stephen Boyd <sboyd@kernel.org>
Cc: Linux Kernel list <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Conor Dooley <conor@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev, kbuild test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, SoC Team <soc@kernel.org>, linux-clk@vger.kernel.org, mturquette@baylibre.com
Date: Tue, 16 Sep 2025 21:49:37 -0700
Message-ID: <175808457715.4354.11044142356915096975@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_214939_656794_24F81C3D 
X-CRM114-Status: GOOD (  15.81  )
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

Quoting Nicolas Ferre (2025-09-16 06:19:11)
> On 16/09/2025 at 10:05, nicolas.ferre@microchip.com wrote:
> > From: Nicolas Ferre <nicolas.ferre@microchip.com>
> >=20
> > Dear clock maintainers,
> >=20
> > Here are the first clk changes for 6.18.
> > I don't think they have conflict with changes for the deprecated round_=
rate()
> > to determine_rate() topic.
> > They are in linux-next for a couple of days.
>=20
> But... this series depends on this patch:
> https://lore.kernel.org/r/20250827145427.46819-4-nicolas.ferre@microchip.=
com
>=20
> Which will be part of a pull-request to-be-sent soon to arm-soc (which=20
> is part of linux-next, so the build error doesn't appear there).
>=20
> Once the pull-request is done, do you prefer that I do an immutable=20
> branch between CLK and ARM, that I queue this at91 PM patch into the clk =

> pull-request or that everything goes through arm-soc?

Whatever is required to build the code should be included in the PR. If
the same commit goes into arm-soc tree that's OK, just make sure the
branches aren't broken if you checkout a commit anywhere along the
branch that is sent to clk or arm-soc trees. Broken includes
functionally broken.

