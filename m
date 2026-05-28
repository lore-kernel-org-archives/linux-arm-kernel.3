Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6642DCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 18:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kVbwVV58HXkR8RkEhw6MU26AYDa34tbTeUacWmMzKjg=; b=05kAKfr4zqIcDoByBMwsZXkd+F
	3R430XJRCRxKqg2dGw0Vb1uHqTWFzRy6MoqRFKliVEJz56DjX/KkTCzVC6owwH14qdo5Y+nrxDiLa
	VcRtHE0KcyIDpvAd770c9dLU6j6oqivmoPSmw0PHxNovcPi/SUE/kQkGzPXjEdou+hVPefy/0xzdB
	iQBaxmOeq5Rv0/pY1sLYHsIJOS2sC8mbgeq8oHGUmp6CjHblKchI7fwXqKRiO4Wc9FAQJioZ5xLaq
	rtC8sxh5TpJFDxZXPWvhzpPWOBkrFYafU5YNgB7aFhxq530f6u8yasplGJoWlRsAd4YJ0wPx+6yoe
	Hhkh9G9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSfwn-00000006Eup-39g7;
	Thu, 28 May 2026 18:59:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSfwl-00000006EuD-2ndU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 18:59:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 207CD437AD
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 18:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082D51F000E9;
	Thu, 28 May 2026 18:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779994751;
	bh=kVbwVV58HXkR8RkEhw6MU26AYDa34tbTeUacWmMzKjg=;
	h=From:To:Cc:Subject:Date;
	b=JAJMdreRzmLpPJyDjwvjHkrmdzTCIxjIHsqnl8YP521Glslnu0YNQOPo+CMB+GJpo
	 NskVtZRDMifFbbE6KSMEw+gHG98/pHlCvWolD8OyrLGxAwm0EkDR6Qvw0hWx4XoJNk
	 drpKuo7Qz1cZAiobUX+hwC5oq8m/z8DGBMr/adzqtThGMLbvJlZcZyxFU97khRqP9W
	 BoIghHfv19cgWzPFLn+wrVibWoinmDuAKpFTAi7gNwwJ94twXMTYum5i/iYP+R2HBZ
	 0+HQHcQn153soonjnQn359D/5TN020Dqs8hHuqnP+K7zGPrCjNe/wTGBVHUgrD3p87
	 hIcJQxZErDIMg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [GIT PULL] firmware: arm_ffa: Updates for v7.2
Date: Thu, 28 May 2026 19:58:55 +0100
Message-ID: <20260528185856.777407-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_115911_727982_FBCF8137 
X-CRM114-Status: GOOD (  11.78  )
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

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8
The following changes since commit a6848a50404eefb6f0b131c21881a2d8d21b31a9:

  firmware: arm_ffa: Fix sched-recv callback partition lookup (2026-05-05 16:42:49 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-updates-7.2

for you to fetch changes up to 18706ea68fc4344049bf693b702cb311a7c27ca7:

  firmware: arm_ffa: Treat missing FF-A feature on a platform as a probe miss (2026-05-27 10:14:23 +0100)

----------------------------------------------------------------
Arm FF-A + SMCCC updates for v7.2

1. The FF-A core is moved onto the driver model by reverting the earlier
   rootfs initcall change and registering the core as a platform driver with
   a synthetic arm-ffa platform device. Enumerated FF-A devices are now
   parented below the FF-A core device, and probing is deferred until pKVM
   has completed its FF-A proxy initialisation.

2. The platform-driver conversion is also adjusted so systems without FF-A
   support treat early unsupported transport/version discovery as a quiet
   probe miss rather than a failed matched probe.

3. The register-based partition discovery path now honors the descriptor
   size reported by FFA_PARTITION_INFO_GET_REGS. This keeps parsing aligned
   for newer FF-A descriptor layouts while still copying only the fields the
   driver understands.

4. Also included is an Arm SMCCC fix for the optional SOC_ID name call: the
   name query now uses the SMC64 function ID required for returning eight
   characters per register.

----------------------------------------------------------------
Andre Przywara (1):
      firmware: smccc: Fix Arm SMCCC SOC_ID name call

Jamie Nguyen (1):
      firmware: arm_ffa: Honor partition info descriptor size

Sudeep Holla (4):
      firmware: arm_ffa: Register core as a platform driver
      firmware: arm_ffa: Set the core device as FF-A device parent
      firmware: arm_ffa: Defer probe until pKVM is initialized
      firmware: arm_ffa: Treat missing FF-A feature on a platform as a probe miss

Yeoreum Yun (1):
      Revert "firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_initcall"

 drivers/firmware/arm_ffa/bus.c    |  3 +-
 drivers/firmware/arm_ffa/common.h |  4 +-
 drivers/firmware/arm_ffa/driver.c | 98 ++++++++++++++++++++++++++++++---------
 drivers/firmware/arm_ffa/smccc.c  |  2 +-
 drivers/firmware/smccc/soc_id.c   |  2 +-
 include/linux/arm-smccc.h         |  5 ++
 include/linux/arm_ffa.h           |  4 +-
 7 files changed, 90 insertions(+), 28 deletions(-)

