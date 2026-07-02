Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B345FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWOQpBgNvXo0ZnRB4wjEU84Kr1CCcsarU29XiJxCk3I=; b=4bBJPK1HsmDivRLKOS8qXqpUbD
	M1nploLiAC16tj2WIf/wtsjFfvtIzKQEDnGfDUMwjArYl50HeX6s7saOJGMfxCG9LfXDpx5EyQdSJ
	MlhR5sTxOOEc5oVmqxny6MXQnmFfyBSGIztXlKvPeBEZqRA/8inM5JU9TfU0oeuYGDb9hHaG9ZKNh
	n6Mo7Ep6jG1/v+GnOSAcqmPqpEpI9rxrYH9TVTDA010oa5mxZIJoGtgJAV49CM8z2snbChfCRqM6n
	/2XW/VCZy2cRDw7gsrmV2Njy3CnV9yVYVYtycbjjTOXBC49JswKADH4rwXe1q6GVhjjXfare/1iiq
	FirCV7dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcWh-00000006sat-3GOJ;
	Fri, 03 Jul 2026 11:57:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcWf-00000006saA-3zUy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:57:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3D12E6001A;
	Fri,  3 Jul 2026 11:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E2CB1F000E9;
	Fri,  3 Jul 2026 11:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783079864;
	bh=eWOQpBgNvXo0ZnRB4wjEU84Kr1CCcsarU29XiJxCk3I=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=A/ZUVNhvYm8fBvoacBKJLlpEO8RvecvjMKyoxz4QeiWMXmOCiTb/6CRgnhxUK6JY4
	 lPE49FZys7H+V1fTacz7wEvIuidwYobgh4uBOyNvebq6rXjCPdmeox/x3JxL8iq7Qv
	 8YASyFzF2Yxt/o9Tv6PTwN2RUF9OBD9db0zfCRgg0SStC8s+HBkFRY3luRYt7s6PFL
	 CLVb09oZ0JHWdG7TRjxBmnjAzzEOz9vkxJyGoGZ8JfBEH3HbxdRoVVOO55GvMK/16g
	 0ZK7qX4fdnjosS/NQoU2K04Lq4DxOCwFT0zHf6xRkniXcgSyspT50ws04noJzHZoem
	 MVToRlxxyDIqA==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875x2zcjxn.wl-kuninori.morimoto.gx@renesas.com>
References: <875x2zcjxn.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8173-rt5650: tidyup error message
Message-Id: <178301502747.83990.10474256834081989263.b4-ty@b4>
Date: Thu, 02 Jul 2026 18:57:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ND0RoURgQ3RwGnyvVmo7QO/O3xUC+HA5Em2eXC8/YHo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqR6O2BqzTvCH7uBH245Vly8tbGrQbneJmLTyzM
 oiEVB9A5n+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakejtgAKCRAk1otyXVSH
 0CLSB/42N43aBk2WSOu3RocL7AnC0gLvcXD4HxxpO+ZxjDXDTCG/NvBHLUTMhxPZTROTp+fQtKJ
 1cXSXXQDBzLRFkVVua281xjqxoGqmSqEuqP8/B5/DgZ4vqITkeTvCiCH7rcv8urK8IGEu64oQBg
 hT/mTalKNxKuxJ1XMQUv5+pl2KAYn0GJBmpE9o+ZIlRUAFPNmNlL1LaV1SJTcWMhFZ5U+G6h9bY
 JeeLx1NvsroFVyhruzGd7USDa7ld3XhLHdr1Ou/KMrBsoGbGAwbB0gCVx1E+QMtGoXfa9mKvF9a
 d2fMcfKgk5VX1PN/LFsL95xrSeCOw8rkb3asdMpsOb1EPPZ2
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

On Wed, 01 Jul 2026 06:17:57 +0000, Kuninori Morimoto wrote:
> ASoC: mediatek: mt8173-rt5650: tidyup error message

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: mediatek: mt8173-rt5650: tidyup error message
      https://git.kernel.org/broonie/sound/c/7ffb66fd96ec

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


