Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECC6109C02F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 16:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I4ODM4iJ9NpGEoFw9HkOkPXwM/66Ou3g5/46ErzADSs=; b=ovE9HsvTTjPgxjAMM4MehRuZ82
	LcE7gUSGAPN1aLKlpuYcQWXLPxBfWw/a3do7fkPpfelPuiEYz5KsxzEcS+M7MUWo6/VBhsmS6AgrM
	TaaKuv40DX9S4PseKKKRiupEPmOtOc49TnD07r3sq2uKQ4AbGCNMlWNg0YkeqjHZpQ/elrSzh4Ic4
	LF08EZWzJew60IX1M8oZG5cHp3H4/Lgn7Hszeo2Pr/jIYKK1ssQs6QEVZaBsD5/jZ+KXeWUAiu5KI
	hdW1AZ7JSVRLt/TyhIjF69la2LQaioX+LgJffPamKrVYvM8gzFmI4iPBFa4Tgc0iXMj3pC8MSLLdR
	p/UGvl9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QfR-00000003qHd-2dTT;
	Wed, 25 Mar 2026 16:01:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QfP-00000003qHJ-3Rb2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 16:01:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9DA3600AC;
	Wed, 25 Mar 2026 16:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5172EC4CEF7;
	Wed, 25 Mar 2026 16:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774454470;
	bh=LfNoREmWlpHbohY+uXMlBTfKpK6tUoS4osyTxIVRhZU=;
	h=From:To:Cc:Subject:Date:From;
	b=FzOcXT//TcFlpcMcwGwiJFGiAKq1a0YsBuXWf+H+6CzThS74lyDtFUoE1ICWLlxnl
	 8ltN9R0MkgKpCndZBQdCFnv0A+4UoyQWJk9JfPeukdrPKHqmlgrhfyrXQd8NWw+Nq+
	 jR5C6tIzFAWmaVphs+KE4XwV9Tl00jnXZzkQ8eTXj83oCpsNys40je8z+ol3WLmPWV
	 eMmOCQ6GCRQsMAty+8sX3LnD28Wardv79/5gJjD3OgrVW5/En13bciL2xz7qy4fmP5
	 rDJN+uv/RjjqEgmBxicZAK9ckdMPd/hVcA0J9Vzk81kt9C/Fhdat1V8vHtCS7+PTyU
	 zyG9hN8o+6deQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi: Updates for v7.1
Date: Wed, 25 Mar 2026 16:00:59 +0000
Message-ID: <20260325160104.4115956-1-sudeep.holla@kernel.org>
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-updates-7.1

for you to fetch changes up to 0a7ec808abecaf0d5c3ecc0d1b87d58f29c85604:

  firmware: arm_scmi: Support loop control in quirk code snippets (2026-03-17 07:30:22 +0000)

----------------------------------------------------------------
Arm SCMI updates for v7.1

This batch mainly improves SCMI robustness on systems where the SCP does
not generate completion interrupts, and includes two small follow-up
cleanups in the SCMI core.

The main functional change adds support for the new DT property
'arm,no-completion-irq'. When present for mailbox/shared-memory based
SCMI implementations, the driver forces SCMI operations into polling
mode so affected platforms can continue to operate even with broken
firmware interrupt behavior.

In addition, it
 - replaces open-coded size rounding in the base protocol path with
   round_up() for clarity, with no functional change
 - updates the SCMI quirk snippet macro implementation so quirk handlers
  can use break and continue directly when invoked inside loop contexts

----------------------------------------------------------------
Geert Uytterhoeven (1):
      firmware: arm_scmi: Support loop control in quirk code snippets

Marek Vasut (2):
      dt-bindings: firmware: arm,scmi: Document arm,no-completion-irq property
      firmware: arm_scmi: Implement arm,no-completion-irq property

Peng Fan (1):
      firmware: arm_scmi: Use round_up() for base protocol list size calculation

 Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 10 ++++++++++
 drivers/firmware/arm_scmi/base.c                         |  4 ++--
 drivers/firmware/arm_scmi/common.h                       |  4 ++++
 drivers/firmware/arm_scmi/driver.c                       |  4 ++++
 drivers/firmware/arm_scmi/quirks.h                       |  8 ++++----
 5 files changed, 24 insertions(+), 6 deletions(-)

