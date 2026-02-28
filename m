Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7582FEE4C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 13:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=al299pOVNbjRpkNOf94OpuR7Olfd8ATQC9P+U6CKqEc=; b=AupzPxexntMytdgbMTe7epvUDS
	4bKy6DRqzhIicHwpb+nJBDbL2H3fDHIrPTjmI2Dj2lwdRoIU7RhZ/OKVvpuxfByZP3zNDzyGZx8Yc
	KVwe0vMjmrKBLXghoH/B220gbqyPSkMNePTcwEEsBXk3XJa3Z52Ijati5uB1CaVE5fW5hr58ZA1Jm
	QWeRcKJDqhS/6EgrABjkI6dNnL5kZ5/6q3DAGoqbNPgQHoST8FsC+J62GGcWRPUAe50jafi2OwtYo
	Jj9RFtMRq3iFN1rIgqfKIl6yRYySSNd46lVuAY9SZ7y/qdVBgD+MhaVLKXJ2TME0etirS9S5WGk2h
	eUIw9tPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwKXL-00000009sYm-2SS4;
	Sat, 28 Feb 2026 13:39:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwKXK-00000009sYF-1Z7V
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 13:39:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2595E61118;
	Sat, 28 Feb 2026 13:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB101C116D0;
	Sat, 28 Feb 2026 13:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772285951;
	bh=A+jgu3UIsJ6M/4OKomoCN0p7y+V5ItH79wf3WXnQeC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ITRiTv4CidtEFRpHIIPQD5Pni6Af5N7tgWhl1qZYUeSjKi7YoYDGCy1Xso2S6C5B8
	 Z6jqm8/mFhvJleeJoy59EIhOsbcg2lSniTPFzZ73Y9awZPxl7TPLT1i46XWdRvTi6u
	 et6n4iUwe36LuFg74xDOjbtm+FrcDI1jNYrgXGF2WeUXfheCeC/YfyFEoIPs/PMXTf
	 PQcpu+ozcLFBS/lqda6P9PQgQ7Fn/FwRjZqO1A3E2kgX9b1iPOfX2wLsQdDX4b2Kod
	 yiMsSTuViekA/wkH0uta+IFPVH9vA/ozGy5KB1mYEFJxj4F+jVa4IxOevqJCVl2dFo
	 K8nfrDImB2q2Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1311C1AC58E4; Sat, 28 Feb 2026 13:39:09 +0000 (GMT)
Date: Sat, 28 Feb 2026 13:39:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Yifan Wu <wuyifan50@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	yeoreum.yun@arm.com, jonathan.cameron@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linuxarm@huawei.com,
	xiaqinxin@huawei.com, prime.zeng@hisilicon.com,
	wangyushan12@huawei.com, xuwei5@huawei.com, fanghao11@huawei.com,
	wangzhou1@hisilicon.com
Subject: Re: [PATCH 2/2] selftest/arm64: Fix sve2p1_sigill() to hwcap test
Message-ID: <aaLv_X7SihBUX5c_@sirena.co.uk>
References: <20260227031933.4103333-1-wuyifan50@huawei.com>
 <20260227031933.4103333-3-wuyifan50@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ww5PzAmBeP3CClFP"
Content-Disposition: inline
In-Reply-To: <20260227031933.4103333-3-wuyifan50@huawei.com>
X-Cookie: Think big.  Pollute the Mississippi.
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


--Ww5PzAmBeP3CClFP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 11:19:33AM +0800, Yifan Wu wrote:
> The FEAT_SVE2p1 is indicated by ID_AA64ZFR0_EL1.SVEver. However,
> the BFADD requires the FEAT_SVE_B16B16, which is indicated by
> ID_AA64ZFR0_EL1.B16B16. This could cause the test to incorrectly
> fail on a CPU that supports FEAT_SVE2.1 but not FEAT_SVE_B16B16.
>=20
> LD1Q Gather load quadwords which is decoded from SVE encodings and
> implied by FEAT_SVE2p1.

Ah, good spot - I think my search for instructions to use got confused
by them mention of SVE2 in the description of BFADD.  Since this is a
fix it should really be patch 1.

> -	/* BFADD Z0.H, Z0.H, Z0.H */
> -	asm volatile(".inst 0x65000000" : : : "z0");
> +	/* LD1Q Z0.Q, P0/Z, Z0.D, X0 */

That should be:

	LD1Q {Z0.Q}, P0/Z, [Z0.D, X0]

(the existing asm has some issues which we ought to get round fixing but
may as well keep the new stuff good.)

> +	asm volatile(".inst 0xC400A000" : : : "z0");

Verified the decode with objdump.  With the above change to the comment:

Reviewed-by: Mark Brown <broonie@kernel.org>=20

--Ww5PzAmBeP3CClFP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmi7/wACgkQJNaLcl1U
h9DVZgf/eYoxaImZMJFJqdQF0wT+T+ig4eiur8/tZT3g5gsg+VfHYUPi6NXyzs9p
stxVJ0eQrzEgJ/Gz65Y8scnRHIDaBZrrqKZ68Ud1meP01/gi4ThKoS7Oe9VfsfPn
unqStwMAVFnA5dzBDpz89lZD3+PmP6rRHasvcnbWZMpJTyU2SnlGT1mupvoJMttr
BXBQ/LO0bRqlarGr8MSiqWcuYXtG1cd7pgMx5dLW+4RRZB1EzC//U4unNoJ9//bB
4lMoIgZeYh8zBZxEE36oIzuQCdW61IhwKDZlrxPL/QC+/Zwy92nT9/1YuQqsxQLe
XpPwMp612+RAj5kbds1NyUvxMddXTA==
=Z7yh
-----END PGP SIGNATURE-----

--Ww5PzAmBeP3CClFP--

