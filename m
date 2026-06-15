Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B433ECD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 16:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ok1q3lFMwwTbCAb1WRuYAS9/p6RNhi6/nVYDTBXnXCY=; b=aQ9V65cRS5eCaszJy+mJVZ36Q5
	8c/7bg8EOVa+DuIZ7bcRvpYRiB/bpjJ6mWf1Nbr8cP1n5SPDwM03vn+oDV5TMTx6Z8mnVSvFsBcfQ
	NgOToeH3wQzgXRU1R9LLCq/7KGK3TPLrk0i28Vy44JQ6HWRLtaro+kiDcslXOM9AHrFaBh010YUt7
	70JgZR3aFAL1P0UdrmV042u0g81BUK9Xs6aEdLIEfrmvC2iZsZ+wGhQ52yUJay1pnabsKP4vqbetE
	WsVs7C39Sv+DNpqdpGxzfamAbGyvIZWO3UrtBhwml6GMH9/wqPdHavUK65bP59xiwJ0B5WnLcNplH
	2MaUobwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAQP-0000000Eauy-34ux;
	Mon, 15 Jun 2026 16:44:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAQO-0000000Eauq-0FNG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 16:44:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 809656008A;
	Mon, 15 Jun 2026 16:44:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68831F000E9;
	Mon, 15 Jun 2026 16:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781541875;
	bh=Ok1q3lFMwwTbCAb1WRuYAS9/p6RNhi6/nVYDTBXnXCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HV6TW2qW8IGdyr7DenKo0WGSxFAzE8eUNEZ0dRdwZNmGCwm3YPBd77WL4cmcDC/PB
	 0qjmq2Uqxym+zOwiRGwfPTb8KBG1E9+xwx0Xp6XBhHHkHNKGrhsdBS4/Gtd7fynwmE
	 rv8VdsPdbZsL4ODZ51VHYVuxnVbTO3R6OZz/gP13aRpwarKGFzzULXakJEVIaXZhlu
	 etexJE/297wkj6ffg4ruM5jm53gkLdBkZyt3snR78BstSBRlh4Yc0OzZA5iNwar9Xq
	 lfwg9GTsMyaIJHdXfTWGxpr4SW+TlJQXnl6OOh1fwUPn9ZvgjRVlvy4Hmee1OuGmFr
	 hSfAEghPhn5tQ==
Date: Mon, 15 Jun 2026 17:44:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/8] dt-bindings: clock: clocking-wizard: Make s_axi_aclk
 optional for static-config
Message-ID: <20260615-sulk-overlord-e88e845d3c9b@spud>
References: <20260615034845.3320286-1-shubhrajyoti.datta@amd.com>
 <20260615034845.3320286-4-shubhrajyoti.datta@amd.com>
 <20260615-squid-showy-435c9cf780a0@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1dHKHMjeI1EHdzp8"
Content-Disposition: inline
In-Reply-To: <20260615-squid-showy-435c9cf780a0@spud>
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


--1dHKHMjeI1EHdzp8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 05:42:17PM +0100, Conor Dooley wrote:
>=20
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Actually, I take this back. Patch 1 seems to be what's adding the static
configurations in the first place and then patches 2 and 3 complete that
effort. Instead, please add this static config support as one patch.

Thanks,
Conor.

--1dHKHMjeI1EHdzp8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajAr7gAKCRB4tDGHoIJi
0meuAP9ju+Zb1v9LLsSoRqV7m4BjKuGydV3Y0cFa6eISj1QPxAD8CziXD32X+dcp
wy7z+4Ob+hRdQxuTF+M54ub3tKFUxAY=
=92Sd
-----END PGP SIGNATURE-----

--1dHKHMjeI1EHdzp8--

