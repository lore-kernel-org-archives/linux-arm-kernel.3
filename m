Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AB1C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jKUy6tbNyU7rIJ/Cs1K7IrSyeblfGGIQgQv6PZPPib8=; b=o8GxmK9slRe0i3PDqqrfg0BM63
	DCJZ0uBI0R3zINlx+V3oEY+cRFAxD4MHUyhGC27aaslUNzkwNDMYFWN42hntmXS7j8+BHIxiQMrKK
	TcKs7QAAIh3iIKElS6valmG5E0EkuWvNLhKcM8QrMA0UO/HbhM+bdOn0eko6uX4nNwcj4kgn4USsD
	jTXFV5/ZlpRsw5Wi5ZPNDdgjdmwhONHQDyRxNk8g5u2BefK2zOgJJv7XOoOEbwJb6ux4dyfE8PJcR
	ovm0eZiCVwW+IH//mtcGAAxbgFPbaaixIwqLlYBfsHAsv9RU5HL1Fj6XK6dx2VAMCvuKvN42u7tFV
	NKGguSMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNIY-00000008Pgb-45PQ;
	Fri, 07 Aug 2026 16:19:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNIX-00000008PgH-284E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 16:19:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC173600B0
	for <linux-arm-kernel@lists.infradead.org>; Fri,  7 Aug 2026 16:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66EE81F000E9;
	Fri,  7 Aug 2026 16:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786119592;
	bh=jKUy6tbNyU7rIJ/Cs1K7IrSyeblfGGIQgQv6PZPPib8=;
	h=From:To:Cc:Subject:Date;
	b=MgVQxQPbaJjohvvWpFSWiw6Bso0yMXSIA/GbHHYlmH+ac0T38oT0YtJj2LXJuqBOW
	 NZoRlwSHVB9I6nwIB2V7hQ6CAJPHEBKmlAlxKVI3ugll5lB+QJHunJyvp6KVN1u0Ia
	 c40S3IASCM+5C0T1nQk/DpOxs6su9SSswLcfw33ls3KZGURvaP0ZsTcAZrDxZrSQ42
	 iTgCUkT/eLm8eTKLglQB4UzXMkGcmtU2DrbrTK2MNDYbMx+48xEGAOPtY7Q9tbblqU
	 EZqFrTkyTSKNJt81zoRaA0PJkooFrYbb0gbjIqZ64fDN1mSjwMIg57yU76VeZghvBS
	 ejaF1b5v5314Q==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>
Subject: [GIT PULL] Apple SoC fixes for v7.2 or v7.3
Date: Fri,  7 Aug 2026 18:19:35 +0200
Message-ID: <20260807161937.6419-1-sven@kernel.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

Sorry for the late PR, I totally forgot about this single fix.
Feel free to pick this up for either 7.2 or 7.3, it's not urgent.


Best,


Sven


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git apple-soc-fixes-7.2

for you to fetch changes up to 09780b4b4bdcc7848249dfc8e44b4d55aa388024:

  arm64: dts: apple: t8122: Fix I2C resources (2026-07-05 16:26:23 +0200)

----------------------------------------------------------------
Apple SoC fixes for 7.2

Just a single commit that fixes the i2c IRQ and MMIO ranges for the M3
SoC.

Signed-off-by: Sven Peter <sven@kernel.org>

----------------------------------------------------------------
Michael Reeves (1):
      arm64: dts: apple: t8122: Fix I2C resources

 arch/arm64/boot/dts/apple/t8122.dtsi | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

