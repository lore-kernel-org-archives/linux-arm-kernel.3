Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948DFC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 12:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6KtQB8gXmpZAqNGs3UWEl+Qs096uPKClugnnWz/FLs=; b=hMOr4KcrsEeAM3aiwxhzOJ/wIR
	JZqLk02QEeJoQZQFrNu5PkHZTyZtKecinVmQ9lOvh43vzRRAat9MJ9TN2OUGPEUdQ5FOWJyc5+VKi
	yQLm+enKm6tEJLfQcIviNK7qPhOtnascD+Oz3hIAttt9ucX95TbpE4b/kyZ12VH2Y8ucPpPx4kXbN
	BBh8iBOAss0rrdIvjBdnyDSRuJzUP2cEReyJfqQDPf9VKqj07VBNm7B0WGhSXaR4ZAKJikXfCntNi
	pFVzf8D6TZCoBvnrz7Z0S1IdoAm6hn2XsVYUUjiaG6qOLiRnL5VVChOmp/JWG55+dSDa4Aq3wQuw3
	QETPvHLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWUL-0000000BoFw-0WsE;
	Wed, 22 Jul 2026 12:55:53 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWUI-0000000BoEO-1d6J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 12:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784724948;
	bh=G6KtQB8gXmpZAqNGs3UWEl+Qs096uPKClugnnWz/FLs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RnfFXsNVNa99zzvS8EqVEIZrIY27uRy8TQ1Cogx6jxo1ZZYp+PNP1dXo7lhmKShjw
	 4HF/wqKDCJXXShc5GIqJF+lw/k8K+R1NPyY0cuuuR6/on+4UypajEVit+bP5zwUkfz
	 ciRoa5CEyWKdt5AS9llvpTVZkJX7jFe3MhaU09qEfHBa+mrzvlUgq1wIH1Yb909/QF
	 aEehhhTqUY8MWfJ+tE3v/v8TnEPpQT15IywzOkV6UCG52ZXTdxPL85IQAuKibaKy0x
	 kFoR8zuqwvAoSAZiJ0+aSmAs8W5qUd6+4R9vI0wKjIdUD/ddZz0owx8Dz6rv5DhPGE
	 MLn2MZnIoOMDQ==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B2B3F662E1;
	Wed, 22 Jul 2026 20:55:47 +0800 (AWST)
Message-ID: <5333a3912656d4c85fd063dc5726106e38150ad6.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1] ARM: dts: aspeed: g6: Use KCS AST2600 compatible
 string
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Haiyue Wang <haiyuewa@163.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/ASPEED MACHINE
 SUPPORT"	 <linux-aspeed@lists.ozlabs.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Wed, 22 Jul 2026 22:25:47 +0930
In-Reply-To: <20260627052708.172918-1-haiyuewa@163.com>
References: <20260627052708.172918-1-haiyuewa@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_055550_628911_C67B340D 
X-CRM114-Status: UNSURE (   6.14  )
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

On Sat, 2026-06-27 at 13:27 +0800, Haiyue Wang wrote:
> As the commit 2596f6b93a60 ("ipmi: kcs: aspeed: Add AST2600 compatible
> string") does, change the AST2600 DTS file to use kcs ast2600 compatible
> string.

Is there some other motivation? It's been a while, why now?

Andrew

