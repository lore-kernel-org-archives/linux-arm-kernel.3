Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1B2CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/D0HpzCmqST8G4Pxk7nK6dI/pc2vTJKF1UDqwcQntuE=; b=K5vE1FEjOHkLxWl9m7MagNf/17
	PEOUZ6g2hqfHhDWbujs+Yg6rCuf0G+uk+TGinqjnB8IPwjIgypFB2CA7oeYxwkV14I638KbtT5krU
	/SmtTvVEVFvWOI1Oklbvypa0AHP/KGSOsSfjJgPcwrtY6iw3zsKMNmpiCoJLR1ayuJ81MVwzQ+WKB
	zcNW70xIepNZlUbJDO1Z2lcPS5BA28zPts+ummoaxwQQIjUMo2msG3S9bsAm7sYqpydbXmMnAl+Lp
	2zyxU+ba7D0oQOMvDoqGZtS0HQe2p4zyDaU0sQICWs+PLEzAymKESFIUxwCfcCoHkkSSqw3YGqRB1
	Wh/CdSWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1xQ-00000008q87-47qw;
	Tue, 09 Sep 2025 17:16:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwr2-00000006rzR-1ffN;
	Tue, 09 Sep 2025 11:49:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7FB1A60223;
	Tue,  9 Sep 2025 11:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8181C4CEF5;
	Tue,  9 Sep 2025 11:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757418583;
	bh=qtgl0WB8EJm3ib0J2lPSGz7+ZZElKH5cZ7NY4HbJvas=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ldAjTkigURj+pvmZUqWLCe4cQLu6qDacWQhvyjv2k6nBvIAQtMG5tU4DmCLzPOm49
	 crYrcYAMROO8/kjqa2ABm2TF3G6M55o4Bq8+0SzXyI3bjoIjX2QWEPh8iD9qrMKYjA
	 G9aVY3tp3bioYPwvwDYKDj0vlw8xABIzZRr3TsoOxTC4P3QKJUDOgB2MP4GVpL25ZN
	 OEwIeprIDC2p7yaqQyQwWuHgwPv+y3K9Vz+RYY0KtHZgKM1Gon7Ypduic6SVdQVvS5
	 7pIoch5KXCjwRU3qX2pPaRvTlz7IE3H5VuG7rNIzwyrsblzM9GqYMd7Ali13jT2orT
	 DgeCQoPcPamoA==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250905191637.147141-1-marek.vasut+renesas@mailbox.org>
References: <20250905191637.147141-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v2] regulator: dt-bindings: rpi-panel: Split 7"
 Raspberry Pi 720x1280 v2 binding
Message-Id: <175741858068.53877.8850228769612193229.b4-ty@kernel.org>
Date: Tue, 09 Sep 2025 12:49:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-94e36
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

On Fri, 05 Sep 2025 21:16:30 +0200, Marek Vasut wrote:
> The 5" and 7" Raspberry Pi 720x1280 Display 2 MCU is a bit more
> complex than the original Display 1 ATTINY88 and the binding is
> also a bit more demanding. Split the binding into separate file
> and fill in required gpio-controller, #gpio-cells and #pwm-cells
> which must be present for the V2 MCU. Include mention of the 5"
> panel in the description of Display 2, as the 5" panel uses the
> same MCU.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: dt-bindings: rpi-panel: Split 7" Raspberry Pi 720x1280 v2 binding
      commit: 5bad16482c2a7e788c042d98f3e97d3b2bbc8cc5

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


