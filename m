Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D599CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 15:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Pbkdg8CxGrTMdISG/ZeL9HyppC5k7WySbHQJhihs1k=; b=vYRO63ZjHio92siggwC0S2jDXc
	6jfrcMIbUCydRDX5ojBZKFlY5HZJMAZK/jDn4NUV49RVvhQSP9XfYOMWp1Hh4DavXx4EEgzYblnIQ
	WgPtYOzMHBIvTilVFtZLT8hOIH/wS2Z9QkY3RWDfKghiFnM9MRqtH2WA7cUwqy0NY/I/OEB50fp+c
	Zx6qu5nOFLDw9tF7jksCipPS0im86HPHtqX4noOH/F1Vvrg1ztSqrkWORKKEKaz4fspRO+l34cdIF
	Fpx+Mlv3hXoeUTOP9xt/zTYCvweDObQhfnE6DG8Z+CPQ995KOxrS11JCq68z/ubliAERxGC3ih+kS
	efv1qxsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPbp-000000080VK-1g0p;
	Wed, 24 Jun 2026 15:33:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPbo-000000080Uu-2Ke7;
	Wed, 24 Jun 2026 15:33:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D4075600C3;
	Wed, 24 Jun 2026 15:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C223C1F000E9;
	Wed, 24 Jun 2026 15:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782315227;
	bh=5Pbkdg8CxGrTMdISG/ZeL9HyppC5k7WySbHQJhihs1k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QEAC++bDkxXBzyfD0/mr/n1HZ2S13Hag15DhAJ/hyMSKw7BmgMcrwcFcCTk9819Vb
	 hjRtWTgLNr/P6SELq5uuvInkN0zP6+FsJ3Q8IxoQi7ZXa6Eirx/AM3F7rpELyemncC
	 tDbHAyyvFKSK+2MaeTku0RjIMYJWOV4AdqVHKtByRuXFlnpJ/20Iu0qNE9xqZwP0q4
	 XvyC8voJDUvzAuamRpNJ+m30SlCMnM3XuaDqNBPE+CR5ILR9ZuWi3cxwIdzaN/JlVv
	 nJD6JdjvhjueyHu2tarrM/GEDowe/Uaibh8CpMmY/17V+tbfFmiUOqJlrNsqfsg6gM
	 r11xiRoDyRzcA==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260624083708.254517-2-u.kleine-koenig@baylibre.com>
References: <20260624083708.254517-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1] ASoC: rockchip: rockchip_sai: #include
 <linux/platform_device.h> explicitly
Message-Id: <178230246570.43395.16324097796241355703.b4-ty@b4>
Date: Wed, 24 Jun 2026 13:01:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1191; i=broonie@kernel.org;
 h=from:subject:message-id; bh=T3HsoN1RXlYhnBv+yF4N9p1cXEDvlxe3CBqydtMEywQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqO/jYR9G4KfjUX1bCR95i0ikgV8DhcjnBLMjAZ
 C1W3Zs/RVKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCajv42AAKCRAk1otyXVSH
 0LP1B/wKWONCKZnjL0UA4GC5KKjXW6HczL7qEGMPO2bIM/NPtLNxJoVRS4Icg3FG6wtDp277l0K
 5+IWeJEvbWJuJuLn60UE6tGqqL6fXsF5l5G3si6lKcnzANwvA7x74GuJzJarvLwDmGpnCjrPC+c
 PKrFwIRBtqZwPhfiGE7ZzKTRnXG5ix2NKwyP7owKzI2iZeNOSyjTvhMSyL8UO8WdMgFkqEfxpAZ
 uKClMIdHTybEdrOxKu1QC/eAiaP/I+iig8SBpoAdlfvAne4e7ifImQyc35nVSdV+lf9BtEhc9nZ
 C5OmixPrzWWzsCOBQzYQKB2FBFsj7gLfA5njqKRT91AR4VoA
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

On Wed, 24 Jun 2026 10:37:07 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> ASoC: rockchip: rockchip_sai: #include <linux/platform_device.h> explicitly

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: rockchip: rockchip_sai: #include <linux/platform_device.h> explicitly
      https://git.kernel.org/broonie/sound/c/83d53eca7e55

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


