Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69552D2F32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 19:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KCJXYmfiMfyBC12yixoXjIeIGcARN4V69yy4SWoKlY=; b=cHIWIg34JMrWNLqH7UoXeDl3p6
	zSbKNVzGPGqX/ZI5Sg37SrRT1RHptwdxHbhEE3wT0OvoA4zLrguGuvcH8EGzzurl/7bcrf0do/se/
	f6U0nH4PPxHyhYohflc89cSbJtZ2KGqTRapqIYcucFM6nAZ4Vnals8+gGTEFocaOk83+rlx7prBK/
	xv+nnFuFCWP3BkIFTOgS2bu71LuS4oAPr34OepbVlCze43nVyRzKJLU1b8wmA8tPSjKmXxP5FgWJy
	2PZqnCBxgp9Z0c2/jLAQPzuOR17b6kDk92g9MxVntGqWBbDjXMI+7BTAikCC2toHBtBMb/47TzZOq
	jqnMG+dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfk01-00000007dBE-1IAr;
	Tue, 13 Jan 2026 19:24:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfk00-00000007dB5-1hoO;
	Tue, 13 Jan 2026 19:24:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6ADD360017;
	Tue, 13 Jan 2026 19:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151DEC116C6;
	Tue, 13 Jan 2026 19:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768332255;
	bh=aGHnWKoxrswCR40fkHeiu5haG1V+3VsNg1NaCX4sHok=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AUUeiyTQsH+8Ff90pRPQiD0ZDy3y8YIaNa3NsR+dHpNAx9NETSLaInWq+zL+UYXEz
	 Ji4YQKc4VdzBgCOPCOGT9iNsvs5RUMica3J40WLrbUovCLpfsNINQIPHtnyBbjlcbN
	 R3s6yWMyPrmdW04H8eoTg8YkOB9UcQmPglYsNY5jYPkS8u3KmnA05ohrHmWN59kFFJ
	 nXZNcF3BhxySjF28POISn6HyMV2uflm8J5RmJ6W56OPlKsxgkJwhYHtyZFcPbLFNuU
	 HT/hZgK5HVyuZJkRJz69NsV+IdkqaVhRJeYMz2XSzSFqYmDK8OsOEtnu2WVtnDcAC4
	 1QhkgJn7lSJwA==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, Marek Vasut <marex@nabladev.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org
In-Reply-To: <20260107213638.505319-1-marex@nabladev.com>
References: <20260107213638.505319-1-marex@nabladev.com>
Subject: Re: [PATCH] regulator: dt-bindings: rpi-panel: Mark 7" Raspberry
 Pi as GPIO controller
Message-Id: <176833225281.1138309.16211933019311463007.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 19:24:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
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

On Wed, 07 Jan 2026 22:36:25 +0100, Marek Vasut wrote:
> Mark the Raspberry Pi 7" Display 1 ATTINY based regulator
> as GPIO controller, because the hardware behaves that way
> in addition to being a regulator. Add fixed gpio-cells as
> well.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: dt-bindings: rpi-panel: Mark 7" Raspberry Pi as GPIO controller
      commit: 62b04225e99a5d1c71c5c73d2aa6618bc2c0738f

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


