Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE55BE74AC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 16:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbAYpdwFWfqkpFLuQpqkgG9AZAAvZuZtqxVzhGadAHY=; b=uiNS+6wK0v1YGOL7sgEVhcpL0n
	woNnperDnu9AUVD1TwfPqwTYDcIU1wy/ZnygyhF+0WYYR3PBNPvYWXOi3T/hTeM2f6/g88XRHi4xm
	Iv7qF2Rkt3AyO2vXgldmoQIZr5zrJNMVo7rKeAwr1IoWL26hhwJS2R36BRDDLOGphEZ4Mv8IWqETH
	17xfhxQ53DrfVa7dPSMxkhjE+pMU/FyiQnTGGizDTnyQ/2+o5bSolH3hGBf4Kg1w3d+Ql5MK6jFb0
	igFvvBLBFF/5xtFSzbsFvI2/fmSDy9DVhd0Apo1X5o8v45kMUkaF46P4VOIfg0gem1ou3yF98ZY1d
	jQcgpmfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVNv-0000000A2DC-3Xht;
	Tue, 03 Dec 2024 16:04:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVKV-0000000A1aP-193V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 16:00:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 71D405C69B4;
	Tue,  3 Dec 2024 16:00:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4CBC4CECF;
	Tue,  3 Dec 2024 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733241650;
	bh=AoSfdUmW3Qz5Qt+tAkE3FSMWGkGJm0lI7MA7iR7Z2XI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fzTiOEurjyVeVI5dFKRU9eRnhBKoYPc9hLs95uUzANDHYMGm0wnLAdMIGbVc7pJU1
	 513WZCumFL/KcT+McSJuLydoIrU1mwtHGc9Z4pF/Km4XqtEow8ZF49H+WJtMsFU4FJ
	 RHz8IrQNgttya/E4TBzT4YQARJQf91ZPn/DlJG1DfSzzIhEjMdCvrrpVkmRrWntr9D
	 FQROKR7Je54MYvOA745ZfZ7f+IAn7InbXkbQd4Mz+h0andR0LtMnEEai5pQmbevFAn
	 GKfK1ZnJFTQ1B0cFhrjGOZj2xQZnuCqYZ14KK3a1jFcVX13vQNxiyo3saljahpKVs2
	 nwI52REa3QzJQ==
Date: Tue, 3 Dec 2024 16:00:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Martin <Dave.Martin@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/6] arm64/sme: Flush foreign register state in
 do_sme_acc()
Message-ID: <9365be76-8da6-47ce-b88e-dfa244b9e5b7@sirena.org.uk>
References: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
 <20241203-arm64-sme-reenable-v1-1-d853479d1b77@kernel.org>
 <Z08khk6Mg6+T6VV9@e133380.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V8rFlpgqAXwiQFZA"
Content-Disposition: inline
In-Reply-To: <Z08khk6Mg6+T6VV9@e133380.arm.com>
X-Cookie: Alimony is the high cost of leaving.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_080051_351036_16228D0E 
X-CRM114-Status: GOOD (  16.91  )
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


--V8rFlpgqAXwiQFZA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 03, 2024 at 03:32:22PM +0000, Dave Martin wrote:
> On Tue, Dec 03, 2024 at 12:45:53PM +0000, Mark Brown wrote:

> > @@ -1460,6 +1460,8 @@ void do_sme_acc(unsigned long esr, struct pt_regs=
 *regs)
> >  		sme_set_vq(vq_minus_one);
> > =20
> >  		fpsimd_bind_task_to_cpu();
> > +	} else {
> > +		fpsimd_flush_task_state(current);

> TIF_FOREIGN_FPSTATE is (or was) a cache of the task<->CPU binding that
> you're clobbering here.

> So, this fpsimd_flush_task_state() should have no effect unless
> TIF_FOREIGN_FPSTATE is already wrong?  I'm wondering if the apparent
> need for this means that there is an undiagnosed bug elsewhere.

> (My understanding is based on FPSIMD/SVE; I'm less familiar with the
> SME changes, so I may be missing something important here.)

It's to ensure that the last recorded CPU for the current task is
invalid so that if the state was loaded on another CPU and we switch
back to that CPU we reload the state from memory, we need to at least
trigger configuration of the SME VL.

--V8rFlpgqAXwiQFZA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdPKy0ACgkQJNaLcl1U
h9CH2gf/QFro82I1W2CYtFjXn3+fT0ntbUwmrgC4GyyCfObCK/FCTSG8n1F6oA8B
bFtwo5vwtVL1WnIIrzpO3LZUDRM/JPWIEms7dN9s+90ruai9tA4ckWDlA4Ej06fF
l/8heEM3xi34XzzNdqDTEWnxp4fWJaxXWA+2DMpR0FFMyxCNlaem5EA2M+6O7mcO
gjrleyVIoTZk37u8nOpJvdK6UMKl8pkwjCL1S8sPtFYLOmXprCXeNE6IdHf3KNqx
90n/MEAqqJc/tKXJHKAbZCSGVeClNFzXOLVksv4MCy+vYO2usa2MLDez64z3Q5Z3
MFjHni48OLHEmbCTivMMycStc4sWMg==
=Go4M
-----END PGP SIGNATURE-----

--V8rFlpgqAXwiQFZA--

