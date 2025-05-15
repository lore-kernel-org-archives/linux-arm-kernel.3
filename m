Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B72C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 07:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4C2LRRzx3WDUvCvgHNz3/rWUFAajWZ0jB41S4g5t1Q=; b=OOkegWNsl5yL+rJN9GNlhlb0Rv
	BQRFJmkmrHHmZ1Y+C8m5XYVrgxUYbeHqGDDnHsTfUiCykzZdGrDUDpOlXz+h9zD1MHcFEPgVEqb+6
	YDazaZPhoHRjcTlmPLxB+a0o3qJu7PVNmbtKIejCSGjFy4wvCLh3nL4nFGwQhcNXAyeUQYKGQf1E/
	1qUdQ35AxM8v4mgwI1lrWYAiVK/SQN13GLoacCM99DUDZ6kOSv2wQJhN9CwrC/01RZqCNy+XMxle3
	Rh/nI8iFHiu5zs37k2Vlc1i20znYv4aVlX5PVk8AUf5Yp+tPLE0gLcZQpozjron2vPGNNC3WnmYWf
	LlIgz7vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFT9o-0000000HNGw-48Lc;
	Thu, 15 May 2025 07:37:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFT7o-0000000HMu8-2n52;
	Thu, 15 May 2025 07:35:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CF28614B3;
	Thu, 15 May 2025 07:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1552C4CEE9;
	Thu, 15 May 2025 07:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747294527;
	bh=+KJy2T+MNcXBlOneJXLi8WasNvcgLEUfdbqlEhlSagM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=JKbDu/lsaSuMyXHGr2FudR7ulPXsrvfo4wdjpQGWb40M5hyCSuNzLRqWhKfL3jCNB
	 SA4P/flssGjW1tQmY+EUl7Jf9ONe4Dok49kDy2GOkdjFiQTZeH6EqtDZM5NgSwxL8y
	 R8rD8UklimLrAcj7OgWntQz1L4OcNcej2RuNQLhGIeEVXfTG40bxiuDdKD5+Ju3yjT
	 gyMARGGAm8VfyCLpm58mtBALD5rdXy2DMGUL9EkrtbNJNmRGnjwHLo4pWQimy9dtTL
	 64XH8YUmGIauPMQl01yOPGmmiyNe4b7TXScDHsgv1B6cQ/xVzIi435hjY6qcgRC/7g
	 xYScWXQONwQYw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250514105702.28622-2-krzysztof.kozlowski@linaro.org>
References: <20250514105702.28622-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: Simplify
 mediatek,clk-provider
Message-Id: <174729452159.272498.16252204109859942609.b4-ty@kernel.org>
Date: Thu, 15 May 2025 09:35:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
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

On Wed, 14 May 2025 12:57:03 +0200, Krzysztof Kozlowski wrote:
> "mediatek,clk-provider" property is a string, not an string array, thus
> "items" is not really correct.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: mediatek: Simplify mediatek,clk-provider
      commit: 0e4e9d75899cae4e7f379c50fa3d0121eff9641f

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


