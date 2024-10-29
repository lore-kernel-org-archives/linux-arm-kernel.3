Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75022D3A690
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 19:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMZ5PK6nHavpzvrlDGaPVOAewZtUCMGts1ESYOM+TpE=; b=ekWGFtRKNmlF1/yOmi2F5K1IJq
	WhYI2oXS7N9DKHqhKxFh1+aP4w8hzq7NGTAngxTMAy7hX4+Uh63u/r99W6zJtC7lNyVxMKrfnsgce
	Wvzj9YXP1KCBWo7jW7sP+e2w6Sd1qBAtgWsmt2yJtI/1sih09Di20YNrWEvrq6pjBA/c+L6yN/Gon
	LnaeCKDk0ESsm8pAU4/danuqMuTvFS2Cn8LCStjvcDgx79PGEI9zxhOQLC5Tym/IUku8qE2eso+ry
	joJ2bZZiquEsySD/jE58wc7BkS4V7eYxZCRY8roVcE53DgC5I9u5TLeqr5BythDgWqVGuPT9dKrJ+
	ahApwn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rVb-0000000FcFa-3DQ0;
	Tue, 29 Oct 2024 19:04:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rTH-0000000Fbg3-2cVj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 19:01:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D8B89A432A6;
	Tue, 29 Oct 2024 18:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBD4C4CEE4;
	Tue, 29 Oct 2024 19:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730228498;
	bh=Vh6G+8uwL9uUOhvODAwVdWDZL/F4D+Frm1lZVOFHCHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p4vSj3Oov1VK0ycqbj88Tprzv8GWpeSYgx4q3BPI73sQDVdT0D4NCWH4rS0FlShxU
	 OnwHuLhX95JSvX7+SbZmrPQBcGynkzjdOpIej32blGefWmR0IXdg3SiVKvCRaM8I2U
	 ZVC3ZKe/ukljcJWgtVyK5b1r3odbMv1nvyGGsubFSyl51D0CVbzv7h3V/tpG8BjPh/
	 +U7yuGclZV8lHd7IMKpfhEXv0CawSsmMkMCGXpNoT0+itAsW9N9qEcFDPsxUpOs1uN
	 mmhDMKKj7HjeAUcy3biVkq9yZopZGuGrDbtJI2dP8HgTx2xadQZf3HamPiDp3R/5ZP
	 8yYvihQKxgYTg==
Date: Tue, 29 Oct 2024 19:01:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 8/9] KVM: arm64: Allow control of dpISA extensions in
 ID_AA64ISAR3_EL1
Message-ID: <bc0998d2-fc06-41e5-87aa-25a963947800@sirena.org.uk>
References: <20241028-arm64-2024-dpisa-v1-0-a38d08b008a8@kernel.org>
 <20241028-arm64-2024-dpisa-v1-8-a38d08b008a8@kernel.org>
 <867c9q3lkj.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4Vm6UmZvhyOSk+XV"
Content-Disposition: inline
In-Reply-To: <867c9q3lkj.wl-maz@kernel.org>
X-Cookie: May be too intense for some viewers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_120139_762790_27614882 
X-CRM114-Status: GOOD (  11.63  )
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


--4Vm6UmZvhyOSk+XV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 29, 2024 at 04:45:00PM +0000, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > +	ID_WRITABLE(ID_AA64ISAR3_EL1, (ID_AA64ISAR3_EL1_FPRCVT |
> > +				       ID_AA64ISAR3_EL1_FAMINMAX)),

> Please add the required sanitisation of the register so that we do not
> get any surprise exposure of unhandled features when someone changes
> ftr_id_aa64isar3[].

Hrm, right - sorry I missed that.  The other registers I was looking at
don't do any filtering.  This feels like something the helpers should do
but that's simply not how things are structured right now.

--4Vm6UmZvhyOSk+XV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmchMQwACgkQJNaLcl1U
h9BBIQf/fJ4ZRG5K2io8YpnuhLePrlnfVtSz0vdMqL26hdM384DyHOtHBnj7tobz
wcMxqJtvV/+nwxaKpTfaJwtriyBqlYLexywJpttHwplCdDoS6DKLAssSkoE5Dlge
RqqtygC4CbFgdwJ54vFke5Ku97EJLhKvEWCMGPKgM7KWXR56f5FyipMzhJDDGkRd
ZP5cCMs0b0vocUbd9URiNhDL28tVUIWLOFarxRwFnlbIDiuedEvyrtaBKh30Mw6o
nb5KPJ8r5N8V8ylHTrFlGmIWrpMTFVLqhYrdc1SBr2wL/fZ8xAO3UkAL8AraIbMC
i9whjaoox3OTBniFy9I7+95eM3Z/lg==
=y7Ds
-----END PGP SIGNATURE-----

--4Vm6UmZvhyOSk+XV--

