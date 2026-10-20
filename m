Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFF1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 12:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NVNZZq6x;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iSv62ugK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rUGvuaVTTy+ZOb7QiqULfTKmRQxwC5KzfroeU94W3c=; b=NVNZZq6x2FfD1HhJyUsWQKGFkP
	e8S3NL7qfDAUWezOz7dsZstaqzXl/iBoZYoFnZs2cYTIfdV2tIdosiFTYXvEsmzG9A6Bly0cRO1+Z
	ms8P+cELOJvBdjbB05l/z0smjNPF268wdBxQTI3ckLnPayxqNaiO3i7pqjT/aEc9sX1jRs3WRJXWP
	B9vBrg7Q+XgBn8OP4NS7EiehrnwTbqsUriESmPFTJP74KHKyh2HjFc9EI/aYJifkoNQKG10PRspwa
	Hbsj5W2dm5G+nKq3/il5+OV0Q1CLPBWqmw4aIzdW8y6yjBUnsROBwYdEFtFxBakpBcW3RRFXhXPjw
	JrL7Vmbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8aj-00000009dHr-2Zef;
	Tue, 20 Oct 2026 12:05:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8ai-00000009dHV-1Mvk;
	Tue, 20 Oct 2026 12:05:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9971160098;
	Tue, 20 Oct 2026 12:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271851F000C6;
	Tue, 20 Oct 2026 12:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792497915;
	bh=3rUGvuaVTTy+ZOb7QiqULfTKmRQxwC5KzfroeU94W3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iSv62ugK666I+rMSJ2KdftrD5ohEdfUYkw/dR1CzFfDtijTXtsc9QJFpCRxA91Lv4
	 hoFWMtlvJNQ3zi5AVQNs54HxJ9YkYvyHk8djA48iX9NDcoAZIz6NemKAWy70JX9Sf8
	 aRGYsVzkYM0Te2EJ8x/Go9bVL8XtdBgm5/PprTgHZ21Yg4L+Rvi9QX3CPhXs/TlVlw
	 oe8MnlVfCNLNTnp5AuLplj18Yfs9e7Wh0pWHeSfb8buxkescVy9gVlXTcKdQOu+Cr7
	 aGL9BVfraXpP6KipeYu6UYAjYHCZ7RxaOhh9gKMAiVu6c1FHhGGeco5Mo2LO9PhtoZ
	 UVnOXvy8uTy6Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C324D1AC57D0; Tue, 20 Oct 2026 13:05:11 +0100 (BST)
Date: Tue, 20 Oct 2026 13:05:11 +0100
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
Subject: Re: [PATCH 1/4] arm64/gcs: release GCS on failed fork
Message-ID: <atdY90gcVwbHu2sc@sirena.co.uk>
References: <cover.1792179433.git.ivanrwcm25@gmail.com>
 <2539f61f79a6053e2a33a1d1ae9df09013c04bd8.1792179433.git.ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gxc4xle/qhZ2446+"
Content-Disposition: inline
In-Reply-To: <2539f61f79a6053e2a33a1d1ae9df09013c04bd8.1792179433.git.ivanrwcm25@gmail.com>
X-Cookie: You buttered your bread, now lie in it.
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--gxc4xle/qhZ2446+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 04:46:00PM -0300, Iv=E1n Ezequiel Rodriguez wrote:

> Select HAVE_EXIT_THREAD and free the child's GCS from
> exit_thread(). gcs_free() already ignores a cleared base and a
> different mm, so the usual exit path (deactivate_mm() then this) is
> a no-op the second time. copy_thread_gcs() zeros the inherited
> tracking before a user-thread allocation, so an allocation error
> still skips exit_thread() with nothing to unmap.

This makes sense and mirrors the handling on x86 which had an existing
exit_thread().  There was a lot of pain finding the right places to hook
in here, there's far too many routes through this code :/ .

> A kthread copies the caller's GCS fields via arch_dup_task_struct().
> kernel_thread() uses CLONE_VM, so during a failed copy_process()
> the child still shares the caller's mm and gcs_free()'s mm check
> does not save us. Clear the inherited tracking as part of kthread
> setup.

I'm not spotting an equivalent path on x86, it's entirely possible I'm
missing something here but if I'm not then I expect they need the same
fix?  They use a similar memcpy() for the arch data and I'm not seeing a
reset anywhere.

> @@ -503,6 +513,17 @@ int copy_thread(struct task_struct *p, const struct =
kernel_clone_args *args)
> =20
>  		p->thread.cpu_context.x19 =3D (unsigned long)args->fn;
>  		p->thread.cpu_context.x20 =3D (unsigned long)args->fn_arg;
> +#ifdef CONFIG_ARM64_GCS
> +		/*
> +		 * kernel_thread() uses CLONE_VM, so a failed
> +		 * copy_process() still shares the caller's mm.
> +		 * Inherited GCS tracking would then look like a
> +		 * child mapping to gcs_free().
> +		 */
> +		p->thread.gcs_base =3D 0;
> +		p->thread.gcs_size =3D 0;
> +		p->thread.gcspr_el0 =3D 0;
> +#endif

I think it'd be a bit more idiomatic to have a function to reset the GCS
state that gets an empty stub with !CONFIG_GCS=20

--gxc4xle/qhZ2446+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatdY9AAKCRAv73Ows9A4
iWTwAQC7iQAwJ8AvSpT4za/gdMW9NJKIrjii+W62TxSlegpBlwEA0ZL335q7PnHL
KBKZVvTQfALmAMz+nHizc7SQa5fSOwg=
=NmUr
-----END PGP SIGNATURE-----

--gxc4xle/qhZ2446+--

