Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB806C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NzkSAe0TCXPSJQwB89BLISVshE/TIgZbQKmglk7brGU=; b=r8AQMoyrbhfS430vMm2qSjzCRA
	kmZJnbd5DjIWLZX+Akusrti7pOxW61UpSwopfS1Tjld1desF5WSestRlN7wdfwokScXRkPvaiJXW5
	e3zFVYGlwaj75EewZpWNpwBvPBQLh3tHsd+a1dvvCFvayBCC7iXas1xFwEnyZ4FM1z+I+zMB5N51g
	FlZVAWcPWlbdHj2a8N6iZ7rS2mOBNIfKGrQnEA3iZ7Jek5nPRPqH0GVEYWvxwf1Aaphr5OMQshgUm
	4jclBbbIm2DPXYQI3nAbTmX6/eeLldeilr86qE55QzSQmzOMkN0yL3LgfrYIhaZ1jJE41zRMg1toT
	Zir9APQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5CR-0000000HUHz-1ows;
	Mon, 28 Sep 2026 06:50:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5CP-0000000HUHV-3TTV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:50:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F1360600E2;
	Mon, 28 Sep 2026 06:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC921F000FF;
	Mon, 28 Sep 2026 06:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790578252;
	bh=NzkSAe0TCXPSJQwB89BLISVshE/TIgZbQKmglk7brGU=;
	h=From:To:Cc:Subject:Date;
	b=Jq7TurLPs2dIE6F3JxGJrMn085gO+w/GsaAlgqA/svBU9dacGNa+ABIreh2janZQ2
	 1/jTg/II5VUnz6kYL0+CfIHCwpOd3yPSAbs797UCCZJkMKTUU0Cakwn9uszR+tMeDq
	 dtdMoeljh/H7jaImd7oFVl3xRKuXjHe4VoWFs0z4aTX2MguH8vrNwon2xpSQ8sATsr
	 kov4JuUHW3c5u6X5m9LluQsucFmeLJlYzsdQvDaTaiI0sGRrkfGVow8Jm2WTjcpdU5
	 442dim/cJyiLrOI82qT6ESxdc1crNa8SK8pn9u8+8lY6O/R2OddVRDDqFdu+avgCLz
	 stOIISElpbDwQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: SoC Team <soc@lists.linux.dev>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: [GIT PULL] arm64: dts: fvp/juno: Updates for v7.4
Date: Mon, 28 Sep 2026 07:50:47 +0100
Message-ID: <20260928065048.2492112-1-sudeep.holla@kernel.org>
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

Hi ARM SoC Team,

Please pull !

Regards,
Sudeep

-->8
The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/juno-updates-7.4

for you to fetch changes up to d8e88ad6f769ec55d3d8510dc53c2b08ddfea645:

  arm64: dts: fvp: Add additional PCIe memory region (2026-09-16 09:20:29 +0100)

----------------------------------------------------------------
Arm FVP/Juno device tree updates for v7.4

Three updates to the FVP RevC device tree:

- Add the missing CPU topology information by describing the eight
  CPUs as two clusters of four in cpu-map.
- Add the EL2 Generic Watchdog control and refresh frames.
- Add a 4 GiB PCIe memory window, matching the range advertised
  by the ACPI description.

----------------------------------------------------------------
Pierre Gondois (3):
      arm64: dts: fvp: Add cpu-map property
      arm64: dts: fvp: Add EL2 Generic watchdog
      arm64: dts: fvp: Add additional PCIe memory region

 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 42 ++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

