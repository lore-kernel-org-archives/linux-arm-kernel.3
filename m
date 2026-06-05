Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB94CD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 15:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bTvm5jVvvuCGHXiCCu3K99as49t50DTZUW0kkqW9Rvw=; b=1lCOxlujXJHTmz8SF5xTXZlWrn
	LjmB3zbLGq7EoVFvQaRtAV2OmZIvn4wNcs2O23/eSHG/qPkV4QWQCQa5e3T9wY1j28E3FRA4JNCzS
	9IIUZqm4T04mrQMsLU9FhiUXjB55y26j/MxADD7lXAyzGoPcVecbsJAeUGCQ2fIWleaj8CjYzRPk6
	f+9Be/JMuISuaomcBt2gB4gqK1RQk27y3Ak6sEQGhN6vZ0er2CtRQrbPi+/8shT3UP2O1c9I6m+Ir
	OwmUYPvswAHuE50u1gzPzUB0SY48U/h1JyAQ3Vx85ZEvRuzYL/wDEiAZuzlnP0dO1thD1jesRBrUb
	uyLNLL1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWLY-00000000o15-2zQI;
	Fri, 05 Jun 2026 15:20:32 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVWLW-00000000nzf-0FBm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 15:20:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 844D2C58474;
	Fri,  5 Jun 2026 15:20:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5F4A5FED1;
	Fri,  5 Jun 2026 15:20:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5EFF106A2500;
	Fri,  5 Jun 2026 17:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780672824; h=from:subject:date:message-id:to:cc:mime-version:content-type;
	bh=bTvm5jVvvuCGHXiCCu3K99as49t50DTZUW0kkqW9Rvw=;
	b=QkOa2YZ85E51nzSVc7/1MGGgrDBSCOwI4619e9+pLMEznCkUKyCYSJm0n7e3bdwGZzN8Jq
	Psbhe0NxmHLVDKabRbTOgZHfpEXBRGRRfqun7WYDp/nIA+22zaFBKDvZrsxtZSQVVa9SoO
	gFlhGrbKgKQMH44SPxxk1liec8kZYCMfdJWoPdppwcIne2HNub/OXLXGIRZk9KCtVUeEFd
	FHd/KPgZn3WRbyT8O+EX5usnDwPCj/v+HLr9ga3rzSOtt0DjL9WDUbXNGkNUjh6Qth6YPZ
	0t+rdeqLfs6VF3Z8MJbwdGS7AJA2+841BhfOwHsZ5muzOOp8Ox/yqtcnP/YcdA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v7.2 (#1)
Date: Fri, 05 Jun 2026 17:20:20 +0200
Message-ID: <8733z1c8uj.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_082030_259925_198526BB 
X-CRM114-Status: UNSURE (   4.92  )
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

Hi,

Here is the first pull request for dt64 for mvebu for v7.2.

Gregory

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-7.2-1

for you to fetch changes up to 5dd98e0389545b302b0c46cef2264b5b09c01677:

  arm64: dts: marvell: armada-37xx: mark EIP97 as dma-coherent (2026-06-01 10:04:36 +0200)

----------------------------------------------------------------
mvebu dt64 for 7.2 (part 1)

Mark EIP97 as dma-coherent for Armada 3720

----------------------------------------------------------------
Aleksander Jan Bajkowski (1):
      arm64: dts: marvell: armada-37xx: mark EIP97 as dma-coherent

 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 1 +
 1 file changed, 1 insertion(+)

