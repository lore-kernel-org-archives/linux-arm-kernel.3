Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9417107527E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 09:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mz3/0bUdO3L9IFcbvntiAIB0thIcBzmMjN9hqW4YLq8=; b=PpPpKM581S6beeTqBMykrxdo2R
	xeEz9bzAYFaE5fKcGsBMgWe7IYMhyQtHAgyEbCugRevQpOqqzaVUeMaxG5rT6w8bjuYmk8VlfDoFl
	IV7FIDFUxnbZ9035rtCdO/HqqNkBM7wO0P1L/mGQG19Mpuxo7aXeLVtNCDWN7wwDyDbJWJzOYZlkM
	pgdKjDuQICzM7XNskytgJ8M49z71+7farHy387l1do5a+0oedpxCVMBVq+JZ/XHS+bO0U8viVUKua
	QcjPQjTp1fLCtYMj0cchLL19sGxdZqCtEUzlIddVxJwMBGnIFG8xEuk3X8NcMemPO3nnzmF6/kEXw
	Gp9/R5uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39OZ-0000000AIc2-0cqL;
	Thu, 19 Mar 2026 09:10:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39OY-0000000AIbs-0c32;
	Thu, 19 Mar 2026 09:10:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3700560127;
	Thu, 19 Mar 2026 09:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3CA0C19424;
	Thu, 19 Mar 2026 09:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773911420;
	bh=SFQprSEcRbd0sUEH4z/HfWCDy2o+uC17ZqdkLyOFFRU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=c19vVM0xRXNwNleR+xoXOzDBuFF+D3IJKNDRdL1wYwrQKrpsXxSIRF3qRMF/iX8sj
	 DZK4c3fsTYoOV+NmYL2JcjtXUw66oB+A9MN8owWRzfd9FAy1SkjNIyJ1cZnOPYB9nD
	 fXKVsh5+tVZHpSODud4G8Cs/GJCKvUT7CwjhjHn6yuFC62FmYDkanXSX0RGQzwFHoC
	 3szyJEvqZRR2LdoguD56M5JtvP0t7OuWp02HUS/0v6ndBRn30OB7KaDib9Qn/VXBhO
	 e5GzFdpI67SxqqdnG06grmXQI8IhXpLzscalHcCwAB2UGx5pqrojBT063y2ZEPjUAI
	 8ZsXrvROIPN3Q==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>, 
 Stanimir Varbanov <svarbanov@suse.de>, 
 Andrea della Porta <andrea.porta@suse.com>
In-Reply-To: <cover.1772839224.git.andrea.porta@suse.com>
References: <cover.1772839224.git.andrea.porta@suse.com>
Subject: Re: [PATCH 0/2] Add Power Management support for BCM2712
Message-Id: <177391141841.2547156.2301777769879399515.b4-ty@kernel.org>
Date: Thu, 19 Mar 2026 09:10:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
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

On Sat, 07 Mar 2026 00:41:20 +0100, Andrea della Porta wrote:
> This patchset adds support for the BCM2712 Power Management (PM) block,
> which is necessary to power the domain of the V3D graphic block.
> 
> The implementation is done in two steps:
>   - Patch 1: Adds the SoC identifier to distinguish between hardware
>     variants.
>   - Patch 2: Adds the specific PM support for the BCM2712.
> 
> [...]

Applied, thanks!

[1/2] mfd: bcm2835-pm: Introduce SoC-specific type identifier
      commit: a1c5073dac90aa5cbf187697401d9b3eff2bc269
[2/2] mfd: bcm2835-pm: Add BCM2712 PM device support
      commit: 5849d8afe131012bfefaee34dde87fe5c82ddce0

--
Lee Jones [李琼斯]


