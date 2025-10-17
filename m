Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222B0CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 11:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7SrQcEhSUYcmuUdv81JIKa1JW6QODcCoPOeMwyReHA=; b=Cvs5jefCOAkrVzrDVKJGiXe247
	X9/tPYyjavUySJHEJBAOjbova7GI4UuDSkfiA7B2pSgCmBxeJ4HNiXaGrUFnjtFDC3wBfKroNRN3J
	2rBUwwhSnBn/gLQYlv3bpXW4Poz9zJzomkvpIoGSW2rO58YHmDlbYzVk4D4akDh1DkfaFWAgMuQ/V
	H2ycgW+rF//eIprRQnllkzqHuTFzO5dwSAtdrWtnRXlEKJgwE0pPlGPki8wQl66VEFFi6FlVE090R
	UqfCmE3SLgfc0Eq2GB8y8qDvS2VQgKRVt1E8k5eiescVGtB2TvhiQPeDpty2SLwHwjlHPhylSe85c
	eoNaXYpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ia2-00000007g01-2lzG;
	Fri, 17 Oct 2025 11:25:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ia0-00000007fzH-3mkI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 11:25:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A42841A39;
	Fri, 17 Oct 2025 11:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A735C4CEE7;
	Fri, 17 Oct 2025 11:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760700304;
	bh=Oha5M5RT2nW2MzZklI9wS7QllDX3Iir9ry2TjWilqqc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=riBoFF8m0IcwZ+37LWZ9Kck4w0akHJzJVv7yYIxm0Fk8dSrg4j4K38bYDy99GWGYC
	 J/xmAsajaw9OaKqCLeOv6Walg3iGIPnpzmNNxlvfiEtN0Ei08Vk5NyJR+EpnYuI3fJ
	 Isr2v7iiBXOY0NnkQ5vnwAZqrZCw3sBNRtdoI3mEK74++fQfoMOEDlDdigjHjympjJ
	 GU8vjsdfjhPmKyS3wwEWENJOqTpBy/alzbSTyXtZUn++6fZWnDqbLI2OttmDNXtoZF
	 ugApFpcYV1uHfyMll8Vq9165mHODLDwJXT4eaw2hrzsrNI3JM46p6tU5uQxhsXai0O
	 RvslakHm7ZigA==
From: Mark Brown <broonie@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Colin Ian King <coking@nvidia.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251016153000.9142-1-coking@nvidia.com>
References: <20251016153000.9142-1-coking@nvidia.com>
Subject: Re: [PATCH][next] spi: aspeed: fix spelling mistake "triming" ->
 "trimming"
Message-Id: <176070030059.36285.11703430965734905306.b4-ty@kernel.org>
Date: Fri, 17 Oct 2025 12:25:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-2a268
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_042504_968952_6B7FE94F 
X-CRM114-Status: UNSURE (   9.31  )
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

On Thu, 16 Oct 2025 16:30:00 +0100, Colin Ian King wrote:
> There is a spelling mistake in a dev_warn message. Fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: aspeed: fix spelling mistake "triming" -> "trimming"
      commit: d77daa49085b067137d0adbe3263f75a7ee13a1b

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


