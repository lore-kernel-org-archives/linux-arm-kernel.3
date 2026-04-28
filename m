Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74937FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 04:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NqJo0wjNu8ltd0SR2CPbJx09lDcoNAeWopaxM6LH2c=; b=PWL/tJcyYsxzKqwB9cT5csl3ZR
	/BqzvAE40iZshuwIa+5WGqwBh7ng3LuCaTPNKKeS2P/vN0D1AoYFtadklll721451aFk2SR4UuDS8
	YC9aJ/6qgLH8dxsM8gt0fhnGrSGz7XeO9VFgVahJkXAxgSmuHHLfCh3rs0qAWbPTFKnXFNtUG+nmQ
	14RgohNLc0Yqi9vZ7GWqQ4QFNHxMAPILHk5n7oKOgdjL28rhqY00SI+W77XHUZ+OUIorNn2d4Qvox
	dvRbfaA9EEfT8BiiTYNElRJsTaEjPwam3S0S3kFZM1vUg1SAJ7yKhewPQ4BopJMvNDauuH0lH1ZUz
	kkZSjNQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwOy-00000002vCT-2NtH;
	Wed, 29 Apr 2026 04:19:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHwOw-00000002vBe-2Wmw;
	Wed, 29 Apr 2026 04:19:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5343D42AE4;
	Wed, 29 Apr 2026 04:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E197C2BCB4;
	Wed, 29 Apr 2026 04:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777436392;
	bh=AmD4vqaT2uUvRTUm6AyJgjIJNJLVUy55SkGkTF49aMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cnLaDfumluBRuImtdokXh4ERk0qYVsC+bj2tEcf2BK0yh7Xia87nSp1T1ouJ/mlne
	 Mfg5oV0QjF6QOdgAakpqdKAuX21qceXVtTOd59nhQlXdsk0YKMcmvDk2yI39vUglR3
	 2tgKxpFRxGTLy47vQ207oMOAUtZ21vqwThC9W5gZQ0yZgpuzgxLhl0LYYLq9jV+fqk
	 aVUDIuZWaatTUIoC8yC+KpmeJ4AO93Bho1hjgZw/xz4FV+E9rybRsRgia1WVVY9eQr
	 /qSJzDSeaxZuFJH9QDl8KDECEXplYL6OKex9HxfYbiwvN105IMxQ2DgqVIvSYI7eFt
	 Ywx14L+qYwi5w==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Manish Baing <manishbaing2789@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 kaichieh.chuang@mediatek.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260428171644.5703-1-manishbaing2789@gmail.com>
References: <20260428171644.5703-1-manishbaing2789@gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: mediatek,mt6351: convert to DT
 schema
Message-Id: <177741830306.363516.10918867152857147398.b4-ty@b4>
Date: Wed, 29 Apr 2026 08:18:23 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AmD4vqaT2uUvRTUm6AyJgjIJNJLVUy55SkGkTF49aMQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp8YbjsZ1LJmGgZqCojzF1xlJO7LUOaQtvFgSPB
 oYB1ACcsHqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafGG4wAKCRAk1otyXVSH
 0KSgB/4tV5PGktpNn5RUJqR6GvCP1Gg4ClOhRGo+4xsjo6d3QDrgQYWGh+k7sHjnZ0whup/bleN
 ZAQ8rZ1cWU3ljz98jPwzILKB92yEL5nc4wVorZmV4jfJmcuuLTTjJcEe2KxRVnuuCSRGMj0rA91
 lyoU+dcYwElbS5E7xLIcjTn2PQDR6B7bDlPwgl9LoE+gKe0r4freqjJg4upNCQAQmfmVO8Uxj7E
 hsg+tuy0noKZk5oHGZVMJtzFS6qhfdMN5l/mRkUbgY+rc+NhIxbVG4b6xnyovT9mu/mDuy2FV0X
 Ha6X1ic3NkSFi63+eth81l/6Pf5NGmmGzSdy2+8ZYLpRmAos
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_211954_673386_B3F32CB2 
X-CRM114-Status: UNSURE (   8.57  )
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

On Tue, 28 Apr 2026 17:16:44 +0000, Manish Baing wrote:
> ASoC: dt-bindings: mediatek,mt6351: convert to DT schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: dt-bindings: mediatek,mt6351: convert to DT schema
      https://git.kernel.org/broonie/sound/c/f103e6c27fa2

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


