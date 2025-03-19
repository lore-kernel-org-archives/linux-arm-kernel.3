Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F507C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 15:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7+fOcdcmlJ8Dq3tT+xMxlbQdfdkpv3vt+U7JwjX8WM=; b=drlemKzbuiVS/G5tNUtJmlGggF
	9M5UaFB3Da37kQQ6Hj9+Q4JFkbz4mdBHjdDzXJIWV4jkd5DhD2em+g4P1+oIaeRtuAxKEQDyM0S2j
	YZPtT9FFVqrLNhssA0ofYSFdcAP8ucsso/OmaJBtIGMO7dEt4USI9RNXoaTagsL43xpNSG2j0ixG5
	53YcjGuK6qqgdVxIBN/9oEV/s9peYeZ4t1frieIpfEAUNhQKi0xKnUnvlUxuh7YuI0u7xkG3pvNLo
	LL+Q5aolTp27vKdvFnHQhS7M3hrNS9aLfK1bmGWnGkkbAyff9z3AH8YgIo6KREkt1RBLu/0PcRl/0
	dXifDZ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuyc-00000009JNJ-0Dxu;
	Wed, 19 Mar 2025 15:05:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuwv-00000009Iyf-3KMW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 15:03:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A517F68156;
	Wed, 19 Mar 2025 15:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64FEC4CEE4;
	Wed, 19 Mar 2025 15:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742396596;
	bh=HclihVpXgk0jrr62do8J69IkyByKRZp2wtFVZiiJRQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cp6K4Gh+NZkMbIyjiZ0GvBEXE7Qd5VdMfO/4RAKaAvRnS34WkEUJPYL4W8RUoQmBJ
	 caQS2OFuULUtauywOOT3OxuGAsH75qMhrI/08ojMIkOwmtP6ZlybfEonHmAxJHl9kK
	 9iJ2BZXiOCNJYdj/mk5zmCwpg+gnDTWluUx2olgTDag7EBwdvR/1bRFacDmJ/n0eYF
	 DiLmOk5Usx50bxTVD1zakUWSc2j6PE4JS/TwjkkvVHBna6lq+VHxV0gInIFW7V5QjG
	 ScJRDfhbzPi47A5Fsmjp3b9BMirZALrxkRzCGOxCG11qZPBWjyUOEHIt1UpO74GCD0
	 PM8p7ODboWErg==
Date: Wed, 19 Mar 2025 15:03:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Jeremy Linton <jeremy.linton@arm.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org,
	oleg@redhat.com, peterz@infradead.org, acme@kernel.org,
	namhyung@kernel.org, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	yury.khrustalev@arm.com, kristina.martsenko@arm.com,
	liaochang1@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64/gcs: task_gcs_el0_enable() should use passed
 task
Message-ID: <ad1408f2-8a6d-4299-b986-0bacc58ad388@sirena.org.uk>
References: <20250318204841.373116-1-jeremy.linton@arm.com>
 <20250318204841.373116-2-jeremy.linton@arm.com>
 <Z9rUEtZtNXhVnarO@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NGfq55A8VzV+mIR7"
Content-Disposition: inline
In-Reply-To: <Z9rUEtZtNXhVnarO@J2N7QTR9R3>
X-Cookie: Chairman of the Bored.
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


--NGfq55A8VzV+mIR7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 19, 2025 at 02:26:26PM +0000, Mark Rutland wrote:
> On Tue, Mar 18, 2025 at 03:48:35PM -0500, Jeremy Linton wrote:

> 		if (!task_gcs_el0_enabled(p))
> 			return 0;

> 	p->thread.gcs_el0_mode = current->thread.gcs_el0_mode;

> Either that later assignment is redundant, or copy_thread_gcs() was
> accidentally relying upon task_gcs_el0_enabled() reading from 'current'
> rather than 'p', and this change opens up another bug...

copy_thread_gcs() looks buggy here - we should move the allocation of
the new stack to the bottom of the function after the assignments.  Like
you say it does currently work due to the check of the source thread.
The other users are the prctl and signal code which always work with
current and the check to see if we should do a GCSB DSYNC in
gcs_thread_switch() which currently misses a sync if switching from a
non-GCS to GCS task.

--NGfq55A8VzV+mIR7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfa3KkACgkQJNaLcl1U
h9AbQQf9GI5AtUO//K/8Gy4mhIDfDlvWsjZdKRMBiiIHubVULhGZnR9v1l5okpF2
HM45GQmkuSrKsUdEdJV/2YYmImOSWFfNQ7JtRnaLuzCLVwUOwapORITO66qcBKWh
ZKVZa8sIgDulT/x6Cq+6icfzYt48OBXwEL1+BjVO4p4LhI49aSKN6EAUQgtjKhyG
NCRfC23CZxMN+Kb33saQHUzM3puEvqUofm39LdGfTGnX45t6aHobfOYFOcvhtcTD
zK6Pvv+EeQqkGIyx2fghHjd/MqHLSWc0xSMtmEZ6uNaQQqaNJPWpLRFgPThdZ+R+
HN4ExJenZxFQCTmRnKxGC2nTiYKkWQ==
=Avuv
-----END PGP SIGNATURE-----

--NGfq55A8VzV+mIR7--

