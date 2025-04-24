Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC6AC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 14:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=254mBnsGWoNXTiyYTm/e969GchDFmZEUzrmy8wdFP4I=; b=XudCuEqMghwhr28fkmMwSUrNR2
	tOlrD9xojXJltEVVyL6MbNfS3LO/8R9IvEA1xwynGZ9zAc+6NwkFZigUyU/dT2dtrz5mpn1d2KMsn
	ZrUMFTvqkJ5GUqyXhgGyE0gmyktT1O+uTgqel4/P94gcoX9Lf+wUEACrkrTUeU4aX/9EWPL7QAtID
	924Z1cUJiDiJwEYRd896ODfr43MloYeig980uO5YWAs9jGCSRy47UTp/llkPJuK2d+hHwIqXHWk80
	C6xKcFcLSHttfCK9bQ0yx8LC9ak8SiluhPpftBcGYcJHksjkoEu3HpVnC8pOiIL/HJSzCvhVCWkSU
	jRPdQfkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xG0-0000000EJz9-3H96;
	Thu, 24 Apr 2025 14:08:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7w05-0000000E4zb-0NtS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 12:48:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6343568455;
	Thu, 24 Apr 2025 12:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F40C4CEE3;
	Thu, 24 Apr 2025 12:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745498899;
	bh=ZyGzDPVkf3UyTDfF9skRIcbVvkbOFEY5W64LlARR1qY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ub27Ape0NQbpr7gqj98cAhVIIiVvy4ptD4xnBSv5Gls8QHA3t0TQfFW9I+1MB4QL+
	 c3NdQePo2dTPp7S9BjOte4spLp/8JkqBfKUKBjXd51OT9x2TZz00cx0R3uuqb5ryp5
	 e4z2+kSOpWC0Fr/CbL/S7KUXKZZ7YgrzitBplayrYcZcKmKVfsMU2DeVZo7bUAl4b0
	 nHunG+zTc1k4VDONEORWLx8hj6RdqKlDVD0PZZ1sbgc+qxM+aBDypbX79xBO50rh2I
	 imt3nXAOJcM7HiDXvstdgp9VCoT23QmltmebO4I03okRzK4i1Wz4ZZxMrOp0wDDx+v
	 B9WbhOLVrPqqg==
Date: Thu, 24 Apr 2025 14:48:17 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: pwm: vt8500-pwm: Convert to YAML
Message-ID: <aokv26x67eu3fhkcrtdo4suoz2lryb5x5u4m4xeycwlpgt4njs@7idth75voi4y>
References: <20250418-via_pwm_binding-v2-1-17545f4d719e@gmail.com>
 <yscledgclp2v4p7djwrszbc3dnqifkcofky7rugkcip7o2rmof@xljfd2kfyzzs>
 <CABjd4YxK+4kEeS_tKBi9zhj85y6U1Dgi3nJNuQ8hfkeoY+iK1w@mail.gmail.com>
 <eydewrcn4tviu6fbqmmvhoc2zao3uzrxwwlc55tuxuhfrexk5k@7xg5fdeu7wun>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eqirucv27yhzqwfa"
Content-Disposition: inline
In-Reply-To: <eydewrcn4tviu6fbqmmvhoc2zao3uzrxwwlc55tuxuhfrexk5k@7xg5fdeu7wun>
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


--eqirucv27yhzqwfa
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] dt-bindings: pwm: vt8500-pwm: Convert to YAML
MIME-Version: 1.0

On Thu, Apr 24, 2025 at 02:32:33PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> Nevertheless I'll play a bit with patatt and your key.

FTR, it wasn't complicated:

	$ keyringdir=3D~/.local/share/patatt/public
	$ mkdir "$keyringdir"
	$ git config --global set --append patatt.keyringsrc "$keyringsrc"
	$ mkdir -p "$keyringdir/ed25519/gmail.com/alchark
	$ echo "ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=3D" > "$keyringdir/ed2=
5519/gmail.com/alchark/20250416"

After that `b4 am` told me:

	=E2=9C=93 Signed: ed25519/alchark@gmail.com

for your patch \o/

Best regards
Uwe

--eqirucv27yhzqwfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgKMw4ACgkQj4D7WH0S
/k5qzQgAseTbJVJaProlfqJPevpOIh4z5WhUUKLHvnLH8q7VWBPtuUsN/r+EYbrf
4qLaUawPwuqqlgGGvN9GS7AzeYm0UBJK3aJsIHmjhGEwalDo+eHmW6bOjW3XmgKy
3fncC/xX8zYsX9jrv0jXmwWftkT4314XGLIccB+ZBogMidpCjxmNYsbfd3XXax4C
BqU6klCntKrHHYpPiQ9/qPEROEj12eceuSuu2dlyTkTkMAX2JZYpVYSJMINa5kGx
3kvLt0h3A0x8RqC8itS4rd3DW8/z5zpyaQpRWu4dfx/i1M5nVP2qLV+on4KgcDg9
faofmGB4Qiub7gjlRKoo0B1WvX0EHg==
=CnFZ
-----END PGP SIGNATURE-----

--eqirucv27yhzqwfa--

