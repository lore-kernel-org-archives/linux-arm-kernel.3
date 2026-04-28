Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12D0FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 04:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCtJEGrJNdlx6qQ2+LU0bmM5ePfd8ECthmOEVZ/llRw=; b=ku9oqY+5ot0lOUAExmbaQfPPnv
	vrHtKLExsFBnafRRNpfN95owfkzijxAk/txfBwdIxGR4LIvRiDy9OXY7+PnQQQKEtRlqJ4zbdGy5O
	Sb23JnQ+J3/yP17YiW/gt0xD1FL2dIzHkfSJK1m7qNzHRnqlQaM9SyQ2ItFcuPIAYiC4EenQzTRAA
	rqAK7M6Z6t212rB+gxRf4QI6JRAM801eGG8MM6fZHwRRfi1oaKfJYNDwic9wc5iBuqIeQ9kf1jQzY
	L9OQKJ/WcnB8xY+KR8sCqEo4cLrmAprB792orzu9QLo+T3z0busDeAZsCa2p5uVw26F7nbvoTW0sY
	A3AW0/xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwOr-00000002v9I-0359;
	Wed, 29 Apr 2026 04:19:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwOp-00000002v97-0l7y;
	Wed, 29 Apr 2026 04:19:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DF766015B;
	Wed, 29 Apr 2026 04:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8C4C19425;
	Wed, 29 Apr 2026 04:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777436386;
	bh=fLkUNRG3XzNi2vIwOAcnS+7uMsvjo7QmjxTi8juHVQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=us3hP0iE/GxjQ14Em1xVk943gZomAFPEgNDYhHuBLhRr/XIxyI+eb3t9jhemN8i/U
	 h0B1JMHB2lmye5Ex0imvUD+eGqpYT+8eP6apWtUdKcC/LvPgdW/9TVhnyHKYIfWnV9
	 HedGNYTden3fuvy9/9Hdga+NzVWgXL4OVC0Fl85I8vtHI5hiJJFJ3pOWbygMVpEi6y
	 068hJ4VGf7E8qs20NwKpgOhhaB95FRCGR6ygCDlZzQc3kFhNwTE7OcHGY8F7dwAlKf
	 jirIczD0MRWfPUz5sJTZC7hRsJTgkgkZ+UvafC6I+0CJzduOwIEEX2r+jAiijPEZOW
	 DilO3Y7pJsN0Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, Manish Baing <manishbaing2789@gmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 kaichieh.chuang@mediatek.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260424210302.39972-1-manishbaing2789@gmail.com>
References: <20260424210302.39972-1-manishbaing2789@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek,mt6351: convert to DT
 schema
Message-Id: <177736327649.363516.9564887357760635920.b4-ty@b4>
Date: Tue, 28 Apr 2026 17:01:16 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fLkUNRG3XzNi2vIwOAcnS+7uMsvjo7QmjxTi8juHVQM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp8YbdA1/LjEVGI9CN1pUs7Qfnz3Mp/buprmIT4
 DdKFSKULvKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafGG3QAKCRAk1otyXVSH
 0I6dB/9o6DjEA3Q+Kl/BtNHLQQzbaLkdI1VD0OdhzSJaHV1ZJ3GayaaJ/jpZ9ItcEbPkRMVxC0C
 Qy+Fj597SFlGvHfF2JpLQaxfBW6U6gpmstvTorf25pHSi+Qwn2F8n4BACIxbQnSeIPLOgmdqA9Q
 HErwzn1TvkjkJBHMRJSxGdnxLIkU+7fa/PJ3xP1FDheQJz0ztMTMbD9pWX2XCs/yGlGNKC3L1PA
 l1brn0ue6CfPBjxt2HTfn+K/q+42kN7dDnn9j+gphhh05hWtmsRAjva/EJqwnED2hxpFC1T4op1
 +6epv3XjfENVWwXUUrV/zd3k4kPp7Bizt3dotkN9qn1t84La
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

On Fri, 24 Apr 2026 21:03:02 +0000, Manish Baing wrote:
> ASoC: dt-bindings: mediatek,mt6351: convert to DT schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: dt-bindings: mediatek,mt6351: convert to DT schema
      https://git.kernel.org/broonie/asoc/c/0770899ca192

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


