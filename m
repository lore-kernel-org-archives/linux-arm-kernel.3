Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB40C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 02:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8dzREoZ/WsyaHQKz6zD+3j3tk+9rN2BHKiKlFhHQROA=; b=wt9X+QmJ7iUQFrywyfF7w5jEIs
	6egSVsr9XaB3NOIfQsbww7dhwTMcgLVoY7B7q3Huq3QBEQYVvHZQxpmV30w5c9K4vUsQ4vUkkDVky
	Mnv0gzEy4P6jOxs7QPe9+dGxpL0Uk6WA79/BKLXmMZoy/6JlX4oilYv/fJkKr3zNpBWi+CI3fFxJ1
	jgCMDuF31GL7srAVO6aUeF426HM/inWYDUXIMSh5ifMI4GAZVwMknLvtTsAFXIA+Btoe+TxXiXTD4
	GM+m99npZRoO7Sw8YNuaCY6MpPzkchhMxZWRTgG2UxN45ss21G8clgrmi4YScLcCNjym2zglI0MP0
	ei8L4LEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZhSW-0000000AXK9-1Y9b;
	Thu, 10 Jul 2025 02:56:28 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZhQA-0000000AXBM-035F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 02:54:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1752116040;
	bh=8dzREoZ/WsyaHQKz6zD+3j3tk+9rN2BHKiKlFhHQROA=;
	h=Subject:From:To:Cc:Date;
	b=bjicqfx2rgywaAX0RM2JysJJTO3TVqwRoCaMymwSQcoJL5VujZkVZM+TNowxxjUuo
	 v6BuM6P+Px0ibNyrm/wG0mfebevRTIvUApMST7bTO7upckx19xnc594OiAHYPXRdht
	 zJuS+zk31AZxWUbG7Y3qnapLI4xjSUyN8RJnypB8GRfkrVDu5LrLqxTaVkCVLKbnaG
	 vb2SntBDI9QjLtYdlhjT9QANxeVgLG2Tx00M0DBy98Vdtf269dwFjJlFliiDsDGPDU
	 z6dDpDjnhPnpMVSDlrA9fVdcvq5QDVMxQccQNN+FgSiPPny1CFPlHPpRzB3VtCGPrp
	 NSCBI15IteGPg==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D2D856508A;
	Thu, 10 Jul 2025 10:53:59 +0800 (AWST)
Message-ID: <9123f151280e52c63dcb645cb07d4eee3462c067.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: drivers changes for 6.17
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-aspeed
 <linux-aspeed@lists.ozlabs.org>, linux-kernel
 <linux-kernel@vger.kernel.org>,  Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Jul 2025 12:23:59 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_195402_239211_CF714BA3 
X-CRM114-Status: UNSURE (   7.73  )
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

Hello SoC maintainers,

I've done further rework to the ASPEED LPC snoop driver in addition to
the immediate fixes found in the PR at [1]. The commits in the tag for
this PR build directly on top, so those from [1] are also listed in the
shortlog relative to v6.16-rc1.

[1]: https://lore.kernel.org/all/d119a7b44b25a1e55a710adec7fce3e9a9fc898e.c=
amel@codeconstruct.com.au/

Let me know if I should arrange the changes (or the PR description) in
some other way.

Cheers,

Andrew

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494=
:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-6.17-drivers-1

for you to fetch changes up to fdf003f30b99e232cd3e61cc42d836ed14d08ccb:

  soc: aspeed: lpc-snoop: Lift channel config to const structs (2025-07-08 =
11:35:07 +0930)

----------------------------------------------------------------
ASPEED SoC driver updates for 6.17

The ASPEED LPC snoop driver was recently the cause of some concern. In addi=
tion
to the initial fixes, the channel configuration paths are refactored to imp=
rove
robustness against errors.

----------------------------------------------------------------
Andrew Jeffery (10):
      soc: aspeed: lpc-snoop: Cleanup resources in stack-order
      soc: aspeed: lpc-snoop: Don't disable channels that aren't enabled
      soc: aspeed: lpc-snoop: Ensure model_data is valid
      soc: aspeed: lpc-snoop: Constrain parameters in channel paths
      soc: aspeed: lpc-snoop: Rename 'channel' to 'index' in channel paths
      soc: aspeed: lpc-snoop: Rearrange channel paths
      soc: aspeed: lpc-snoop: Switch to devm_clk_get_enabled()
      soc: aspeed: lpc-snoop: Use dev_err_probe() where possible
      soc: aspeed: lpc-snoop: Consolidate channel initialisation
      soc: aspeed: lpc-snoop: Lift channel config to const structs

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 224 ++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++-------------------------------------------------=
--------
 1 file changed, 110 insertions(+), 114 deletions(-)



