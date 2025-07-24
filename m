Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9F4C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 23:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EuT4OECneQlqr9IoS0XFEkJgV+fWU6vO0yfNC4odBz0=; b=DEGZByx+LYuwx84vBNeUHVW377
	fTNZn/7nNjYpsVwgvBcaMaoJQsN0u5rRXtu+brIx7tqpwV/zmFgjg4sCKnVVm+zasR+LIReq2kL99
	ejcKouWFV82uJAKTV0JcORy2HLatKhOCQZ4vQN9GCCKk3B55uck1vZ+PsGuUkqE5tO7fYtvL2/XE6
	iDfvtXODusIvPCx88nf6oH+HvQ0ZEKfZs9q/c/IyTi3wR+NZVPQ4PxtJQF1fdd6JdaWGKJv7FpxGh
	4K+v/BDYDyid9cM49k0SsnUYHNlffMzGNROeKL/e1iW6baK8IV41Pme2h9mNCuJmMmf+1HCtDqfAA
	xJU+IJYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf52X-00000008eiq-0NJX;
	Thu, 24 Jul 2025 23:07:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4Qp-00000008arl-1iiT;
	Thu, 24 Jul 2025 22:28:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CDF255C653F;
	Thu, 24 Jul 2025 22:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3C8C4CEED;
	Thu, 24 Jul 2025 22:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753396134;
	bh=6UkftOwnWcxhW5u2uOEGRNPfwKgOe+LwjHtv4z8eR48=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b1Ek78QfqtZjdMROv13a3MI9lk2CQb/ZFCPsYltjPEztgLPfASrf3Xm8j7KCVtDFI
	 EMFM3YJnc0GXsXo+fbfc7t8Ain1WcuUUDNgXu9Kvoso/OnGvEMRMo+mmkz7qIXP2iU
	 k8RGxvNDx8PBNfsMvwFQMcyCIqKPonowa+stBQnBmX53chEsl0hu9oNTb3GDs1MMkI
	 npTz7BPnFKg5vu2b5Wdz/wrS/4F2o5phZaHBb2eYDuRiFp44dvlPAiRRmXTnhdGyYW
	 lkxfsoaD38OD7egR8udMRgbLPH0VlIOfkzGMc7EptWAHMuklKzvV2b4c0kOMB83iIi
	 gqCesMrV9NcfQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250724114832.146718-1-colin.i.king@gmail.com>
References: <20250724114832.146718-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] regulator: mt6370: Fix spelling mistake in
 mt6370_regualtor_register
Message-Id: <175339613258.176873.9240561400072710018.b4-ty@kernel.org>
Date: Thu, 24 Jul 2025 23:28:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_152855_502270_5DCC0323 
X-CRM114-Status: GOOD (  10.29  )
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

On Thu, 24 Jul 2025 12:48:32 +0100, Colin Ian King wrote:
> The function name mt6370_regualtor_register contains a spelling mistake,
> fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: mt6370: Fix spelling mistake in mt6370_regualtor_register
      commit: 0bd042ae771d61ef7ccd5882f7aeca59a25f71d9

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


