Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406C3C44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 22:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mvC8NDXiJnJ5VmV3RtYR9Y0Oth/mJSucyrmsDMktgJE=; b=c0o4Y9eDuuIC5q7ncY7GFbaB1j
	eWtcrOnoCWFrqzXeA/XKlOax8gsPe8KDKag/Ap1/NlAKxupPbRwtfqWgZF/3nSQOWkaQGq2zNdcxq
	3+YEF9/lfeQ6dbva/F5T2Qle6xSfHb8yj5KzXZGCn0FxQ+ohAVsLJGknUpSNOhBgdnohBwwRnNg9g
	wcyVKIUsVIZmQmep5rILGKo30nLI1i/vSK/I8IQvDNl6nn8u3Gi1Xkjn0eHAdKdR9V2f6VToG9BrX
	V+dR0UHAQDARKMAFPU5ayXkmA2eK0PZljV1fx5312Nqk8rajYAj1YsE31Z2WiU9vxYBKxM+vD3CDL
	qH7flwGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vigFO-000000065rc-36eg;
	Wed, 21 Jan 2026 22:00:18 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vigFL-000000065qs-2ytk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 22:00:17 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id AE664C034202;
	Wed, 21 Jan 2026 14:00:12 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com AE664C034202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1769032812;
	bh=gaBDVDzWa9ERdVCWGD1R7i/41y6YewvQa4xYslxTbxo=;
	h=From:To:Cc:Subject:Date:From;
	b=Rgq6JmYMcYe9dHioo2XMQ3d1IfgBQb7TrbLLEY+1kkhGYwJsbFGfHB40j1BOCYOeu
	 LksjzjOwNpkeFERBBzEPj+hgSV424lKA22wdYYskaj2nXt+dotiJQ4BszgB0Ov2ya5
	 B3L9EUBnBwhJu8q0Z1kBBGDihk2zykLedClRBdCM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 604321A186;
	Wed, 21 Jan 2026 14:00:12 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom devicetree changes for 6.20
Date: Wed, 21 Jan 2026 14:00:10 -0800
Message-ID: <20260121220011.1171930-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_140015_818432_CC338526 
X-CRM114-Status: UNSURE (   8.28  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.20/devicetree

for you to fetch changes up to 929dc5b3e06c54f1d19b01c93042174d0e741b99:

  ARM: dts: broadcom: bcm2711: Fix 'simple-bus' node names (2026-01-08 09:32:39 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs DT changes for 6.20,
please pull the following:

- Rob fixes the simple-bus node names in the BCM2711 .dtsi file

----------------------------------------------------------------
Rob Herring (Arm) (1):
      ARM: dts: broadcom: bcm2711: Fix 'simple-bus' node names

 arch/arm/boot/dts/broadcom/bcm2711.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

