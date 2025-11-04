Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51F6CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 22:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/PPI2UlSg+2wDXB6qM/q5iBvs6wz5UduwX3SF9n6VxI=; b=bY+N8v3NZ2EM6RXBct8QK2ObHV
	qX303sciGQz8N4wrtp+vbtn1ZYFOau+5YMnhpkiy9+JflfK2i2E8iXcs5PMl9OXBRgQ14mL6MIPtC
	B2MEg/Gx+1iZjadnUbKyvQYBBxqFiLCVIxY5lwCTS3MfkdcdhclSUzjdPnRi5MYdfpXJB/ZLG1RWU
	BYDVUMN3MPwpOth8wGO8Q29P9OBYf9hLn/GDIHyPfYnjzJi5GEq9eBFH2mxbIQZ5TpWUeu43h6FTT
	gWg23OX0GtalnNKArrNntTW7fSJFtNKGmehVVpeOHMFr/kh90N/GlUo4sYFxZ/gmwt/EbLmgQJ3jl
	3E6TmG8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGPVk-0000000Cgvj-0e1G;
	Tue, 04 Nov 2025 22:28:20 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGPVg-0000000CgtJ-3Dy0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 22:28:19 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 9AA0DC0003E6;
	Tue,  4 Nov 2025 14:28:13 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 9AA0DC0003E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1762295293;
	bh=p2n4TFm415R2JyPtCWeHvuVmBkp52QEUaSpQMwo74Jw=;
	h=From:To:Cc:Subject:Date:From;
	b=o4sxXqjT5Lh6LpOot2VzdLl4xruyXIAa0PScWKuPZP9sIxYZcxGe/HVpsl7W/aHjY
	 eDJDpzxrW9J3wF8BxZVn1lvCX/k8DdZ35mYQUUfm62XzivYDxWb4tYmkARG/OlRd5C
	 7mr/tjFjRodmut9yBGCH7AAYSv/qPYdKvpyVncmY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 475AE18000530;
	Tue,  4 Nov 2025 14:28:13 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom defconfig-arm64 fixes for 6.18
Date: Tue,  4 Nov 2025 14:28:10 -0800
Message-ID: <20251104222811.3874608-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_142816_874208_480F5A2F 
X-CRM114-Status: GOOD (  10.24  )
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

The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0:

  Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/defconfig-arm64-fixes

for you to fetch changes up to 9c16e4d216d8103a8178bbe070eb21f779f190c0:

  arm64: defconfig: Fix V3D deferred probe timeout (2025-11-04 14:20:40 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64 defconfig updates for 6.18,
please pull the following:

- Stefan ensures that the clk-raspberrypi driver which is now the clock
  provider is built into the kernel image to satisfy root over NFS

----------------------------------------------------------------
Stefan Wahren (1):
      arm64: defconfig: Fix V3D deferred probe timeout

 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

