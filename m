Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3281BC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 06:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgTdlM7HUov9VA/8i5JV8XB1TcFEipF94ktJ1SLspGg=; b=VRHzdMtCdZH1CN66WXtQ4PMtfe
	et/xtk3YDNjPHDFY72r9k+IibXUF8T5JZq6TyUIS8UAgtrXsuy5kBCftZBK7IYsfTw+GLDbNsVn/8
	l37ohNNkMSZKe6XC9MApVeNWEbbwFFqfbzozHz4K3VU54fGWDV45HHVfjAnAFc+rp8A2efpEREPZT
	WV6lJDWRLtou1jzIdCkoJcCsdush17a/l0ljmcG+Vewxpk812K7NzMpGnztZsKLlYIl9YL2dMmKnA
	hipVzYaeXr7eHZiZah3kd5RsVVLfQkITKCVz+BMjPxenmMZ/NbiOTOV34gBQ+HH6MoGznfNDcQo6O
	c8gn2lgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZNxv-00000007edN-0ZIi;
	Wed, 09 Jul 2025 06:07:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZNvY-00000007eNI-3SWX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 06:05:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0016C5C5983;
	Wed,  9 Jul 2025 06:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181DEC4CEF0;
	Wed,  9 Jul 2025 06:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752041107;
	bh=SzD8fsHU7duvdSUQLYizw2PuJGQ8kvETIYaho9kNf10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nTmO4pteY97Kik7iPXm2GrBZ2k+ytY/51/0hYrDwr8tP2BmdFndwlFWeZJ02QxayF
	 bP+HnMSYmzi23Ssn6wqpMjW78n5yCy71sUQpG/ByD9rmbRjp8Fu1Heb65xhY55ftCw
	 SDCLTBwk04U+kQNIs3WyqmvuHvX6xTPHpLoFa3EpXJbaOKvntBEDo4W74kkRIxM5ZC
	 APgtU64n1gCyVeFJ6pKTAuAFtUiX6uBc/ibClllYw6J2knt2vAIU8q8j36W0B8tkCM
	 6DmMOv3mlUPoWFKtffaP6SoZFfBTKshsy7Mxoh3gt5cvUrUHnAE19vck0OwvLYdO6V
	 dov1haKVEqIpw==
Date: Wed, 9 Jul 2025 08:05:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-pwm@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Subject: Re: [PATCH] pwm: imx-tpm: reset counter if CMOD is 0
Message-ID: <xo56zato6pgqqttdriskfgh4kdt2g6q5eg5jxte56uddkdfr63@sa7coeifbsmy>
References: <20250701220147.1007786-1-laurentiumihalcea111@gmail.com>
 <vwozlwajisjw5qomwtmnfdklmucevyxncsxl2cdmixn2yixxrk@x6j3r2lrl5qz>
 <a1b6039e-7020-4d17-8186-d40ac17ba730@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lxvmazlbdrmpdgwa"
Content-Disposition: inline
In-Reply-To: <a1b6039e-7020-4d17-8186-d40ac17ba730@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_230508_943908_9D1BFF10 
X-CRM114-Status: GOOD (  19.65  )
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


--lxvmazlbdrmpdgwa
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: imx-tpm: reset counter if CMOD is 0
MIME-Version: 1.0

Hello Laurentiu,

On Wed, Jul 02, 2025 at 11:31:28AM +0300, Laurentiu Mihalcea wrote:
> On 7/2/2025 8:51 AM, Uwe Kleine-K=F6nig wrote:
> > On Tue, Jul 01, 2025 at 06:01:47PM -0400, Laurentiu Mihalcea wrote:
> >> +		 * MOD will NOT reset the value of the TPM counter.
> >> +		 *
> >> +		 * Therefore, if CNT.COUNT > MOD.MOD, the counter will reset
> >> +		 * after UINT32_MAX - CNT.COUNT + MOD.MOD cycles, which is
> >> +		 * incorrect.
> >> +		 *
> >> +		 * To avoid this, we need to force a reset of the
> >> +		 * counter before writing the new MOD value.
> >> +		 */
> > Without the reference manual at hand or a deeper understanding of the
> > hardware this isn't understandable. What is MOD? What is CMOD?
>=20
> so, MOD is the reference value for the counter. The counter needs to
> count until this value is reached, at which point the counter value
> gets reset to 0 and the output signal is driven HIGH or LOW (depends
> on the configured polarity). This value is used to define the period
> of the PWM.
>=20
> CMOD, on the other hand, is a clocking-related configuration option.
> I'd say what we're most interested in here is the fact that if CMOD is
> 0 then the counter will be disabled. Otherwise, it will be enabled.

JFTR: I marked your patch as "changes requested" now in patchwork and my
inbox and expect an updated patch, but without holding my breath :-)

Best regards
Uwe

--lxvmazlbdrmpdgwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhuBo0ACgkQj4D7WH0S
/k6dsgf/RheRWtMwEqe7uWfXT5aywFTiqSMVTEDTy8ZWFhJ977cgY7pWfCCqtk2U
RYLXoc+cp5FIhb0yBfk25qK5cHIzwVxE6p0H07itNWXjKlP2NYssB3ozzCv2Cer9
WNO/rZKF4TYaYI7cd6eqM0+HJZMABZuOBvJnMG7xGds3ktFG4OHkYUSQfcDIBUqg
Ty6LOq2LQMXKsT8IXzYYGlqGk8BblLKfgVyOing2W3+eKJCqI5R5G43S5dH5SZBR
1EAAEEfmzVviiRbe2hpYVSrRoTgfQjCPjX42QmIDH0lsgoGtzhHllP7l+hlImesh
RbFkCkmk8Aw6dTWrBeaF+89ovOg8lA==
=k8wj
-----END PGP SIGNATURE-----

--lxvmazlbdrmpdgwa--

