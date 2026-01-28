Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1643BD3F090
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 16:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYnUSCF4iWlv8ks4slfVcsFjDo5d0urEhMvs8z8EnMs=; b=TxefV/egfl3scBqm4rKei93kVO
	WpJuX1VzFS/bL1iXNmHuNSKYRtiCMoB/TYykBTzcXnJ9shDBTGjI+NMHYfYJWROrTL00D0i2FYA6A
	o5oVYC5T1RajiXdH49fEcJRJBLeqt3QvU0kA0QknunLTvG9LDmfJYSS7riNdc163TpJMxJcUgYjkh
	ZgOCUjy7/w2+ibI0UHB/OijP8dk8IjBg/JXQ5ZmjaijkHdhk2K85LRpbtP5yygxUPtwUJbBHeaVyh
	ObENMml25e95iBDfoIBu0dmIFFSCzxyaQu1qYj7HtKNP848QZR7e8D7eR+pdQHmSzI3P/r/f0ClDF
	v6AAO4tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8AZ-0000000GMop-32Jj;
	Wed, 28 Jan 2026 16:13:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8AX-0000000GMoU-35vT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 16:13:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B33D5442CA;
	Wed, 28 Jan 2026 16:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86ADC16AAE;
	Wed, 28 Jan 2026 16:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769616804;
	bh=8MNeGIev9fZaWFqifaCXOcVD+0b5chfSzFUco8Ab1oY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C8O3mebhQPQ+Mc8gjxh/L5BobsCqF2z+LTAPzl9wlRW0dYb94VVPE+hhjJMZcA9t0
	 hWK+KcSANm2vXJm4izrdVITNF2ENlhgUzs+D3FuVkOdgiZVXTXtVqIO+GOlE20yQhG
	 HSYoxGslhQDnwnG/PfuQoCMwoZ+/R4FRP/HX5phh/ZRWmeF9//v7jx1nPGsOQDOrDb
	 dkkWzSPmIlvJxJGg0DJgPyvUcn5hlD0Usd58nv07DUJGQE6JIER2pk6bDtF0cIvuK5
	 vgVfEAg3MiWIjPDtgRh8dsct6dDbkhxdQj/4McivEvXhz7lVQchQT706fXiD1dEnDU
	 y99OhJRJ0ckWw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] kselftest/arm64: Small fp-pidbench enhancements
Date: Wed, 28 Jan 2026 16:12:59 +0000
Message-ID: <176960577143.3585946.11441770891629156382.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260127-arm64-selftests-fp-pidbench-post-sve-v1-0-3c78eda0d58b@kernel.org>
References: <20260127-arm64-selftests-fp-pidbench-post-sve-v1-0-3c78eda0d58b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_081325_796147_68021A26 
X-CRM114-Status: UNSURE (   7.32  )
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

On Tue, 27 Jan 2026 16:16:13 +0000, Mark Brown wrote:
> I was using fp-pidbench a bit recently, resulting in a few small
> enhancements which it seemed useful to integrate.
> 
> 

Applied to arm64 (for-next/selftests), thanks!

[1/2] kselftest/arm64: Add a no-SVE loop after SVE in fp-pidbench
      https://git.kernel.org/arm64/c/96e004b4bdf9
[2/2] kselftest/arm64: Raise default number of loops in fp-pidbench
      https://git.kernel.org/arm64/c/b661d753ce2e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

