Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EACCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 01:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6sNKaf6Emxid3ZVnRf3FrHFQvVHAGDbo00Rv0+jMbEM=; b=LEZLeAQTP53LWqYlcN0D7Q44Md
	2sLOYVZ6atKQYPvciU0JH/vv0V+adl8sUo1dl/3tEK3/dFtGzLe/aUTHYp0wFmdobuDujJHRzKnui
	tUp96bNNHBxQ2mpHgD4gWns8mrVTWyaV/PlxfRF43Q2Z0mkOc4iNBRi1eVOxgBOOXjwPpAtjV/cqK
	STTgGPrVUyunbDv3+xeOKAwNCLd72Zs5wgVADQrY0C4VnoKRwKM81dtuYPbgFlLUpClSIo9jtcK8f
	PoWQTH+Hd8QbTqjp878GitR6WG98Zg0BKxZhgd5iGNMS9wA324xSDeOKZK0nzxRWQHK5hHg7MEofG
	sXTEXldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUafr-0000000E3mh-1Y1i;
	Wed, 03 Jun 2026 01:45:39 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUafn-0000000E3m0-3Y3X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 01:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1780451126;
	bh=6sNKaf6Emxid3ZVnRf3FrHFQvVHAGDbo00Rv0+jMbEM=;
	h=Subject:From:To:Cc:Date;
	b=Pzsp8widNNQW7lqYjOla9SV0FDAI+RLJyW+mVvMJR4Uqg8RR3xCb5tR/ehxAWXxhW
	 6CPj7Sz8sHE83Jc8qynufLBIG4JAk44kcJtAg68SDJnPV/B2IwL7s5ZcCv2y5r1ocU
	 LdjthGl3VI7blsWS8gJiC48QHG6NQAb7GXJ0dSANxhXjAxzvIAOaaddUU8ti2tTYSH
	 q0IUd3HvVe5fjzz4deqhllDjKgLVnJMtFVShHDe2QG+z5FKjy13tSh399hxRONzUqO
	 AL1ev+iZvi3fIZtXaKR/02pKI+ImwZiqd92b5zcRF3SpF4u6qtXryJFN6MqsDd5MiM
	 lEJkg7RMGrRcw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1B9F66025D;
	Wed,  3 Jun 2026 09:45:25 +0800 (AWST)
Message-ID: <6b6b592163523beea48e875a047afc8b4bdbb00b.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: First batch of driver changes for v7.2
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Wed, 03 Jun 2026 11:15:25 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_184536_081725_D3660AAD 
X-CRM114-Status: UNSURE (   8.79  )
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-7.2-drivers-0

for you to fetch changes up to bc13f14f5cd3d15054de38dc1232b49343d36297:

  soc: aspeed: cleanup dead default for ASPEED_SOCINFO (2026-06-03 10:47:55=
 +0930)

----------------------------------------------------------------
aspeed: First batch of driver changes for v7.2

While bc13f14f5cd3 ("soc: aspeed: cleanup dead default for
ASPEED_SOCINFO") was committed just now it has been in -next for a while as
b333a0f1c857411d83a02aa6f1d9ecc7666d6179. The commit is fresh as I moved it
between branches.

Other than that it's just the one other patch from Krzysztof tidying up the
location of MODULE_DEVICE_TABLE().

----------------------------------------------------------------
Julian Braha (1):
      soc: aspeed: cleanup dead default for ASPEED_SOCINFO

Krzysztof Kozlowski (1):
      soc: aspeed: Move MODULE_DEVICE_TABLE next to the table itself

 drivers/soc/aspeed/Kconfig            | 1 -
 drivers/soc/aspeed/aspeed-lpc-ctrl.c  | 2 +-
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 +-
 drivers/soc/aspeed/aspeed-p2a-ctrl.c  | 2 +-
 4 files changed, 3 insertions(+), 4 deletions(-)


