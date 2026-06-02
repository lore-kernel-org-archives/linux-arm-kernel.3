Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39E0CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 07:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJ8mECA75kUOQcjtQgtAIPOPtq8u7hZP0f/rp6Q850s=; b=FCub1GLw6qBMy4mCU6WvordnKp
	qJ54JfwVsQRDpMjbX2Yn8vESNxMONl3Y3SjerhK5mv+L+Y7va/Fnm58uGyIxHGtTBQIMVY/rI4hf/
	NhiTqJxJLUPPkPQpfeDltgB54+pnyThVrMCBfz6mCJWsZp75mQAiUbbZhK8LbOmDzcdnFe3cUqicm
	PLEYnTmdkNN7ybyyAQ9qwPDPo8vObiHQI+8rYeIEeLdnmANaDKIQB18560Hcx0GWD8AGRPAPJG5/0
	sTJf1NiYKtXJ8YNo10vH8cLVMiI37RHd4c0Es9nnOTdQW4dG5H2/Vo9am8s/7f/gUr3OeIWGtqmAk
	a6AB7H7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfee-0000000EQcA-3yMN;
	Wed, 03 Jun 2026 07:04:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfee-0000000EQbk-1mut;
	Wed, 03 Jun 2026 07:04:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DAD486021C;
	Wed,  3 Jun 2026 07:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59D41F00893;
	Wed,  3 Jun 2026 07:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780470283;
	bh=HJ8mECA75kUOQcjtQgtAIPOPtq8u7hZP0f/rp6Q850s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=n7Oq5YUtLDaMxkOTwEH9/lffKLtQ89ngP7idpkE63mC51fdHY7a/PWDigxIi8vaMg
	 wcb+wa9ls9QKRtkyPKqQOuA2mL0gfYQnlSiiaRRAjGuoHW4CbZAjFDLBQ40WP1F2gY
	 +RrrOE758ljDi+0t31xv3w919ENSVkujHYTW9SEGrT/G1osv7NpWFNlgXPaqT3kKX7
	 +Ex2IHWnU0j4ck0VXO8Bo1dp6jAVdJ11HZfVTgPZdvn3+/oSzg7eqy/fhMpB8BuzrP
	 fXdZFgZlsO1kRw/uAyy6z/u378msePpjBn2paZHN7Q0uLyFO4OMX6SbtJaVpb/Gj0K
	 WiGoDOQRsVWGA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Jaroslav Kysela <perex@perex.cz>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 notify@kernel.org, stable@vger.kernel.org
In-Reply-To: <20260527-asoc-mt8192-probe-cleanup-v1-0-1bb834d05b72@gmail.com>
References: <20260527-asoc-mt8192-probe-cleanup-v1-0-1bb834d05b72@gmail.com>
Subject: Re: [PATCH 0/2] ASoC: mediatek: mt8192 probe cleanup
Message-Id: <178041319393.93058.14289988542820157532.b4-ty@b4>
Date: Tue, 02 Jun 2026 16:13:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1517; i=broonie@kernel.org;
 h=from:subject:message-id; bh=omcsqXZIrjlqQYaLvoAefesboTuwmjaOhgkh4sN/v3s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqH9IHRwReoqhf5cLMJ8qmFQaLwz8otJHMPte41
 nJ7EnZcH9+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah/SBwAKCRAk1otyXVSH
 0O4rB/9RHsCPVXWkcxMYSsFb1OiZkZvz4SgI/HeA7wO5PWl6cBpRHbv19PAItK8oTmx9A6n/G9X
 Kr60hNXyoxPL9RPEtE+Ps8mu4/wfAvog9Bj7+a41T6JFdEyHVOMso5Gy3fXCM2uT3MczYZOlt3T
 WiVzj34FPJYHOR1v/CeiC9p3oZxCl/Fym9Y0AzW3HOdW5A15VzOY1lqpCRjP7I90oDaJgqng7KB
 wg5dPmMrDAP0R6DIa+ONoB+DmW5j1oEG9xHseoW4TYru47HWi9FURHAbpAH2da0JW/8eHUCdAq/
 1o/SDmNiPtnSeP8Rhg1v1aaFGLCCRiANmvhkHKq/YjeYEW3D
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

On Wed, 27 May 2026 10:55:45 -0300, Cássio Gabriel wrote:
> ASoC: mediatek: mt8192 probe cleanup
> 
> Fix two MT8192 AFE probe cleanup issues that mirror the recently fixed
> MT8189 and MT8196 paths.
> 
> The first patch registers a devm cleanup action for a successful
> reserved-memory assignment so later probe failures and driver unbind
> release it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: mediatek: mt8192: Release reserved memory on cleanup
      https://git.kernel.org/broonie/sound/c/965e17ae6751
[2/2] ASoC: mediatek: mt8192: Check runtime resume during probe
      https://git.kernel.org/broonie/sound/c/e24d5dde56a5

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


