Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6646FC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 21:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKBbhFVa059S4cyouWrgkTaUmVbQMUrd/Wmoh8VXRiI=; b=q2i5sPjbsYsAcogcd1m32YLTH2
	qSYtCDV4FOLt55qufjTQBinghV1JkPr/poEYIfNKDiHaKFbQXsPUTlWlKrkCADfL987wAROYW7eIe
	1tov0bctFbUAv8tQK+qZWqvQJqkh8uoDFJUIbTJWtmGsNQ9cC8B3CxA82fTGgtMs1N1yFm0hol87B
	p++Wiwb6qwxd/MTUS5XHXg+f5JrXVTGiPMMFdLWe4n0dJiJo0UGMvC4w0yw6tBAd36BIv+zeLCq88
	FFufeYyK+GCOqKg4J0vxE/WHTGimoD0a3HbEK+cmSplIi/mSY7CWc5eQ41tdgD8W84YdcO2Bkzo3C
	Rwkey/Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3hC3-00000007mox-2xM6;
	Mon, 07 Sep 2026 21:47:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3hC2-00000007moW-3MA5;
	Mon, 07 Sep 2026 21:47:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ABC5F601FB;
	Mon,  7 Sep 2026 21:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4551F00A3A;
	Mon,  7 Sep 2026 21:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788817677;
	bh=FKBbhFVa059S4cyouWrgkTaUmVbQMUrd/Wmoh8VXRiI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ixu1xORodadWwi/1XFRNAhlOiK3hz2ID/uCTSrrn1ZAQ7BM6fCzTUG2AcWv01QHRJ
	 1hpketZND3mj0Q2DNeo9Nq07+GHiPz4GFCL1TfS6uKJ0o9U6sm+/1uGxhWVSfKJIXZ
	 JjnE0fSO/gJla807G+WttOfNP1OnqXR/MbV89cNZ2C0oCcM8uZ0IHe8usOJJF2zW+j
	 S1/Ilr3i+NaoHHJonBr+G7WMZLbi1uUwhCTftEFjA1x3mh7Cs6ncI5I+Uf6KOb9qVV
	 MRnwQHMbo5GOE7ky2qJ4rMAV0OwaEZaSJ1hoDPOuMTU7CPTU94u0VdW3ovlr4K2nnp
	 N9Owo3NOgs+Ag==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, "hpp.iscas" <hppiscas@163.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Kai Chieh Chuang <kaichieh.chuang@mediatek.com>
In-Reply-To: <20260905133210.63803-1-hppiscas@163.com>
References: <20260905133210.63803-1-hppiscas@163.com>
Subject: Re: [PATCH] ASoC: mt6351: Publish the OF module alias
Message-Id: <178880730290.118202.3003996533999491750.b4-ty@b4>
Date: Mon, 07 Sep 2026 19:55:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HXWAokHFgJeO1B9vW0w+sCrmC95999arTMjNFJAR6yI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqnzEIcuBe9d/xYsCjxZOdBv1mqeJTu7OhGl0qN
 I7sM5tkaemJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCap8xCAAKCRAk1otyXVSH
 0D8FB/40FRMYjNrvXYNR3VAn93IMc/gprjYD8QYyYiJo0cIiW/1pgqKrSnb8ndluSt3Y0Xk9dhu
 FpHO2AFUcMPrcBI28PNypbcS4nfscT0DtOpzJ1rcz2As60H7MFRItBwX+53k9wN28uW6PJMkKvt
 F8ENYsI/3K6ZO7ViVchdMdnjuapXWKOunAu+5cjHxiD5A0j5PWzgtVe5IUbYmDz9nMgs+1jB6kE
 9Cw35/AIswztZRkH/9sLoeVBOE1CW/SH0JIzq9/tNBTmZoi1SV6QPzHGYbfBdjMXXkFBsojZe1g
 SgoI3YytVb8NJXFeuCmKVBa4+igGuauMhBEinhKe8dqR4OCR
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

On Sat, 05 Sep 2026 21:32:10 +0800, hpp.iscas wrote:
> ASoC: mt6351: Publish the OF module alias

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: mt6351: Publish the OF module alias
      https://git.kernel.org/broonie/sound/c/9c3882ec1039

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


