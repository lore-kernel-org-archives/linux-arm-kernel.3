Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47461D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 03:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MZ80JwS0iD5akhr1XQGxGYkcFeQdhvg/jM3vqUS2DSM=; b=29C4gA8kb9UUogDopY+PMXFOqx
	hG6oFs+rfEEnRjRweSidUO3I+X4t3itgEDV8LoMhq0aI0HkXt0ANXF5fwESUYyhsyi/tIyFlrDB0J
	WNlnny2aZ1ySr6LnTsHa5r5ySAOwXurYGCfTXPMUewkXOdICHHuc4jYqEJr3MlNaEis8uOYdMeKG+
	XHLdMOjOB2xLmwgaoVnPeDAiVK/67HhCHKEfp0M4x0F1kE5zdjbDqQ1wP2/U5y5T+HfCUQgblARiI
	DtHVlpSgqmBLQkhrU781krLdLHOnfxhZyBetI0Vh5B6iur5fAsiBR3x7Tjn+kEcs2RrNF1RgNmWM4
	LTIu5VQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5GtS-00000009Uct-2fK0;
	Mon, 28 Oct 2024 03:58:14 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.209])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5GqK-00000009UPP-0YUJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 03:55:02 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 416C0C0000E3;
	Sun, 27 Oct 2024 20:54:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 416C0C0000E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1730087695;
	bh=K1SYdMufPEu4Pz6UKbEUR4wqQsMmcb/g32ziiy2TALo=;
	h=From:To:Cc:Subject:Date:From;
	b=k1gU0/UbquGHYFXStJJpIByA7sBpwAX34sbe0QiycE+GGBfVDawcamexwAkpWip6t
	 V13JGDq4rLMDSfTujLibcGXIzt5Yeoqx/QpZOrJ92wPbOs9bl4VZgaGa8OmaO7z5tT
	 VlsM0OXhVu2Cul3R6LLJOdghJTc9OCqcq+zSMRug=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id DEE9918041CAC6;
	Sun, 27 Oct 2024 20:54:54 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom defconfig changes for 6.13
Date: Sun, 27 Oct 2024 20:54:48 -0700
Message-ID: <20241028035449.734504-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_205500_343388_28894574 
X-CRM114-Status: UNSURE (   8.00  )
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.13/defconfig

for you to fetch changes up to a1b87bee1bc2259e8178c40fa914b3237836f7a9:

  ARM: multi_v7_defconfig: Enable debugging symbols by default (2024-10-08 15:01:34 -0700)

----------------------------------------------------------------
This pull request contains a multi_v7_defconfig update:

- Florian aligns the ARM64 and ARM multi_v7_defconfig by enabling the
  kernel with debugging symbols by default and using the toolchain's
  dwarf version

----------------------------------------------------------------
Florian Fainelli (1):
      ARM: multi_v7_defconfig: Enable debugging symbols by default

 arch/arm/configs/multi_v7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

