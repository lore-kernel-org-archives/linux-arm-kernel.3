Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24879C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 11:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhzauwQZPbpylpGr4WGE9mMiIv1Y0Ir+oeoCGGiZuDg=; b=bAAbajhkwfsC2ErYETcc9pYpBW
	Zj96kmbTLbxzKwoX52rxtrUj9q/e1aATeGwzPCrgZOxLU/6WejLqjKAyP4zM38gcb3Q1ibdcfCybe
	CEjPTF9oL7fhySLchCoTOLR9go32Ztgl5iWdcJ0hqte5VUMYEwpenR6Cq+LMImc90U/Ze10sh/M3k
	SiGHBbR9ZnTpZcyED28ftoGs+tg9Of7vajiJ27TEsnt83jbk7DDybTC4N61P1lkczA0DeOmK0qP+g
	cPK63zNnn6qR3kvrGmjipg7aJNOy5Tfo5lvCX3D2Fpjz/I4rDRBexRIOyYkQ4uH2pCgXQELlNrLBN
	eUJfd/KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWSe-0000000Gp4x-489T;
	Tue, 30 Jun 2026 11:17:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWSV-0000000Gp0W-03dO;
	Tue, 30 Jun 2026 11:16:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C157341450;
	Tue, 30 Jun 2026 11:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D9C1F00A3D;
	Tue, 30 Jun 2026 11:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818214;
	bh=dhzauwQZPbpylpGr4WGE9mMiIv1Y0Ir+oeoCGGiZuDg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UNSA3/+D4r4cXAUAKPFvhYTv+69PZbKlTh/NF3TZEpJ79O3McYU/fwKvHa8S7Au8X
	 tX+y9qFmH6BPicNXjYYrlg/+j9DkBZTOmp5fDfF82aSx1rwaLaKKhHCs08Y9W1rNfi
	 5Ztpl705/j5PzUbR/AowX4vMebYvQ0Xr3oTbEGjJBru5MDRRY9r6W1fMoP5Vynuukf
	 rEq/9ouifH2RwckH0jfh6hQdqbxSSqLI992u/HezAKa/rBMHmvSyv+1x6CI8TRgk/E
	 1Glrnw2PT127SjjgnMl8/IQ4lmL66DAjjfg1DyFlGzz0gA6ifGxBa8bG9MbsCGMIN/
	 k9fB3VhenjZEw==
From: Mark Brown <broonie@kernel.org>
To: linux-mediatek@lists.infradead.org, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260615185810.11804-1-l.scorcia@gmail.com>
References: <20260615185810.11804-1-l.scorcia@gmail.com>
Subject: Re: [PATCH v4] ASoC: dt-bindings: mtk-btcvsd-snd: Convert to DT
 Schema
Message-Id: <178275431870.47562.12564836681670805353.b4-ty@b4>
Date: Mon, 29 Jun 2026 18:31:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sWHuPdL4V7aEh8FugrGqBsjNaOpEn9LSPJKhiXzoATk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ6WjLm2GfsXw6NKD5XVY0W5AtH6+Er1DxKMlP
 fHioa7fM6WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakOlowAKCRAk1otyXVSH
 0LmmB/9aq99s/+8+af6mipyDDgGfYxlP702UF2VGKCa6ALZ7GWzOw8XxmiNG9hYfUhlcXMHJ5tF
 GQlTZvXT6Sp7YyFnWHOqvKkoQafpEkiWL9d7+G1Tm73WSTgHmYFucxwOWf6KTTfdxy3ePy5q0yC
 kB3LfDbjrhgEaO3T4VE2dZd8oc3Qw9uf7kxrYzh5BByuYO0knHFu2PLZC5AYqe2hX7qZFN+gfCF
 IooPHITfNjS6eKssJdyR2qUzl6NGzvweMWn27In54iB5sbm/C8ZomO9s9TTti3ntJi5nMK1kVAT
 mYJLbo8Th01HOax++kLQSM9Kvy6GUiwBhvLAcAwNgFY3R/br
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

On Mon, 15 Jun 2026 20:57:50 +0200, Luca Leonardo Scorcia wrote:
> ASoC: dt-bindings: mtk-btcvsd-snd: Convert to DT Schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: dt-bindings: mtk-btcvsd-snd: Convert to DT Schema
      https://git.kernel.org/broonie/sound/c/012dfa0c45ec

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


