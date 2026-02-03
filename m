Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BF5E87855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oYhe8dDtvNlpyrT2WI8oHXc9QY8uA1iM2uNTGW8KnM4=; b=Adp70C01JnehJ2e/sPxIQAvrZ4
	DyqciPd9T7Kf8Oh7uqnvqnsKsT10UJsam4GI80D1e0AGwCTwgq9nr67+cZoE+uJpJ8q33vGJXbejg
	04nY+s/eQFwhtpdVSbsQc26HHxBMq0vA/B+WNwArCnFhe58eFJPA0wQWmgImj8ttqTKdpHZ7iWGX6
	35syhhDtL43CUyNL9Lct4i1X1wgKI5/b59aJSdo1eC/xAulGq/8odWYXXzd6V3IY9t7PneTQpVD6p
	wa3whqkI4hwrg8VZx4/lN9tVQ9uQKrm5n1v3GDlcITi0hZpAOEW8V+QBWAGvQhJNcjQhnkC71clOI
	jlKk5Wlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnL05-000000077lW-1aBM;
	Tue, 03 Feb 2026 18:19:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnL03-000000077kk-0Ljz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 18:19:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A89D60143;
	Tue,  3 Feb 2026 18:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C4EC19421;
	Tue,  3 Feb 2026 18:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770142781;
	bh=oYhe8dDtvNlpyrT2WI8oHXc9QY8uA1iM2uNTGW8KnM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T6wPJU9fcBNS1G8ixyYw7EI2dBsyL6+oDqXyjWP4dYx3yAjicK5jiBb7Hoi/jo5y+
	 JwSBwuRpP0YzyXrndGNqNByXXty0EmIuLsLVd9+RadcELpJ7xr4zG2DCpa4HY5Wsvj
	 9ZoMFJgL/QOemYxSc9BY2iABitIJQV25h8zMgxag9YhsMiL/+CXERs7hhYg0WbsKJs
	 pDkKtGJS0gKRJ7SVM2sp4fGT9N5RyrYHtwZ98o6Hrca86HnHkEQjK+PRe0FLN95fbF
	 dsdZNxvL8m4xzaScnmMn9ca72VmCABTeBIQJDL4ruTCg1UAUHb3fzKw5yto9ELQucM
	 apIaApoW45O1g==
Date: Tue, 3 Feb 2026 18:19:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] spi: xilinx: use device property accessors.
Message-ID: <235729f3-4a81-4b1d-8ce4-c2a394b542db@sirena.org.uk>
References: <20260203-spi-xilinx-v4-1-42f7c326061b@nexthop.ai>
 <849bf95a-133e-4faa-973c-19342afca327@sirena.org.uk>
 <1DCB4BC6-372C-432C-A6C1-B089711CF8A0@nexthop.ai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2e0gAuQCD+J7pxBs"
Content-Disposition: inline
In-Reply-To: <1DCB4BC6-372C-432C-A6C1-B089711CF8A0@nexthop.ai>
X-Cookie: Your supervisor is thinking about you.
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


--2e0gAuQCD+J7pxBs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 03, 2026 at 10:16:46AM -0800, Abdurrahman Hussain wrote:
> > On Feb 3, 2026, at 4:48=E2=80=AFAM, Mark Brown <broonie@kernel.org> wro=
te:
> > On Tue, Feb 03, 2026 at 01:55:12AM +0000, Abdurrahman Hussain via B4 Re=
lay wrote:

> >> ---
> >> Changes in v4:
> >> - Removed patches making the irq optional.
> >> - Link to v3: https://lore.kernel.org/r/20260122-spi-xilinx-v3-1-8cea2=
0e82f0b@nexthop.ai
> >> ---

> > That was the changelog for v3 as well (and you dropped the changelog for
> > v3=E2=80=A6).

> Sorry, I haven=E2=80=99t realized v3 was the same. Do you want me to chan=
ge anything in this patch?

No, it's more just understanding what the change is.

--2e0gAuQCD+J7pxBs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmCPDkACgkQJNaLcl1U
h9Dl3Af6AlIRYHP0eQB/A7CYtmSVJ0OAvt+0gQq0ZAdT3DfA47WKUL/SaSqqkDu5
TG3Kxk68eC0ys9N3tryzti4VyXdSxmUevLe3EDUAAyHMhJl1daIz9WouMdfcoa1d
H54BR60JsUAgS/q8sJ1+l+1oLn3a6I2ePobuNkGGW6W1gB32veTVGgACSpu/xkDj
51kZ8r6TFgPcarzD4JkjOQXholP8IW5DKGXi2ybtuY+DWbb06pISPxQurstSbOMH
NReQPc76d1A46m/l06corm+yPDTgQCRBnlkaivS32APRVgnIZahFv9QIakpoI3a6
Z8WgLTJFZQIEZ2oPQwkva6M2wbfPEw==
=pbOu
-----END PGP SIGNATURE-----

--2e0gAuQCD+J7pxBs--

