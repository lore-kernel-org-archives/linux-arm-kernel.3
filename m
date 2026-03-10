Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA051EB1056
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 14:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCVHtCdeJSJsihYhis2FNv0MJgFY1pbntr30vB+O2jM=; b=UKJ2dKtXWPkvaXjDpuV3/eUgiP
	oVEb/t9bLM1d4Hj4yAlOqkCUzimt6YZL4oFGha4p04krz3nCjzw2Q7F8pWowFTPTxoa1NqUKdRUSH
	QKcyu6RQxuH2UwyVTtasfIFYuq6c90Y6jf4L/0+h/QrRh72cYDNUsurXaP50Way6J/HIWrJrfS6wQ
	xh8luYsHxIKJ8qB8WLNcObCsN8jQ4dis7rzVRnCWxXFqpIQ6Rj490b+jkaccPu6E49pfI4NUm5nae
	IH8LjGzlns3rPaM5ti9SsYHzs6v3JHzDK7IbqBKyHV55oxn/pdd1Q+U5vbLjsnN1VTC3nJL+lfU8t
	3j5IKl9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzxq8-00000009fjT-2Cs3;
	Tue, 10 Mar 2026 14:13:40 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzxq6-00000009fj4-0w2b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 14:13:39 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 2126092033B; Tue, 10 Mar 2026 15:13:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 1FB1892033A;
	Tue, 10 Mar 2026 14:13:32 +0000 (GMT)
Date: Tue, 10 Mar 2026 14:13:32 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
cc: Nick Huang <sef1548@gmail.com>, davidgow@google.com, 
    dongsheng.yang@linux.dev, dory85109@gmail.com, ebiggers@kernel.org, 
    idryomov@gmail.com, jlayton@kernel.org, john.g.garry@oracle.com, 
    kusogame68@gmail.com, likerockman102@hotmail.com, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux@armlinux.org.uk, namhyung@kernel.org, robh@kernel.org, 
    squid@squidspirit.com, wdhh6@aliyun.com, wqu@suse.com, yot4106@gmail.com
Subject: Re: [PATCH v2] arm: Replace ASSEMBLY with ASSEMBLER in uapi
In-Reply-To: <2ad752a7-0349-44e6-92b9-c67ba37c913c@t-8ch.de>
Message-ID: <alpine.DEB.2.21.2603101412520.63708@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2603011816460.44093@angie.orcam.me.uk> <20260309152423.2582-1-sef1548@gmail.com> <2ad752a7-0349-44e6-92b9-c67ba37c913c@t-8ch.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_071338_449619_90CBF171 
X-CRM114-Status: UNSURE (   8.53  )
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

On Mon, 9 Mar 2026, Thomas Weißschuh wrote:

> thanks for the update. After our last discussion I prepared a
> supplemental patch for this, but of course forgot to actually
> send it out.

 I have now dug a bit deeper and realised that GCC used to have explicit 
-D__ASSEMBLER__ in the specs for `@assembler-with-cpp' before switching to 
the internal macro definition.  So I take my concern back, the original 
change is good to go in.  Apologies for the confusion.

  Maciej

