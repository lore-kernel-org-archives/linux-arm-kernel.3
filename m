Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB882E74AC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 17:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4F0jl5g+w3FLRSKr0oxLSX/CTU8D/OJShDcVty3jADw=; b=isR+xsBWU3dFc7SnCOMvOC0XTH
	6LML4CthxWJIaIbJoy1+J0AoAk/hsg49dKA6vWRYJtV+zhVdijwy3jW2I72Y44GQB2wPTw9sXKBxa
	f0lX4vnHB/pIzNDgDQ/NirW5sIS/3Ax9i/2GGIvD7vTOAnx+JPULRw6eCXHYaIwisk0V/iRLj9O0Q
	UyGVF6h1XuMpTBJpiyNIiGeDgSBograsT5YMeWFq1gqEOSiM+wuMLnLV/8ASL77/Bha7CWUmwHnKv
	t6QTgivH48m8Mjec7KvoEw+d9ztlUW2zEBonWxSyBK6j4DHjgVQZZMtMNYxWAtrXJn/8tmRT+Gpy5
	LOdbL+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWTD-0000000ADf4-2Gob;
	Tue, 03 Dec 2024 17:13:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVVv-0000000A3fZ-32lQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 16:12:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C087CA4177F;
	Tue,  3 Dec 2024 16:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F37C4CECF;
	Tue,  3 Dec 2024 16:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733242358;
	bh=F9SO0SqK8bG1I8hFZ3skt7R6pqnnPq9qHCJHYGaW9f4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=igbMQ4yRi9reLImfDnJLr2BHCu1Z6F6F0e6W+TcZm5J3kPylbhM5KYLoN3bmunPN6
	 8vVr4LryjKCdHD8Qqr93ucUmUxyyNtFF019BIvNgzInqLGkiHneY5/OTt6mxXchlIq
	 QWDdRsfwGxrBTvC9M8mtoYz5NDXiwvVL8BJfeyUTI+gJ2TDeqBaPLBl+BIu7X6T65t
	 BJaqYpd5wEkGSao0FoVOxlBvD3Rao/umYJvBjgiGdgFPCUfpCngS/mcWQfx0qy39m1
	 mQv6knn+kjCqYJS2cuQPyO4QbOTd5IPBOvmpUqFl3GnPDh02o6xkNwWAKBbLNsYVxl
	 h/R3wWZvFOjNg==
Date: Tue, 3 Dec 2024 16:12:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Martin <Dave.Martin@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64/signal: Avoid corruption of SME state when
 entering signal handler
Message-ID: <537fe318-a679-4b5c-b87f-93a7812dbeca@sirena.org.uk>
References: <20241203-arm64-sme-reenable-v1-0-d853479d1b77@kernel.org>
 <20241203-arm64-sme-reenable-v1-5-d853479d1b77@kernel.org>
 <Z08kvi0znVM2RHx4@e133380.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+lgisz515vzeuI55"
Content-Disposition: inline
In-Reply-To: <Z08kvi0znVM2RHx4@e133380.arm.com>
X-Cookie: Alimony is the high cost of leaving.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_081239_828182_7EDB66AE 
X-CRM114-Status: GOOD (  17.29  )
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


--+lgisz515vzeuI55
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 03, 2024 at 03:33:18PM +0000, Dave Martin wrote:
> On Tue, Dec 03, 2024 at 12:45:57PM +0000, Mark Brown wrote:

> > +	get_cpu_fpsimd_context();

> > +		if (current->thread.svcr & SVCR_SM_MASK) {
> > +			memset(&current->thread.uw.fpsimd_state.vregs, 0,
> > +			       sizeof(current->thread.uw.fpsimd_state.vregs));

> Do we need to hold the CPU fpsimd context across this memset?

> IIRC, TIF_FOREIGN_FPSTATE can be spontaneously cleared along with
> dumping of the regs into thread_struct (from current's PoV), but never
> spontaneously set again.  So ... -> [*]

Yes, we could drop the lock here.  OTOH this is very simple and easy to
understand.

> > +		/* Ensure any copies on other CPUs aren't reused */
> > +		fpsimd_flush_task_state(current);

> (This is very similar to fpsimd_flush_thread(); can they be unified?)

I have a half finished series to replace the whole setup around
accessing the state with get/put operations for working on the state
which should remove all these functions.  The pile of similarly and
confusingly named operations we have for working on the state is one of
the major sources of issues with this code, even when actively working
on the code it's hard to remember exactly which operation does what
never mind the rules for which is needed.

--+lgisz515vzeuI55
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdPLfEACgkQJNaLcl1U
h9BKOAf+MLS0FpEuVDT0jpRdE+xAaBTIboWgjMz8CcNXxOEGRn3n7smri5xV50BH
Lvvp8PMP9DsUOxWqAAq7MxgEpo1aXopGH1oc84zjtzOD/rl+MQDlxFcS6jOM1dCf
oI9bemAyeqxTT79KiPVTptC20e+VcCDeHM/7hXA1gqGPXz/07sdpgT9ZBX2KCdEI
JD6hdVNzFlj/6Fjy7Awgu9WiqOA8oxjqO3NKgrJMbtdnMlm4SP4O1BX9KPgS35K6
w0rIXthg3E5B1q53ry+07iAhAUA9CgpiKnKTzRe6W0ogv47mtp6FZa9wUcnBz6RM
+vtgOU1CAStCu8pO5UeeO+kv1MSjxA==
=TKmL
-----END PGP SIGNATURE-----

--+lgisz515vzeuI55--

