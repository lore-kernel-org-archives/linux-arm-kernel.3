Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380EF606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 19:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P4qmCPzq;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e97rt7+f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JbMEaLInfJZTikyj6sTbndfICmjNer0efXBtfT3t/z4=; b=P4qmCPzqikjP4E
	HkKeSht8alT2MZSyJxbcoIP7cMu8x+T4vuruhB5IldU0Fe1GZpTK2opmLu5IHb6vVjuvgZ9do65JZ
	nj4tJECyXjUptRcVKmSmEXqm1ulCZ93c3hyC4oSekFADR459mUE2GYY9fPwzmAsc+zC89piMIyyf7
	GWdf18EUiHuTxCK77gDbY9TlxHVfRXPhckeei1Pba+L/cPvP5cDAH4qY9n2IFtWNJ5Kvo+LQIz1eD
	wD4/Tjsp0/CzOtXt7pJAEGOMzNQOI7B0nDofGw1oMvydzGLneKK+IQseLkyaDQ3z5c8/+fYA3QZ/y
	FckajyPDZYRPvZLi3boA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxsG-000000007EJ-1voY;
	Mon, 02 Nov 2026 19:39:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNxsF-000000007Dy-3e6l;
	Mon, 02 Nov 2026 19:39:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 56F27417BE;
	Mon,  2 Nov 2026 19:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D78F1F00A16;
	Mon,  2 Nov 2026 19:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793648359;
	bh=JbMEaLInfJZTikyj6sTbndfICmjNer0efXBtfT3t/z4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=e97rt7+fYVS06nnercX285Pb/2VysLZOY5Ijme2sohfOvFOKVsaY9E+Sj+gwD1ulJ
	 MwHVa8aF8UjhGdwWt6QruaR9HA5g9wf+vblucB1NXg0ntlaPNV8pCKSbK7EKJZJbhj
	 zRBjZk+PFYGFAopr5Qy267xd1sfVGJ47cnOoXhlvJ/l/z3cd/9vSaFncABJwO4cnjO
	 CuNyvBrhvCCa4/+daiTyMDJtQb/QBXebIrXSPGThAUhSZbUAWdFqWPrVyI/W9+6Smt
	 DVsFgeuwQY7sDdonzE79SifCG6LQ5fO/w1Jd/ABEy3AxivzLCla2acQvpmu2cPOg2F
	 SCXiL5BaSRCqQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id AAFE323DFF18;
	Mon, 02 Nov 2026 19:39:16 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>, 
 Jun Yan <jerrysteve1101@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
In-Reply-To: <20261101080926.267041-1-jerrysteve1101@gmail.com>
References: <20261101080926.267041-1-jerrysteve1101@gmail.com>
Subject: Re: [PATCH v3 0/2] ASoC: codecs: Add Everest ES7202 support
Message-Id: <179362860891.1990291.9978990707739127303.b4-ty@b4>
Date: Mon, 02 Nov 2026 14:10:08 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1593; i=broonie@kernel.org;
 h=from:subject:message-id; bh=57IEY5sLI0R//srJiFo6NAVqvbCrI7pKU9CTHZdofwo=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJePHuyJNJxogH/crU1D3XeKQRMSdjfd0tpc0Gtj68L2
 ybVs9ULOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjARW1tGhp4iDlnNYNNJTe6B
 KQyXPGNkilY2peq+PNW045HB5mUbJjH8LzePqJoYY9eeteDFyua0U0W8fHuPrnrbtfq9BZvMqnR
 9RgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 01 Nov 2026 16:09:24 +0800, Jun Yan wrote:
> ASoC: codecs: Add Everest ES7202 support
> 
> This series adds support for the Everest ES7202, a 2-channel PDM
> analog-to-digital converter controlled over I2C.  Patch 1 adds the DT
> bindings and patch 2 the ASoC codec driver.
> 
> The driver is based on the Rockchip BSP driver, reworked for mainline to
> use regmap and devm_ helpers, probe the device ID, and report the actual
> per-step PGA gain.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] dt-bindings: sound: add Everest ES7202
      https://git.kernel.org/broonie/sound/c/ded65056b6c9
[2/2] ASoC: codecs: add support for Everest ES7202 PDM ADC
      https://git.kernel.org/broonie/sound/c/063273b18195

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


