Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3648CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 12:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YpzBT36kW9U7OBTwuhBl/P8ApoRRLO/97dxhJp/7Cvo=; b=I532BO192iXNScKA+3C9vLywlQ
	UbZRrwV8UeTzBajoKQMCkRhLNbb3Fpqb8D0WwoOy1rPBINeGhPNBePWAtlJdrx57muyRh0ns5K3FL
	mIAv7GoFtj3gUD7q+eA4pSfIwAAISAHz/LMwIFdgs3jhdo6Q0R71ZoG6SqKuYHyLkAXKAlPnq+a2s
	RNb64pnC3k45CZpIkiU6yHsTQrUSMO9A1W3fF+Isk2/ZOgIN5o+NsAPjiJb90NlpJnJStdXvRzoQH
	vDpnYKL1CuXsGVISEVcpJXqzZztAqihQK3EtR7AdgC+Fk6IImrpW27YLVZaR/y/0uIXj/AC++rPUd
	OmuO6Dmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvEkW-0000000B6mw-3t1b;
	Sun, 07 Sep 2025 12:44:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvEXr-0000000B3sn-1ttw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 12:30:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86FAF601E9
	for <linux-arm-kernel@lists.infradead.org>; Sun,  7 Sep 2025 12:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D462BC4CEF0;
	Sun,  7 Sep 2025 12:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757248258;
	bh=DBW2Ex5toXKoUcqUfdn/FZVI0/D7yly/ottjIM9jxww=;
	h=From:To:Cc:Subject:Date:From;
	b=KhTMVwlhrN8V2mgFhNk0HQaBykD+OKN9jbB4eIOCTE8gxNmQhdAR0rxjUt5nOoGNj
	 2HVrtoBZK5ps1f2RmpndurkAbasNMOsqLM5kxcaRWFcUZwUqa6cWEt/ktfo730J7mX
	 NdzQkdZstuPHWWk+ZNavDSOISlrxIHm5k7rEbclA+X/BTcTrpKfMU6oMo40+epz7cn
	 9u5B6F63CY95mnma00yWitP/TZY6UpRL493iGgUvm4LEXIcMWSdmx2EvwtUnmTidOZ
	 tFxedLXt6b3P7YIBwvEAsrPRyFNjOM5+D5ivOId3iAL4Mhg6NfcgfWtFuw6xpC0bf4
	 if9jXCJn/x+ew==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm: dts: socfpga: fix for v6.17
Date: Sun,  7 Sep 2025 07:30:58 -0500
Message-ID: <20250907123058.175447-1-dinguyen@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_fix_for_v6.17

for you to fetch changes up to ea9da67e2add7bd5f1e4b38dc2404480e711f4d8:

  ARM: dts: socfpga: sodia: Fix mdio bus probe and PHY address (2025-09-07 07:26:29 -0500)

----------------------------------------------------------------
SoCFPGA DTS fix for v6.17
- Fix midio bus probe and PHY address for cylone5 sodia board

----------------------------------------------------------------
Nobuhiro Iwamatsu (1):
      ARM: dts: socfpga: sodia: Fix mdio bus probe and PHY address

 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_sodia.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

