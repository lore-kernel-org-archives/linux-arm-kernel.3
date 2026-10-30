Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FC1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wil7fEw/;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=t6kROqxW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FqNjo0H98iaz293JQvNNA0q47umX4/lWICDQIiNkFTI=; b=Wil7fEw/iqb7rECO25Lmdx9U4l
	p6ITsKNvM5uBFuAlNqM6JVRo39S+h5XJsxP5VnlCXGZQr/P9T9mE9Z97VDa2gyweizOHP6sIajVO1
	LbTtsIOaRJ01+WIdTBgtEBnxQHsQItsfZJYf8oZzgKgEYl2fhb+x8zO9kq2ej6yKFR4GPIGwHSTkK
	/LKBG++qzKR7AqrqspPgBPM91MTxvRVhuXRrxlDKV7DbQjv6TxUzE6EQz8+jAXvFKBe4Fv41GEKCC
	uze1lkMmyYMBr5JoaDsjoITBXrK0Bjj68M82t7hWJMIrLu4sV8djwZz8RfpZ9xatc9oFJZDQk9sNA
	dBg90N3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMn06-0000000BmqK-1qXt;
	Fri, 30 Oct 2026 13:50:34 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMn01-0000000BmpZ-1Qgu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 13:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FqNjo0H98iaz293JQvNNA0q47umX4/lWICDQIiNkFTI=; b=t6kROqxWTQc9PKB1x51sXY1F3z
	cXBVsuDuKSOdnf+5pHiLYzTvc0SQmfQO25k/2UcArvJrjxSYDk+AkLb5R4ajJTO4IwGuxe2BlLgJz
	vr325AVrKqG91ZmfcNYDrkLa6O3Pu9uAyILZpTCYWmdV+HIQmT+Z3m4PEIZVL3VSe4pnDQMeZ9tqP
	ktA0PHcqJem+2uPTzhX1ofkzVkUKJWB2RH0gWPc6/mUZm6CUB9YVe/CTKaxvOahzeXQBQyZsdEZIT
	F4G3kG70ZznA3V+aMAzaHShb3wcZbu9hIszsEjLnxKnQcpczwzQFz3/9F34zJvxcFHXo1kQdo1BZ4
	BWNAffwg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xMmzu-003rZs-2K;
	Fri, 30 Oct 2026 13:50:22 +0000
Date: Fri, 30 Oct 2026 06:50:18 -0700
From: Breno Leitao <leitao@debian.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kas@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64: Kconfig: Don't select CPUMASK_OFFSTACK with 64K
 pages
Message-ID: <auSem6kzc2d52n-H@gmail.com>
References: <20261007-arm_stack-v1-1-b48dad5fa8b2@debian.org>
 <auCSG2OmNMQKp3dq@gmail.com>
 <auRxNDAe_tv-mCvk@willie-the-truck>
 <auR0kSCYyo31Inxf@gmail.com>
 <auSFVKVuGryqTgjG@willie-the-truck>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auSFVKVuGryqTgjG@willie-the-truck>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_065029_382908_B51F09CD 
X-CRM114-Status: GOOD (  13.52  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 11:53:56AM +0000, Will Deacon wrote:
> Because you might have thousands of CPUs?

I checked that case. I built defconfig with 64K pages and NR_CPUS=4096,
with and without this patch, and compared clang's -fstack-usage output.

With the patch, 62 functions grow by 512 bytes or more. The worst are in
cpuset: update_prstate(), cpuset_write_resmask() and
cpuset_handle_hotplug() grow by ~1.5K, to 1648 bytes. Nothing crosses
FRAME_WARN, and the largest frame in the build goes from 1312 to 1648
bytes, out of a 64K stack.

I believe this higher frame usage is still way better than the kmalloc
at function invocation (the reason for this patch), but honestly I don't
have real numbers, and I am happy to take them, if it is worth.

> Because copying these things by value could be expensive?

Hmm, I _think_ having the cpumask on the stack or not doesn't change how
it is passed. cpumask_var_t is either a pointer or a one-element array,
which decays to a pointer, so callees get a struct cpumask * in both
cases.

Which copies do you have in mind?

Thanks,
--breno

--
PS: I am not pushing on this patch at all, I am just trying to
understand the reasoning and learn.

