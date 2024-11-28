Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D41D70DE9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 17:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26Aq4ZaxkboOkjwursPiJrPZXJhOAiBZuFn+AEls1yQ=; b=G+Vl4/GSpgBa35Vrka1Q3CxAdL
	3G1XVNRJpiQbche2rb5qIuTix773dJBLquhU0QaDEqvip6UNPsGObaqG8U3ffcX9dHYzFCNEnwt0S
	e9eM9OiNk8oGqrvC56+XWYUFIZM27mcaXVSAs3LU/JVxLqPx/qiU3hJ1WyBJ3QSv09S/3Cpa7J08I
	VAoEdhDB556X70MKK5TqShhtp79eNKalX0qvtZmAMK6QvnSLGC0XO1kjSMRjcgKtXP6IzGYLed6au
	Xq8RzhsLN4OX85lqvzJfljghYEt/z8Wwxm9j3aVYhMunxS0GlMJU+puECL38USR3BsLeWeN5Tbflq
	aZMPNyuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGiRr-0000000G5UY-015N;
	Thu, 28 Nov 2024 17:37:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGiQs-0000000G5Pr-3MBY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 17:36:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BA0A0A43C7D;
	Thu, 28 Nov 2024 17:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874C0C4CECE;
	Thu, 28 Nov 2024 17:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732815361;
	bh=26Aq4ZaxkboOkjwursPiJrPZXJhOAiBZuFn+AEls1yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lg2yDZalnDYUTgDUDfap6cfQPi7A0ApkIxTIZ2nlyYSbS+D7XFE10sGtMzDB6E/mW
	 X+QK+Lrggc8nZ+pEtKUhZ6+3kRBiUEgC013flKA+/B3MWI7IkkDsTrVaMUk3sSnEIQ
	 KokgaogtNxIloZiVjP7xNMNMhNLRLqOZOuvUOyf253yUZwD7GQxeZRb31MT0O4AkEo
	 BtDzpBX+8AERCNvkypyIkimYQATFvi3y6DdEr/7kpQGY7YpTWYPY3zUlOOkWUU9Y3a
	 75/NCJp2wdXVm4W419QCBxkDAXzkxlLdmlDY9ASlZeS68oPRIQ3eunPqVMkNIq8cRs
	 0EfvtnlFluezQ==
Date: Thu, 28 Nov 2024 17:35:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org,
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, qperret@google.com,
	kristina.martsenko@arm.com
Subject: Re: [PATCH v3 00/15] KVM: arm64: Rework guest VM fixed feature
 handling and trapping in pKVM
Message-ID: <137ae0f1-32c7-4856-9357-00493995a89f@sirena.org.uk>
References: <20241128123515.1709777-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+UK7DtF2N3FgCqnU"
Content-Disposition: inline
In-Reply-To: <20241128123515.1709777-1-tabba@google.com>
X-Cookie: Close cover before striking.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_093602_913591_E77E682A 
X-CRM114-Status: GOOD (  10.31  )
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


--+UK7DtF2N3FgCqnU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 28, 2024 at 12:35:00PM +0000, Fuad Tabba wrote:

> This patch series redoes how fixed features for protected guests
> are specified in pKVM, as well as how trapping is handled based
> on the features available for the VM. It also fixes a couple of
> existing bugs in the process.

Tested-by: Mark Brown <broonie@kernel.org>

--+UK7DtF2N3FgCqnU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdIqfoACgkQJNaLcl1U
h9Ahnwf/RXp6E2oXvmFjv+NBfMZiMoVnatZ8caqPgnXg3+GBDJnpTL758vHDQZhy
nOCeDC06R4dn2ZyFvoWswcl5tBy6vORO88rgWycarzzUUdBoGoSk8tySA5QbKSnk
GM61J75SiZfrtKt8C7WefoUZb5o+EKN8uulUfqwbG601KtIeqtIeh6XQcYG/0FSQ
5FnbcH09p8BDtFB/wK171+5HlG2h80CIffO+RdUsI3Bjfz6+xjVPXZHLb1C43uPy
PV6NzfIc4NNLbIDtdtp7KCJO+5L1DZ2Dqr3WUfEJjEUsSZgEU9ETs4ZRcc44xGGK
pHjGvk+9pXNvpcr0AbjaJEK8YOnLbA==
=v6vt
-----END PGP SIGNATURE-----

--+UK7DtF2N3FgCqnU--

