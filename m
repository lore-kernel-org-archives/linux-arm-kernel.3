Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D781C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 17:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hiyu+pEc2sVtmebeH3zognnXRrUmdN5uvRUJe9gUEE=; b=pbEiyq6HjFhbzSCgbxDcLbwH+M
	93fRsBMuf1JVdifxtJRzade07urjjJ5DGlqLD4Y/j+GSdOwXrwG/9yXRq3osOWg4HkmSD1fPdvTOO
	3ssxmlnb8A2gs6aotYH0cp6V+nLmO2LWPBrpHnVRyEBzJj4im2EbnGddKnq3KxhJzYLxMA69fvbM9
	1RbI3KV1EDYDOB0qITeTvre2IzY3hssKEIHytLYEELqfMGkmXCyOdYAze8ULRJXAw1+8OpVpEG1n5
	/HUGuOvFUcUB/h0VnEN5XmQePR5rlN1RLTe5nql6xhRnZb8R1lr48kVLei7kkJpK9HNRKA/ag7fqk
	VVI7aBgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5jp-00000006zxi-2t8o;
	Thu, 06 Feb 2025 17:32:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5hb-00000006zTQ-0VdY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 17:30:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B75C5C5822;
	Thu,  6 Feb 2025 17:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A309C4CEDD;
	Thu,  6 Feb 2025 17:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738863009;
	bh=09KTedSG77AXoeir+b4HyRhzwue2u0WYm3LwzHo7ci8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=i3w9pT2vZ2WN2ZQqCvJ21gyp79pu6ADWMlJ7U9AgIiZ54nFrA9zlaSLwyGNCFgREg
	 ivD32IvE5fcC62tCMypL24Xl0dBcN1mpO7FMY+26DTOpZQszDS7I2Bp6nSTZaqKPrM
	 mTe1MtnUyqNpBG5+FBCJlcwOXfAMQeq0tJp+wM7w+Yo629LE2a+KC2Q3Hd/cteLtIJ
	 YBFfzN7siD6ARNGFkXy3hME3T9NjShiU17CkXag6Yh9lSF+W1kgFBA1DnyoRmG4vfA
	 Dr1p/fHrKOtFX6RvBXYIqlKf5k2PEXQ8QojGJ/GgcZgaMzL1WXJLuu1SE53LHmYK90
	 O5hi3H/hZaw5A==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, 
 alexandre.belloni@bootlin.com, lgirdwood@gmail.com, 
 Andrei Simion <andrei.simion@microchip.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
In-Reply-To: <20250203091111.21667-1-andrei.simion@microchip.com>
References: <20250203091111.21667-1-andrei.simion@microchip.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: atmel,at91-ssc: Convert to YAML
 format
Message-Id: <173886300585.325569.12869992577309610074.b4-ty@kernel.org>
Date: Thu, 06 Feb 2025 17:30:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_093011_218744_64CB7628 
X-CRM114-Status: UNSURE (   9.94  )
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

On Mon, 03 Feb 2025 11:11:12 +0200, Andrei Simion wrote:
> Convert devicetree binding atmel-ssc.txt to YAML format.
> Update the documentation supported file for MICROCHIP SSC DRIVER.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: atmel,at91-ssc: Convert to YAML format
      commit: 6603c5133daadbb3277fbd93be0d0d5b8ec928e8

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


