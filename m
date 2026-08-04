Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374A9C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 06:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bf2vZiMryyidrIVtaECU1kR4CLMERTZBJinxRYUKU/E=; b=P32zKa4vM44d13jaxi9RcJxa5d
	8a4Vs6e+gJjASaC35vSoZ28OBjLvU8dI17+8Q89MLTQmZRxc5ivXEHiZKja88zS5GKwATwH7EEt5e
	v/HgvnC2QyHLWfaG503Trl5kSM61J8qVNEeiHoAhgEZz/TAX5LOizQvXFkl34c4h7jTM3SkU/RIkN
	HUY5ioKW1nxRhamPugkrQJvaFlsXg0FuyLqcEijJv2D4xgt11pwx4QYoa3xymD8eUnQNf/muq9IeP
	fGGYUbSZvn4Mi5/U3JiCWBfIFgpkNa73YzLMQ3/sH7svcHMZxhicrktBMwb8y738QeHjSRUE+q8kX
	PcDmbvYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8tW-000000019CX-2YYM;
	Tue, 04 Aug 2026 06:44:58 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8tT-000000019B5-2rNO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 06:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785825893;
	bh=Bf2vZiMryyidrIVtaECU1kR4CLMERTZBJinxRYUKU/E=;
	h=Subject:From:To:Cc:Date;
	b=eG9KGIxiXBF6NDuZtZX8mRQEkbxls6aRsqKf7LXLXpHL3micaiofpXy/GdhJ9MPEH
	 JQHFBtyhPIlseduOGmpqiLGYaIUWFARzav4Ul8Fowu3deWTZSb2oEhCGiy+5q3unKW
	 UbxjiGFIeDvXjW8bQlePVJJYBKIuFhM3jYyWTu4SmLJMp78cJmaYLg3N4Prg5GR/HG
	 YF1lNDz+TruXJoetiFT86zzsB4jnnMTpGDTo7IQGNTCp8UVORiiLF/uMJtIQLFQR4N
	 x4ZW5lmu3QkrYBLkE3yKxpCy5td/tN02/lmklbWkhshqGnmzl4bYfrEtX2khjnLNDN
	 VZHcNk5p3fetQ==
Received: from [IPv6:2405:6e00:242d:870e:1a3e:8259:e4fe:6a28] (unknown [120.20.146.186])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E781D655A9;
	Tue,  4 Aug 2026 14:44:51 +0800 (AWST)
Message-ID: <3da63bea367b3490b041c909a4503cc2b5e9c394.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: First batch of driver fixes for 7.2
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Tue, 04 Aug 2026 16:14:50 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_234455_912410_2C8D02A9 
X-CRM114-Status: UNSURE (   6.68  )
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482=
:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-7.2-driver-fixes-0

for you to fetch changes up to 1acef6d85bfd98bd9dfe1f08bffa397a4dda8a6f:

  soc: aspeed: lpc-snoop: Fix usercopy overflow in snoop_file_read (2026-07=
-22 22:10:54 +0930)

----------------------------------------------------------------
aspeed: First batch of driver fixes for 7.2

This time it's a single fix for a kfifo overrun, caused by the the lpc-snoo=
p
driver implementation behaving as multiple consumers.

----------------------------------------------------------------
Karthikeyan KS (1):
      soc: aspeed: lpc-snoop: Fix usercopy overflow in snoop_file_read

 drivers/soc/aspeed/Makefile           |  1 +
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 38 ++++++++++++++++++++++++-------=
----
 2 files changed, 27 insertions(+), 12 deletions(-)

