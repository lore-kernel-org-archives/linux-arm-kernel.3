Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37910109C04D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 18:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nfQ/ZluEzA+VJhWfNYk/QTmqQJyZbxBytieg1CqHWg=; b=SXka57mQTbtghjgCM62HXFZPnq
	ScbGAE+JYNr9gw6q+iqe5TgCtBkovBQJmOkvxPvKLXPLOpeOSXAljPfZ8eGn8cFIeRzR15ewYDbiN
	PIXLTBcO7yO003O06rgSMue3RIqsrya53Q0/UQlY1r/LJ5DNh1ulOIquEArdaSNjo+rROrdIcQjGf
	3wHuBky5kLhWQFy6VlR3akrpIRs6b2fsV6BzSj54qXLXqO0DNDQqfjc0+U8ThFD5SyEw6+muXfLUQ
	8NrDvIdX58yX17sNI6/8UNFy/UcUmiil9ATukHtCu2GO/pi+6MI6B4udKjkq/+HLbpa2JdwThmjQy
	TLzgrIfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5T0w-000000044zl-1Q5F;
	Wed, 25 Mar 2026 18:31:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5T0p-000000044yT-0YOm;
	Wed, 25 Mar 2026 18:31:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5730E40B21;
	Wed, 25 Mar 2026 18:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68488C19423;
	Wed, 25 Mar 2026 18:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774463486;
	bh=kybuw/joKD3Ujs6Axg2qmrSATtAdTyhGHj9Zud71BTk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UCWdD2ieMESxwqobselJDEiSkmK4r90l/iKwsD6wVPLnjZZeCsMBKvRGGHeuSpSrO
	 B3TwSe60QQp+GIkNVMyj9cO9skGUO4juLyAYab3sBqvwUA8jkiU5WtkFaBgPoSYCaV
	 L5D+ZjJdvtKKkO4VysrNwz5VavWa/bNpRDpZY5EPk5jaG5XB7/HOpv9D2BQx5bFl6o
	 oHVm5V35QMwQ5njZcQ+61uFPnJd41Sp4dveKGAEw15uSBixfIqaXpTtth8Y5Ezcg/v
	 XVn/d7WzDaipg6MW1dllLvQJtnTpiQZKgHE1KBM9YAobudmIHikoE3L6iAGV/01qqE
	 6cBe5A8U/gjJQ==
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260324135508.839142-1-festevam@gmail.com>
References: <20260324135508.839142-1-festevam@gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: rockchip: Convert
 rockchip-max98090.txt to yaml
Message-Id: <177445778598.74886.17433530132719817153.b4-ty@b4>
Date: Wed, 25 Mar 2026 16:56:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-6cc06
X-Developer-Signature: v=1; a=openpgp-sha256; l=1151; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kybuw/joKD3Ujs6Axg2qmrSATtAdTyhGHj9Zud71BTk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpxCn73hYijmsJEGiZYuGXud9H5IrGaTRCmihMe
 DeHsGqUqtOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacQp+wAKCRAk1otyXVSH
 0PWIB/9yF/67uvMKywglQaTIZPmNot/J+5Xu/VQH++wGoOMiSxn3iNo3aWmoHlH+iShN2xmQigJ
 xJY07gwAQL6Woo7xvrbXp5HwyDxVkPrnH/p6nVDgkrlrdzh/F1qN4gCuSvVrP8QyvsebVTJS0u7
 ELgYuXXmE9Wbc1PQMSUiRGxSKqmROzBEqRFYoZr14uk8QSg1vCaVauh5gCzHvk4/zquJAVZ+FZn
 B10E/XeJsfTygsVetzuNnfxg9QW/Y1wDWyNzbH+/CVl3dKR2rk19EZ2jJqdEf0zN3WtKwjRA/b+
 TdgQ2aQpOBzn+bngvc+rgXh4qlPkB9Xso1grQOe6VELp/AId
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_113127_201943_5495EB87 
X-CRM114-Status: UNSURE (   9.97  )
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

On Tue, 24 Mar 2026 10:55:08 -0300, Fabio Estevam wrote:
> ASoC: dt-bindings: rockchip: Convert rockchip-max98090.txt to yaml

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: dt-bindings: rockchip: Convert rockchip-max98090.txt to yaml
      https://git.kernel.org/broonie/sound/c/c9b48a451ca8

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


