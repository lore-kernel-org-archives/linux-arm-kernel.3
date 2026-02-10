Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57F2EA8115
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 13:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eu+2xrtPsyV40bObkn3vPedwvAj8tOQJMTk9xsPv7Mw=; b=fNKy46wHaM5xMUSbeiqnIZ7vt4
	QfL3VTI97xoAjgIq/zoHFX9ORcHLf9LQ58mFQu2oqXJ1gSsAFaLe6C4fsyDiysG/9ISj4qM59ORqA
	rfil9Ub8/rJv3XPrps2sLIPPcJO5MiEorupSHcKjbsz+ngO9JfgBxNiAP1gNg5CxSO1oyIgGWL7qL
	w8AbQIr8ypP0t/2jZzlKJ8OnVYqrpPyvZunzOnmVoG94mjR1P4sCJZZyMN5qViV+on5uBmLY56eG1
	a9zjKbRe9fPIoeCleWa+Ue9V3rZIiLQ8uFQwd3esH8irJcTMrv0eWmUNaDPQ3t/RxXqYhpMxoazOY
	LCtDmezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpo4O-0000000H0dX-2c2P;
	Tue, 10 Feb 2026 13:46:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpo4M-0000000H0d5-087Y;
	Tue, 10 Feb 2026 13:46:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA4B1418B6;
	Tue, 10 Feb 2026 13:46:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E451BC116C6;
	Tue, 10 Feb 2026 13:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770731180;
	bh=xIaQ9mE9WjsV1VOYv4AKH7JPw5sBhHo25m45P5YuLnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A4GDjjMx9ExKObk//2ynhkUbzHEc8JT53zI0gYJ5qUL6cpwAj0IwBtuFouObf8qnQ
	 oSwMhHcvGJ2+g7P+5KPatHDXSekFVce9ad584Kc/u3eHiWeh9tsF4AH9RvIyuGKzr0
	 5hT5mE1EeLqEHRKRw0trUTwp23RRqNnIDC5wemF0CdyQ2Rq54GBNrR2mUcOxg3fwEp
	 M9PJ5LYq5G8BruPPS5aWglIIQ7thDxbO6X7BPxH+6Q2QCnyNimskjR5mo5FT5Xy8Hp
	 hE0lxFinbvHjJGppAc7GfRUrdY4AbpGOjj4CICWSx1NbNU/UWXU0es+vynEmShNRiF
	 ot+xJoHCH8P9w==
Date: Tue, 10 Feb 2026 13:46:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Adam Ford <aford173@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 4/5] regulator: mt6363: Fix interrmittent timeout
Message-ID: <0d1dbeb1-68b5-4b1d-a07d-10f8bb47c105@sirena.org.uk>
References: <20260210053708.17239-1-aford173@gmail.com>
 <20260210053708.17239-4-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+IzQx6Pjw2gHNQNh"
Content-Disposition: inline
In-Reply-To: <20260210053708.17239-4-aford173@gmail.com>
X-Cookie: Spelling is a lossed art.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_054622_087257_465D6012 
X-CRM114-Status: GOOD (  11.32  )
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


--+IzQx6Pjw2gHNQNh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 09, 2026 at 11:37:04PM -0600, Adam Ford wrote:
> Sometimes, the mt6363 regulator would fail to initialize and return with
> a TIMEOUT error, so add an extra instruction to wake up the bus before
> issuing the commands.

Please don't mix patches for multiple subsystems in a single series if
there's no dependencies, it just makes it look like there's dependencies
and makes it more complicated to get things applied.  You should also
supply a cover letter.

--+IzQx6Pjw2gHNQNh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmLNqYACgkQJNaLcl1U
h9BGZgf9GnEYtgwFfeWahWxOc9AG8aitDWEbX+AJrF/pojwMi6gx3YagpFAspqI0
2hHMTFIbbWRI67L9BCM5ETXn/MKFrJr6IxfpMI7+Q6gVYKiWAGlHUmCzQ0FfiBy2
YHsAVdWVj/ZIiLJB5Riwx2iPBYHFgv7bu8jWsMilz6U2vGSQDSiPjYq4jXb0kSJm
TqY8to2aMwY4wOeaF10k5zFHdqoLvVfInytKQWZ/LDHjzXI29x0elTdDNfilHtDK
rWjTWy0oPDqK1gKI9/CN2ZiD3lFfMy1NYyntf3C9NSOgGhZrIYmcc/RtC2ujwP2P
rchKSyFTT4qJVxQU/irY7eD8sdIOkw==
=krKu
-----END PGP SIGNATURE-----

--+IzQx6Pjw2gHNQNh--

