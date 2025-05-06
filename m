Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31E1C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 17:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TSz1OWm0B5U3QCt1Nt1q8Hqzz1qhQA6Q1C1IkoBljI=; b=3fHdy7RF63SA/pQ8Cj7GF3DQg9
	2W2QclZyAhbCBmckd6UgBfIcNy7h21QCEIpNR6bIbS18JCpK0u7z+zeGdLk3R0vT2x/A/0A1Nmp3V
	PVfdNUyGFER0RO0tqHlOW/UbejPtMeXAg14jQNgBhbDdU2gr5oGcyOHHZrmemKn9aGHrw1X93YvL/
	bUC8TQTT6zPfGSG/iLSHIDOP5Vgc/TVEkp2/V3cRnhxWI59YLq0MLTVn4x/LXoVXpkVkrfRAuv5Oo
	wWgFy/fHkYYPnHVVn581bIfTS47+nyZYBkfbgNGFKkvsjxDkgr67eEGzlKz/BOVeYn3dKxbCsgQKW
	vghfzJQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCM7Q-0000000Cr3q-1aX3;
	Tue, 06 May 2025 17:30:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIRe-0000000C8zu-3ZI2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:34:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B9A9615F2;
	Tue,  6 May 2025 13:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998EBC4CEF0;
	Tue,  6 May 2025 13:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746538490;
	bh=8TSz1OWm0B5U3QCt1Nt1q8Hqzz1qhQA6Q1C1IkoBljI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZHYlge8tiqB+KlH2m3iRRIlcW7oOd/GawTHhbnZ+dk0CxjR3mJWg0RE6AV/67UzCo
	 /YZnGumJzlndLhFE2rAYRGtmADQWML+p9FRXUERZAcfAJVuZoRe9cpjYWZZgOw2891
	 ksLpNZ2Gv5QKZrNGK+ICKHjHIK/AWW4b0OVruveyOiEo+wUYz3MLrdGaNifobskq6p
	 QTm7dCkHVd2CRO7tjJTmWEoTeqspOcvpZlQyaZBdsF40U2FoVEz6HNQySfvfTrZvSj
	 ORTvxKVIYdyTiYt8bf1gdM+2y5W55ahX8Df/Te4i91ZlgARJ+YB8ibDtYg5uC3CoIu
	 J1qxGaOU3VQJA==
Date: Tue, 6 May 2025 22:34:44 +0900
From: Mark Brown <broonie@kernel.org>
To: Florent Revest <revest@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, catalin.marinas@arm.com, will@kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	akpm@linux-foundation.org, thiago.bauermann@linaro.org,
	jackmanb@google.com
Subject: Re: [PATCH 0/4] mm: Avoid sharing high VMA flag bits
Message-ID: <aBoP9ILEv-z4bRAQ@finisterre.sirena.org.uk>
References: <20250506095224.176085-1-revest@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WfNXS5zD4YMjIjfy"
Content-Disposition: inline
In-Reply-To: <20250506095224.176085-1-revest@chromium.org>
X-Cookie: Well begun is half done.
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


--WfNXS5zD4YMjIjfy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 06, 2025 at 11:52:20AM +0200, Florent Revest wrote:

> While staring at include/linux/mm.h, I was wondering why VM_UFFD_MINOR and
> VM_SHADOW_STACK share the same bit on arm64. I think I gained enough confidence
> now to call it a bug.

Yes, it's a bug - it'll be an add/add conflict with those coming in via
different trees.

--WfNXS5zD4YMjIjfy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgaD/MACgkQJNaLcl1U
h9C7Dgf9FVH1H/mNg1egXWX9AKNdUe4P0CABXFDY7Ba+WHdeijmIWGjt+SIVmg86
oECww6n5j8RUABEu5Rjt6gR9sV57kB54ytlT30XDu/WgjAXEk/qVSsKurhzcv2og
9o50N5VpiOxRQEH2SundwnJLdoe/B+4+/ONS+T3XZIxo0UGvIrf2ltoNiV3b5K9X
86d9rBpZoJyftPCJcskFBzzYSIgw+CTMnaINAxBE70V6Cn2vOsqdDsSiecHRV/jj
V6HuFUh7oCGvxNf64s+CgWCKQYbuCcQVGtYU8s9D3KSIKsQ0ghtOpoGJxoGKq3Rc
+ic+5Ul1ak/mfMfZvoBSp4FAjZeddg==
=YB//
-----END PGP SIGNATURE-----

--WfNXS5zD4YMjIjfy--

