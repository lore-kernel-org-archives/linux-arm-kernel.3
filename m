Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128AFC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfgFCEUutxebEV9y6CUnaO3hkMGm/JGlSnNd+ukteYw=; b=iiyE3owjk0yKPytvce/V6CoE6Q
	BSIWZyiQWPXHKHy+urDQAofnBz3vLclDXImUKF4sg2e2gV9HumDCXoH84InLkgbddP8RqBVjekuUc
	P74JXDcKJwzSUuWXRtaog0mZcRuyn6TqqdgxG3+aTRZJHc/8ZTt+tUuovKDe7qGJyZzElA98L/U4Y
	T56kYihMbMwA3LMfZookigXOdWkaKgAw9HPTNcv6g+Iaqwy6ryrKgaqmN7jGIA0xiwo959VrdOBK/
	Aq1wXmGDI5gaEbrD+hLczHOVvjDnPMs6iqJwwYVlfivhYAz+M+cYvce636WWUr8YO5MxBOP9jUuaw
	qv1RgBpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeiM-00000004ZOh-1n7g;
	Mon, 09 Jun 2025 15:47:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeAw-00000004Tve-489e;
	Mon, 09 Jun 2025 15:12:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B8AB55C4B45;
	Mon,  9 Jun 2025 15:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EE4C4CEEB;
	Mon,  9 Jun 2025 15:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749481958;
	bh=Fq4Gw3eBE6iJsFqutxXYbbq+iN64HPcwkkKNFeMgfNs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DUCiR6HGlDKIav/QuQDJBCcgHa1UKzzBUVM8aFjLOFQIMr/DzEUnw23tJJW1P5Xud
	 1Y2rsJzuyALDq/2ISG8W1tcLLhq61yovCG2qFrTX2AWaOvk/jB9D1iSlT0HC2PXe2M
	 +3G4+JSXzjoKV/LT+wIN7b7cjJJtmnZLyqtftJZ7GuH/EoeJ+DmTLrHcHhEZL/Wdsf
	 UgmynThjJXogHVvlhxiDlbxSNbTCb+XxQw51mHx2b12bj4SZEaC5d8/sEJxu/gewSI
	 pck71H2FN6jz7yJPsLItc+Xq1R0X5Wn3OYYvkph9/Zqa8R+SckwPL6PINQLmOyXRQB
	 sL6dT16A+jesw==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org
In-Reply-To: <20250609000748.1665219-1-marek.vasut+renesas@mailbox.org>
References: <20250609000748.1665219-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH 1/2] regulator: dt-bindings: rpi-panel: Add regulator
 for 7" Raspberry Pi 720x1280
Message-Id: <174948195556.144772.17933863518828459548.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 16:12:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_081239_067293_D93CD62E 
X-CRM114-Status: GOOD (  10.83  )
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

On Mon, 09 Jun 2025 02:06:41 +0200, Marek Vasut wrote:
> Document regulator compatible string for the 7" Raspberry Pi 720x1280 DSI
> panel based on ili9881. This is the Raspberry Pi DSI Panel V2. The newer
> Raspberry Pi 5" and 7" panels have a slightly different register map to
> the original one and offers PWM backlight control.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: dt-bindings: rpi-panel: Add regulator for 7" Raspberry Pi 720x1280
      commit: 6d09c6e474bd27a86352deaf73d02c8c21eeec7c
[2/2] regulator: rpi-panel-v2: Add regulator for 7" Raspberry Pi 720x1280
      commit: d49305862fdc4d9ff1b1093b4ed7d8e0cb9971b4

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


