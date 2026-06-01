Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EC8CD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 06:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lAiVDVucdMqAYUaIsz2zKP8mWiCqDtisp/U8q8163k=; b=TYWSAWG94sAwL4bXTjH6ZWtuxv
	kC/HKXAIPHlugoqg1xhOC7eAFQEK6Z5GjxwEWiV/EB/BquTqUQarFUxDz8ggBirdRG/6fbf/XIPkm
	J8hXXMj+wr0U7SZQFRbpvEdZFeFnKPYClJdHys46R5pmuS2wsl90wGmAc/0CBJDlz3rOTtwHmz+u5
	SNoYh+9z/kGOZjLxe24ZasF4oONUhIeGVjJQxjf4Uq+HmfLZQ2ty71f5vYZ+Iqa9Zl952Ias7ypKa
	Dc0l76z0y8K7aQtb3q70tgW5xfDKjIH4t5spsBBYCwedg1Tx3i2Vr2yCM57z/WHq8DANXE4YPYLum
	KWHiK9vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwGJ-0000000ADYn-0rsD;
	Mon, 01 Jun 2026 06:36:35 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwGG-0000000ADY2-0ltS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 06:36:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 30BC4C6247C;
	Mon,  1 Jun 2026 06:36:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FD84602AB;
	Mon,  1 Jun 2026 06:36:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 84CD110888CCD;
	Mon,  1 Jun 2026 08:36:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780295786; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9lAiVDVucdMqAYUaIsz2zKP8mWiCqDtisp/U8q8163k=;
	b=Dhk9yDVfNkedeNz7hp8xqZpj2QnRayEzUOh3+WbPWJpOPOzIMjDFrrQVtHNrLljczMX+Wy
	yIrE2MgaDFmSHdOsBF9M5jJz8CHFdQ0APZc0ISVfcvyFbkO99ty6i8e/dFhePO/hE9QJUr
	sggvIER9E8H1HjdjM4BiCTTGblGLqdBXtNYVXhrJbxsF1ZvDP8Z8mbP5rv9K9AnB49+r/s
	yPjqYhOzpVPn4kvxjlWdmInZDve9waV5LIsNiJqvXQTdkAb2Y0iiIipG9FsVYnMPpu+xPF
	QIUXqnZur8uJOoAOCW5E1bc3qPDqDodFyD4wDdfdrHecSatCZKwuGiHPgwGXtw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Martin Kaiser <martin@kaiser.cx>, Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Kaiser <martin@kaiser.cx>
Subject: Re: [PATCH 0/2] arm: mvebu: two simple cleanups
In-Reply-To: <20260502121438.116288-1-martin@kaiser.cx>
References: <20260502121438.116288-1-martin@kaiser.cx>
Date: Mon, 01 Jun 2026 08:36:22 +0200
Message-ID: <87bjdu22e1.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_233632_393637_37E3289B 
X-CRM114-Status: UNSURE (   6.76  )
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

Martin Kaiser <martin@kaiser.cx> writes:

> Two small patches that simplify the devicetree parsing in
> arch/arm/mach-mvebu/coherency.c.
>
> Martin Kaiser (2):
>   ARM: mvebu: drop unnecessary NULL check
>   ARM: mvebu: simplify of_node_put calls
>

Applied on mvebu/arm

Thanks,

Gregory

>  arch/arm/mach-mvebu/coherency.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> --=20
> 2.43.7
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

