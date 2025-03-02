Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596C3C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 18:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rQXew6m92deUN72dLBiwb/ih/m/f5d9GpQpBSeEN2Ro=; b=3/hQJvOQSfWjmwIFBBlnXoFmkV
	EhcS8jvBEkxtkIpWR7KR2GK3xG5vTDj7HVA/ZRhnuKu6BN8ePEYsAkObJxxAfxpZ7aXPVqaGh/cFm
	Fph+Rb6NFskzmQcTKfa6t0CE6vYnOoucwzwwLxMNz6cJslEusr4tVFg2dtjbu0mH5mwoLB4r5PNdq
	LifFCf2XEPZkbhN6Ex5maBfl5m/dgjdIX5Th2PuCM0LsHNNcvPMHkJA3W+3ojL9YBYKE6rjQkbAwU
	Yky1IgmxhpJBNzvy1Sjz+i6xcAXgPuED91pidp/vdZFjrMVdJCvWmDvwVSpbYudyZTx/2Eq07jGfj
	bGw6Ulqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tooPS-0000000GXCY-2ZeU;
	Sun, 02 Mar 2025 18:51:30 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tooMM-0000000GWuH-3xQh;
	Sun, 02 Mar 2025 18:48:20 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1740941293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rQXew6m92deUN72dLBiwb/ih/m/f5d9GpQpBSeEN2Ro=;
	b=UOSYoFClTic2PbsC9ZKZ1fJwDcihUrGT2sSqx5TQYRRDjOkhAl6cWyeyGeYDyMbHqe9vet
	btRM9ugur0ouyrMDvvN2GvE9yZWSZfR51R1mhtxk+NkcUXMkYqof+fcghrOA5N9XLHsUsn
	BhOEsztZ1BpWPpwjnNY5ubwihMSFSWMqywSYz1eZaWrMF74RhRswq+wZ7lUa3NV+3yyZoz
	oVf+zkOEm4Whswh9i62CrOX+FysuxDrS+tdUdVzP5eOj6NlQjBqiyz/RP/ue/H7SY3LbCx
	bVOR5CJHdRQFkyDWDeGwstvcDsXeIXU29pa1RylRbiVoOVcBTVA2i/HuLPQ0zA==
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	didi.debian@cknow.org,
	chris@z9.de
Subject: [PATCH v2 0/2] Slightly improve hardware description of Pine64 RockPro64
Date: Sun,  2 Mar 2025 19:48:02 +0100
Message-Id: <cover.1740941097.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_104819_129484_582E9F41 
X-CRM114-Status: GOOD (  10.16  )
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

This is a small series that introduces small improvements to the way
Pine64 RockPro64 [1] single-board-computer is described in the DT files.
This applies to both production-run revisions of the RockPro64.

The introduced improvements boil down to eliminating some warnings from
the kernel log, by adding a previously undefined regulator and by adding
some previously missing references to the regulators.

The patch 2/2 also results in reliability improvements, by reportedly
resolving (some of) the longstanding issues resulting from using certain
PCI Express cards with the Pine64 RockPro64.

Changes in v2:
  - Dissolved the patch 2/2 notes into its description, according to the
    numerous power cycling/rebooting tests performed on a Pine64 RockPro64
    by @ChriChri and reported in the #rock64 channel on irc.pine64.org
  - Adjusted the cover letter to match the latest test results
  - Added "Fixes" and "Cc: stable" tags to both patches in the series
  - Added "Tested-by" to the patch 2/2, thanks to Chris' testing [2]
  - Added a few "Cc" tags to the patch 2/2, to make sure people involved
    in the earlier related patch [3] are in the loop

Link to v1: https://lore.kernel.org/linux-rockchip/cover.1740748439.git.dsimic@manjaro.org/T/#u

[1] https://wiki.pine64.org/wiki/ROCKPro64
[2] https://z9.de/hedgedoc/s/nF4d5G7rg#reboot-tests-for-PCIe-improvements
[3] https://lore.kernel.org/lkml/20230509153912.515218-1-vincenzopalazzodev@gmail.com/T/#u

Dragan Simic (2):
  arm64: dts: rockchip: Add avdd HDMI supplies to RockPro64 board dtsi
  arm64: dts: rockchip: Add missing PCIe supplies to RockPro64 board
    dtsi

 .../boot/dts/rockchip/rk3399-rockpro64.dtsi      | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)


