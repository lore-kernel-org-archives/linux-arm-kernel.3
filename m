Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520AAC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 02:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lFaBzW/UFNKRDOoKgOilQk2+bD1ofG50x/0d54hiwwo=; b=4/HnpBroXBBdxBsnCX7+ftNdvP
	HmX9BY0ML0ONcUEw3jUhLJSwk0iP3dxI5uzTBkJoOaBj4WpLSUpmFH1+DmlDye2TCGnqx4DJ8ZnnA
	MUzxVhUakbVt5Pd3k2VEzYAxz0MrgGvm6zM1up6EmixVd4HfmS5O+c4FxlIDOaqPsKBIbuSikpAJR
	Yn4WAUGbBxRUfjnSwmnrmGPWjhK1+p8kdf1PIdHSRQpkqgCv0hcZTMRZxeID8lG5E70j9RtLq/GeI
	fT39AFJQeq/LysgvTBSM9+E8Y1eL6JhfXiw/m8AMNKqYWGn3M3747DMCIOTmPuUeqRVSDbujEEutP
	e+S7J1gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZgzq-0000000AU4K-1UHv;
	Thu, 10 Jul 2025 02:26:50 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZgxT-0000000ATkR-0Byp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 02:24:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1752114257;
	bh=lFaBzW/UFNKRDOoKgOilQk2+bD1ofG50x/0d54hiwwo=;
	h=Subject:From:To:Cc:Date;
	b=O3MbPEDV8Vl5EyZd0IlS9GM7zFbwanUKbgi8uw38SA+/7kAG7A5I3K6ne6QLYVQ5W
	 QYE7yjtnUqcs6SXZNOQoj/kRpTxPpnbabtnuBeHjf6ZqZO/Xow2zMoyTTtz8/x2YZz
	 mM3u9e1zWiE7P7qvwU1e+DhY4ykrkeIJVcCIA+Tcvw4N6nsHPwoGnT2d6yo92Oeztn
	 dUMJODDPBsu0MHHxcO39SIobpy3QdatzTOhVNLX4+hJ2N52Vr4KpGrQp/64oXoNuGm
	 8YsAJQzi05wkBJqBKvptPYI5gftXk3EvuiRymsscENZpuzd6NoJk0g4po/FpHeRPRC
	 Av0g/SX3FK7OA==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D972E6508A;
	Thu, 10 Jul 2025 10:24:14 +0800 (AWST)
Message-ID: <d119a7b44b25a1e55a710adec7fce3e9a9fc898e.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: drivers: changes for 6.16-rc6
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-aspeed
 <linux-aspeed@lists.ozlabs.org>, linux-kernel
 <linux-kernel@vger.kernel.org>,  Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Jul 2025 11:54:13 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_192423_275522_5C9689C9 
X-CRM114-Status: UNSURE (   7.74  )
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

Here are two fixes to the ASPEED LPC snoop driver for the 6.16 release
cycle.

Cheers,

Andrew

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494=
:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-6.16-fixes-0

for you to fetch changes up to 56448e78a6bb4e1a8528a0e2efe94eff0400c247:

  soc: aspeed: lpc-snoop: Don't disable channels that aren't enabled (2025-=
07-02 11:05:20 +0930)

----------------------------------------------------------------
ASPEED SoC driver fixes for 6.16

Address concerns in the ASPEED LPC snoop driver identified in the first two
patches of the cleanup series at [1].

[1]: https://lore.kernel.org/all/20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd5=
9c934d3@codeconstruct.com.au/

----------------------------------------------------------------
Andrew Jeffery (2):
      soc: aspeed: lpc-snoop: Cleanup resources in stack-order
      soc: aspeed: lpc-snoop: Don't disable channels that aren't enabled

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)


