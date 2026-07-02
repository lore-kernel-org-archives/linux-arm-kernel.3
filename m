Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B134C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 12:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfJGQiLZMT0lCObzgKpJ2ztq6NpnscngYdLYNzXRSXc=; b=Lpf1u2puaQNVEM+V4O0UbjOlSD
	OgPls9VEQWvDCSMxYCTNTH6yvqWAYBSqgIQTXJLGbmjPuQYTjNHFHIt7/F9t8MjmcYZDMNGXEMP4S
	zUDmR2b/MrY2qd/yItbAF8jCKVa4Dou4j5Y00cvMWwlXlrEo8ilgiXY9Mlv+cB2UvsDjUEUQRc341
	ju4pBvJNVtdub13vY0ci1Nj7hXjB/o7JMbfMMbUNQLa9m37kDS/8nbEKjBSSBm8Pk/VVA20lViEyH
	2wcIo9Ep4ZG7WWgJpTwVS6zMQMXLw8jF7tTnq7GVWxpgxjWaFqYeZemLBGuv7IGPeafJ7iRNb4Xgz
	mj1lqGwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGzz-00000004TpP-4BTU;
	Thu, 02 Jul 2026 12:58:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGzy-00000004Toy-3OS8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 12:58:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 22F6660126;
	Thu,  2 Jul 2026 12:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 498A21F00A3D;
	Thu,  2 Jul 2026 12:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782997113;
	bh=nfJGQiLZMT0lCObzgKpJ2ztq6NpnscngYdLYNzXRSXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gsEpkhgWYncq2LdMZrUsooPu/jZHOjUgLjqrSzbuLjR+tIbx7Vcziu5zn7VJNwr33
	 ss5o8JtaW9CCTG12u1JRgikFR4gV/oKcTEgGcedsx87E2YZcnnsU8YnapO8st7gr0i
	 VrIElU5Ps/p/8iYg9Z9UfQVUXMgmDGerpP/fy/leNs4kRlBGQZ1Ne1SebwXhv0DCj3
	 Mmcoexq9euoC2jHaPPw08WJA/V645zwCAepi1yWTAN1Aj6bljYd7G6N7APZTp88tvY
	 ij90n0h97m7Kbxq06CoxrzMeq4z6toZuvCU4gpIbtwrLjBsNIVwje/EKcbbq0UDFlD
	 1/astxQce2lYg==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	shuah@kernel.org,
	Wang Yan <wangyan01@kylinos.cn>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/arm64: fix spelling errors in comments
Date: Thu,  2 Jul 2026 13:58:23 +0100
Message-ID: <178298908428.3252584.2973401122289097904.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702015242.361489-1-wangyan01@kylinos.cn>
References: <20260702015242.361489-1-wangyan01@kylinos.cn>
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

On Thu, 02 Jul 2026 09:52:42 +0800, Wang Yan wrote:
> Fix two spelling mistakes in arm64 selftest comments:
>   - "whcih" -> "which" (arm64/gcs/libc-gcs.c)
>   - "resutls" -> "results" (arm64/pauth/pac.c)
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] selftests/arm64: fix spelling errors in comments
      https://git.kernel.org/arm64/c/a52d6c7160f7

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

