Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB91F9D0F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 20:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uPX3bdqetJyAXLQx5+gwiLlWyEUjNfIqWGh9hIQNoOg=; b=xhVVBkJ5lBiP5rkT4Aftf5YJNL
	zYE432N4kjYodiYnqO6McumxUU8Up7NY3oZC21mpOuXshxUM52pOxHcwl2zUrc2ORTt0EHOafZI2J
	dlczfIuvIRik1vizLlSKRZTmvUfICsHew1DL4vJPI6Vf6J+quBpXiHutVsiuMixj7QzHcW21OF96I
	AANV6CBFz98KgUZRxdoBKGySrzXMGDHmoAOb+icxV4JubCoRM6sLDnnih9N7kiKZ3RtxFtl7iSTIi
	O6/BUT4NqmSLIrU5U/kAd7anqpq1BPk1vrF41nrr6gQfVRWixT2u1NVd0vLXtzqpR1SsOvtkVqL2S
	9l9lHsoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCkJT-00000000CI3-1lYR;
	Tue, 14 Apr 2026 20:24:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCkJR-00000000CHw-4C78
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 20:24:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E2A760018
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 20:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C97C19425;
	Tue, 14 Apr 2026 20:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776198284;
	bh=9gzrxKbw2rxLwue2MsvZ/QpDvJM6VvmWIy9J5cPJO0s=;
	h=From:To:Cc:Subject:Date:From;
	b=iB9npNQd4Uq8GqWbc6nfDQCUGz/NKMH077as1pAwywYc5wRCRfAktsxJjnD7VG4Fm
	 YiCfAoH9UJSR3T0Fey7YxZS2PeoRdN8bLXMetpjdu1gbDVEPCX3ikAEv8wJEosCETX
	 6kFn24oRkmPRTttdSqHgk9PraPWwhf0lTY4dyPgTbCXCOI3UGZ2AdUvIzporkOEERm
	 Q2czFlISg7eqB6/oWEKoHVxHDj6lri+116jn/Ve/7jhlRhXTx3Kjtqjt6iJ0d1WeC8
	 zaduqioMFVbova++50cAcnZ05BNrs/puRC81gQuFmglTBud0VMLHmPFqEHlIXMMfvH
	 xPzXaQrY2loEA==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Apple SoC fixes for v7.0
Date: Tue, 14 Apr 2026 22:24:25 +0200
Message-ID: <20260414202428.5278-1-sven@kernel.org>
X-Mailer: git-send-email 2.53.0
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

Hi,

Two fixes without any functional changes, they just update Sasha's email
everywhere and fix a typo in a dtsi file comment.
As discussed with Arnd I'm already sending out the PR now so that you guys can
decide when to merge this.


Thanks,


Sven


The following changes since commit 028ef9c96e96197026887c0f092424679298aae8:

  Linux 7.0 (2026-04-12 13:48:06 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-fixes-7.0

for you to fetch changes up to c7ff53ef45b2f879576f7bbeb163828d04f5f491:

  arm64: dts: apple: Fix spelling error (2026-04-14 22:13:19 +0200)

----------------------------------------------------------------
Apple SoC fixes for 7.0

Two commits without any functional changes that arrived just before the
merge window opened:
- Update Sasha's email address in all dt-bindings, MAINTAINERS and add
  him to mailmap
- Fix a typo in spi1-nvram.dtsi

----------------------------------------------------------------
Axel Flordal (1):
      arm64: dts: apple: Fix spelling error

Sasha Finkelstein (2):
      mailmap: Update Sasha Finkelstein's email address
      dt-bindings: Update Sasha Finkelstein's email address

 .mailmap                                                                | 1 +
 .../devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml         | 2 +-
 Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml    | 2 +-
 Documentation/devicetree/bindings/display/panel/apple,summit.yaml       | 2 +-
 Documentation/devicetree/bindings/gpu/apple,agx.yaml                    | 2 +-
 .../devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml      | 2 +-
 Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml           | 2 +-
 Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml               | 2 +-
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml                  | 2 +-
 MAINTAINERS                                                             | 2 +-
 arch/arm64/boot/dts/apple/spi1-nvram.dtsi                               | 2 +-
 11 files changed, 11 insertions(+), 10 deletions(-)

