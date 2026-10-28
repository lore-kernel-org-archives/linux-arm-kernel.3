Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E982606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 14:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KlyIrZnA;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YirwpN8N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SJDODn+Daxete0vXNEeSBNeEHTwbpeBhwXO3acT8Jjc=; b=KlyIrZnA/e8PGXg1aEymMyu9Gr
	Q24SaaL1Rk+/5vGH0pNWrM/nRGs2l0LCiLSeFb52tRMCSEV60yymeLkK15RIWnz34aoZi2jGmVUcB
	YzAVGlvdLBzt2B9wgx67d8b64CIiKQash2lAK2wPaCAtvMWyrdxSLULYR+1hW2INJNnOJu1LId4XO
	CWkqlZCdPK6Zfzfs7GApOP7cCVTiXfDJI830SimvwMOieTYXQ3vV7U7aRecPEJyI8Pfu6Ku8Z0x+8
	3xMPYOFI0/HJjFp4Tlc8xStZzZjUa3FBOTem1QKRHCz1EThI+N42ws3akmngi2MvjitzYAgElaF/B
	secfKWkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4pt-00000007ECS-3bmF;
	Wed, 28 Oct 2026 14:41:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4ps-00000007EC5-33jh;
	Wed, 28 Oct 2026 14:41:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6CCEC600DA;
	Wed, 28 Oct 2026 14:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB3E1F01829;
	Wed, 28 Oct 2026 14:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793198463;
	bh=SJDODn+Daxete0vXNEeSBNeEHTwbpeBhwXO3acT8Jjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YirwpN8NTIcpR91bbQZOawatQgF7WOZribCgtbQv3D9/IEwAE5fo0kroa8564+nYm
	 6mlIYEBpfTW8Hqn/astGPJWT6TccQlGtF8K2Obc9yA7PSFBQ5ZI4xyquuc/F+pHVtR
	 6mfQBL/ylb+NNAYpULUdWpufa1il/FmWMeO/5fdDmtuolhmVdvOYx+ccHFXLe62LO5
	 N2u3xI5LUJgVwLhHVABfH8nV9r726sROrQ1qjsm6R9Ky251dULE/J4o5RQ/SajqFaa
	 jY4c95rf9MSoJ+RZnUy0WvNnTVDAJMXFPA3JdsdcWtIEamSQ3buF1Xsw0gfKRvBcD3
	 P3On2k6G6xutA==
Date: Wed, 28 Oct 2026 14:40:56 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Iv=E1n?= Ezequiel Rodriguez <ivanrwcm25@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Deepak Gupta <debug@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] arm64/gcs: release GCS on failed fork
Message-ID: <fc71b59b-aeee-4d68-9d48-9eb9ba707321@sirena.org.uk>
References: <cover.1792519121.git.ivanrwcm25@gmail.com>
 <8522b8d3d3ecda7474d0af8b8517c1f5d708ecc2.1792519121.git.ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JK4egr7oBGvhaW3C"
Content-Disposition: inline
In-Reply-To: <8522b8d3d3ecda7474d0af8b8517c1f5d708ecc2.1792519121.git.ivanrwcm25@gmail.com>
X-Cookie: Pushing 30 is exercise enough.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--JK4egr7oBGvhaW3C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 03:19:30PM -0300, Iv=E1n Ezequiel Rodriguez wrote:

> +++ b/arch/arm64/include/asm/gcs.h
> @@ -67,6 +67,13 @@ void gcs_preserve_current_state(void);
>  unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
>  				     const struct kernel_clone_args *args);
> =20
> +static inline void gcs_reset_thread(struct task_struct *task)
> +{
> +	task->thread.gcs_base =3D 0;
> +	task->thread.gcs_size =3D 0;
> +	task->thread.gcspr_el0 =3D 0;
> +}
> +

The other process.c specific helpers are all in process.c.  Otherwise
this looks OK, though I'm still not clear about the analysis for why
x86 is not also affected.

Note that since you sent this in reply to the old thread is was buried
in my inbox.

--JK4egr7oBGvhaW3C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmriCXcACgkQJNaLcl1U
h9DyKwf/f0wQRzWGs4z7w3rL3l/aDet1CHGvYQeENmeNCwRcMkxKv7+aoLzrNWJX
ZlLAXfNLCaK0SG3xcaLnerecwFSW/K+zwNIqFQf7E3czUrYNyZ6QyuUeY1sWKkni
fD8xwhMCQeDCKMrIJvAYMYNgT6sFI5r0TrowwJjKsFgitHpQ9+QU05extDSJ6JoH
Mqn0oOauMbIXl7F25YhJ63+d1nlTajtFiq5VoI5tIjcWosAdpaEmySSpBX1pqBF3
90lzfVTXtNPpv1qJHoHhFhfttnlVCvwGp/lgwQK1kw+fw2wlfHdR/PXLR5hnkqA5
fhLzMJjBO1oi0mpX+FfxV5lWZTHuaA==
=qGVS
-----END PGP SIGNATURE-----

--JK4egr7oBGvhaW3C--

