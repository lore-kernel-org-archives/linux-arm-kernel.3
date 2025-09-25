Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAEECAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 11:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfla3Y1dSOons3njeFEIdGceO7zZYUF9LjcXnMti018=; b=Q5DLRLLIbGPQ4y8IRlwvw+UgRj
	NWSKn+NWt5lsxfXdo1KNzq5Fhpt8pWer126isb9akFdK2YhSm6xy6izvGsM81Gm+D+fSH7u6U1fpU
	M0TRXkG7Qm4VMrD9UKnvdEU/GV+7tWW8uvi9+S1Vomr7LczThBmnYzgO1eLRc3QFIMdhRmoyxhYqs
	meM0XP5/zTPPa5nO2D0ZaBZmUxQKRoaVwGDcxDWU7hBbXJWZIWrqCZ9Oe1DN6Kc1S/yNPkvAhaBar
	eoPu/Dq95F3SjtrnDmGkE+eCWGpRogyb/MLYz2BBrfZVUPy5ZAFZ4R/FlQFJbrD5O3bzFBipCngGV
	UU13fUYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1juY-00000008Q0R-2p0n;
	Thu, 25 Sep 2025 11:13:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1juX-00000008Pzb-0Kyl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 11:13:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A525604FE;
	Thu, 25 Sep 2025 11:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E44C4CEF0;
	Thu, 25 Sep 2025 11:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758798766;
	bh=wfla3Y1dSOons3njeFEIdGceO7zZYUF9LjcXnMti018=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qi/ti6+UFCn/UIlo3PwLexk1yaz/R6xiLWxHGTGD3mB0dB04GgRsXqKVfnRTjk8yR
	 5x3q9UjODw+3r71sYYtUc7xf6xKEPx/0bIYcSMpTafCYt7Fs+TArK9+DDxph/ZcleQ
	 A3HkSq4HL2/jyPqD4TLhqEjhb9hDFSy1hN+8ynZ1SqYLuwkQFiJ16yTF65UiKXxptu
	 GGjSRKJYeTQYCOQ0m+GfXntvJ8/mgOufm7qEoN/kU2rvpX/bqvNii6AxbcY4tilT4v
	 m7xmALPJZiroYgymzgTiBrsbaiPMbpxPi4xO4z6E45wB+PczS7Y3aTUf3NviBcdIdv
	 /S3f///+7Kp6g==
Date: Thu, 25 Sep 2025 12:12:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] KVM: arm64: selftests: Cover ID_AA64ISAR3_EL1 in
 set_id_regs
Message-ID: <bb46cc46-f177-4cc7-b0d0-c7970d8d7a6d@sirena.org.uk>
References: <20250920-kvm-arm64-id-aa64isar3-el1-v1-0-1764c1c1c96d@kernel.org>
 <87ikh7ya8y.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/zaKCw9JkNIMK2ix"
Content-Disposition: inline
In-Reply-To: <87ikh7ya8y.wl-maz@kernel.org>
X-Cookie: Shipping not included.
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


--/zaKCw9JkNIMK2ix
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 24, 2025 at 07:29:49PM +0100, Marc Zyngier wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > ---
> > base-commit: 5db15c998c390efbe5c82f6cda77cb896a3a6a3e

> $ git show 5db15c998c390efbe5c82f6cda77cb896a3a6a3e
> fatal: bad object 5db15c998c390efbe5c82f6cda77cb896a3a6a3e

> What's the point of indicating a base commit if that's not something I
> can find? You should never base any work on top of something that
> isn't a stable tag.

This was due to you having applied the LSFE patch but that application
not yet being visible to me at the time I did the rebase (I've noticed
occasional slow mirroring on kernel.org recently, possibly it was that),
I needed to base on the already applied patch so that I could check that
the test binary worked properly.

--/zaKCw9JkNIMK2ix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjVI6gACgkQJNaLcl1U
h9CWEQf+LhWPmI+TiqBpNhHF4rThKI4mBv/BM3yn+6w5SjGK/aQgfPXoKuBSa8gF
eajZSipUrKXtenT9qN2VJu1n02ahuNh75Issa/SipMwbkjRYseunEUSZoLzfvfaW
5aVqnQ21GIOtoQLj3as1wfVRVMQw/fntDTJBAp+NFQYPh6Iky4TPkgnSG9PTqfGJ
MiCU4IupB+pg+zebaH/fG69j2YHS9kegvJS+E+uLa7vkE0TEsc8qUXvxQz0TSvhU
8e0XJ3GMu3okoXZ9iNxRcVrcuG1VuBruhSG7In9NpaThNs7ilXDF+eTcOVlhDvtO
9FRj1mHPSl4l8O0vp3BzuFgeiR8oyQ==
=IRxn
-----END PGP SIGNATURE-----

--/zaKCw9JkNIMK2ix--

