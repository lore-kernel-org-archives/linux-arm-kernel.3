Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B70FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 18:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQhugXnKZaFsFk2VLARnVsEPScbazA/Qt6kI51WMme8=; b=Py5orWsMZt5tx0TrzA8/e8siFL
	SsLzJqBmoz1yGwLHLPEduycP+slPsZ5C3DQ82rvXuaplrcdYdS9LKzYIyYrbCw6r1br/J/0P22AEJ
	pW4yl2AJisKsaV6D/yWVuyiHWuYKkmh2TsadlDeog1jxZJb3hn63fKjFl8K//zOsrQW7f/BdwIW5w
	RcXEfehiIphBl5CoTWGJpZIZzRstfsqCwdyC/bIn9XNPU/vReBIxLq1tVD+466DDgaN9n4iSpdnHH
	19BKES2OCA+f7qVFNnyRiG6Kdbr5AF2m28o/TcHFaZnP1ldvzsUIbvsVTJ0w4RU+J9sGoOAzU5Bxg
	yXVCtE0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGhOS-0000000EhWG-2VKD;
	Sat, 25 Apr 2026 18:06:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGhOR-0000000EhW5-1RNO;
	Sat, 25 Apr 2026 18:06:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 744B860055;
	Sat, 25 Apr 2026 18:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4C1C2BCB0;
	Sat, 25 Apr 2026 18:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777140374;
	bh=kQhugXnKZaFsFk2VLARnVsEPScbazA/Qt6kI51WMme8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fXlPDe3tmLMH6p3KtZGTKhXWROWTdMMVOTo/Q43zxNtaVYBGKJZRchulG88X5+A/R
	 dxgGIUm1Hp/3dsybuRA8/zAua+D/Tu9NNxO472o+DE6sOFhua03zBeAaU+05gYLPDE
	 hv9Zx0OA9e5bap083O5F+Shj6cm9kEVKggMKkhCkAlONQJQ1Ju2kaqVXHwdujjxamM
	 ZKUvniEuZvZDnEs1Lp3AprQinL/7zWSAbHfC+8Py8yHkQ6fiXJaiSfMvtZ9C65ZNjh
	 B38F8vw7ns/nDihDXj6o+uGx1BM3vA9fijb1tO9mmtUQM+eWi4CMOMCrebpFrN3nA7
	 00Z5bm/Yj1R7g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260424-clk-bcm-fix-pi3-v1-1-8a734e94cecb@kernel.org>
References: <20260424-clk-bcm-fix-pi3-v1-1-8a734e94cecb@kernel.org>
Subject: Re: [PATCH] clk: bcm: rpi: Mark VEC clock as CLK_IGNORE_UNUSED
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Maxime Ripard <mripard@kernel.org>, =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>, Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Mark Brown <broonie@kernel.org>
Date: Sat, 25 Apr 2026 10:51:51 -0700
Message-ID: <177713951108.5403.14915756699205242219@localhost.localdomain>
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

Quoting Mark Brown (2026-04-24 08:34:52)
> From: Ma=C3=ADra Canal <mcanal@igalia.com>
>=20
> On Raspberry Pi 3B, the VEC clock is used by the VideoCore firmware
> display driver, which remains active until the vc4 driver loads and
> sends NOTIFY_DISPLAY_DONE. If this clock is disabled during boot, a bus
> lockup happens and the firmware becomes unresponsive, causing a complete
> system lockup.
>=20
> Mark the VEC clock with CLK_IGNORE_UNUSED so it survives the unused
> clock disablement and remains available until the vc4 driver takes over
> display management.
>=20
> Fixes: 672299736af6 ("clk: bcm: rpi: Manage clock rate in prepare/unprepa=
re callbacks")
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/r/5f0bec08-f458-4fba-8bf3-06817a100c4c@si=
rena.org.uk
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> Link: https://patch.msgid.link/20260401111416.562279-2-mcanal@igalia.com
> Tested-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Applied to clk-fixes

