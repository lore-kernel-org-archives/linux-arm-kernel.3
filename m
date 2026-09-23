Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC444C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xs5gJ/grQyDHbsgJ1oP5z0dJ2zNZ69341O6C0BuvK0k=; b=JgcEPatqxjVwIHZK//QqCXj1UZ
	46p8bi2kcZpOK2X3ksGj2PPwyt5j+fujtL12TeT7XUL/mFZGJdQ2VdzoP7wu1Ms7iMs2hQNia1Krg
	6xWx3NcTu/v1etU6AbT5Op+kCLsre1FBExbgzIEy6QT90K0rmPoY+NN5cpEdY6c2s1W1iKGYpczGV
	Gj8l9rZrqbRPzwsw06zN2CQzG/I2NNhy2R7dOafE39cSJG6PREByw1r4Vk8sPSstyVtvluOg36Yk7
	BpiQvP5siBWcQ+sVYyKv/7MZZqOMNbpN4GPxB3d1Rea/SABQeHP6lDSazgLungcfknUs00l8lApCm
	+TCX8Z9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9N2Q-00000008OWR-1duL;
	Wed, 23 Sep 2026 13:29:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9N2Q-00000008OVx-017J;
	Wed, 23 Sep 2026 13:29:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A3B8402B3;
	Wed, 23 Sep 2026 13:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570301F000FF;
	Wed, 23 Sep 2026 13:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790170169;
	bh=Xs5gJ/grQyDHbsgJ1oP5z0dJ2zNZ69341O6C0BuvK0k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BX8OYWNeIBvlZm6TKh4YFb2Ly8T/nWPAMiN5+HqX2KOGKQVoZ3+n8GB08KoZqkFS1
	 6yNgTarln794eLL88NL8/NM5t2LKtf/JOFK4kUHQyU7qECMDVXGKDq9y+VQ4rAXScc
	 6V9ZACxqdxznVPGnIUWEUebwxLtcrEZGmLxaqU+cMP+e7Fn8SGvL5WrTfVSqXnJDVX
	 Z87w+CazsVRui5GBdtS2VJmit59hyampAvHTTlBm0bDsGV7/w6bu7+jHkKd1Tf6AOh
	 LLf4xXDhS/iSf2lwH42kVGf9x/diFbUdUachR7fhG7addlZA7TyWPkBgDPljmbDVcf
	 zZU+tC07d1ypA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, Flora Fu <flora.fu@mediatek.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260922195502.818012-1-robh@kernel.org>
References: <20260922195502.818012-1-robh@kernel.org>
Subject: Re: [PATCH] regulator: dt-bindings: Convert
 mediatek,mt6380-regulator to DT schema
Message-Id: <179016022040.322763.11628592193956081664.b4-ty@b4>
Date: Wed, 23 Sep 2026 12:43:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uujgvklY7PATqYba/pben/w/9c2gUvK55dUyGu3mrqg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqs9QyApAIsRHkrfGa2QTf/4yUUudYST775JeNL
 R0m9o1xu/OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCarPUMgAKCRAk1otyXVSH
 0M57B/9Oo12YnBveuP9UDqL2bseU7+s9RLZ5C6h/ZoXi3rfVfaaTKkUNLFZn7lVrgDQL/9wTn7t
 X3/GW+MiMJsmNsDihxoD+Jfz9X1qnvbvE7dT09fDoG6MazFiWC4GI2apjbZYDpuJnzIDnIkdJSU
 P47fS5hwchWaBErnlBT1jBiLN2SwOM+ZCmMGA6Cn+4hWkDrfV9S6ZZXDVzEqnrXqBzzZr3r64V2
 UkCxsXrrXlDwAWeEXn/wPjXHG/3K7eXACPJWTVOpswFT/9v/yWSwO7BP5VymcoxO9nP3P1sgpU1
 3xx0l3Irqq3FnGxhRtw6jUXnBHkHUQ/ZrArqLQBfRoIhOWex
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

On Tue, 22 Sep 2026 14:55:01 -0500, Rob Herring (Arm) wrote:
> regulator: dt-bindings: Convert mediatek,mt6380-regulator to DT schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/1] regulator: dt-bindings: Convert mediatek,mt6380-regulator to DT schema
      https://git.kernel.org/broonie/regulator/c/22fe14c9bcb6

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


