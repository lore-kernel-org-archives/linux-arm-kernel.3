Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897C6CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ptzp+2oJuw+CxI6X5o8rCGyADt/tgv4sV6+WYhGeroU=; b=Forr/WKLDkPtRbQ9/8PAJsFK/C
	nJ0w2wuOdb9U9fEesA4QayuVwuui8s/mnJ1JH/FxRBvZR6lrCoiqVEzoxzgwKHqLU8Ui7KaPjyufb
	hZFewl9pVs8+5hVZD/QLhaeL5yvB9xzygvGFMgFBEfRdibmq3rpNBvGKnZ+sT/xdBWKlMZe/7RgaP
	yOOD3MpH6JLsVQDXtoriOS8LeY/wsNtJswA18gxiG5wuLyiacDt6hiadmd8MkI0d19e39GufoIehU
	jB9Al64L52vY2wk1MC10tBKVvJIiZvE9mZBGmO6H5pgBvXU8fYmFDnhDnl6Tbc2fr9czBdYUzwe5J
	cYjR8P7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fml-0000000COJt-1Xpf;
	Fri, 03 Oct 2025 13:25:23 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fmh-0000000COIa-3iwG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 13:25:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 161D11A10D1;
	Fri,  3 Oct 2025 13:25:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CEB5B60683;
	Fri,  3 Oct 2025 13:25:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77EF1102F1BE8;
	Fri,  3 Oct 2025 15:24:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759497911; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Ptzp+2oJuw+CxI6X5o8rCGyADt/tgv4sV6+WYhGeroU=;
	b=RdIJdGD0bJYNxg5ovmgufKgK04VYIolbqXYuQRztDusYp2GxHVsqgprbo8KUk9ImQVvoYh
	+IuF1+tlh7XkiALCjHIVXTYyermJ8YS65zYivldjU8rNS+JAybPgGIwaOfI/8fj2y6KLL9
	M0Si99AJGYa6qY5RU7z1voEdbr2ElyQVb6PNSg8FDlYe3NnlHePZKCq6QVCsk31raIL3O2
	J0odDaxLvtHeC0zqSmes9fsQiODAtw0QkvdEki6rBdtK32ytymmR9F38iXzouyzztX6TCo
	9HFE6hD9g91YVxWp0eFYc1WMWK7+Z4HyN+eJXAlUvXt+haIwSaOOORPn86KQOQ==
Message-ID: <67535617-92fc-44d4-ba2b-060d0408a5e7@bootlin.com>
Date: Fri, 3 Oct 2025 15:24:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next 0/9] net: stmmac: experimental PCS conversion
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Abhishek Chauhan <quic_abchauha@quicinc.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexis Lothore <alexis.lothore@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 "David S. Miller" <davem@davemloft.net>,
 Drew Fustini <dfustini@tenstorrent.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Eric Dumazet <edumazet@google.com>,
 Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
 Furong Xu <0x1207@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 Jisheng Zhang <jszhang@kernel.org>, Kees Cook <kees@kernel.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
 Paolo Abeni <pabeni@redhat.com>, Rohan G Thomas <rohan.g.thomas@altera.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Simon Horman <horms@kernel.org>,
 Song Yoong Siang <yoong.siang.song@intel.com>,
 Swathi K S <swathi.ks@samsung.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Vinod Koul <vkoul@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Yu-Chun Lin <eleanor15x@gmail.com>
References: <aNQ1oI0mt3VVcUcF@shell.armlinux.org.uk>
 <4822b6a5-5b40-47bb-8bff-7a3cc91f93c8@bootlin.com>
 <aNVENwSF4I3hyP4q@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aNVENwSF4I3hyP4q@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_062520_070997_6526B837 
X-CRM114-Status: UNSURE (   8.41  )
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

Hi Russell,

> Thanks for the offer of testing.
> 
> Do you know how the stmmac core has been synthesized as far as the
> MII interface from it?
> 
> If not, if it's using gmac1000, possibly later cores as well, then
> DMA_HW_FEATURE (or FEATURE0) bits 30:28 should give that information.
> I'd guess GMII, so probably contains 0. The driver doesn't actually
> use these, or even look at them.

When synthesized with Lynx, this reads 0 indeed. On my device there are 
2 instances of socfpga, the other instance doesn't include Lynx and uses 
RGMII, so in that case bits 30:28 read 1.

I hope that helps :)

Maxime


