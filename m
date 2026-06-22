Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062C8CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 17:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBPNSe4CPrmYI7tdrVEFFESNM2AQv28THAVOyYtFOEU=; b=pw5jo+7ywWFyrlSStQuWCToCH5
	LvzNrgLeQsjzIIh6VO2m+aE/9ja9boPsLQHYw74Znt86jG4bwWGG7JV8EHFysauDY65whzDZqO2GL
	rh8HlIwDvGry82lnGMe5UPK9ejP/1vm0fohgM6wHT/YgH2hmJh94Ce2/sBxm48vwDJLh9r5qy2HZJ
	PgDiT7cuYYcUFb3oBpN0uxNWGsbSZT7HRVMHhMH+D8gWCQtn0PX6ptcNZeTgaKg36WRkuhfKGQnBj
	LOMBKbKDD4S20lmY1SdytSWbHZXX2dqIfT/2SbjkQcvC17d6KJG10mHaTBtAbhBAsfsTW7oAOyFm8
	0sQRN/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbi0n-00000005ECs-1ARc;
	Mon, 22 Jun 2026 17:00:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbi0l-00000005ECj-3O8l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 17:00:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BDB766020A;
	Mon, 22 Jun 2026 17:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 179101F00A3A;
	Mon, 22 Jun 2026 17:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782147638;
	bh=FBPNSe4CPrmYI7tdrVEFFESNM2AQv28THAVOyYtFOEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n7sNwPJLODKiRXF3ckMys9a0madlZ0QlBOjYZTx2GavzrrW3/QRmV3JeyB24/EZv3
	 BRHFAExyTS2FzXigFI8UDWdLfavBXWAuhHMrapEic0JLHIohNnMHnohCRjYK3PUPLC
	 4Rl5EYkYprfryDf3jF89EjjuImusXvrM9H0WgPgEacIMbCPAxH7oPXuWbvPZrFUBVu
	 GwWHT/ScgXSiGewELPxVxuIfWHGkNtWAVyT11/AJf0F/5CJIqeonNdRebDGYbCo6I9
	 /AClqSuz6/0yFBwwPcQVSgR49SkKXOGd0x2fQ1S9mPE6/v767IrCuv0/SsYC25QLxd
	 VRKBj0ZycUhpQ==
Date: Mon, 22 Jun 2026 18:00:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH 09/11] regulator: db8500-prcmu: Remove EPOD regulators
Message-ID: <70dd1974-3360-4169-8b3a-36e7e1cc4460@sirena.org.uk>
References: <20260618-ux500-power-domains-v7-1-v1-0-eb5e50b1a588@kernel.org>
 <20260618-ux500-power-domains-v7-1-v1-9-eb5e50b1a588@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rGlF+30zJ9UqBxku"
Content-Disposition: inline
In-Reply-To: <20260618-ux500-power-domains-v7-1-v1-9-eb5e50b1a588@kernel.org>
X-Cookie: Now I am depressed ...
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


--rGlF+30zJ9UqBxku
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 18, 2026 at 07:00:55AM +0200, Linus Walleij wrote:
> Remove the obsolete DB8500 PRCMU regulator drivers.

Acked-by: Mark Brown <broonie@kernel.org>

--rGlF+30zJ9UqBxku
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo5ai8ACgkQJNaLcl1U
h9BaJwf/cE6zFilqlprukQbzoS9v80E9/7Y2JJSaiLnvW6JjSjMvkSnz7MwKRKjV
5YmmCXijisVfGbkgQLL3ad/7NkhLD//cJnPh11Mp4W8IA1IGV41qH9W5gUgwo7QE
MHb+IChEB+Ba8VSWtCqsktqI6O3TNmd/SKnnheO8g88/ldpZ+keIlYk6Ox8zVVf4
JmMuWMMFBJR2ybHy/L2ok0OshjgcUKGaQS0QpAhPBJTQ2/+NJYGliH322Y/irXhe
exF9MfFUEJDjCI6RxKMOqAp+IChlNd2l9/5zJ4xG+1jPtgdCd8g8P/WMGjdebbhB
mELR4oOXs2c5uPurZH8ILur5P+kN8w==
=UUpz
-----END PGP SIGNATURE-----

--rGlF+30zJ9UqBxku--

