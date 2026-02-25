Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AC0EFD23D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80c8riE20DAJ14acRDSroDMzLj6+aDsE6TnHoAhsfbg=; b=eQaDB1Qv8h+Gbm6D/b4lgl0EZd
	0djM6zi85SKV/1UOPc6gmPqIX1Ghfx/HfbMLMsP65iZoe7YWwNZorgcL8xqE1FhOleucZt5V1cvx7
	F0vg2w0Uv+g2j+HKxobEFA5Iplu6ZKjGr5hgpSTux86+nYB59TpDZWGyE52EHLk8C5D+atCsOzKX5
	Y2VtdTEZHcxDPPM7j6A61Y3HMtE4YlVUYED7JkrWyXGggroIrOVLHL/bZ9uaKr5cBd7nHVOkZmID5
	cgwVQaA8EvvL5DJsnDxK8ajQLS8xYWsS40aYLpenbrH2LK1I6yY4mlXDtzJTjaQTI2Pe8zHTYITO0
	qw/HhYJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBpR-00000003kOP-48Of;
	Wed, 25 Feb 2026 10:09:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBpP-00000003kNp-341u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:09:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93DDD43873;
	Wed, 25 Feb 2026 10:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D9FC116D0;
	Wed, 25 Feb 2026 10:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772014148;
	bh=CfYCszxAxhMS8qQHcBKjQOsNb8jic3AdWDNoOXYU7Ww=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=DMpXhKB4qGxzb+D1CcsGhEUsVyKm5zQyt2oTv+K0n+xiuskqK70WNorSXPBNyDzIn
	 LE+fvyBih4PWZdGkWMsxtaJWOCXLQeUpHfqGDLwQpp5197J/k2s9YzyvbOcdfOuZ8V
	 eQ41qPMAokQU4EhIfjPyXv2uIxr7UbJpEg2HKkzQicnKWmqUuyPjCVhVebxoOuk+/s
	 BjfOBzLdpOmrmo9thx3aYW/ByQEwfXQ6P58p742bNdiFfyCYoRwf8zz+fMJIyv9SDH
	 84P0k9SV1Uid00hdmNrfrh2CUhqmLI2p12+orYjOMLu8tXH2zahnM00UjG1SYmHGaH
	 X9dlZoMEm3Vwg==
Content-Type: multipart/mixed; boundary="===============8254512922807785031=="
MIME-Version: 1.0
Message-Id: <44a51c003ed5184e14c114c1b8327c16fba34aff50c2323bdadcd72de45f9920@mail.kernel.org>
In-Reply-To: <20260225091359.3299924-1-tabba@google.com>
References: <20260225091359.3299924-1-tabba@google.com>
Subject: Re: [PATCH v2] arm64: bpf: Fix UBSAN misaligned access in BPF JIT
From: bot+bpf-ci@kernel.org
To: tabba@google.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,puranjay@kernel.org,catalin.marinas@arm.com,will@kernel.org,bpf@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org
Cc: martin.lau@linux.dev,eddyz87@gmail.com,song@kernel.org,yonghong.song@linux.dev,john.fastabend@gmail.com,kpsingh@kernel.org,sdf@fomichev.me,haoluo@google.com,jolsa@kernel.org,xukuohai@huaweicloud.com,jakub@cloudflare.com,jpb@kernel.org,tabba@google.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Wed, 25 Feb 2026 10:09:06 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_020911_790949_0FA1A966 
X-CRM114-Status: UNSURE (   7.83  )
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

--===============8254512922807785031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> Fixes: b2ad54e1533e9 ("bpf, arm64: Build branch-target-identification-enabled BPF trampolines")

The subject in this Fixes tag does not match the referenced commit.
Commit b2ad54e1533e has subject:

    "bpf, arm64: Implement bpf_arch_text_poke() for arm64"

The v1 of this patch had the correct subject, but it appears the
subject was inadvertently changed when respinning to v2.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/22390726005

AI-authorship-score: low
AI-authorship-explanation: Natural patch evolution through mailing list review with v1 rejected and v2 adopting reviewer suggestion; minor human error in Fixes tag subject change is typical of manual respins.
issues-found: 1
issue-severity-score: low
issue-severity-explanation: Wrong commit subject in Fixes tag; the SHA is correct so tooling is unaffected, but the human-readable reference is inaccurate.

--===============8254512922807785031==--

