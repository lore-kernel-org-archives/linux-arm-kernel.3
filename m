Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2B9C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MxYmH8Zhj54JrthynLXFFPBkyagP8JbghV8HRGYt2HE=; b=T28yh3Sxw/fr+PJG48+MBLdcGg
	gxAV8RPLk7MXIrgL3Q/Gwdqh0lvtK5wbeJnWvTkpEaCL09Sn8JUpI9xifULPL5XXEZcCQMNwP17be
	t4AinVrUSgE7E2jzYc0tBwgJmeTUBPGAzTbKC53MxZIdKK4ymEt/1GuCK1SVXmxPoNMdT0UdYxQVF
	KpTGmYvkPHSIG15QXZMdnAQ/pTjcldCQy/kfSOXvVt8+mWCcpvmCFSoMKvw0BjDU0p/p/ATbsZun+
	k4G1MOE/19fq0kaDK4mhru6SM2+Dn7JLh8xH/uM9MBv//zWI5V6g5jWSE/lAC6OAauKqBjQX3f/a1
	wkEST01g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhqG-0000000DNnX-1yCU;
	Thu, 12 Jun 2025 13:19:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPgIY-0000000DAEf-2SiK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 11:40:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4534644C78;
	Thu, 12 Jun 2025 11:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD6FC4CEEA;
	Thu, 12 Jun 2025 11:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749728446;
	bh=1KBhM8bk9JxMtfrE+3h3SIFV/b3n9l3SS3mDRZtnhCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VgaAuc7hMRW+sYqU/VAveo1iulgWDwYA8M+njnJvlnuYB/pNbkWeTFkolAsH52FVh
	 UaEDl9aaEoX8Mq2dM6/yhu/4jhiiujrXyfbzavqG1pYPbAZ6KI0uH4v6CogdrB3OYy
	 8yT6/BtKmXUvCosBh+G3cKun8AaflYyBbeqwhSeds50IsI1P8u4Jrsr8yle1PVV+eL
	 rWV3HPDeTaytXTbIJEOye5YiSzks8GJ7QNY/mnsBjn3OEZ0f0j2WVdMSCgu9KRrlDi
	 9rXTedWbz9VYq0hk6RVo4GRumWLYOfvjxuYAFhMvAuXn+gQR5NTvtHGImYNhhffNsG
	 A6v59JExJroZA==
Date: Thu, 12 Jun 2025 12:40:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Don't call gcs_free() during flush_gcs()
Message-ID: <4b354842-2108-4904-9294-fb9b00978986@sirena.org.uk>
References: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>
 <aEm-F04k0sC1tOCp@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KnlgrhDwbe58yvRw"
Content-Disposition: inline
In-Reply-To: <aEm-F04k0sC1tOCp@arm.com>
X-Cookie: Biz is better.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_044046_644543_449C0FEF 
X-CRM114-Status: GOOD (  19.49  )
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


--KnlgrhDwbe58yvRw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 11, 2025 at 06:34:15PM +0100, Catalin Marinas wrote:

> However, I thought there was another slightly misplaced call to
> gcs_free() via arch_release_task_struct(). I wouldn't touch the user
> memory with vm_munmap() when releasing a task structure. Is this needed
> because the shadow stack is allocated automatically on thread creation,
> so we need something to free it when the thread died?

Yeah, I've got another patch written but not sent for that (since it
doesn't actually overlap) but like you say I need to check that things
are joined up for threads that had a GCS created automatically for
compatibility before I send it out.

> Another caller of gcs_free() is deactivate_mm(). It's not clear to me
> when we need to free the shadow stack on this path. On the exit_mm()
> path for example we have mmput() -> exit_mmap() that takes care of
> unmapping everything. Similarly on the exec_mmap() path.

We need that one to clean up the GCS for threads that had it allocated
for compatibility, you can see the leak that results without it easily
with the glibc testsuite (or anything else that does threads, the glibc
tests just spot it).  Most of the checking for arch_release_task_struct()
is verifying that deactivate_mm() is guaranteed to be called eveywhere
it's relevant, I need to page that back in.

--KnlgrhDwbe58yvRw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhKvLkACgkQJNaLcl1U
h9Azfwf+OUKFVllQ+wZdyz7mY0zgJQ8dbVbvdT/iLVCH9YbTrUHWIsOGjTDaqug0
+6DNXS6Ok5zgxVzGlXdf9SI90HDwpgaHleYFz4FIGLI6wYH5LQCqyHCgHi4N963H
cNHmSP31GS0rwH51mZlufeIEzn9pFBRKqzDgt7E1j3ldDmXYtCtKgHmcnI6mkTR8
RvyD5t5TcurgB7qiR9Pz888CBcpdDqUtZ7xG0UlgcyBCz7TeagarpBFPa7P6S5Pw
vuMwGfSeaouwGZx5+SbN8Fjx/lPaa8uYXqk1Sk6jgW9QNp0W2tzfzw+/YRMLZx4z
OJMotwBAiUEy822grP33JFPe2FgX2w==
=HNrf
-----END PGP SIGNATURE-----

--KnlgrhDwbe58yvRw--

