Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3F8C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 22:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4Awgxk/6qZuiOs5NBt5iKLdvwHRlQ2uTPMeZaAPeN4=; b=ntdv5m533PQgipDHBaQz3+yRiv
	kFuR1bhH5M26msxmaw32eM78B/Q3UW+kLQWARAXFjN1kthBEqmOW6AzcVG6y5x+IsIBdxe3XZEnaS
	xctYccdKhpkpJq4vWiS522yVGJMpWerumZJzl+u2IjkRip247yIjq5bEiSneCfkCKuT0Xr4EgzKay
	DFP3h3t2zujLJfqMi8WTShK/ck0rUnum98CrvFFm3h/IuSWCpjTUsSledI+/XXaFA8hwZKHA8fUO0
	unfuHGSxUXtIjGNpILz2Au13zNGD308YLp9eti2dpDqr9yNCJWWAghSpHJj1ytoGr+zvUvhPYk7FE
	Wrhxbm4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Fr5-00000000hyJ-496c;
	Thu, 03 Sep 2026 22:24:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Fr4-00000000hy6-1wSz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 22:24:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E32842A5C;
	Thu,  3 Sep 2026 22:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3331F000E9;
	Thu,  3 Sep 2026 22:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788474261;
	bh=r4Awgxk/6qZuiOs5NBt5iKLdvwHRlQ2uTPMeZaAPeN4=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=BfsP5sYC5/Nqio8sYBOh02H7pgewe4wVisN9kP+lp33gRywxmrMQN3m55asg1ljwb
	 V70GJjlOaK4UQusnacxTH4HHAG0zvDr4NKrpPX2/+YtlUrB9AGLPYkcBc9MJDTvoKq
	 LqwiELoZMy8Jj8A5BDEq2H7eEoZJAMIGSvsq7FgxDQLFU+WLkLXYBrkRa03ENyB4n5
	 Wer75FnMMZuFbMiWqw/72AyxOhvU736AIPMpbGwa44QiCG5fRCj/GfGajKP8w2ZOwA
	 nDdM1qLakaJbsBfKTsLdbIdkft0cgqpvz87JUGinczdAvUi+05RSPn7E6IQ165hL9O
	 9soUu5ewR1+3g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260830084046.14679-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260830084046.14679-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: imx-audmux: Replace tabs with
 spaces
Message-Id: <178846125559.7659.2373412974052957861.b4-ty@b4>
Date: Thu, 03 Sep 2026 19:47:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=R5ecAYavOe/shWm/VHZyOlX0ILQ6IoRlJWrBllw86so=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqmfOQANCyZh+kF83YBereludMZCIbGXvNHdv9n
 qSQ+PVVaVyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapnzkAAKCRAk1otyXVSH
 0MZ1B/911WzFcnjK0xMG7i2UmccxCAPh6RL/mwROCe+M5azXO87QCxfvoM0RiglkxDPFuPKpnsu
 eU/Xz0Y/Gt1k3tV6S8CpmS+hlcwEDefNFOCnG19IeZ2gVLHEwR0QJUwoZzfcUj6joLb/BQyizk9
 DWuTi0Rkp0NjJQl5/AfBHRt5dAgEqvnfsc08o4mj6N41kpKYpYYFKWPoMTDYZEBAPeqRTp7JLey
 bdLtxNvfe9kW5dtw6dbun8R2VoYjOLoCh/n1keImYM12ZzpU8cXKUdABuC+NeDKJKnWQJx1MbrK
 K9HBvaFfkmdSYsxaqNs4kxnbv+eAlDSbUVtmC4QvA6T4rUET
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

On Sun, 30 Aug 2026 10:40:47 +0200, Krzysztof Kozlowski wrote:
> ASoC: dt-bindings: imx-audmux: Replace tabs with spaces

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: dt-bindings: imx-audmux: Replace tabs with spaces
      https://git.kernel.org/broonie/sound/c/9e6ad2ba055f

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


