Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8916CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 11:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVnNvE6HEmI3bWFjCq2hCENdotEdrEc4xK74AZkJfcA=; b=a1CW+JmF7TB2JMux3q9hpSvCwA
	awVWcBwGrXRwlVc5kmSaaTCm36KZICfyGYFk5Ag4/A8xwvofs4O0rtfQH4daF+Cu3ppLvnywj856N
	FHft2G34Sj6hbBlBu1XqCPkMVZRLcjGdZvo1alH14NsoVzweBu9F6hvwI5CoJRWOtCOvt92Ur7Spb
	9EukUnmd4N5rRJLyNwzOX0cedA7rkIfug8Z7JFPsNTiA3ojGjRGFzUQCZb2fzY2hFLB1hSGpboU4w
	L0a0uWarfXBlXU71zieO0muaL9/ECaFGINB8F7iIae0WwcEUhBYYz4nwUOzyt08f3mk1dkJNgDWRR
	Nw48xNAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7BZd-00000008MgC-1cQV;
	Fri, 10 Oct 2025 11:46:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7BZb-00000008Mg3-40L6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 11:46:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46FBA60143;
	Fri, 10 Oct 2025 11:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE3DC4CEF8;
	Fri, 10 Oct 2025 11:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760096771;
	bh=VjRxcvWMrTGyGz85idIF5PiXEZxnTBbF4eiWaP7b8wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M+7NVtlmySul0oHAyxjuJWWDer3RkdoMkGtEQoTnsSP09fys39swzVepuODsPzHt/
	 IQn+WqBkqPJkTTTickC9FsLyM9ionInKUUxaOOs12s6Uf0IayEGoPzKU2YEpGy7GxU
	 uL5P2q6o/61VyDwDFvPSVtgXLeF+ie7mP3Ps57DLmP197bxils85C0PGoEJSRfhnFl
	 RKKvFq5oheFHgZxZToQIHSvDAM30hijZFCd0QgQ92KfRz7ru6Yh48nZjeRmTMj7fcd
	 mpRMX0JCIs0/Ac+Iq0OkxnUlDu4o1udPiNJhm4ykRrLlagYbJqkl2B+2iwvW+JT/2O
	 G4cYQHfJNkd4Q==
Date: Fri, 10 Oct 2025 12:46:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Jun Guo <Jun.Guo@cixtech.com>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>,
	Peter Chen <peter.chen@cixtech.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggMi8zXSBz?=
 =?utf-8?Q?pi=3A_spi-cadence?= =?utf-8?Q?=3A?= supports transmission with
 bits_per_word of 16 and 32
Message-ID: <747574cf-3139-4e12-89b3-cbd396acd5a4@sirena.org.uk>
References: <20250930075644.1665970-1-jun.guo@cixtech.com>
 <20250930075644.1665970-3-jun.guo@cixtech.com>
 <SI6PR06MB7104D8834A40A802CF6CB085FFEFA@SI6PR06MB7104.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lO07HjWtCSe5Llfz"
Content-Disposition: inline
In-Reply-To: <SI6PR06MB7104D8834A40A802CF6CB085FFEFA@SI6PR06MB7104.apcprd06.prod.outlook.com>
X-Cookie: But it does move!
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


--lO07HjWtCSe5Llfz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 07:50:24AM +0000, Jun Guo wrote:
> On 9/30/2025 3:56 PM, Jun Guo wrote:
> > The Cadence IP supports configurable FIFO data widths of 16 bits or
> > 32 bits during integration. The default FIFO data width is 8 bits.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--lO07HjWtCSe5Llfz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjo8fwACgkQJNaLcl1U
h9DyVwf/WCMG/NpBnT9MMwlm16K+zd2lPXv/ilYeqE7QaTU7WWngAYWiYFEoOdDZ
cObq2XEyhZLmb+YN77c0ovhJyscBfdZVlspZMWAav6JEjc0h/7VqU/KQJzJTsy5U
Aj4UxRx8wpiJWWwryPrs9BN3HkxObvWeShGEU0+YDSx+O/UXdT894AfXl9WTL2sS
BfE57HUnGuf6tPrxcfcIc5UVTHm1BvejJhCzJGi7f//uOmGkUcenQH9yd2pl7gp0
DSisTawh2QppOhrPFNidR+gL8FqULPybe01fGSqodm2gKV65eywghOrzUMtYeMro
LtWr+sUCG4XghAmclVUDCNTozt7ZAw==
=cXcT
-----END PGP SIGNATURE-----

--lO07HjWtCSe5Llfz--

