Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EA1CA5FE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qlSrBYso4EEfVUPgxIO/sNKai+oC0Hd2E6Zpp0fRewU=; b=wmcS2j4b8GqC6LAY366tx140hH
	CS/xHihCD0RTmoGikpzVdhpioh/kPGHvxTHInfRhGM6nviG4AZNZbJgMsmfK7PHHMqU/wqZ0uUuEb
	eAyxp3wovewDYAm2hzgjWyTkpO2rWbYVekp/3yTMRnAokBFNO5Z3o7IX/Ls3FXblt6dofHsEia4Sk
	Gg4itZwmlOXAZnlZCBC8ug5JbIYtRIlZxyj4HHC1Ls8U2/XeFHJnDRsh+XjCzssdfg0NgNxfhpmTk
	37ymLg51a8C6zZ/J3LWTRI8ET95me9Rq0nXDYX1ArdV9zmFfoBP5ViQSRxetMRocicRJDqSbnhC2q
	XXxwRYcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCie6-0000000CNih-1NTU;
	Fri, 02 Oct 2026 19:10:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCie4-0000000CNi7-0SGb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 19:10:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B11440C28
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 19:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0FE1F000FF;
	Fri,  2 Oct 2026 19:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790968211;
	bh=qlSrBYso4EEfVUPgxIO/sNKai+oC0Hd2E6Zpp0fRewU=;
	h=From:To:Cc:Subject:Date;
	b=a2nUVAZkcxRPwxj5738uDNNQLBiPbAT+WlGCe3dxDaC3MIwx84Kvnc23oDAYKu8Jp
	 b+5CvkjFsfwhNENLHN/MvmYHZ1Pw1DGWdZ91lWUU/LHu+4MNd/wd+Tsx7qQeJYjkaI
	 z7vx9/rUl4KtNMPQqKN6Mu/uUHNnQ6vrrimUwQ2/Ci84wXaYmxAH1qUXrd5pEJl/hM
	 Iwc4wYvMWi2w9iajYC/xOoxd1gq1i5rpeUHR0ypXy3JNH/v9Bc82+fGGbW04j1v34K
	 ab584WTqMIHM8xtjNkWA7aGH1lKhNOQbkpFJcBX9v1nj8vtNt4qIslqTedfZ48UJ6w
	 YW8j1/xXtxpGw==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>
Subject: [GIT PULL] Apple SoC driver changes for v7.4
Date: Fri,  2 Oct 2026 21:09:57 +0200
Message-ID: <20261002190958.8205-1-sven@kernel.org>
X-Mailer: git-send-email 2.55.0
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-drivers-7.4

for you to fetch changes up to 4edbfa916dbfba44af3ef2378cae2b2653c96058:

  soc: apple: rtkit-crashlog: Add support for AArch32 state 'CrgA' section (2026-09-27 18:48:47 +0200)

----------------------------------------------------------------
Apple SoC driver updates for 7.4

- Enabled shared GPIO support for ARCH_APPLE which will be used for a
  shared GPIO line for the speaker codecs
- Add RTKit crashlog support for older 32-bit co-coprocessors used in
  older iPhones and iPads.

Signed-off-by: Sven Peter <sven@kernel.org>

----------------------------------------------------------------
James Calligeros (1):
      arm64: Kconfig: Select HAVE_SHARED_GPIOS for Apple Silicon

Nick Chan (2):
      soc: apple: rtkit-crashlog: rename 'Crg8' section from regs to aarch64
      soc: apple: rtkit-crashlog: Add support for AArch32 state 'CrgA' section

 arch/arm64/Kconfig.platforms       |   1 +
 drivers/soc/apple/rtkit-crashlog.c | 141 +++++++++++++++++++++++++++++++------
 2 files changed, 120 insertions(+), 22 deletions(-)

