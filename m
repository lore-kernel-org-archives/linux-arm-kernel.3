Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB268CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 16:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7mdruPdQr7t+ynZUmcgCTpI6asT59/vB7/OGTo7L0o=; b=LP3PyCCtx2MOLv5O79GzMJIhR5
	8wl+o/+fMwNAxtWdWn30AOwERL000TBucCHA+bVIKetK65p7ip0oSHAW94a1sw5q8yC1r0KsxpLK/
	Z/CApQubM3EOipFGVwu6XwTC/Qwbo7g4pD1yRQoxmLvlhMy5iT0npubN93/gXIMCoUv7UrRtGxhsG
	hE/NamE20q8++HJMJwixsfQiiYTYvbv0cW2aRHFSH1jWYKgMb3uLUUiq1ZPvTmXllBKDcoVRrBfup
	UytkT38bbDWDovecZlCp3qQlmIPnt1JYl9dlFOw+krCGKgKYrVXfVM0WwIaOw1DM6RSp40hirN3+o
	Jqw5bxDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1S4N-00000001aBV-3PbY;
	Wed, 24 Sep 2025 16:10:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1S4J-00000001a9O-04RK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 16:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72DCC60205;
	Wed, 24 Sep 2025 16:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26385C4CEE7;
	Wed, 24 Sep 2025 16:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758730210;
	bh=+bxKeV/Lqnru7tJ4/Hudh9iA3B4xEqB7fjy+ACHveP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uNj02plKdklKs3D0OQ8JZTeIlcsIItcESZqhDYIYpsvrccMVgN/tCYpwzIYllQkO7
	 bsW/f8qnclu56EjN4n/+hf+Q3b4zBJrbGbFEAzt7vp/ses/+kQnbxCIDSqaMt8alUz
	 Y6JITY1q92P1JkxQnwYAzjqQJiGA9Jl8V9NfH8qhKRlxVaUEFsUpvzmm/dKvSpE3h8
	 dQGcnRORfNBieM2p5pCHbPcFPIPAVFhGQ+VEg/ACMqZQcI9MW1nEpVyE7G9Yozz0cg
	 eQ8ejsmiAlUUPuW2Tr4ZYOZgZfmyYkN9YV3J/jLwvIhtpAMLdOgFDgt2eEu2xK2Qba
	 P42azBOJ/K8ig==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Hanjun Guo <guohanjun@huawei.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] arm64: Kconfig: Make CPU_BIG_ENDIAN depend on BROKEN
Date: Wed, 24 Sep 2025 17:09:58 +0100
Message-Id: <175872754653.2448570.7709142013580478154.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250919184025.15416-1-will@kernel.org>
References: <20250919184025.15416-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 19 Sep 2025 19:40:25 +0100, Will Deacon wrote:
> Big-endian arm64 configurations are vanishingly rare, yet we still claim
> to support them in Linux despite very limited testing or visible
> interest. Supporting big-endian adds unnecessary burden to reviewers and
> contributors which, without any known active users, is hard to justify.
> For example, recent work to improve our futex routines and to implement
> nested virtualisation support is non-trivially complicated by having to
> support both big- and little-endianness.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: Kconfig: Make CPU_BIG_ENDIAN depend on BROKEN
      https://git.kernel.org/arm64/c/1cf89b6bf660

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

