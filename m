Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA46109E52B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 02:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l4mtEumOCiMQzVWWzIR1DoohIyGt0P5H3qYqzvyRbOU=; b=HXagWlTiFAvulwkM28u6oXCygE
	9ok1YzaVcPzrV5qmC/OCwTk6ZO48r5ZrrygQdsCAh/P+5faeb11E8dKeomj+kTLf38fTBrfPRtVIK
	2Y041zaJfHpMovrzrPT4XBzizOy/N/C+jWL6Ia6k2FQ2NnTJW8aST/M83oCWzjZJbW1RPc+NbUZbF
	3mRXm1nK0fxhYBWY9A9QIgJvZatBPqntLfeVmwzl6AbKzJYP1hw8A9+QD8i4d3/f35pTAmypAJzB/
	bhT3rNNihaIwzecaa3h4ptBiqfwJo7vdgyPTRWmPckhWSwqW750UJcBQ8sj/3VrdoO+2/4hPpA0sW
	eGY/Px9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5asR-00000004bOQ-0Azg;
	Thu, 26 Mar 2026 02:55:20 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5asM-00000004bMt-1Aiv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 02:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774493705;
	bh=l4mtEumOCiMQzVWWzIR1DoohIyGt0P5H3qYqzvyRbOU=;
	h=Subject:From:To:Cc:Date;
	b=NccYpQ4Coz6Uhm2j3vFrrAtwmbchovowc2eYGZJE7GxosHgOgayix3f+s4UxSf0eZ
	 HMvgr1d+0SpUF9lZDH8zJ/j+02Nr4GNMm+RcLJkyOkXeVB0h4tUmgqpVj1aJ/VnEBY
	 9AQDtitwKqP0MZBaOWozB5TsuesOj8OKerpTs8kWOpY8ynlgxCUgsQRU6UeBzZXC/X
	 zAyOAf0mw+liIwyWSBFINH1NtCEQuoUCMenQvu85WCHM9r9jI4kobkGNnN+rhwyV6q
	 YyGXGZjsKIGVfwJLjYMdZc/YzmMGVY7YxFgwv/lAq9UcOvazKzNgRTU+tsVhgj1+1J
	 yqD8RgtCJ+cEw==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3ECD3645CA;
	Thu, 26 Mar 2026 10:55:04 +0800 (AWST)
Message-ID: <4afeb8eaa663835725cebaeb8c1b6f50dce184dd.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: first batch of fixes for v7.0
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Mar 2026 13:25:03 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_195514_507464_68B4A59E 
X-CRM114-Status: UNSURE (   6.84  )
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

I've been intending to send out this fix PR for a while now, but time
has escaped me recently.

Andrew

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f=
:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-7.0-fixes-0

for you to fetch changes up to 7ec1bd3d9be671d04325b9e06149b8813f6a4836:

  soc: aspeed: socinfo: Mask table entries for accurate SoC ID matching (20=
26-02-23 09:43:21 +1030)

----------------------------------------------------------------
aspeed: first batch of fixes for v7.0

----------------------------------------------------------------
Potin Lai (1):
      soc: aspeed: socinfo: Mask table entries for accurate SoC ID matching

 drivers/soc/aspeed/aspeed-socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


