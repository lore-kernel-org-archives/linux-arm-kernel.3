Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A93C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 21:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ep/N202nJDJVRzqeGaKn6vpcgvCSfEz3KGhmnRvElUw=; b=uLk2hQh7fME3ffb+MySJg4XeIJ
	gF5jKe9Awxq024GfoTJoR4mtOPrlcxmlmJvQcbI8dPkFNKBtk+bizHfqaUNLkAWCipd01wokgbSa/
	A6oejXoKgAzR155sjnpTclWDWOOJ7PGw0vZplNRLcqvNdhklqVJpTLff4lWbFKhdELK77S1D9vt8V
	moosgDjQ44JTck9T7LWUeRxvpuMPKsiwsXfWTuhRgLXRlnaay3MCyVO4MGudbA61NgHHvCM9m0lp7
	Z5CL4u8Rb7hppG9WTLoa/+Gu6POQngFcVf2bHwCz4VkmaDqpkxWh7TmRpru74QuDX8Sj9wwQkTZR6
	jSogzZbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3GT-00000008Skj-3Ugj;
	Thu, 24 Jul 2025 21:14:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3Bh-00000008SGw-3i2e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 21:09:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F00346511;
	Thu, 24 Jul 2025 21:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E71C4CEF5;
	Thu, 24 Jul 2025 21:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753391353;
	bh=nFlm8N0bOxTn7QBOexrfKe5KaYKZqvAsJ+gie68l0VQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=DUkk4GhTTHugFUqVtTWmlwUrEFfwmGfHtrK9yl8rWQyM5WPueNYoV2PwHnR0ztEmk
	 aLkrOonnw96yHpvs6WZw8a8E1Um6yOqNnT/NB/HCb24WS+yCO7VTPY1HHYQbBerg6N
	 lfNUtFXwAFzilduSb2eUndNmg5WU1e51CfMXd19u2FbjpZHi77/Nqj53439L6wrN+o
	 phjjmJYWtHrVv17sbAAD+tlKp7gc22tYuKOLw7LUmelwCD0hayFlqmNkiRQnerT2/4
	 TwwRvwNqasJt4XsiqPMgP7qNNtKwRrBoVKhIXkcRBkDT7Tbrc97QnRFZe8RdYtiOtJ
	 U/b6+Ma3IlNTw==
From: Mark Brown <broonie@kernel.org>
To: claudiu.beznea@tuxon.dev, andrei.simion@microchip.com, 
 lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, nicolas.ferre@microchip.com, 
 alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Varshini Rajendran <varshini.rajendran@microchip.com>
In-Reply-To: <20250610065005.64070-1-varshini.rajendran@microchip.com>
References: <20250610065005.64070-1-varshini.rajendran@microchip.com>
Subject: Re: [PATCH] ASoC: dt-bindings: atmel,at91-ssc: add
 microchip,sam9x7-ssc
Message-Id: <175339134961.153218.9352688179256813035.b4-ty@kernel.org>
Date: Thu, 24 Jul 2025 22:09:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_140913_946665_F0CCF521 
X-CRM114-Status: UNSURE (   9.04  )
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

On Tue, 10 Jun 2025 12:20:05 +0530, Varshini Rajendran wrote:
> Add microchip,sam9x7-ssc to DT bindings documentation.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: atmel,at91-ssc: add microchip,sam9x7-ssc
      commit: da98e8b97058c73b5c58e9976af2e7286f1c799b

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


