Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52FAC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 12:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzDViqHwu2RfpqU3N6PKdbRLm/UvcA4k+JxCzWWo+Xw=; b=ugWfq5FNEbHlFueEQaDM3bA3E+
	Drz1fQ+BbGh8BXAOk5xF4L4JHa41YtJETTucwM7tKoUkv9r+En374dEg60VMkz/BgnE2p6h5aja0u
	fYArJXpbx8TVztOcP6OrahtnXtq5wSUyZg2x9ZdBO6rVxxiPH2YibfqmlivbBEhAHvEgyHWVVuSUp
	24kwvS77d/6r08jXtFePFwjhLKIptoJAozUe9xxssGmkD/UqZ3Y+9hZtVt4erdT3+UhW5Uu/K9EFL
	kk3mbB2uVVcThaTCwTkiU+q/RQO3ma4KHmf5x5qqc6ZNRzCwEtj3JpmT1yaIv1GtpOy4sxmM5BaMH
	odtvgVVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNY7-0000000A5fT-29GN;
	Thu, 17 Jul 2025 12:17:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM8C-00000009t3B-0IHe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 10:46:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90D4F5C6907;
	Thu, 17 Jul 2025 10:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD73C4CEED;
	Thu, 17 Jul 2025 10:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752749187;
	bh=gx5/G6zzlqK9prZpiz6/I2jYvB1WZ4q5jmJ/0wHnyEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mGKvmMCmUZ+GzcSVQRFWy3zlaCTPGCGzmUiN5x7qOgZ3wcIXrPY0e5Dy/lXX2PsBO
	 W+JhlTJSfnxllqQyhZ2r4UXNZ9k8pOslCZBD0sRg3fimb95vLgHTNvhtVkpuhHGDot
	 d4mFNt/KtHtHN/zN+vinIJD23AKyMCdRYYfwTnwQuodhnf0jJ1O6yu6SeURhDdh9mF
	 1e4MC9lT7FZ69d6EKGbh/TK6NM7vR5xtYfqRFPF+EyLDXv4x7ah+iZxvyu/DJwFPzu
	 1ZbxaBeYtmX/dinV4MTPeduJYna467wXWy5/AI4BmfQhCF4dqKtAv+uAoh33i/MO98
	 KEHclzV/CGZTg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm4: Provide local defines for AT_HWCAP3
Date: Thu, 17 Jul 2025 11:46:16 +0100
Message-Id: <175274687562.736017.4541105049784210584.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250715-arm64-selftest-bodge-hwcap3-v1-1-541b54bc43bb@kernel.org>
References: <20250715-arm64-selftest-bodge-hwcap3-v1-1-541b54bc43bb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_034628_154981_0CF26086 
X-CRM114-Status: UNSURE (   9.06  )
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

On Tue, 15 Jul 2025 22:11:41 +0100, Mark Brown wrote:
> Some build environments for the selftests are not picking up the newly
> added AT_HWCAP3 when using the libc headers, even with headers_install
> (which we require already for the arm64 selftests).  As a quick fix add
> local definitions of the constant to tools use it, while auxvec.h is
> installed with some toolchains it needs some persuasion to get picked up.
> 
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm4: Provide local defines for AT_HWCAP3
      https://git.kernel.org/arm64/c/54c605124da6

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

