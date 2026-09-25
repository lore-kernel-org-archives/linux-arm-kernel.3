Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADF6C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 19:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YP0jp5v49HBfu/4CPw5wckFxck6BRjFdgu8ahuF2rz8=; b=RizpPGpTBYKnaqLvmD5qYWpSEr
	BcxSSkLfjLlVBak7jcsiTqzhKQyf6nBk+h7JYgEo0uCPBhvdShiw/6BvFAjaU5sAv+rxWKwTimYAt
	hD8sjm0d9fnsF+g5zIweXQeevVtiNuTIEbgDThEiBzLXbTs9C54g1StQ16GbDWp0WnR8yopiYPPDO
	g+EdUbCKeikeGneer9KRqvORwTcb9si44RSuG1SFPavMmI7aWLFNq4g+aH4Ds8swTaqkxPqJWFWi2
	EkG7rijgqieu6ZUq0NXafZ9oTxx41uL+gmFi+pHpkAdMnlNpjZqHTe79xsoFwqJnX+/XFibMFWLzr
	MnaqZ0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABGn-0000000EE4R-1zK9;
	Fri, 25 Sep 2026 19:07:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABGm-0000000EE4D-19J6;
	Fri, 25 Sep 2026 19:07:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 62CEF60136;
	Fri, 25 Sep 2026 19:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3D11F000FF;
	Fri, 25 Sep 2026 19:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790363259;
	bh=YP0jp5v49HBfu/4CPw5wckFxck6BRjFdgu8ahuF2rz8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gNdlpKWjpharo2pflu9Hw4lNxfIqlvjDea5O8EddsOrfVXoqpnclBrORkQJdxHUBR
	 rH57BTI5njhcoUt5Vs0r6QrVUT6Bl73M/XY/T4wzTwtO1V7iuomXmpCRK0J/Fhnyf6
	 UcfgBlsIGyajIiLBGHjLA6jd87r0YHm7Q8nqQkoKJpSctFD5InpnOxDcRsvxnGA8oO
	 R1EHNb/kYs+2s7SQ6NPXDwcOMB6laaePrYCa3FTZT3YFuxS9TYFSC8/3UfS+yAyvxx
	 kilNinZVaCEPwIzQd3OYtmTXVLVJEJNrWHtoiRwaoDoT8MQUbPZYtd+dNdh9sC0h/j
	 GFfoMk4N/wxZA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Justin Yeh <justin.yeh@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260903062056.1024263-1-justin.yeh@mediatek.com>
References: <20260903062056.1024263-1-justin.yeh@mediatek.com>
Subject: Re: (subset) [PATCH 0/2] Allow mtk-regulator-coupler to be built
 as a module
Message-Id: <179035830762.204944.11395615043279520095.b4-ty@b4>
Date: Fri, 25 Sep 2026 18:45:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1408; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zRVcaemvTXGN2bgQi7y8081cQVO4m1OogkEA4cAdlhs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqtsZ2iAa86OMZgcUEc6IZB413rreoq6GqVNrU6
 zs8EXGoVjWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarbGdgAKCRAk1otyXVSH
 0Mn5B/sFydko7wvhS6Bfz021cH+toSSqYBm7jep2sftGtRTB3RZKnCTUgWyt1GjP1Ej1hrYkVzI
 n1dR0VJT1a9ecpWC/5sv2yuo3r+YDk24z4mO7AqsvRRq2yZXjYKvfqsQxR3j24vqID8S37i6Gx9
 fcG8sE5sARRaXi9+cHpvQ/EoyS20V4JVofWjKo98NCFoglaSS6gYnOukPSgiZknPEjJ7aObwTHP
 2kAkTCvVCdkYtT2amoGbgzTm5iKaQucZrm5lEVNow28Di2RKbiZiCIJw9MqUk/DO56NARN09/fK
 3nJCmgq7pqk6fca4sadAeGaKRCoHRShimlvxwMh4wSI9nAnY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Thu, 03 Sep 2026 14:20:45 +0800, Justin Yeh wrote:
> Allow mtk-regulator-coupler to be built as a module
> 
> MTK_REGULATOR_COUPLER can currently only be built into the kernel: it is
> a bool, and its prompt is hidden unless COMPILE_TEST is set, so on real
> MediaTek configurations the symbol has no prompt and is forced to its
> "default ARCH_MEDIATEK" value.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/2] regulator: core: Export helpers used by regulator couplers
      https://git.kernel.org/broonie/regulator/c/59951bd9c6b6

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


