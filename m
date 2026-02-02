Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE81E7DF11
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=foeRVFWuQzMNDcyrjqNWunUCm6DHD+y9yvlBwjiz+cw=; b=SKPLXRSCbR0G8JRqpnPkwnBuT9
	Uuu0A9KsOfnhy3Kdvn+CwUgTyZf9UzFlFq/iqUF4ar+NeUpAVaGDeDvXDE/3k3lkYISUsEq2uGJle
	WEoNWGhNxT82s/u/NLouHpYIqorustddyIjXSA70FL9HrdmQIasZNnkeXCxlMcCkqeJJGMPhuyZwv
	MzVNtj39mtzdHWlV2c+/9nvcsm1dXJeMoXWuvIt0IoBNUbbEv7qvp+burwzS0CeoBOojE6+UbN2ri
	wEHwYGR9vg5IwfGgOXy2AN3dkWhU0Dgc4MOZYbEZE2WO6JUMTmeyumZWTf9hz3ksWiwVy5LsAKKnT
	LEBntGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyFB-00000005Ock-18rm;
	Mon, 02 Feb 2026 18:01:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyF9-00000005OcO-22Vu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:01:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BC8E541900;
	Mon,  2 Feb 2026 18:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4984CC116C6;
	Mon,  2 Feb 2026 18:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770055306;
	bh=Q+HGkIOAkSlkxkzWQ67n18RZvloHmIsyR0HqYnUNBiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IEZWzm0VVPzmX6yGzTUj9Tl532/y41Mv2Gx5anPMJ3n4Vv5OfZzytqXZ+0xhrtT3U
	 4Dk3sFwwS9ilT7W+d+FSPJnxhSAZK3GhLQNLoFTFGD0OtpFQJ5Yp+73NALJio5i23s
	 9Nua1iOpDBV0JvNAunSJhkPbPx1FN5EKlpV5QE1SX8u5O6gMz+Xy35QXOA73u/5w9N
	 yFVVCD6kfDxD8n7HmFKNa7vW91vuzivvS9NZJdda4JzfN6KWHzdi7XTVt/VnHfLXoP
	 ZH5IqyXlM+GPZGv1fiahHuZF6WfFkAhptCtQYN1+VoIoHW7JwaX+b+qWC+LOQz0X4s
	 M8nc6+/bxarQQ==
Date: Mon, 2 Feb 2026 18:01:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: arm-mail-list <linux-arm-kernel@lists.infradead.org>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: inconsistent SME2 ID register fields confuse kernel into
 reporting but not enabling it
Message-ID: <6731ba86-cd65-4d5c-9ee2-55aa59094eaa@sirena.org.uk>
References: <CAFEAcA9yyLBa1Hp-2CrSsHBOBcGKSg6Rr3uvfZPckcRsTXDC8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N/BTGxtXPxBHmZXY"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9yyLBa1Hp-2CrSsHBOBcGKSg6Rr3uvfZPckcRsTXDC8w@mail.gmail.com>
X-Cookie: Bedfellows make strange politicians.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_100147_588989_E35711EB 
X-CRM114-Status: GOOD (  23.67  )
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


--N/BTGxtXPxBHmZXY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 02, 2026 at 11:37:46AM +0000, Peter Maydell wrote:

> I noticed that if the CPU reports an inconsistent set of SME2 related
> ID register fields, this confuses the kernel into reporting it in
> hwcaps and /proc/cpuinfo but not actually enabling it (so userspace
> programs fall over with SIGILL).

> The immediate cause of this is a QEMU bug, but Marc suggested that
> you'd be interested in this report for potentially making the
> kernel more robust against it.

We do have some cross checking of ID registers in the kernel, though
other than big.LITTLE consistency it's fairly limited - mainly for cases
that are architecturally valid but unhelpful (ID_AA64ZFR0_EL1 indicating
SME features on a SME only system) and those where it's part of the
implementation of an ID register override.  Mostly we assume that the
system described by the ID registers is joined up by default.

> The repro case is to use a current head-of-git QEMU (I tested with
> commit 587f4a1805c83a4e) and tell it '-cpu max,sme=on'. The QEMU
> bug means that this gives you a CPU that generally reports SME2p1
> but incorrectly has the ID_AA64PFR1_EL1.SME field set to 1, not 2.

> but the code that generates /proc/cpuinfo and the hwcaps must
> be looking at something else (I think ID_AA64SMFR0_EL1.SMEver) and
> not cross-checking whether the earlier probing enabled SME2,
> because it reports sme2 and sme2p1:

Yes, we use ID_AA64ZFR0_EL1.SVEver and ID_AA64SMFR0_EL1.SMEver for the
SVE/SME version hwcaps - this mainly falls out of the fact that we have
those for the point revisions of the features, plus the fact that we
didn't do anything that prompted a bump of ID_AA64PFR0_EL1.SVE yet so
there's only SVEver to look at for that.

I think we probably should add an explicit override here since we
support command line overriding of ID_AA64PFR1_EL1.SME so a user could
set id_aa64pfr1.sme=1 explicitly on a SME2 system for some reason which
would lead to the same invalid configuration that qemu generated here.
This gets a bit annoying since we've also got the various subfeatures
which will have their own dependencies on the core SME version, while
things that don't use any new architectural state probably aren't worth
restricting anything that interacts with ZT0 would be unimplementable on
a SME1 system and someone might reasonably check only the subfeature
capability and assume that SME2 is available based on it.

--N/BTGxtXPxBHmZXY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmA5oUACgkQJNaLcl1U
h9D4xQf/Yest+O1Ww8dUk4tDDnONJfgPzG7/YN550/WqeWOND3TXyFVV/+Tj0sCs
YXOPMNLmPG/nrFdygmVQQoyjGLxmLc7iscFbp1qqwf+uM/mmfKjCKNYeZ8lvYuKO
WkKq8XAJEwSWzsWs+5zshp3FqCT7q3HRWqxZOslkXChvE8MdnpZkBmZy5l3UgcRN
KpOYZvVP39/wSdIlxCWZ8fs5wl5OMEzw5Pj0QVBqtwcouRNj1xvu8OCEOicas9EF
OJEG00SmkH4Fa5eoPAIBUqhYcrFiNxHVkLQiSSApPKDcwi3j/VIAIuo3DhPHIH7I
+phOkHnWh7d/3eTanm6k4mvDL9KeNA==
=4oVw
-----END PGP SIGNATURE-----

--N/BTGxtXPxBHmZXY--

