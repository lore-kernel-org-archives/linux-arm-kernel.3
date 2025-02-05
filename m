Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEE0C02193
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 00:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zI0sTmEJ9TsR8yXL29aZxtEc9FgdgtkaVcTEpXxeYyE=; b=bvLXl9x2bWTb43Bcpm3fqYWIBW
	wco8lnI9oRanMVjNNDVqiFBS6Dv7+/0mYGGo1zTZ2VpJhYYkzl8VvfLNlwkH5LeZzHChp/zdBzYL0
	1tNMGL+HtfGjBCG2S0IhL6g1oKEuY0Lj5GSfl0OkJzhb1FnZu9BgeFGt7jS2Z8iXSsGtXHX7yh4LH
	nBkniBvIjdv1XYu7SnjQIO5+QRUXU9L9xIosDH6ZjOyrMdhuy0hUZgxKBtB58TfNhPOJ0RwosaDVX
	+cGXRSzToDgkeYBR56AXxlvh1pvuyZZVzSbfvB9pv2rQreI5io8sq2mO1PaF0Dt/FmWKOBjYkbJUu
	whESlXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfT2F-00000001tl5-0okb;
	Wed, 05 Feb 2025 00:12:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfT0t-00000001tcB-2KUI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 00:11:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A12B5C5DA7;
	Wed,  5 Feb 2025 00:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F4CC4CEE4;
	Wed,  5 Feb 2025 00:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738714290;
	bh=zI0sTmEJ9TsR8yXL29aZxtEc9FgdgtkaVcTEpXxeYyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T8rXBf2jA29IML9QMwaRxwtYMXdZyvIP/7PhCn6zdVTrFV7WP5/Fh/xmgYyt56NXC
	 WgRD80QjCrDxIwMIBOAOuwbV8jjPIynSOeGypKle33Yh0gT7obi5YfYJ02njgQrvEf
	 PitphPmBmVY1HCVIy5tgE2Ar7Bf9Wc04dGIuuXkEUHM1M6YBhCcjJDHY0iWXfdbS7K
	 YEOKH1nd8155Uld0aW3/hfrAOu1O4XgPaXBouypI9GEJSD/bl0BEpImoHF2ua5iQfc
	 66gBLlMFlEJGUcGpCYjn9RSvlg6KyaEzlExI9ewDBqTWM0SqqV+UHZdJqR589Ue7EN
	 ewTr9NRea69vQ==
Date: Wed, 5 Feb 2025 09:11:26 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH v2 2/2] counter: microchip-tcb-capture: Add capture
 extensions for registers RA-RC
Message-ID: <Z6KsrhUYoYF8n10J@ishi>
References: <20250203162955.102559-1-csokas.bence@prolan.hu>
 <20250203162955.102559-2-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a6voB7vV2r6plo90"
Content-Disposition: inline
In-Reply-To: <20250203162955.102559-2-csokas.bence@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_161131_638880_7E31CF33 
X-CRM114-Status: GOOD (  10.86  )
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


--a6voB7vV2r6plo90
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2025 at 05:29:53PM +0100, Bence Cs=F3k=E1s wrote:
> TCB hardware is capable of capturing the timer value to registers RA and
> RB. On top, it is capable of triggering on compare against a third
> register, RC. Add these registers as extensions.
>=20
> Signed-off-by: Bence Cs=F3k=E1s <csokas.bence@prolan.hu>

What is the difference between RA and RB (your code looks like they
represent two distinct event channels, so I want to confirm)? Is RC a
threshold value set by the user, or is it another captured timer value?
The capture extension represents Count value specifically, so I want to
make sure we're using the right extension for these components.

William Breathitt Gray

--a6voB7vV2r6plo90
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ6KsrgAKCRC1SFbKvhIj
K6VNAQCk32TT8lWMH4Lv4X9PvkCeWYw6WUYjQPmRiEjrTjy5UQEAogdky3058O5y
SsjhwyTWpveB3B+stA0GPxnW7Z0WAAc=
=pptR
-----END PGP SIGNATURE-----

--a6voB7vV2r6plo90--

