Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C012CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 04:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DAE8pGCxYl8G9v8ecKHO0yaQWwa/ZODfDlyLDiQKmAE=; b=BTxHSkF+QWvl0bzkZbCAjMR05g
	iOfW81aKzP5BKvIKh/qIr9H3OiKp4evg0HYgElv6d79lV6d/WtCWzaqBqYuHFBsljuzIHGRj5t8hI
	KZb7Zf0fRVrAjm8A6N/uwO6NdbvKg5/dvx5hrhxTwtlHDbENx24Y8YzZGisNeXEWQ3c2tO0ipVTRn
	Fw72nWDeDUl0ZLm4WyZXip/v67EC4Aa8peX86ZKTCi645889E7NQv2wXkEy0NnT1OZLSOYC+3+F12
	y6+FT4gWW6sKFvtcGcxjmMu9DTdW6ifRmKwzcDwmvwNI4JZO8FHiO+nmzNjQfy3e+2/RC3flCNQmk
	zNoXbOMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTCp-0000000EPfd-07cl;
	Mon, 08 Sep 2025 04:10:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvTA2-0000000EPAg-400n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 04:07:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8503C60007
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Sep 2025 04:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3BAC4CEF5;
	Mon,  8 Sep 2025 04:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757304440;
	bh=wDex0QqoddNRas0GYZ6VwjGjJz/eOq/MoV1W40db1xc=;
	h=From:To:Cc:Subject:Date:From;
	b=tYeYebdsvRRhrKJNJFOM++6NRUSpMfw/H81BJGiZCC05+M9rb0ua/Rt+ZSxZ28xhU
	 +rDU4grYbsWchWAI51eCH+TZMipyAXfjZC8+9hfWPLSLl8IOE2gBDgRqBrykcb2SC+
	 V5MBrvecv3irmbFLqkzKO5nsnRN1IglsK5zkNOsEKWHjzdyX86/qZ2AUKzcB3U6C1V
	 +5uUC5cPhZfyyCVReQxjB/4xOxfbuchojVDeKQWjGVdfklF3PKXSJVvOsB3a7ZH7mZ
	 mHQcFj5Y6j7nJ436puahpjhPisGuoQ3e9nS0Pn/SKDxi5FRHbhEm6NahqsuKxEExeN
	 Ssnf325jRkh7g==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm64: dts: socfpga: agilex5: updates for v6.18
Date: Sun,  7 Sep 2025 23:07:18 -0500
Message-ID: <20250908040718.187857-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.18

for you to fetch changes up to 9cb76813425956f82cf598c357da0c9f36a1d9a8:

  arm64: dts: socfpga: agilex5: enable gmac2 on the Agilex5 dev kit (2025-08-30 20:27:06 -0500)

----------------------------------------------------------------
SoCFPGA DTS updates for v6.18
- Add and enable gmac for Agilex5

----------------------------------------------------------------
Matthew Gerlach (1):
      arm64: dts: socfpga: agilex5: enable gmac2 on the Agilex5 dev kit

Mun Yew Tham (1):
      arm64: dts: Agilex5 Add gmac nodes to DTSI for Agilex5

 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi     | 336 +++++++++++++++++++++
 .../arm64/boot/dts/intel/socfpga_agilex5_socdk.dts |  20 ++
 2 files changed, 356 insertions(+)

