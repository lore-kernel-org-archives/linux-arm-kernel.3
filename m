Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23B0CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 13:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JmYWc1I4g7/c/BVgQeuJjZRITvmaXXfhyjJQ2b5IC0I=; b=BpWBKab1IrihNX13nPN4/Ee8xd
	wtbGyZDubBFGp07U9Oapn1iBGLjG/MOesPgPu7eWWaJbvFrp037Zss/cqDQcgH5vAuydaTt11BWMs
	glY6UoPqIfc9oSx096Yxrk2qbwFFswVRebpQk20rJVfszbWK93ujgM1mQfZ0nA3uo3C7GGdqOaq7P
	8HcYbTura+u8gZq75nzqG3lCXue7eRYAQ8jGKkEFCyZhMbuferQwQmLEix7mp5qpKZ9G28J6Kr4Qq
	DHDHRpSJzUfW92sEAKbNJ2a8deHcdNqUWtWuC5Le5O608qECa1AP6TmXY8N+sTigJ6yYpT7brEyZu
	2R7okKuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzaku-00000002vLQ-34a7;
	Fri, 19 Sep 2025 13:02:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzakt-00000002vLI-23dq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 13:02:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9804360142;
	Fri, 19 Sep 2025 13:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02027C4CEF0;
	Fri, 19 Sep 2025 13:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758286946;
	bh=JmYWc1I4g7/c/BVgQeuJjZRITvmaXXfhyjJQ2b5IC0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=isxUgjz3W/iiTQXV6suviEyO13BMaBiHl8/ACv+fHbiau5X2krjzzMubpU5J7c46z
	 1nA2uFjk5roqG3bC9dWMV+20Y2WdEiw/s0ssLnEW8hzmYgB0IPfF5pHqqqhdUdtHE7
	 Wjz/IJ+SK5PtouebFkGM5MS37N4qkr9cIiG5DNUkQ4tvnQr22hZgbf+LW7M20ZYtNu
	 nXTe2I8QyK0HBMcGVKLHLLHfnxPWSWWGS2zdaykctHiqU4loqRVbCyLke/ZZa1qiiC
	 X+ZpcfEcaT3aJQsr46ks0brFqDp07aQkN85TDTWx0S363x2nuR+0vxakSxBvqLa5dH
	 eNOo3vwEkA+AA==
Date: Fri, 19 Sep 2025 14:02:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: Re: [RFC PATCH 4/5] mfd: axp20x: Support tri-phase setup
Message-ID: <1c12bcf9-f9cd-4876-b589-e65e0605ef38@sirena.org.uk>
References: <20250919000020.16969-1-andre.przywara@arm.com>
 <20250919000020.16969-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bibf402iCqQCoieV"
Content-Disposition: inline
In-Reply-To: <20250919000020.16969-5-andre.przywara@arm.com>
X-Cookie: Don't read everything you believe.
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


--Bibf402iCqQCoieV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 19, 2025 at 01:00:19AM +0100, Andre Przywara wrote:
> Of the PMICs that support multi-phased regulators, all but one just
> support a dual-phase setup, with exactly two regulators tied together.
> This allows for a simple data model, since just two is somewhat of a
> special case.

Acked-by: Mark Brown <broonie@kernel.org>

--Bibf402iCqQCoieV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjNVFsACgkQJNaLcl1U
h9CDbwf8C3Z88WScvhWLa/erMfENML0aMwtvD8ri1qnnWlaFEQPD7mRzR4uA0wML
giyGHIUr1UEiWRpm5WGs6eKUUk6pO5K9h8z33zR5FwseUv/kYVjLfb/z/6Gt6TZz
IqS2f4/MId5TX5iSh0AcEHyJp3NiI9QxyZbhfeFSHVTxPELvU1N/Rk2j+/1SeZ4Z
3034bu4p3nAsnBkbppypGO+5WGdkibHH6yyaZ8hW+MmNKcX7x7k3crO3ZZnToVn+
GMsE/VFw6ZoUcHN8Vksc1ndKPRMzpy3XCVoXzLvOQTxM/GEtNYo1wHk4OKr5DhyR
lLmV7agd/Oeo9SSGA1ezwxQLtY9fsQ==
=G1tq
-----END PGP SIGNATURE-----

--Bibf402iCqQCoieV--

