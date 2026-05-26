Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1312ACD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lrIS1mRLdvFOvur2TxaaWhBItiwLy6nmSCpDteM1L0=; b=sKhtNPHDZj2gS+SGzG2nfoai4O
	4HEaz9qiaJ8Mm4e9NjZzrYyc9bmbn9vKXJbhyIpZ8fBuztSYbKsLO6fNwm07ZZfRXPw15kzasJXNt
	clXRfF6Hj+vrlluKxj1o3qMQVfcQdI0VpeYYbSS9I0k+LOLeI8uR1KvkpchHcjQ/o1WIIIq10yi5+
	mw0DP757UwzuDNxQh8dJh37VUDNOwG3/LX3PeYifqYTvkAPn4zybLGG6ooSGKEpgVODqN6Ku2TpZX
	h6/zi48Wad/6wOA+Pw1UubAPDNYwEmW5MbOnD8X3W7l/sMuDjqeFal2caFDylEsnoh1Jagpun3P2w
	9shLgYNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRskj-00000002ARh-37kx;
	Tue, 26 May 2026 14:27:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRski-00000002ART-2uaY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 14:27:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D37D160123;
	Tue, 26 May 2026 14:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A990D1F000E9;
	Tue, 26 May 2026 14:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779805647;
	bh=0lrIS1mRLdvFOvur2TxaaWhBItiwLy6nmSCpDteM1L0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F1qbmWBqi8QdQfecBmVVoj1yXGvGKR3Z0oej2cUc8452a4NQeeHDomd/K4qToK3os
	 ZlxZJ1qmqtlnA/10L5YWJVEmGpolDQbDy6tMyJhonsJh7zV1z1qT7Dl0ruBtvI0IO3
	 IZmsxQ03jzNuBxSiWXE+dyOcuk6vWdqPWc2t98Y3cKh0zW1xgWhlX/JH9jPpgF3fKa
	 hFDzx+7OCHcvgU6Vx8+hE5dLGbUvbBLKpF9HsniHHw6SNlPRaaWxC9UjQCWBPktmNi
	 ZqeN3jcbPSSygJBp6hDxfTLtAd4/Xb2zcHV1w9R6a72KSJ3kGkHxJ/v7WHJqFAvg8j
	 YgtTV9zl1IwxQ==
Date: Tue, 26 May 2026 15:27:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 02/18] KVM: arm64: Don't override FFR save/restore
 argument
Message-ID: <5274350b-b136-45e4-9648-55c5a9212207@sirena.org.uk>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-3-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pWo1D6sXPeUbvLUB"
Content-Disposition: inline
In-Reply-To: <20260521132556.584676-3-mark.rutland@arm.com>
X-Cookie: You are fairminded, just and loving.
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


--pWo1D6sXPeUbvLUB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 02:25:40PM +0100, Mark Rutland wrote:
> The __sve_save_state() and __sve_restore_state() functions take a
> parameter describing whether to save/restore the FFR, but both functions
> silently override this with '1'. This has always been benign (and
> callers have all passed 'true' since the parameter was introduced), but
> clearly this is not intentional.

Reviewed-by: Mark Brown <broonie@kernel.org>

--pWo1D6sXPeUbvLUB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVrcoACgkQJNaLcl1U
h9AqyAf7BV3cLAqlBPywTUOcOoFp5aEiVNwBvAEfl+xrgLAJcVBYp011Et5Kt331
nISXXs/a2XDHvPA1q+IwJiZX+6vMZ/ecvLBVOUmPGIJEnJXUaoB0EPg+cjRTTts6
SqPVyfSIHc+QR+ZpVA7XoBFrW9DiYGMhVNVXXL4/9NMDU9QX2ARhnHEdhWHqNCrq
ks318ToGqqkGHA2T0E4Qi/OylF8myn5eeRHWubmTIvdgSEFdyp7V4ystYp8+13Eo
fjemEycDOhcItHxBXMSUI3qQNR1cA15M+mT2IQTXVtKq+GwnpXK92wdUmp1Euc17
8KIRLIet9b73FsuvVvwXPDBCZwb1NQ==
=y1bp
-----END PGP SIGNATURE-----

--pWo1D6sXPeUbvLUB--

