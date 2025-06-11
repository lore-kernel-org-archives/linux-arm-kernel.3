Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11630C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 18:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRDHd0SMxDu8sH1wYotu8sGdz7yzIzox5QZKJm1LQHw=; b=nhezvv2gSNexnNnx0Y3On5Nude
	iQIAnTw0q8zV7Co0FynBsbcqIUZqS6XPdExrz3kTsCezs32nkgjoArmSGkfnWYieQkU3OMYVwSLQU
	mtHSwL8v5ltxcDCAzZXphJAF+AlXfHNP4Z+/MI46VkHLFxENemSkL4KB9XseyMbx5Xfig5mFNyTrg
	l6kDHioA1nb8aXroFdmDEcyrFkG5oyiCOFG1JRzXByoMaXRzIEZ1PpWIgF5MxQDuymtYisGa6FwSV
	AvaIUbVYcpw+7bW6VwDyL2QP7aGnIlTCB7UDyR2maEJd4adxVwIaUtXtzy/3IJxGNU/LBTWFuJfJD
	e7sRMNZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPkn-0000000Anke-1LVH;
	Wed, 11 Jun 2025 18:00:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPME8-0000000A4O5-2Z63
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 14:14:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E92843663;
	Wed, 11 Jun 2025 14:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27B6C4CEE3;
	Wed, 11 Jun 2025 14:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749651292;
	bh=cRDHd0SMxDu8sH1wYotu8sGdz7yzIzox5QZKJm1LQHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mCmuawChcdqRdwAkPm4jhPIy665Rxx6TdREd5RlZDR5ccoBbKUFGQpPO/Hgzy2J7+
	 c1lwCZn9Ui/z0p+lFGcoDCxz9xmrsPIPPqDfUF4rzRRckdn0y9UKI1EwrR7aDa/+8/
	 EtwxYhO27sfSo+he1rtJQNCuxu7bj9mWM1Oi+CDOxyOV2Z20SX1T0E3XafYUAi026y
	 aEqteOH2s3eT/TYnHVUK3mifK+CD1DXRVmJ6Ik86vz5vP7mRZdnzHsWBWsflpgdjox
	 H92WsTBhkMWzGQZVun7SIQ+kmv0GwF6xL/eJeer8bC24qfF1xIgi0OqsESU++2TsIF
	 Sq82BLwmrIiRA==
Date: Wed, 11 Jun 2025 15:14:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	hardevsinh.palaniya@siliconsignals.io, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/7] prtcl: introduce PR_MTE_STORE_ONLY
Message-ID: <7f9d8b40-3e01-4d83-b6e8-0cb2cdeb8fd6@sirena.org.uk>
References: <20250611094802.929332-1-yeoreum.yun@arm.com>
 <20250611094802.929332-3-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WLkaznFp6D9YkjJU"
Content-Disposition: inline
In-Reply-To: <20250611094802.929332-3-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_071452_665523_4BDC3FB8 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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


--WLkaznFp6D9YkjJU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 10:47:57AM +0100, Yeoreum Yun wrote:
> PR_MTE_STORE_ONLY is used to restrict the MTE tag check for store
> opeartion only.

Tested-by: Mark Brown <broonie@kernel.org>

--WLkaznFp6D9YkjJU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJj1QACgkQJNaLcl1U
h9Bw5Af/XdFp939N2wucEqYWmTgJRZo67n99s5HUufuQy9VuRp8hvczjeAs6Kkx4
GxXiaPopZ8T4BbO4Dcg1jX/NcHqJn7JATKxyQqYXsxOZHD08QzPJhdNNakfX4DjO
4/YbkM9X8uM+cI1kcyFsTHSpmkx5gppfZS9ZfKUoAPHEg8xlQVrWYjn9z+5bw/Q6
5IWN57yGPSalnTxCOwC9w9tPRNpiDpoy4/1odxFGTmH6UsYABrfaprcBJjGm2t6O
5SLrAW8VNJrnDbIezM92Zq3GEa2cLUUUJLs4mld5Z0gGbgL/XfJglpPzrfX0p7rl
oN0TrmhTKHyH+xS48CG//DZ5mvzVqQ==
=1ld8
-----END PGP SIGNATURE-----

--WLkaznFp6D9YkjJU--

