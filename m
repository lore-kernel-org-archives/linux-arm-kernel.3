Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC867C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8EuB+xwdBiQ3yRsV0/rIKejmsH9u9MdHF8N5+qFAzg=; b=zY+K5D/BDWF6T588mEb3u9CjBe
	V5SYlDxMVL6X4QBSM2qathpM/GxWsq9n+2JAkdNgHMAKgKjHVAMpgBJMuUc87voXtDPwKvptBbsvm
	YxuU+ohgJajz+L79IhWUd3NjSf5nc0Qrx0hkHMBd3k8iWLlr8p35/KA2AVnLKO8pKyFtBG43VL1fl
	GOSCS3AiwFnS1M1LJ5uhJutaOX/X6C9mPis0INQwMkWDNdKtJC48H6uLI4p5Xobzuv93V/SvUgWT0
	KhH9Hy5t4+3J/mmd3macJSUXG+r87HqZ3e2kZoiiDNOJShSZ85KrmOLkvyJ6IqUbaS4dxlV+DPR9P
	eIVB0uHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oMA-0000000FNin-11cz;
	Wed, 02 Sep 2026 17:02:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oM9-0000000FNiO-0N5M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 17:02:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 79FDC43941;
	Wed,  2 Sep 2026 17:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159A01F000E9;
	Wed,  2 Sep 2026 17:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788368556;
	bh=r8EuB+xwdBiQ3yRsV0/rIKejmsH9u9MdHF8N5+qFAzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FaW5qLroJgZhCyK0BQQx/WuLJIx2VmI4fpgSiaX0ifyLF1ANFcjmOQPKqwryEEOoC
	 5wfQ9qJaStKFbjSfO4Hh2aGa2TPOzBjS6rXuQOzB+rnm27jQWJYSqWeufKnopDiWmt
	 /zm1tIxvN8QcPLR1gfvwA3lBB9RvnQzN4Ieii7gk+jOnhZgMIpRAVnIF3Z56YAUpvb
	 vJmnDwR6QNNQXn0DrLLkbU33scYJaPedbf96ekQVm6/J0gU6S7J+RRjpKIkl2Q3OEp
	 48njzjuOkZOH7J6WNZFefd8IFI3XZowRfqd6iffHQsuMMkPHl+U6ZqIY94fs3DYOGj
	 m9OgmuvpTvFpw==
Date: Wed, 2 Sep 2026 18:02:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
Message-ID: <20260902-astonish-revolver-8941f0c60e60@spud>
References: <20260901-t603x-spmi-v9-0-09e702e3b153@chaosmail.tech>
 <20260901-t603x-spmi-v9-1-09e702e3b153@chaosmail.tech>
 <20260901-clapped-fled-2ae6126df5cc@spud>
 <F6BE1957-CB62-4D6A-ACA1-1521A14A3E23@chaosmail.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QsaiTKcPGEfme9KB"
Content-Disposition: inline
In-Reply-To: <F6BE1957-CB62-4D6A-ACA1-1521A14A3E23@chaosmail.tech>
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

--QsaiTKcPGEfme9KB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2026 at 08:24:19PM +0200, Sasha Finkelstein wrote:
>=20
>=20
> > On Sep 1, 2026, at 19:41, Conor Dooley <conor@kernel.org> wrote:
> >> +if:
> >> +  properties:
> >> +    compatible:
> >> +      contains:
> >> +        enum:
> >> +          - apple,t8122-spmi
> >> +          - apple,t6030-spmi
> >> +          - apple,t6031-spmi
> >> +then:
> >> +  required:
> >> +    - interrupt-controller
> >> +    - "#interrupt-cells"
> >> +    - interrupts
> >=20
> > else: false?
> > Or do the existing devices also support these?
>=20
> Yes, they do, we are just not planning to use that.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--QsaiTKcPGEfme9KB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaphWqAAKCRB4tDGHoIJi
0kYWAQDCaly+eWPzS6GEIOlVd02ekQEv+WMJFDuYSDVpupn9pgEAz5H9mytVUf2y
Guy1zykFRTknUaIwH5FGKrb3QLC7QgQ=
=FNAi
-----END PGP SIGNATURE-----

--QsaiTKcPGEfme9KB--

