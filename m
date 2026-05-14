Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3777BCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 16:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rq2XApI3vxhogDpPbwsH2LhjyW+EEP8duXinJmEGT4g=; b=n8X1VJWRqVPoH3ZP416X1SzqwA
	rYJRbVksIUI8Fda4YL2jp3eAIwj3DwQcPb4nc7mlmGNE5kNWTqN0168AaopiZ19mxGF/ZsU5fCmMm
	iubB7QY4liNWXlooJAO0pNZbHbOtzazm72HimCjyJp3EaM70gPkXJLv5V6D6Gjh1R6tokCS81N9KG
	c404ZSPMCZFia3r9QDQDB2K+T9OTlV/x/HwRGgo6CJ/j3k2MPwNN1gaPmXp2GZq2weBbmxOhuYqNU
	PZU9VgjyCG12LU/0HWZVgu8Bee+UB16BYGI2M15k4aeK5hps6/KIiFggCdFhYEllQ1TDdlR2PzE0K
	CuCgpQXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZMj-000000068Am-3Gw2;
	Thu, 14 May 2026 16:56:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZMc-0000000688n-44Jb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 16:56:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0658B60139;
	Thu, 14 May 2026 16:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD4CC4AF09;
	Thu, 14 May 2026 16:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778777805;
	bh=aHxKi2z0EW5CeMWkd1EKJ7WBIHw0c7wEEhodM5zgoL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EyCbU6X731gxwAhjmHkdXO8MqMC7eC6peDbiICe1vXMIp/9S9HaAR/kBNhLRQHdmc
	 cDv5EacNhHrgc9pdVKIofJ4+UR+/tHWDxC9UMowLlzTd+ut2dehuqRHD5p+DfDDTaG
	 L6wZhaiw5/6vRbVJ61gRdxf9FAVQ+8ACHwRPcdN3sc4KsR2pvQOaZoyN41aK5s9lvS
	 vBka3YZKsHyiD81bsqILJYN9CBWplN5f2aT7iA0Dx+8EceXuxuTGbEc38Evy0F2mNE
	 mbh+5uzlHEKNTcfb6T3mHSJZEKvaqljMq5Rv6np7/Q/KFJ0qWp9CgNLfaBFxYlqG0+
	 5NkEtBFpGs9LA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 stable@vger.kernel.org, Titouan Ameline <titouan.ameline@gmail.com>
In-Reply-To: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
References: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
Subject: Re: [PATCH v5 0/7] firmware: samsung: acpm: Various fixes for
 sashiko bug reports
Message-Id: <177877780331.167822.16476754238198495357.b4-ty@b4>
Date: Thu, 14 May 2026 18:56:43 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
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


On Tue, 05 May 2026 13:12:57 +0000, Tudor Ambarus wrote:
> Fixes for concurrency and memory ordering bugs that were identified by
> the Sashiko review tool when proposing the GS101 ACPM TMU addition.
> 
> While these bugs are genuine flaws, we haven't hit them yet, likely
> because we don't have enough ACPM clients upstreamed to trigger the
> race conditions.
> 
> [...]

Applied, thanks!

[1/7] firmware: samsung: acpm: Fix cross-thread RX length corruption
      https://git.kernel.org/krzk/linux/c/f133bd4b5daf71bccdde0ad1a4f47fac76a6bfb1
[2/7] firmware: samsung: acpm: Fix mailbox channel leak on probe error
      https://git.kernel.org/krzk/linux/c/b66829b17f6385cc9ffbcbe2476d532d2e3121ad
[3/7] firmware: samsung: acpm: Fix dummy stubs to return ERR_PTR
      https://git.kernel.org/krzk/linux/c/b4a38606991c0fad165f754db554961aadac247d
[4/7] firmware: samsung: acpm: Add memory barrier before advancing RX pointer
      https://git.kernel.org/krzk/linux/c/9dadf5a788164dc460a4f25e4e8798de510d63d5
[5/7] firmware: samsung: acpm: Fix false timeouts and Use-After-Free in polling
      https://git.kernel.org/krzk/linux/c/5ae6310453c7b1bc7848196a9acbd33584c4be75
[6/7] firmware: samsung: acpm: Fix missing LKMM barriers in sequence allocator
      https://git.kernel.org/krzk/linux/c/a7569019007a448826571f880d0010b7f1945e12
[7/7] firmware: samsung: acpm: Fix infinite loop on sequence number exhaustion
      https://git.kernel.org/krzk/linux/c/10313b4cca783ef2e38b2a76dc42dda481d7ebf3

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


