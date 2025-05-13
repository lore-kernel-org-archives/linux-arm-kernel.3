Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A55C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 09:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7g0m7VJkNTIO4LXOzU25ym4XDpgPkWwygBETC4Rkik=; b=oDkQsTh7Q26upjlgk3VIYlLsSv
	W0sZlKw1EpOrhZlbGXuZCicqST/z7e71fl44voPD9raN4qk7F+zXM8zOFwteEtoi82jaQiO8GuAf4
	FfS2aprxXwXKCQWyw4tOJvpxSFxUKq1JYykqmjdToLqQn4QHbkG5c0JqhaEZl94jnlA1J3ZctrOrO
	unQ/7A2+/WSfOLMzgZHZDmhioee6v1nlLzKvnbONXz7CmfixHr4nb+5vJvyuAJpIM0f7Val8oFBlF
	zSs6UMVI5Jf0Jy+hjrjzZIq4IhWu84M1ln7Kg5Z6upCjykK7SDlQ0iGxbcX7nG2YJT35QSasecYCH
	UGOyWVxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEldl-0000000BqiW-3YSW;
	Tue, 13 May 2025 09:09:33 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uElS7-0000000Bp8Y-3od6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 08:57:35 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 24DD2C0003FC;
	Tue, 13 May 2025 01:57:31 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 24DD2C0003FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1747126651;
	bh=vR/93ec3r0+zr631KZlAteKwTdt4fRqwIMbcj1ILbes=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yc8InAzrfbIzYDRCqc5jliALYGkH4idp/LXCVF4SxoeqYPpJFoojkUyTwPG8kFKcv
	 mbGJl/HuEC17lno70bjpv1x5qPuBcKxdvXnDheIglkScHfVmR6MBQCwtOepHTPjYhj
	 /7rA08L4kDmXVoZvBjsmrTBps/gDX2trStT7N+p4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id AD49D18000530;
	Tue, 13 May 2025 01:57:30 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	William Zhang <william.zhang@broadcom.com>,
	Anand Gore <anand.gore@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <rafal@milecki.pl>,
	Olivia Mackall <olivia@selenic.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH v3 08/12] ARM: dts: bcm63178: Add BCMBCA peripherals
Date: Tue, 13 May 2025 01:57:30 -0700
Message-ID: <20250513085730.2043820-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512-bcmbca-peripherals-arm-v3-8-86f97ab4326f@linaro.org>
References: <20250512-bcmbca-peripherals-arm-v3-0-86f97ab4326f@linaro.org> <20250512-bcmbca-peripherals-arm-v3-8-86f97ab4326f@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_015732_014996_086F449C 
X-CRM114-Status: GOOD (  13.19  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon, 12 May 2025 14:05:54 +0200, Linus Walleij <linus.walleij@linaro.org> wrote:
> All the BCMBCA SoCs share a set of peripherals at 0xff800000,
> albeit at slightly varying memory locations on the bus and
> with varying IRQ assignments.
> 
> Add the watchdog, GPIO, RNG, LED and DMA blocks for the
> BCM63178 based on the vendor files 63178_map_part.h and
> 63178_intr.h from the "bcmopen-consumer" code drop.
> 
> This SoC has up to 256 possible GPIOs due to having 8
> registers with 32 GPIOs in each available.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

