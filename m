Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FB6CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 15:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNg65F8o+4jumSNRPx/T2FFyZjl7IBIA2OxW5ATa7ao=; b=NeJjtzBnkgWijZf7eFQNBq5mdu
	IhUBfwvcBDDhHcRsekIEKPimZKB1Q1Rwqi1EOA7+N+wEDN982LQtJaV91z43XoDQHrOYuYReqFa5e
	DNwLRzRipZA5M7o/QWrPI6aKGmuu/otZ+jycos8uY6VHJoERTZhqkkqJbtDqb+tiMCSlAJBSEg1p1
	wyu+U6X4TqevKKyY2dtfi5U+bnc1n2eTUvRI6bdqnWNmPKVYNdfJ7+/7zCugki5twlR7c+bVULYV1
	DvEiOaO1aK4RynKjR4eQp6JFVSLFxATYk0cgmqAV+kVBymD8g6zHkPATK5QLKSVYBT9yRreB1AwMy
	Pdo/X00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRu8K-00000002Rhd-1UbB;
	Tue, 26 May 2026 15:55:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRu8I-00000002RhI-3ZmK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 26 May 2026 15:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZNg65F8o+4jumSNRPx/T2FFyZjl7IBIA2OxW5ATa7ao=; b=SDpOJAINYeBpcXWkapq8C1mi70
	Eom6+NYHZHfqDC4zBcL/+UPaaGpkKXPXAJvzS+UFr3I+zBVy3cevCPsyZT/5CePb0pXj/IPQ7VY95
	xtirPtsAbPwrW08EprXdavQ4pqKslSJJVbxpkUbiTbRJPZotCELyJ220bS7ubhv9KBQaYfNrm8ur+
	bUl2CNHx4ftG55wqhz9LnRdCicgEOHIw7iGW4khcZ3g74JB801hRQ9TS+poDVrPTNY8/zfxv6d/75
	jPCjoCra6KEgtVJTkwnwWtl1Es3gBHa7zNFPZ1K3hJ0OZsqJIVUIIJlm3FGAPysO6sNg7K++sSR7w
	hBLLKXyA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRu8F-0000000BlHO-34wv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 15:55:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 65D9B43CF9;
	Tue, 26 May 2026 15:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2351F000E9;
	Tue, 26 May 2026 15:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779810948;
	bh=ZNg65F8o+4jumSNRPx/T2FFyZjl7IBIA2OxW5ATa7ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EFvF0zJica8h5ETJEnWESEi62COQQvAI8gG/6Mvn5TxmQvDlzj0GpwYIywEBnL8zF
	 8TfdSm4FfwVJeAd7Zzq753jZw70BCRGyxh58QxI7uyGIDHsiuilw7mA56LlPqN1mu4
	 15+v9mjgXon1yGukYoHIJ31Stz9ddJYYI6NoAD529w67Qh7i++5Q0C4lBSX6ptpUVV
	 Bu+GgRQAhFr9JscQASUNAPStaxlz/ZtohuTghE0CdPTZZZR2rx8Q5McTT3U8SUVzyw
	 qHw7ySp8qao5boWgIjpeeF7pwm7EZDDBq0o8b20OERZD6Oz7eefv0RE4LuuABgDFam
	 gUKP1jOusXyGw==
Date: Tue, 26 May 2026 16:55:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 10/18] arm64: sysreg: Add FPCR and FPSR
Message-ID: <458fcb4c-46a9-49db-a179-9081d7d50dbf@sirena.org.uk>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-11-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G7fW5B6xakMhz0Gm"
Content-Disposition: inline
In-Reply-To: <20260521132556.584676-11-mark.rutland@arm.com>
X-Cookie: You are fairminded, just and loving.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_165552_232800_DA89AFA6 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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


--G7fW5B6xakMhz0Gm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 02:25:48PM +0100, Mark Rutland wrote:
> Add sysreg definitions for FPCR and FPSR.

> +Sysreg	FPCR	3	3	4	4	0

This looks good.

> +Sysreg	FPSR	3	3	4	4	1
> +Res0	63:32
> +Field	31	N
> +Field	30	Q

DDI0487 M.b and DDI0601 2026-03 both call this field Z.

--G7fW5B6xakMhz0Gm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVwn8ACgkQJNaLcl1U
h9BTRggAhNEDG+iEgC6Eic1xR0NKIc+l4w6x+B77WYe505Ojy6JMyp170pylXegX
wSQxHgZ08gYCuIDngbxHVDVQxICBRKRgwHyPewpbA1r3fd3wNuco892mJQAttRtB
F1I6DCPBFnd2U1qSLrhC0kRyKs4Wrh5nmElIS0TOTnLRy7xZA1H0cx1lidCV6nCO
CNZY/WQ/VYwAYQlxWfEFh9Ende+LakujTqczdm3KDTihx6xDPoUIW92WaYqjQjcK
AS3nB8VG/TTLREfKYiO2FPHJOF9S2eSRFfJQ+zss3rTuQHyANI7i5e+bo5qUBn3h
q4A+Updj86SXLrO1tjHhrcoZXaH2Ow==
=f89D
-----END PGP SIGNATURE-----

--G7fW5B6xakMhz0Gm--

