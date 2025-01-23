Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5297C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 20:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MRyTElAG16R8DRj4EmNcWgWiSiifDoKh/CZ4j1aSrgI=; b=TNBEg3ona30UPNVl6nsEomIA/Z
	DVVV5UmJq4+JxVlmpI3dZtFdD72Aiv5DyNz4XIRAFn2/TUXbprml6hD/EfZJre9vHGUsQpebSG8Sz
	LZ2updgS117m3/A/I6/TvGCwBQF6otfloEngLsPCb/s1a9LVpIh8BrznwR6aHjb8sCY1O8DjEBkgO
	ifVA2tAUJQWTYjRdWOSDgkiLOdBwrPXSWj+IijTzKyRjhnupZCHh+WiEpwxrxqotRKUEfbcWyi2zg
	ZiU2sIGegU82hYP+2ERJxCY5rYb7J00TREKSMJeOTVvWumSTOE5KcCTXDF7Odyj4V81wWzykBr/uv
	yfsuQokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3uG-0000000DG4p-2H2g;
	Thu, 23 Jan 2025 20:34:28 +0000
Received: from saphodev.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3sx-0000000DFtP-1WgN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 20:33:09 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 34576C002813;
	Thu, 23 Jan 2025 12:33:05 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 34576C002813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1737664385;
	bh=NzAv43XRmSsTSm3/eC+rMC67Y4keakaL3BNXK4ygDRk=;
	h=From:To:Cc:Subject:Date:From;
	b=hXPgmSG2A8wU7A+a8oHvBCMHTusmch/rbfNXg9YR+iyX3c0S7nkbIg7BzVjmxOqXZ
	 N54MBGh3a0NkaTyGUlwDzg8qaW5Nv7xAeP++N06xNApd7vsg8Lpef5z4rNDP5I7NL+
	 Q3v2MkbM5eJKzcDOXNvfymWNmK75QHTNu0lSdR98=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id D63B118041CAC6;
	Thu, 23 Jan 2025 12:33:04 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL] Broadcom defconfig-arm64 changes for 6.14
Date: Thu, 23 Jan 2025 12:33:02 -0800
Message-ID: <20250123203302.1491843-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_123307_665201_E761A11B 
X-CRM114-Status: UNSURE (   8.73  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.14/defconfig-arm64

for you to fetch changes up to 6e59bcd1e088901fe3441b2f3cfe887cdf544a4c:

  arm64: defconfig: Enable pinctrl-based I2C mux (2025-01-14 15:16:37 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs defconfig updates
for 6.14, please pull the following:

- Stefan enables the pinctrl-based I2C mux driver which is used on
  Raspberry Pi 4 based systems since we switched the Device Tree files
  to use the i2c mux representation

----------------------------------------------------------------
Stefan Wahren (1):
      arm64: defconfig: Enable pinctrl-based I2C mux

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

