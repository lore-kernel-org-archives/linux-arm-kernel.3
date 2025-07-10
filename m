Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727DDC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 20:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tph47f+ctNY6u0dxxS2jpZksVjE6IeWO8X/mh+f760Y=; b=DzHsNSafJTeXHBs/6HSTOPH87U
	LJr+yZWb/2MxKySBd8eu5b2r/bupFPq1Icx3tvmwRIObwbes6gOxDxVX/XkknI3nU+b/RPMPohPzR
	LXwQ2Ko1fNjHRJx26cOz0LULg5LL+CbCuyYsyFckA5PW/saEFIRguMyp25JelxlaosiL60rBagWVc
	PmcWt9//OvrlnDoWA/T3+Ltf0lKbxgTUCO8TfPcWwN8ronWTXxGTwhsW6NgWrYtzAVBlNBipMFF5Z
	nfQIayDmDiFb7LPzqMlxfjBFjf/TQG7CAJOzyA8wmDGn5E3cm0cTBEOzmdroyrfPTwvjH6IFTGFRP
	afD1VAEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyMI-0000000D0sd-1jUR;
	Thu, 10 Jul 2025 20:59:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvTi-0000000Cdsb-0P07
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 17:54:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C185DA53E8E;
	Thu, 10 Jul 2025 17:54:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28AE3C4CEE3;
	Thu, 10 Jul 2025 17:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752170075;
	bh=F05HSydP5BNA2szlMLXA5Y3OXlzOycAxUT/KLRoTscg=;
	h=From:To:Cc:Subject:Date:From;
	b=Q3LbuAwoJH303RGl9w6tdCBvhbsnhmPEP1AoD7Zgvxr3jjKZZEahWEn5kfOOgRzg3
	 uXNvRxochNO5B4GWmiMekfeS4CLN+yXxAPOX7ovTZL6bS9ov8knLtjm2ugiMGlkwhE
	 TjsvhqYunKmc+jjG9i5jJ+YlQRmRj7ZUp061kz/G1B30yKB40HtcYzy7hfxMYwYVgC
	 z+Hua1xqkR1JkYjiNJn/QjvHd1jIXid87P61P8w56wV9ZV6WCY0Oig9CQCkI0KB37a
	 Ra/jSRojD49hb2W6qdNOKWUw2ujO9pXCXhu+vUPsYpp0GDiNgLrq9dtqN6Zi17Qxb2
	 U0ZzgQmulJUeQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [GIT PULL] Qualcomm DeviceTree fixes for v6.16
Date: Thu, 10 Jul 2025 12:54:33 -0500
Message-ID: <20250710175434.6201-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_105438_194527_F8AB3AB6 
X-CRM114-Status: UNSURE (   6.68  )
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


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.16

for you to fetch changes up to e8d3dc45f2d3b0fea089e0e6e351d1287a5a2a29:

  arm64: dts: qcom: x1e80100: describe uefi rtc offset (2025-06-10 09:14:58 -0500)

----------------------------------------------------------------
Qualcomm DeviceTree fixes for v6.16

The RTC DeviceTree binding was changed in v6.16, to require an explicit
flag indicating that we store RTC offset in in an UEFI variable.

The result sent X Elite and Lenovo Thinkpad X13s users back to 1970, add
the flag to explicitly select the correct configuration for these
devices.

----------------------------------------------------------------
Johan Hovold (2):
      arm64: dts: qcom: sc8280xp-x13s: describe uefi rtc offset
      arm64: dts: qcom: x1e80100: describe uefi rtc offset

 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 2 ++
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi               | 1 +
 2 files changed, 3 insertions(+)

