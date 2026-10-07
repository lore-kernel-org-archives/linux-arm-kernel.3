Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C306DCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/gWD4+uF+hshf4jV8IFeriarw2p1293YxmuUXLDiuE=; b=P+EFQGS1yVaERkpWzYLW5/N7sM
	kOLpXSbyznQX6a4jx91W/RKZT8JXcfVzi/kKOMjveYzvTeN22duvHM3PDmMVZCd1zBIwvIhCXWTg3
	yhhg67lTbR0+JJv0Ugbx737P7O7rC80CPBgPICh9yCDNt6+PftdxN9hFUoY49jTYkm7BExFgo90QH
	mWiEB+Z1ke/0o5T+ObiXUeEWliHOrTqdhPTMEoxDoLez9M6zn3x4WR8DeXOtbxD5HQgYbRGwfIGjc
	GE160+FTyksQ6wVPbzNxjph2lf/7Hhx6Q1XazbxAIW2i5FRLApNTQQoEOn/13V5sn1Jxc8dRz4ILK
	dn9hAHyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ1w-00000002MAN-2Fw9;
	Wed, 07 Oct 2026 11:41:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ1v-00000002MA4-0KzI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:41:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id A5458417AA;
	Wed,  7 Oct 2026 11:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id D78F21F0089B;
	Wed,  7 Oct 2026 11:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373310;
	bh=U/gWD4+uF+hshf4jV8IFeriarw2p1293YxmuUXLDiuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y5Op3kvtuJhamiHNZudiMXfK5YZx3gWK24uFJyq8TF70getuQtSg/aOgceLbur8K0
	 mgGEo/ux/z2YL+24acrUdnT/LqmNb0IZm7+4iDyvjT1+rIdJOzD0QLPXnXHQ/ZTcR8
	 5T/kmnrijB9xTFl46C6LY+C1BiEOxJIDsukaNvgnhMSv59ijD0CVWWYeZ6dlLR3q5k
	 R0O84vEb8WuTwgcrVusvhyJCMWyW/lTkQ2vEH84Uz5/AuCwtH11pXNRy3xXZNhen3+
	 XM0LZftPYS1fKHEVnMDY2Y1tiHIxDfJTnyQYZyxB0rQuVEJ3VL+G6aOq9dlNMHWu9P
	 ErLxua++imRQQ==
Date: Wed, 7 Oct 2026 13:41:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Meher Thanmaiee <meherthanmaiee.vanukuri@amd.com>
Cc: michal.simek@amd.com, tglx@kernel.org, daniel.lezcano@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, git@amd.com, 
	linux-pwm@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH 4/5] pwm: cadence: Add TTC PWM driver
Message-ID: <asYvE-ThtZeYSEyk@monoceros>
References: <20261007-cadence-ttc-pwm-v1-0-52a95a8d98b1@amd.com>
 <20261007-cadence-ttc-pwm-v1-4-52a95a8d98b1@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="liwzd3daugmfm5cv"
Content-Disposition: inline
In-Reply-To: <20261007-cadence-ttc-pwm-v1-4-52a95a8d98b1@amd.com>
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


--liwzd3daugmfm5cv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 4/5] pwm: cadence: Add TTC PWM driver
MIME-Version: 1.0

Hello,

On Wed, Oct 07, 2026 at 02:37:02PM +0530, Meher Thanmaiee wrote:
> +static const struct pwm_ops cdns_ttc_pwm_ops = {
> +	.apply = cdns_ttc_pwm_apply,
> +	.get_state = cdns_ttc_pwm_get_state,
> +};

Just a very quick review: I won't take any new drivers using .apply().
Please use the waveform stuff. And also note that there is Rust support
for PWMs, so if you're adventurous try that. (The reference in that case
would be drivers/pwm/pwm_th1520.rs.)

Best regards
Uwe

--liwzd3daugmfm5cv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrGL+8ACgkQj4D7WH0S
/k7WbQf+IdxlXDGnofnNGYSJgNSQuykiiXyUxguphS+V2ZA4vtCi3WPVyShJmJFn
QReubs0MCHoik/W77Aoga7xjD+yAOhark7Qyt5bvBmWnBZVqZ1sdZSxfOibA2PRs
TRrzjc1jtzHuLakyMmVOlgrxVVATfm5TrpR4v69m9AMX5K6gtdvvZY5TScE6X118
l9GXS7XRuu4gTIuudT/NAMOnK2p1ghbX1LFcGQ6fY0wAlayLeoVeC3koTYHG0UQA
9NNkJRpZizPsC2huOWeCCz3+C79L6pa+Wz9Mh8cM6v6dQEIOe4WcnKomw4hW+GDZ
IUFGtSO4+my35wClptMOrsLNs8fXPg==
=KvDE
-----END PGP SIGNATURE-----

--liwzd3daugmfm5cv--

