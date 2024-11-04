Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6461D1BDD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 17:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITG+KqEu/Wqqd8mlCLZWxurZWMFjo0/jyM0HmtfJS48=; b=1nJyQqAhNZUo0y7TwYE4dyj19l
	6enJqfCazaMUd1OjO9mvr0/wjBQ6f3AsPdEWuWzDoWZSbdmPRIFKA6zOjtE9MYLfpsD9sBRUSo9hG
	pwZnhKzKwfWYd63bbjkS1Lm1JlXQ3tzEBOfSDjQkYi16HBwKQ4XjDXpX/o512mHv979E4fX0T7C2j
	lcKBKscOC7h/VugXNEBFTj6mgZYLy18w9eObFYqvzne7DBfQk9czTmrnF9r72+0IK5C7ZyzYBFGu2
	p3OAsg92FK5PnY7cZuHI5PLtmsEuHqQTk3bPu846B9mABRy61/CRPG0p5IL1UKC5yUxciDl4xeivd
	k+1jUXlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8186-0000000EZaI-2khv;
	Mon, 04 Nov 2024 17:44:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80ap-0000000ETa1-49tX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 17:10:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DE24AA43189;
	Mon,  4 Nov 2024 17:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CEB2C4CECE;
	Mon,  4 Nov 2024 17:10:17 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64/fpsimd: Fix a typo
Date: Mon,  4 Nov 2024 17:10:15 +0000
Message-Id: <173074012615.2444105.10660252555826650982.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <2cbcb42615e9265bccc9b746465d7998382e605d.1730539907.git.christophe.jaillet@wanadoo.fr>
References: <2cbcb42615e9265bccc9b746465d7998382e605d.1730539907.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_091020_110901_08F9A4A1 
X-CRM114-Status: UNSURE (   7.72  )
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

On Sat, 02 Nov 2024 10:31:54 +0100, Christophe JAILLET wrote:
> s/FPSMID/FPSIMD/
> M and I inversted. Fix it
> 
> 

Applied to arm64 (for-next/misc), thanks! I also fixed the typo in the
commit log.

[1/1] arm64/fpsimd: Fix a typo
      https://git.kernel.org/arm64/c/525fd6a1b34e

-- 
Catalin


