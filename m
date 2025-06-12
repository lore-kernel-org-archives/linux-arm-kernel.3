Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B751C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 21:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgrQLQWS9o0V/8PhYEm0toLrZTckUgoOpVOkpeNYIfA=; b=X2LbT1SYf+xaKQNgvGp+vCdq5C
	7Zdp/ZxyQvB59Clcp5a2Gq3lQuaoCwSgJiJw8FMPh6izJ3jGv7RFqYRklvl9y8K3tZAoJQ3np/gZ4
	oaDvaxMnV3UKsn8hyHoS5euDxcYo4LTc5nki2D66EPc+PdJm8u58gPbsa03Qk4Nmd7b9TySwJ9thl
	XbgCIHFi4k0s3iW1Ma/VT7Jz+0f3VZi0ypw1kjVDdpz2T7RsOur7+KzaqRsYVjMKaUzfT5VIJx/Aj
	vXsQA+gnuNZSkDGZecfroez9A8oeNTwaWGTNVPsqIuEUU7dqmAozhe4na6pW3duOjE/S4KfrH0XYl
	oJvATfpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpAq-0000000EccK-35I1;
	Thu, 12 Jun 2025 21:09:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPliY-0000000E29v-0wja
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 17:27:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D6C25C67AA;
	Thu, 12 Jun 2025 17:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B232C4CEEA;
	Thu, 12 Jun 2025 17:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749749277;
	bh=PrgQmr9RGtzfNpjORGADjA2i5T/gKByYDyMqNAkbjes=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JdEHI+PmeDRk8zkYVqYlfi2GrqiuyzNBDkU0uGBP+srqOtivqC5GuXcW+/Hrxk9Ez
	 IWAzLphX/Vw4OjSIFz3eB53BUjmv8w5q99NWMD86VfLs4KWmhOifk/LQYU9+2iIW8b
	 DuwMHa1x/SumFcaGZDaKVrojr/5SITueFRfR7PMAITq+bno1Cfbj2Pb5OKn8UydK2K
	 lsa+RzSf7+MMEB0M5JqJmMgNyjL4RvHtFgbk8jQBQrjqdPR0BjkrTUvgzFOdssXs9O
	 +6GSvNSZC0ULfdOEtwMYaL0KqH3cjr2NSaN6u1JQ1lQMOzB3f9XQSDeJbSTAd4wIzP
	 hi8F9FV+D4Z/w==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] docs: arm64: Fix ICC_SRE_EL2 register typo in booting.rst
Date: Thu, 12 Jun 2025 18:27:47 +0100
Message-Id: <174973980080.2446925.9518474417822842973.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250610120935.852034-1-lpieralisi@kernel.org>
References: <20250610120935.852034-1-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_102758_300418_BA86FCF1 
X-CRM114-Status: UNSURE (   5.95  )
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

On Tue, 10 Jun 2025 14:09:35 +0200, Lorenzo Pieralisi wrote:
> Fix trivial ICC_SRE_EL2 register spelling typo in booting.rst.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] docs: arm64: Fix ICC_SRE_EL2 register typo in booting.rst
      https://git.kernel.org/arm64/c/c0c7fa4e7a51

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

