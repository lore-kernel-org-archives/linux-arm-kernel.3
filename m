Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF78CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 19:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZkXKuYPcbG+9+dVLyedjjFJ1dLjkS7g02eF8dW/xnI=; b=cn1aOGodyxWqpXV8U/1KkehwSK
	7CEuob2FD7e++WuEL7/UMpdCqt0iPHUhDJHXlm5ruwDPF15/6zafrbaOmGX+UkxPK1+mTaJ3CvnFL
	b/KX5f8wPySdd9Zn/Te87nfU/NZkstsfrlhJ14OKzsHy4dcwilOTHtMfTE6qu8Nj/OriFfZ+2Y3/G
	qxYh3H+VTZx20jAfcd14PET9h2LsBRzLq0be33ePzHEcW0P6e77kCGNuX4Ar4HVGEtlXJMaCqTs+Q
	PU9Fi/DwNiIgJP92QjcPD4BEJ3w/L6/MhyxuAWssGeoBL33OTJgpjd8SpGSejDsIBVp2c6MpJF6XQ
	fjHQ4w+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhTX-00000001s9n-1L08;
	Mon, 08 Sep 2025 19:24:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uveDo-00000000auT-2ye6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 15:56:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2316560054;
	Mon,  8 Sep 2025 15:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC5EC4CEF1;
	Mon,  8 Sep 2025 15:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757346959;
	bh=3QPTwbhduu2dP8D2E7G/tU0gXRTNUJdIG510wmSZlbY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UP65rJin/AZ9cx5t+pjQ3qg22tsP5dc4u8R4ai2bBDukl9PkdnM/oZFBtptd0sZSn
	 EySGVZ2WgWPkq4KLVHcw9JXAZ6lXyNWZYt/yooBIyTQChW6lDaS6CjRNyklPS+coqJ
	 VMCsG+Bd/6wPWl4eNHWJhgneqc+gNkbOCwikVB0QChmaUN1QNRp9NkybRtYSxvUgGY
	 81DmdrbB4t0qpG7ZtIKeGq02PTMxIHJVCRJJwHAipeQ0LW4XtK3r5TcDwX5LDkLPsJ
	 +YbKvjYWUmXDjii8rBV6i55sf3XsUFplKmnx0ovwlPXba+VL5Wt9/2/6oyriaP1SJT
	 kC37Z5fFpoGeA==
From: Will Deacon <will@kernel.org>
To: bagasdotme@gmail.com,
	Markus.Elfring@web.de,
	broonie@kernel.org,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	shuah@kernel.org,
	mark.rutland@arm.com,
	ebiggers@google.com,
	martin.petersen@oracle.com,
	ardb@kernel.org,
	thiago.bauermann@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] selftests/arm64: Fix grammatical error in string literals
Date: Mon,  8 Sep 2025 16:55:34 +0100
Message-Id: <175734463405.156831.1715928321630007279.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250826214913.866695-1-zlatistiv@gmail.com>
References: <20250826214913.866695-1-zlatistiv@gmail.com>
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

On Wed, 27 Aug 2025 00:49:13 +0300, Nikola Z. Ivanov wrote:
> Fix grammatical error in <past tense verb> + <infinitive>
> construct related to memory allocation checks.
> In essence change "Failed to allocated" to "Failed to allocate".
> 
> 

Applied to arm64 (for-next/selftests), thanks!

[1/1] selftests/arm64: Fix grammatical error in string literals
      https://git.kernel.org/arm64/c/14a41628c470

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

