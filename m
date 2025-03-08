Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FB6C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 00:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sE/MUVOnH/UIUB/d+lf2WJxaGwzXEdtWM7tnrrNbY3U=; b=pqBc9p/4qobcoc2hvslUOLERPS
	VpekqzKZ5wBwNDC6BLSRUU9vwJGN/LKiXu8qCd5inrge+xXRwxKDywQAFEDZiOpwaO5xxSyvObcaE
	iiaxwHlbK2vTI6yk6xO2+tTzslR5iEBLOrF5m1h90VQZHfmjumC+p1+8JKuC7LXEbfWClNEG9VxSa
	HrDF6pr7N26JBNtLTqvpQQlAf3yKzwtV+DMsY9xeaw+h48kmr/ua8OWlnoAa9eaIWzWE9dDbbWJOA
	g5yMx5LdH4Y3/dqDnJeS9HM3NM8T66XakzlIFZiKtywLC3rWxXsDn/xfg1CDgT6uwQ+4waMogJ+MC
	obO/aX1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqiRj-0000000FxD3-2pwN;
	Sat, 08 Mar 2025 00:53:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqiCq-0000000FvNt-22xZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 00:38:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 489995C65B7;
	Sat,  8 Mar 2025 00:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A010C4CEE3;
	Sat,  8 Mar 2025 00:38:18 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id 83CB6180B9A; Sat, 08 Mar 2025 01:38:16 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, claudiu.beznea@tuxon.dev, sre@kernel.org, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 p.zabel@pengutronix.de, Ryan.Wanner@microchip.com
Cc: linux@armlinux.org.uk, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
In-Reply-To: <cover.1740671156.git.Ryan.Wanner@microchip.com>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
Subject: Re: (subset) [PATCH v3 00/21] Enable Power Modes Support for
 SAMA7D65 SoC
Message-Id: <174139429652.169744.15334502728005076193.b4-ty@collabora.com>
Date: Sat, 08 Mar 2025 01:38:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_163820_572343_89B82018 
X-CRM114-Status: UNSURE (   9.70  )
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


On Thu, 27 Feb 2025 08:51:47 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> This patch set adds support for low power modes for the SAMA7D65 SoC and
> the required components and changes for low power modes.
> 
> The series includes changes in the asm code to account for the addtional
> clocks that are in this SoC.
> 
> [...]

Applied, thanks!

[13/21] power: reset: at91-sama5d2_shdwc: Add sama7d65 PMC
        commit: 2fc78cd0a3c3013543e5f540eff61e9696138f83

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


