Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E677C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 07:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNh4O5caSx6jmO3mxlqusQXtE5knpPq+iiQ+Jzf4Ivw=; b=JWTM1hv42luEZOBvDWKWJRW0Tk
	JjKxBPN62+pJEr0sd76Sw1xAxMb5cgrek7su4rzc/nff1Smh8GbTq3k9orLSvIkBSdaynf16qj8HD
	v3rcJkmjPmBQE6SL2Huvk6ja062NXQyr2GEkr1/eICvmMtXtxyrRwrNvTuh+ZOqubzE2jrZWb9ra+
	14Ml55QKnV8llqJSMstA4rFzTM05qr9XpUcqqBdFtzc3XsZ0N+F4U56HJAk3XlYZ5cRggIourvk11
	tmyhQ+TOBQZTR77fbGeMdsWklq48XqCMzii75yoDb4mn0Ze3wllRPMm+WvLbmrb4gyuowuZGZoCe7
	oVR+Ru9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qfM-0000000D5HC-2Moi;
	Thu, 24 Apr 2025 07:06:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qAq-0000000D1BY-0rcv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 06:35:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CB9F43AC6;
	Thu, 24 Apr 2025 06:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D49C4CEE3;
	Thu, 24 Apr 2025 06:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745476501;
	bh=4gClZZchBPS5nWHetbxzyLcECQQe429cDxgXba/S5p0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aIJ4L+QrkTELRIRh4kjqs0BHkuu80qMpSFBaEm1F0cenLZJb0F7MyPPfUTFUP6yRM
	 bYzv+IwctnllFt/Ka5OA6W80dGA9tERFTU9XDKvtmOX/DPwj9Li+821K7qHCl3CuQa
	 cYjm70RTgYtq/V8oUsZS/Y+CibOu5KK4kBZ9sD4AkZrANZaFvQNmvctdx3n/lcsRje
	 VBYHnJWBcsRNFllxDffEerx4EwjrFYdOXOHsJP6hroDwE/4x9S5A7+qXmKNQC5FGGZ
	 z8cVTIiB62kmBd6M6Nz7o6ysDMcNYhp671krnng45ePVcNpmknv+TDP17E9axLgHe/
	 cBq6efIzoyVfQ==
Date: Thu, 24 Apr 2025 08:34:58 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: pwm: vt8500-pwm: Convert to YAML
Message-ID: <yscledgclp2v4p7djwrszbc3dnqifkcofky7rugkcip7o2rmof@xljfd2kfyzzs>
References: <20250418-via_pwm_binding-v2-1-17545f4d719e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qhetb3dose7tjp32"
Content-Disposition: inline
In-Reply-To: <20250418-via_pwm_binding-v2-1-17545f4d719e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_233504_271901_797A0F3B 
X-CRM114-Status: GOOD (  13.39  )
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


--qhetb3dose7tjp32
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] dt-bindings: pwm: vt8500-pwm: Convert to YAML
MIME-Version: 1.0

On Fri, Apr 18, 2025 at 06:55:07PM +0400, Alexey Charkov wrote:
> Rewrite the textual description for the WonderMedia PWM controller
> as YAML schema, and switch the filename to follow the compatible
> string.
>=20
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Split the series from v1 into separate bindings patches so as not to
> spam all the subsystems with unrelated changes, per Rob's suggestion

That's a good suggestion.

Applied with Rob's R-b tag to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

I saw you signed your patch using PGP, which is great. However I didn't
find your key. I recommend to make it available on keys.openpgp.org like
this:

	gpg --export alchark@gmail.com | curl -T - https://keys.openpgp.org

and then verify your identities using the link in the output of this
command. Still better, (additionally) add your key to the kernel keyring
(which however requires you to be in Linus Torvalds WoT, see
https://korg.docs.kernel.org/pgpkeys.html for the details).

Thanks for your contribution,
Uwe

--qhetb3dose7tjp32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmgJ248ACgkQj4D7WH0S
/k71GAf/cV7upSehxuOa5yALPuIkS68mnMURiVpePuIYzsRORKndFKnxWyqUXbFW
RpbACn/GJCb21cf9SV5Kf1UtDUszG5rzJvy3se0FUoq/z5YFc9E+xaXKjpn8Ihet
XX7sv7UPi+gGHKzztpiDpUXCmOHbWPf8kp4IvvjMyZdh8tr4Nv3P2WuhMdGak28+
DINKNuRrqnZL/A1VblAwbwhAPCVpGSj5xpfQa97Gg6i9Xc1tzVdujhlt9d5vl9zT
THzXD7o1if4I4KS/P99qpUmJZO3sFwXfiVA8u/xNfcgEY48qhUGHQt+QuF20qCJC
KU9yOZDFmT+Sclw4+G8KTxI+uaSp3Q==
=edGU
-----END PGP SIGNATURE-----

--qhetb3dose7tjp32--

