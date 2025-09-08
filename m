Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4147CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 19:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MDLH8KDavbhElvYEeGASjt3b59nw3BEYffUz2BhRUhU=; b=nhERh12z6E1lNuKh7ornkXSyHk
	Y061PlgIifRo6MQJKE1E26NzYehd8isyUe3h/fQ4lVwhfV8V/gX4dkjP1FNdDdQlRNZIPLkD4gaGN
	dDtWn4I/HRAiZnTf/4eF3yaqDY30uSqYsjpp+Ur4oG1gXQnQtXLFdf/Vsj2BHxrPh4+ylfZgk8HgJ
	cBHEq6I2x5XULXb/o6utnnLC+7ecU2gBbimWkTSm7v+XzKY1OK/so8WZLOChUMBHIfYoTbzsO2XBg
	fbxJU+3qCeFQCFc5UIadKG+jZ7bKy8uY6MtLBuYtESnB15lOmejfTzabke8gFJmLDBx/rXVdpq697
	RAcJ/ZCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvhAZ-00000001le7-3E9e;
	Mon, 08 Sep 2025 19:04:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uveDW-00000000aiD-0SeJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 15:55:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 84EB2601FD;
	Mon,  8 Sep 2025 15:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1B5C4CEF7;
	Mon,  8 Sep 2025 15:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757346941;
	bh=DizzKg5VIDcP8L+ZEfS/2/xa/RROiz4nTvz9DInCpd8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z38RrBL9jOJYM/P5tXNOiS2jkhaKwHC++0XXyY4dJwVsQoZEhoPnL6VRhO1z7JIjl
	 gi7CMBaaseAKOPFPvNc4UOFiCIM+t0V5lh3CwNOYYDA2SJY/3Um/FcmfDWfy1hwQ7H
	 xrOPQQLlx8HKtnAaJKPbeNWQRHPFzbZKP19T7giN/qOaq1wh9/dBn52gnuItDY7ouO
	 5XrOCkQaj6S37PiKUHES/udqHEvUbJ1c4pYH0A6A1npZGyJP4GD0U8f6JO5ycUSWsA
	 5esj0uCbcmB9Ou6e7e9J91dN0YsxhCFJIeWCvDGpAhFId8RJGLSKhyaX/P7J/myefr
	 uNo4v4BXjdFvA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/sme: Drop inaccurate documentation of streaming mode switches
Date: Mon,  8 Sep 2025 16:55:27 +0100
Message-Id: <175733401206.91195.12940628509924658208.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250723-arm64-sme-mode-switch-doc-v1-1-702bb484b4f4@kernel.org>
References: <20250723-arm64-sme-mode-switch-doc-v1-1-702bb484b4f4@kernel.org>
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

On Wed, 23 Jul 2025 13:27:45 +0100, Mark Brown wrote:
> The SME ABI documentation contains an inaccurate description of the
> architectural streaming mode entry/exit behaviour, just remove it since
> this is better documented by the architecture or with the rest of the
> documentation for the specific software interfaces concerned.
> 
> 

Applied to arm64 (for-next/docs), thanks!

[1/1] arm64/sme: Drop inaccurate documentation of streaming mode switches
      https://git.kernel.org/arm64/c/3c0979c64481

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

