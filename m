Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E76CD4850
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 18:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUoaZOo0WM1phWbd6ZULg4KFX56eFleG4ODNAvRZuJI=; b=IrOkTBn/AbOmTXB5v8DhumF73y
	UV62NAhfgs25KiyyywMI166EaFK4i5e+h1pYUBhTkHOOC670cTdmanTdhqa/hSnxGVvSEGgdL9nHQ
	AHPgD3PA/qEGU7+ZYJ9EHCAfguXuQYIwxUU8CrDw3cQMoY9soaHFB3QhHTW8w4yMQcyn/Rced5Gug
	0enqk1BPKKmN4WjApbMmykxSt3BD2JCmVYZBgvLCPNV1QiYA/W19zVwFIb5b0qEiBbR0QVDqEfkRG
	PfxgDSlKGuI8A99mNGQ8RtFMJFzSBUlNnQmW7lCjjK3nXE3vgLrpd3D2Aeko5/TyU5egeCJTqlFaj
	RMyhhr2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVLU-0000000EVZO-2QOQ;
	Mon, 11 May 2026 18:27:12 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVLQ-0000000EVY5-285D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 18:27:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 98DA2C5E154;
	Mon, 11 May 2026 18:27:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D72EF60646;
	Mon, 11 May 2026 18:27:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6BB011AF9FDC;
	Mon, 11 May 2026 20:26:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778524022; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IUoaZOo0WM1phWbd6ZULg4KFX56eFleG4ODNAvRZuJI=;
	b=DNzc3FTWsu/erUDEMD3zjc6DVqSrkywFMWL9JUCx4soSB/FI19tVVgKFZDZ+sdM4qPInFl
	+j+YkNveDEyLZb3hdarEsvProAaw0pOD/vWeLYd0IZ43vnN6s8pvk+Vi3o2tRkT6eG9Rsu
	9pOYb8Dp/DTvq0aYo8wkTjHlgNpvbwM8sr9YAaMZg5Sx/GzhPtTizqi9a51VrkqlqA/SRo
	3PWvyFNkfr22/3QFoc5xWVzVvXtirElmW63x8Ta16VvPyCbBAZaCQsFWLcnLYuGUncK3Zl
	v8O5jfSi5BYhbJctjk20RXSRPCgoNhTW5u8RQt1LFg9PSJk8RBY5JDV26GneYA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 20:26:56 +0200
Message-Id: <DIG259UJOARG.2WFLZLCSR41AJ@bootlin.com>
Subject: Re: [PATCH] MAINTAINERS: change maintainers for macb Ethernet
 driver
Cc: <conor.dooley@microchip.com>, <claudiu.beznea@tuxon.dev>,
 <netdev@vger.kernel.org>, <alexandre.belloni@bootlin.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <kuba@kernel.org>, <pabeni@redhat.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: <patchwork-bot+netdevbpf@kernel.org>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260507120444.9733-1-nicolas.ferre@microchip.com>
 <177828000904.878212.12911947829161473740.git-patchwork-notify@kernel.org>
In-Reply-To: <177828000904.878212.12911947829161473740.git-patchwork-notify@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_112708_702175_7CEDF16A 
X-CRM114-Status: UNSURE (   9.40  )
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

On Sat May 9, 2026 at 12:40 AM CEST,  wrote:
> This patch was applied to netdev/net.git (main)
> by Jakub Kicinski <kuba@kernel.org>:
>
> On Thu, 7 May 2026 14:04:44 +0200 you wrote:
>> From: Nicolas Ferre <nicolas.ferre@microchip.com>
>>=20
>> I would like to hand over the macb maintenance to Th=C3=A9o, as I'm unab=
le to
>> keep up with the recent flow of patches for this driver. After speaking
>> with Claudiu, he indicated that he is in the same position as me.
>> To help with this work, Conor has agreed to act as a reviewer.
>>=20
>> [...]
>
> Here is the summary with links:
>   - MAINTAINERS: change maintainers for macb Ethernet driver
>     https://git.kernel.org/netdev/net/c/0a549298f452
>
> You are awesome, thank you!

Acked-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Oh wait, I am too late.

Thanks for you work during all those years to both of you,
and thanks for the kind words Nicolas.

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


