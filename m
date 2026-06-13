Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0384ECD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 22:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2FhzrzvdqAzy0gU8lhh7x/LXxPE1LPhGr06xqqGpPo=; b=RUmOrGhCL4rmxk9zC4VAf0ZW2j
	1BcH/RE8gBPVIn0xUdcPgeqhyeJg81c2cYyW2DtCkrEj0+uX+ZXKQztQlO3PXRU9AVROFDvWwKGI3
	azkxNSoHSZ5hdSkw3+OGLg3W9mnFjnRsAxv02wCQX8cJpvipL3c5C3/eh06JqA8vI4Dy5YF2pl/Ga
	c73QZV3KKHPTowHEjxluG+luhaFxC6N6GCxz6ZDiqPO+ObAu7oKUKc6+Nu/04QFMtD9U6gDP7n8oO
	Wv+BlodzgStPK4mtg26z4goUyUI/lmvpvV78jT4ZIkODWgZvg3uwDOAwbd5xAJGVpqAAgCq0ow3C8
	8mZlukmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXFr-0000000Cal7-04Rk;
	Sat, 13 Jun 2026 22:55:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYXFp-0000000CakY-1KPa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 22:55:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BF9216008A;
	Sat, 13 Jun 2026 22:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662951F000E9;
	Sat, 13 Jun 2026 22:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391304;
	bh=n2FhzrzvdqAzy0gU8lhh7x/LXxPE1LPhGr06xqqGpPo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=FD3qfZaYPeCDOtbqEM7kkl0l2E2nrpDxQyEo8fzwz2OQqK3STca9WA3GRYiPuHpbL
	 TolfMJthikoK1qNdzYPYNL+ovmsLgD4B4OCOKOQVv2uDfRfj5DnxiENnELpCbCod/f
	 AseFfzPW1lz9OTfT1kj+oBCF2D/LI+toNZfC9kfro8kMIcmeusdw+bvUDS/6ODeoUW
	 +vwL4X3KLHgonvXjFaqF8ft3eKw7cksN7gkcaSPP4dmBg/R+uZdGf6QWM0tjhzBrvG
	 bN8ZJU+ypUkgrgVcJcVmZsowpRyL4rF0lddUYlnMjaPvbqoziyxjwQctji3FHNJ1Hf
	 Cb9Xp9ESkJtow==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260604030907.dhppbxwyfnnoeitz@dumpling>
References: <20260604030907.dhppbxwyfnnoeitz@dumpling>
Subject: Re: [GIT PULL] clk: ti: sci: TI updates for v7.2
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Tony Lindgren <tony@atomide.com>, Santosh Shilimkar <ssantosh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>
Date: Sat, 13 Jun 2026 14:51:50 -0700
Message-ID: <178138751088.819343.10697672744094606693@localhost.localdomain>
User-Agent: alot/0.12
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

Quoting Nishanth Menon (2026-06-03 20:09:07)
> Hi Stephen, Mike,
>=20
> We have a couple of minor patches lying around for some time that
> was'nt getting in, so took advice Brian made.. Here is the PR.
> I have cross checked this on top of next-20260602, applies clean,
> passes the build static checks and functions on all the TI K3
> platforms I have access to. Thanks in advance for pulling..
>=20
> Please Pull:
>=20
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3=
-sci-clk-for-v7.2
>=20
> for you to fetch changes up to 2b0123e4a9257fa2933d13d1bca9ac36467efac1:
>=20
>   clk: keystone: sci-clk: fix application of sizeof to pointer (2026-06-0=
3 21:46:01 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

