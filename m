Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67569C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 16:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2o87q7v5cxxbC7rHNG2GciJlU0cBpq2bf+m5LctGnM=; b=Yg7/tiXf3bHeSAJ/d1khE8Z6zM
	L6PzUVnTYb/7ga6WVgd2aAalUp/xf5ynJNHWojzPIKbRrqsAv13ckbZNPP+OEAeZciJp3i6vu790v
	au2yOk9WcQRZVjZre1S+rmo4R1zPCHOapuvQgjmx3Qkwzz/8ipX4zkkfIKaLf7EdKekwwCR5SoSZM
	tk8Uljhz2g99pt8qLqaDFfjjW7OuFs4q1rCLVqQRKqy6q0iE8El66dSyPoUP6x+9/RjUhwq6OGt1Z
	NiVnfrpqgA+QWbvX8vobQbJ6PxKVwuBWrvVA5GbkmbKZuKKNqMcLgrid07jrBpmLaaDr7dZi+zAet
	FM5YJPbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOVP-0000000AdmY-1l7J;
	Wed, 11 Jun 2025 16:40:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPLN8-00000009wPf-3lWO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 13:20:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90C3F5C5ACC;
	Wed, 11 Jun 2025 13:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9644C4CEEE;
	Wed, 11 Jun 2025 13:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749648005;
	bh=UzJeNJW3RMDMtfEx3QPDFOmM9L8mS8UXAa35yr675nE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pWAs19wN6rphWarV0Tu4IiG2hpeYtuqQPID+BN4Q+yxvw215nxL3B//Rw4we/J+Qt
	 kB/jcQhTiDtdss47vSFmPR8RfX8rsmjk69eHpSZkJUxqDE4Evb55GqZfx+NuT2id69
	 GnJso48gs3GYq3rlnanjsLhMEORFva9HlsaMNwkxb4laTyOJUmRjs1TesWhxjr6J0R
	 qgdr76hmSuWoquQkQ0W6OEdC1Mp2d8oqTRLzNKCoJ9kvNp1HXR1MwgtQ3X869SgeVY
	 SIt4A3XthDtOBQy024bNS6KaMa51B+ytovl6psDsw+pqhJm/Z0GD9AaP4d5eV2PW6M
	 /7hrC0cUUBYCg==
Date: Wed, 11 Jun 2025 14:19:59 +0100
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
Subject: Re: [PATCH v5 3/7] arm64/kernel: support store-only mte tag check
Message-ID: <3a0ed679-dfb0-4b10-a081-db56583bffbe@sirena.org.uk>
References: <20250611094802.929332-1-yeoreum.yun@arm.com>
 <20250611094802.929332-4-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vUy5kMIj7urwy+MA"
Content-Disposition: inline
In-Reply-To: <20250611094802.929332-4-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_062006_976039_2EFC8206 
X-CRM114-Status: GOOD (  13.15  )
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


--vUy5kMIj7urwy+MA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 10:47:58AM +0100, Yeoreum Yun wrote:

> Introduce new flag -- MTE_CTRL_STORE_ONLY used to set store-only tag check.
> This flag isn't overridden by prefered tcf flag setting but set together
> with prefered setting of way to report tag check fault.

There was a concern when adding asymmetric support that when adding new
prctl() bits might cause issues when libraries linked into a program
don't know about the new bits and miss enabling/disabling them.  That
doesn't seem such an issue here since unlike with asymmetric mode store
only mode doesn't turn MTE on or off entirely, it's more an
optimisation.  There's some possibility that something could rely on
only stores faulting but I'm struggling to think of a real use case.
Assuming that's OK:

Reviewed-by: Mark Brown <broonie@kernel.org>

--vUy5kMIj7urwy+MA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJgn4ACgkQJNaLcl1U
h9DFKQf/UVQXyYeS0IFPcj1QrNsvziBeCEJJzwQDnkBmFFHJ/XPZo6wn7iQFHdL4
zhZl4dz2MtmfyONRUsSfxxu15zotZI/oR7jkYXeqLoxflPYnT6iekVPaLESeg6af
duXG5FnmCC9XLQRllCNzTiax8+WY6sHIvopvERPXijaVEsMwQo5lKs9SovoFz0I0
LjerAQARmBHNChjcfzSD2pO1DriKYxG3QqGwCuDuYOmfGru8tqeDC3OaxqRPj0ND
nvVJoUrzhnhamYVA9Y3XK/5oVlmF3niseb2vY6n7H1DORkJnRkxUrna/spVk16kP
hSI5F/qT4iaPVE+W/dCTN4Q0ficqwQ==
=UECi
-----END PGP SIGNATURE-----

--vUy5kMIj7urwy+MA--

