Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A81E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 08:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wb2cgo90VM0BZt3RlHOwC/RhEANvPqgEySvUWJGLHNk=; b=KyvUhWhE/8OlaCcpBB1XoZkhBJ
	7wGcXjzC//XkpfnW+tml24Lht1HlglFSTM+jO4bSFB79KOcusgozEIt6RRRNf22Rse8z2Jccb8EY8
	l9WCkTFgW9w7VwErEYI7EIV2P/Itqv4PNdo9PYlAJEbxE6yLwKi3r4//gp6IhH8/TWJc9x+G6RXoS
	rMH3DYk+ic2lHupT9Or5YKw8Ylci3zIVarKFQ0rA+KPCTKZ/MolFxwLG1KmrQeVIS5awjm2oPyIgv
	QQi/o8tkr4eLDI6jD1NAULhJcNxNdtjKEQMvXze2d8JkhvC3GQ3VIVKiaq1GaRASRWg5PE3MooP6q
	lL6fXjDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJqT6-00000003fIk-1Ypx;
	Sat, 07 Dec 2024 08:47:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJqS1-00000003f0E-3Xnf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 08:46:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BBD715C4A53;
	Sat,  7 Dec 2024 08:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDEEC4CECD;
	Sat,  7 Dec 2024 08:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733561168;
	bh=Wb2cgo90VM0BZt3RlHOwC/RhEANvPqgEySvUWJGLHNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rtLrQ+Rd+OhhRS4PtLyFkT1tEKWKZi1Q9Sx3ugJpZjnt1T+VqisNUYf5+KlvWwYdw
	 XXvWQuFrevcUihZySaOXd3jF6YjssUqhHbtJIynYz8PtGI5k/vpyZMizToFTEM3t01
	 nYMlEclv0vuS9WJtSFINB7e4dWb5JnkUQ+a+LyHH/wbYuoDeGoZhzSzA9H6s6pnHOq
	 iGw9IEqC5GY45RlBJsVrtXsgiQ8sUSYO/hrgK7/Vd9v0edhF9gD0kVjbVMSbfRW7vj
	 Iq/ykxKp4ZcEW2eldtsR5TpKxkI2PhKE1/jFN0GGtrEzauIK4l6mB7o2FbHAuW2ekh
	 gTEZr7fBefx3g==
Date: Sat, 7 Dec 2024 09:46:05 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: fabrice.gasnier@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, hierry.reding@gmail.com, lee@kernel.org, 
	linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: Re: [PATCH v3] pwm: stm32-lp: Add check for clk_enable()
Message-ID: <4wcwxgo5irzfvyec537ucm4e276fqq36hhw3l64qmoj43hjnmv@byi5mvb2wc2b>
References: <20241206215318.3402860-1-zmw12306@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oj4rdulsaiobcffa"
Content-Disposition: inline
In-Reply-To: <20241206215318.3402860-1-zmw12306@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_004610_054335_EE45E94B 
X-CRM114-Status: UNSURE (   8.33  )
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


--oj4rdulsaiobcffa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] pwm: stm32-lp: Add check for clk_enable()
MIME-Version: 1.0

Hello,

On Fri, Dec 06, 2024 at 04:53:18PM -0500, Mingwei Zheng wrote:
> Changelog:
>=20
> v2 -> v3:
>=20
> 1. Add tool name in the commit log.

Thanks.

Applied to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

=2E

Best regards
Uwe

--oj4rdulsaiobcffa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdUC0oACgkQj4D7WH0S
/k6mqQf+JDo1gcCBjg9efkJzxZYhmArKsOw3oPJMdypsvvMVg3jtShekC41O0nIT
HRSguGN0MitOyEYsGAV/ZMKr/NiKM8oxOrSa+PNzhikAhjPHpqrfvYAcVqcjtDla
JSnwYVFDfNiI0BUs5ZEHLmB6KAwdiFJS80GumePqh8zQUfIrn55DIZWzpvg0ScAL
Nv8FLKz7o+tO+OiZXSuKwqhl7JCaVh9zQXV5KZoMidQV9WTrmAEiC2HllMDQy+79
Voekd71JC+DB3nE5NSlNEZTEAr5M6/GCgnd5KV+Sme4gK3tT+DFMF+AZuFSYCRlt
g8UEcIcpkdOcrnXnfZ/7jepGVxRwhQ==
=fMTD
-----END PGP SIGNATURE-----

--oj4rdulsaiobcffa--

