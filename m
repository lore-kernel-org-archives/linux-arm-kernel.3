Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F14C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 19:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FJ1SisEZoziVJiHCKENaqnG6f0OBWM3E08oFJJ1oDg8=; b=ObhwoOI2WJdKJIemQRn4H1GfCF
	Pbs88CXWk8leOE+qXIH+l2cA8LwK1lT+kg4yknAEHCLDStKcrYgVQdOAoJnwX498gDDlyFXI3Nyf0
	ikOk/6JwxK4f15C0EbC0Un3Uc4MYOiey59gfNXQFxbxQAraqh2qxq6CyHaFVOrUKqAAFo+DOd1dwS
	vqw3K3AXVUKBLHG1cddwa5s8gFhTiu/uD8eFZZojM083PPZhZS+VhfOKrrMQS2J/i7O171v+MSCM7
	zRJrz1EFzTiK+O8ujPQn1Ou6RSqvAchGsy1a1cRznmbZfZlIkNGrCf7OZEKfbY7aPU7gl17Poidek
	lL9XJg0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK0BP-0000000BSJi-1GP1;
	Tue, 27 May 2025 19:41:55 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK04g-0000000BRbb-1qJv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 19:35:00 +0000
Received: from ramsan2 ([IPv6:2a02:1810:ac12:ed80:9962:836e:244b:c4d7])
	by laurent.telenet-ops.be with cmsmtp
	id uKar2E0090Y7Yez01KarLX; Tue, 27 May 2025 21:34:51 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan2 with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uK04Z-00000003oJJ-24WQ;
	Tue, 27 May 2025 21:34:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uK04Z-00000003WiW-1gKl;
	Tue, 27 May 2025 21:34:51 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas DTS updates for v6.16 (take five)
Date: Tue, 27 May 2025 21:34:47 +0200
Message-ID: <cover.1748355530.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_123458_614937_C79D1723 
X-CRM114-Status: GOOD (  15.98  )
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

	Hi SoC folks,

This is my fifth pull request for the inclusion of Renesas SoC updates
for v6.16, containing just a fix.

The following changes since commit 652eea251dd852f02cef6223f367220acb3d1867:

  arm64: dts: renesas: white-hawk-ard-audio: Fix TPU0 groups (2025-05-20 09:31:11 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.16-tag5

for you to fetch changes up to f62bb41740462bf9fde4b110df5c7d3bc223fb3c:

  arm64: dts: renesas: rzg3e-smarc-som: Reduce I2C2 clock frequency (2025-05-26 12:07:27 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.16 (take five)

  - Reduce I2C2 clock frequency on the RZ/G3E SMARC SoM.

Thanks for pulling!

----------------------------------------------------------------
John Madieu (1):
      arm64: dts: renesas: rzg3e-smarc-som: Reduce I2C2 clock frequency

 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

