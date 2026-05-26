Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003B4CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 15:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rxYm5SvTOcVKLkiC72tchyYE0ruvCzdYhMcAjMbKO08=; b=mHS6L24IDU5v3l/AmtqYbnwwKE
	MqTXxZ3GMNckE8gZNTqTr3vjpMji9BbnjzIm6m5SrbHAvqG7d4TcQW6rpBOkyILBLPBqnuV8KynIr
	PfNgoferHb8A8a8fC+U7cZuK6FAFNgdZS4h+qXpsk93BLPXQl+60U+dGHLHhwQ9qjq6Rj457CHh6Z
	nbH4Jyl9990jri6NjUg+1KfEdYWcfA3Ax/sCDFQwiMmqoLt47U3KaxBh7FyG7fzR7vOo892qw0ylo
	OE4A5rzcXDTQkqxYAtnn2ISNUXFp5QPdGTWrXoEEi3WF1nEOkesVAsx427ClICGl2JC8/lqxntS/N
	JA9YwjNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtwC-00000002Pk0-40vb;
	Tue, 26 May 2026 15:43:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtwA-00000002Pjf-1iKE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 15:43:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB47C43DF6;
	Tue, 26 May 2026 15:43:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E1F1F000E9;
	Tue, 26 May 2026 15:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779810201;
	bh=rxYm5SvTOcVKLkiC72tchyYE0ruvCzdYhMcAjMbKO08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HW+bRRyvwTV6HudGegIlgGBk8E8txzo4s0Q4+4ftbXP3pW1/hGGJqmdi2LL+i8/2v
	 SqqjZ7igTXz0JYuslSztKYEXhb5WSqG1sKk/+LseDp4G3zaFBqSn8XTexpEcxpQrdP
	 o5ezCjhU2tl7g08TERaEC524tphtYmqV7h/QenGPgVXm9hMt34oCSqen3w8p24nCuB
	 EwtQ/U9+3LXVE2PctSWZ/9AaJ19Z5ttNmVjfgRPltstWJE2LHeTrU2aG/yGXjRf+7h
	 Jin4YsmG8eIcu0rGz4YVMH/EnhdVvCprIUcyLVKDmUbO763vFF2y28A2bRDh7mEyE0
	 +BEcxcDQShwbw==
Date: Tue, 26 May 2026 16:43:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 07/18] arm64: fpsimd: Use assembler for SVE instructions
Message-ID: <5918222c-b518-45a9-81f7-53ac7079a0c4@sirena.org.uk>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-8-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ErY8mrnqLWnVZBkw"
Content-Disposition: inline
In-Reply-To: <20260521132556.584676-8-mark.rutland@arm.com>
X-Cookie: You are fairminded, just and loving.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_084322_465180_5A729FC3 
X-CRM114-Status: UNSURE (   9.78  )
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


--ErY8mrnqLWnVZBkw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 02:25:45PM +0100, Mark Rutland wrote:
> Historically we supported assemblers which could not assemble SVE
> instructions. We dropped support for such assemblers in commit:
>=20
>   118c40b7b503 ("kbuild: require gcc-8 and binutils-2.30")
>=20
> Since that commit, all supported assemblers (binutils and LLVM) are
> capable of assembling SVE instructions, and there's no need for us to
> manually encode SVE instructions.

Oh, finally.  I hadn't checked in a while:

Reviewed-by: Mark Brown <broonie@kernel.org>

--ErY8mrnqLWnVZBkw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVv5QACgkQJNaLcl1U
h9DIHAf/cI4ULioK4aN2o4Rzo+KZL3f4lNjpzInnpNXeEWBzKED8BXzM2jojAAWk
WT3BhcQKoE+t+93fKkpPP+a6lAG/euPOqjxjvS2h1qgNqqf+nCsTABbe3vK8aiJw
9hm6eORHn6e/PNm6MWPjGk0YuVLvEhICmiI8m7nzhKjSt4bb0rk1iBnP6B26rqlO
VBD4XaDmRKZQhymidHcFefTvn2W7GaMYiRWQ80GTDSlliceAoPVAi9Lq67xFo2Lo
TASLxahZsqNNc4jWkGoL1ATfC93P5Fv+godLu8p/okejkxCzy7NGd+METz0Z6Ufy
GtTSWXZ6l6BatnEzZgGmpUI30JfBUg==
=lht4
-----END PGP SIGNATURE-----

--ErY8mrnqLWnVZBkw--

