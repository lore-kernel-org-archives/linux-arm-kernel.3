Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDAFC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 12:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZPPcB2Se1xayB1f1+P9TFpe9Vt4mOCdBfx1Vac89o0=; b=IqwkbDLJsRopJT+9nqnz6fJZw5
	PC4GzYZcU3vnJKZBDLzyhO5k8MDbpchwZm8Qrlw/W/0AJa59og/MqBxtplLVT0vHVvB9OaDNw42is
	J9BeQZyWNUA9qW/J7nKWLtvbfvrfa1WoLQBQMCYGxBGDpOuKIlSpGwf5KS0jaZaDGHjlq5cTun9tQ
	V4fQHaYp5ThxsFvA8RStlDu1TxlsoKak3IihtnAP7dvFlC211n9QjS/K1okWMj/t5lXlgsz32/1i/
	Kf0oP1b/SvwZOvPdiC7sVWc0upODOU5YgJQVCh9wc0IlE0vQzOJIKw6vHoHQ9XgMr+s3Pd9BfxwVG
	+c+IlXaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuJF-00000003Oql-2en8;
	Fri, 16 May 2025 12:37:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuEu-00000003Nyc-4Be2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 12:32:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 084AB5C24D9;
	Fri, 16 May 2025 12:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9E6C4CEE4;
	Fri, 16 May 2025 12:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747398756;
	bh=LZPPcB2Se1xayB1f1+P9TFpe9Vt4mOCdBfx1Vac89o0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dP74h7WPGpcKPl4edo/YKKy6Ak52fVBy6wsOgoSgrlwvGykV6y7+9U3qKr+705fi9
	 nOIfJWrsOt5VjD09txTFFfMvJhoVXXKdaIgb2EctOMmS3LXB7DL5yg5AIs/p1xTH5Y
	 DAKYumrFJRW6GrNtVhwVOPy/sEIEOiu+H/aEtC9Hk1FT9+Hf2R8xNHxXCh5gczhuyY
	 btPEdM8HSBZycbRZl+gieZ59BTVR5UoQkSbV5LlZS/IyHclDbkcpNgt/DXQOAsPIo1
	 zacvCQhIuRQ/kBQcGPSrM0t+XfO9EiGbE1200BSCIkAwA0tJhXEzyf+TRGl6Netk2b
	 G+A8lFgE/ZLqg==
Date: Fri, 16 May 2025 14:32:33 +0200
From: Mark Brown <broonie@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v9 8/8] regulator: bcm590xx: Add support for BCM59054
 regulators
Message-ID: <aCcwYc-P3wnVElVW@finisterre.sirena.org.uk>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
 <20250515-bcm59054-v9-8-14ba0ea2ea5b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rt7h2hlvi3JLefw0"
Content-Disposition: inline
In-Reply-To: <20250515-bcm59054-v9-8-14ba0ea2ea5b@gmail.com>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_053237_075846_9410C683 
X-CRM114-Status: GOOD (  10.82  )
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


--rt7h2hlvi3JLefw0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2025 at 04:16:35PM +0200, Artur Weber wrote:
> The BCM59056 and BCM59054 are very similar in terms of regulators. Add
> the register definitions for the BCM59054 and enable support for it in
> the driver.

Reviewed-by: Mark Brown <brooni@kernel.org>

--rt7h2hlvi3JLefw0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgnMGAACgkQJNaLcl1U
h9Achwf9GfRM59JFB98JmDtCZm0VP87rX1U+t2r3UHaO2db9sYgezOwwkNwQ74YC
YVyyz/WDkhTzez4QPx/p9uDPzxq9sBuM6r6qgHFoz6AkKuzcR666OL/lz37Ugfx/
DFxcn9o/pRIUzbVPTnN1ZCjvLAOvyySSjXi8U+8eMJA13rE1P+gcQHNDfe8xpIvz
iSTTcPO39SY8gkNkUuLqqoItlccqf2SUhCVoQea0bGDsg0RJt/OaF5hKl/IHgVf1
mxILPt3JnkqKIofAoSOi4eAiCmahqn1ypDTOnwBcl0CUiPSozDoXNOpWxjsx9v2l
EE0vR1dvqKD2mRk3Mq0u3UCleLuXuw==
=Z/pP
-----END PGP SIGNATURE-----

--rt7h2hlvi3JLefw0--

