Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9692C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 11:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxk6ktef0CtcpkX9OEzR0N5hQPdE1diNEHXY7SV+68M=; b=m7WX74y/12EZ1lJwdpoQXB7NZS
	0W8k+rCmdzlXko3svwl5EErTEiqoO9vIYdKX5mQwD8lOB+JT7ebdrw9QhcUWj/IAoNSlqZnc9jUxY
	Vo8dw7hRRdtJumeqh52hadq2dvKdLxv6B4MVwF3JvRYVpQWNXwKOjUlmcGWYCnDyxT3GWjXX9XNi/
	A6aTppHNppUuB+MhVrCfXk98voezTS+h+OqZ+6t0l4PxW3qYsrC4wnXdPfmoMjokW145IOSojGYQ/
	dUUjF/b4RXx2050bGS6iCvHmK0EFApZGkdj6jjFfIrSSMlU5XiOLvcXKY95N2UhQ5bQg0m7nwCQsg
	1OgwFlkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesiP-00000001PCk-0rLv;
	Wed, 01 Jul 2026 11:02:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wesiN-00000001PBb-2Zav;
	Wed, 01 Jul 2026 11:02:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B2BC43D50;
	Wed,  1 Jul 2026 11:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49A11F000E9;
	Wed,  1 Jul 2026 11:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782903767;
	bh=oxk6ktef0CtcpkX9OEzR0N5hQPdE1diNEHXY7SV+68M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZmsE07005kHFibUaDJe2OI9QNMYtKgqf1WfHojOhD7o26Xa+oTaVbH6eX05ziEa1O
	 n2xljvNPURuy7LXvvkpCHeB7TJMme35Qshby2Q5AsEOiA6OniMFRNIRCiObUoPBbTK
	 RDuN8kR0iRAvh31abrFdzu84vQjQ+syLk4uTCZ7ckV7BEwXYX58yP0mhEgUu+mKk4X
	 UP1i42NIxEUENCV0cymC/LTkZ2oBnPOb5h1ri02USnK1EKODRajZW5wZ6Dbz477sRI
	 i0iqgzyE6PlS3AXHhQDvbwgJ8mpzEhWByERnQb6zj0ZEckXucYFgEYZEMMqxiF7Flo
	 Y4SminheQF4WQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Woodrow Douglass <wdouglass@carnegierobotics.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andrei Simion <andrei.simion@microchip.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Icenowy Zheng <icenowy@aosc.io>, 
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <cover.1782827697.git.u.kleine-koenig@baylibre.com>
References: <cover.1782827697.git.u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v4 0/3] regulator: Rework i2c_device_id initialisation
Message-Id: <178285924112.12243.6143940055220497340.b4-ty@b4>
Date: Tue, 30 Jun 2026 23:40:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Se8qvSnLyHP7PFMUp7FvEWErFUDObH56rpra7K5A4IU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqRPPSkuOjyGJnC2onBkCSeSpvaMwcJclIilDAU
 MSbZC7ZbL+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakTz0gAKCRAk1otyXVSH
 0NWXB/9W0gSges1rte4PrGSwpKauYIdmOSbe2NOTmDKfZmGK8VTaOVGe55uBVK9mCwNJxUP/RVi
 KNLawM9pdiX8G373DtyTrGM9+5xwydpWx2thMXS01Ty+f0XyVp2U8R8psHLxbtw7dwcw33fw1rL
 b8gGXUuGZshCQAPwS1C7x+EH1h9ckZGtzKPBsIjFs8ltK8dic/cNGblxTZ1J1hBhP4oKzEqBWwO
 CQuLQtr8lhoEkWBmOjFfGk496jB6K0DrDPK0hk1Qy4NqBJbNV0d2oadZpdTUfUQio+rAqekfhLh
 ZFrquoKSgTUbdh+OQD3aJ2tDR6tkLs3QFYUzLIgv4mMvzAs0
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

On Tue, 30 Jun 2026 16:01:06 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> regulator: Rework i2c_device_id initialisation
> 
> Hello,
> 
> changes since v2
> (https://lore.kernel.org/lkml/cover.1781888370.git.u.kleine-koenig@baylibre.com):
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.3

Thanks!

[1/3] regulator: Drop unused i2c driver data
      https://git.kernel.org/broonie/regulator/c/3ac69e3cb288
[2/3] regulator: Use named initializers for arrays of i2c_device_data
      https://git.kernel.org/broonie/regulator/c/8e74b2db5867
[3/3] regulator: Improve style of i2c_device_id arrays
      https://git.kernel.org/broonie/regulator/c/2924fa8381ee

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


