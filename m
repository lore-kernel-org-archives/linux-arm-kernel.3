Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7728310775EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1hrraDMe9WNsUyCzlWVS3UdcmIYvWSlrxh7Fyyebjw=; b=qZ0o0VQW7Mye6BHheK6rI+zHeI
	Fi0iyHBYeDeT8mtI6+Ncd7uXaqEPFqU1EHR2urHdIXKkw/xfpE7TUm7HhKxhlDksTITA4hZFXvdCd
	fqND7N4pc7TMBYVqaeNo6jmQnBJJwXmcmZ7rDE/ASkbXmSNwf1gjVrC6SF5zZfzyWJsTQMPfEMMjm
	UFh0fOt1aV5ZaZ+0MgnETHGVJY/POnfCd25BVCWOtdkcj/HSocsFmVH7Sc/4m+myJoUhTrMwcvthZ
	L6h7ir5fh9Rt1vjAkcHBArDp/+telB0antGGLpra9xzk4wSeda/maVgtzWDWUyVhcD/76kFB2Ffct
	oPnyKzXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uWe-000000092iz-2TXD;
	Wed, 18 Mar 2026 17:17:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uWd-000000092i3-0OUe
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 17:17:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=M1hrraDMe9WNsUyCzlWVS3UdcmIYvWSlrxh7Fyyebjw=; b=EewCYSqOO8HuM1ydR2oscwkM9H
	e6KJDRMHTvgSk9Yx3SvUmd3jmSCb1HdZ+Yg09CF5MthRbbjxKYZBugM0hM9pCG+50ZamzCVEr2Tai
	eIIzBHsRQbi8/RYpJOFMySx1pViEypWf0l8ZxFHAkNSYDkjutQEaBnrjgIrNb5Ij+Hlbf9wn1jjsw
	sz0FVlWHCO2syZMt12TVpTfWXiha9vHuLdZWH8VLjRRwjXKRvtNlvIA0uJYwLgIO/Z+3aC6Fe8cXl
	C4dSqOlhK6/+ItCwhSg2M4moMTdCXxscB9JZ4f5VCrwPL+Bn5/qzzDx36LL9qEugla3UazDAmPGrJ
	/JhBEmEQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uWY-0000000BqdO-39CT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 17:17:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B00B443DC9;
	Wed, 18 Mar 2026 17:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70D75C2BCAF;
	Wed, 18 Mar 2026 17:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773854254;
	bh=dm3G7/u4dkXgG56i0lULzKkyOM7j8bbEFH4ISzHFyUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LBWFAH42lPCuKmuEdfuRq1aSN36d87ndQsXolknWabBU/+uBts6zddmVGhOw5SXMA
	 vu9KRw/vuWN3g0LJKpDT+n7iTF9ugFmXCL+0X3pMtmy2ahZ2t2hKOlX0VEPmmDIek/
	 u9Y7GjMnvKAA2MmDuuu+WkatpDmJt5aiy1QTKFKFNCYDH0iK8UDPeLpFpfnJvmbBEh
	 Ruv9mzrxF9aXguTTVEggkIjd3EB9ahiJy+8vkanfJVsKd8LoTD6Mt1CklESSuDK1Yu
	 Nd8m9TdD/3aOi0Zrd7PCgxPXFgy7alvH5oGGSgV1qd8k1IMeEBU8zZTAtUVFQLWaVK
	 QZWwGOWepMXRQ==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v2 2/4] perf: Fix uninitialized bitfields in perf_clear_branch_entry_bitfields()
Date: Wed, 18 Mar 2026 10:16:56 -0700
Message-ID: <20260318171706.2840512-3-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318171706.2840512-1-puranjay@kernel.org>
References: <20260318171706.2840512-1-puranjay@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_171738_971252_887B1592 
X-CRM114-Status: GOOD (  12.16  )
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

perf_clear_branch_entry_bitfields() zeroes individual bitfields of struct
perf_branch_entry but misses the new_type (4 bits) and priv (3 bits)
fields. This means any code path that relies on this function to produce
a clean entry may expose stale or uninitialised data in these fields to
userspace.

The function was introduced by commit bfe4daf850f4 ("perf/core: Add
perf_clear_branch_entry_bitfields() helper") specifically to "centralize
the initialization to avoid missing a field in case more are added."
Unfortunately, the commits that later added new_type and priv to struct
perf_branch_entry only updated the UAPI header and did not update this
clearing function.

Zero new_type and priv alongside the other bitfields.

Fixes: b190bc4ac9e6 ("perf: Extend branch type classification")
Fixes: 5402d25aa571 ("perf: Capture branch privilege information")
Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
---
 include/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 48d851fbd8ea..d7f39b7e9cda 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1481,6 +1481,8 @@ static inline void perf_clear_branch_entry_bitfields(struct perf_branch_entry *b
 	br->cycles	= 0;
 	br->type	= 0;
 	br->spec	= PERF_BR_SPEC_NA;
+	br->new_type	= 0;
+	br->priv	= 0;
 	br->reserved	= 0;
 }
 
-- 
2.52.0


