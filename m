Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E02ACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 12:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9Jf7h1pYTVgGgE9gDXnqDSE3vGFbI0kfL60fK7EHn0=; b=1sfA/ukJb0/b0WRPaAdnzA8QQh
	NWfjkJaCAJRLXIVIqbImudF22Nb86B3TVeNpTVx1E8hFP8y8r7Pc9Uwy4ZWGwEMUsefUVpX06h8ZE
	WpKV0Cu3QQU6Lm+Q66Oj4T/Up1nPWNkFPg/jbQV9yJDqlpTr/9x+G4lTHEu8w6rQuJrBplFW8FacJ
	aKc4PBucvCmAZo+ijZgSUumYJBt91GAyE6t6titP7onwFyZZg8pyIDHx/Z3K4emiaBvWiEo47VhJN
	gsKtpri8wtXbjutdXqkMcdMY9dcRoXzwlAaKeSBYUph2h94IAfiXff1pmY55E2drxtPt8QDheHHsy
	G2KLN39A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIn7Q-000000078a6-20MT;
	Tue, 11 Nov 2025 12:05:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIn7O-000000078ZV-1EF1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 12:05:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8237C43AC6;
	Tue, 11 Nov 2025 12:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E004FC16AAE;
	Tue, 11 Nov 2025 12:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762862701;
	bh=Rj/Ffz6hWZOnKL6lUXw9bBydLKj+ya5olampmLUhD6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IRGCfqeXtVbKlLi2wEo2Z7mqPczPhzbwL7YTnc98QY8J945F4mXyyWYWtqKq6TPfs
	 K42bkkFxokP+VQvg1yp/8D8naqmI0qlvRJhYOpY4rmdXGkdq5xen9yxhOQicqJp9dK
	 8+0ChkZ9Yg2euz2BtNXsysvp4TRRQKW/MRb2B7xdEuZdETAJkMd1Jlw05cpF18sSPp
	 bnqy4VGAIqZhwjMLWcVjTTvNXkKK0sWw+hOCzW3DdrDxzvt/YQl/nDf8SyEp60MqA4
	 70UmESZlEzt3X70Rr0ChfXLa2MWKnracGfrOFuUlnXXHeIp5/eR47/0+VNFzYgGPjA
	 YEQ3MKbWsOPcA==
Date: Tue, 11 Nov 2025 12:04:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: Finalize ID registers only once per VM
Message-ID: <aRMmaLBxLI025Bpe@finisterre.sirena.org.uk>
References: <20251110173010.1918424-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="botkdb13y08NZZbR"
Content-Disposition: inline
In-Reply-To: <20251110173010.1918424-1-maz@kernel.org>
X-Cookie: You dialed 5483.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_040502_353832_4DBF3120 
X-CRM114-Status: GOOD (  10.27  )
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


--botkdb13y08NZZbR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 05:30:10PM +0000, Marc Zyngier wrote:
> Owing to the ID registers being global to the VM, there is no point
> in computing them more than once.  However, recent changes making
> use of kvm_set_vm_id_reg() outlined that we repeatedly hammer
> the ID registers when we shouldn't.
>=20
> Gate the ID reg update on the VM having never run.

This resolves all the test issues I was seeing:

Tested-by: Mark Brown <broonie@kernel.org>

--botkdb13y08NZZbR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkTJmUACgkQJNaLcl1U
h9DYqAf/dM6FdLxmhP9fECQFCQKuAMwwwUPye6YkHnpfFANgWBy4Hz9Wo5el5bfT
olCIEzv7zloQ90R5wFf5TvfbdToJNUAwwbosgLOoyPXFT2XDsnT6gyl4mO3Q52nd
zM0zwhZR9/1DAXr305wyhtYDdbWXaM4Q/t+CzBQEB8ad1yI32GTBhDjciAfHdPm+
K6PDHYFGn6ZSCie6e/WFAPOU+AKp/Crl6AqxxlFkytXKW3f4tpw6Oon1SJ0t224N
ssAUc5ZAtTFcGY2vSSDsAANZnj2y9tWLAMzisJp/kBFIrIlWbEKd7mj66EBnVa5r
J1AzIEzPcyyel+JUqEkqagQ3nKkZJw==
=V3rN
-----END PGP SIGNATURE-----

--botkdb13y08NZZbR--

