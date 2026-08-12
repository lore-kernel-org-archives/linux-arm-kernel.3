Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E4FC5B567
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 06:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uxz2fEi2nCnRBxNZtGn6+3DfJetw4t5WOoUiQF6JSCU=; b=girjV+rKFQ2K/UpmvLOc1rUfOo
	AshK5tXTxXVXVNnMxICzHgHyDR9ce3YI+oECYvg1SQdUDOwy487vOVwa4oCBZoiIf88tA4wrcfQ3V
	MTyP/FNbUTi19L09rBZPGOW56LxKHOD43IOZI/OYPhytXUQN8AdwXJGX58c3UX+CHbepQLxkbVGbO
	3kC9jx8yG/EiolPoKPmCPApEGmaqxwX6gzxiBAqtDTDEt8PTHC6GmxuUTz7yn8F31oOvhJaNR46Bl
	WnjYwk3cdJ8zupMEf7cVTxbyiHmQZ/RlEymSeBp61WS17RcG/Rqff7efW6iagtlOv7mQYSHUIHby5
	5RSN7YhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2Js-0000000FVQD-3kfI;
	Wed, 12 Aug 2026 06:20:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu2Js-0000000FVQ2-0XvN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 06:20:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C5B6600E2;
	Wed, 12 Aug 2026 06:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541821F000E9;
	Wed, 12 Aug 2026 06:20:05 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	conor@kernel.org
Subject: [GIT PULL] Microchip ARM64 device tree updates for v7.3
Date: Wed, 12 Aug 2026 09:20:03 +0300
Message-ID: <20260812062003.1285582-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-7.3

for you to fetch changes up to 8258a4bcfaa9ded9b19b3c230ed85df44d580935:

  arm64: dts: microchip: lan969x: add QSPI nodes (2026-07-27 09:57:02 +0300)

----------------------------------------------------------------
Microchip ARM64 device tree updates for v7.3

This update includes:
- the device tree nodes for the QSPI controllers on LAN9691 SoC

----------------------------------------------------------------
Robert Marko (1):
      arm64: dts: microchip: lan969x: add QSPI nodes

 arch/arm64/boot/dts/microchip/lan9691.dtsi | 33 ++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

