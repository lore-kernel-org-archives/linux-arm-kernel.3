Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AFAC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gi9z0zpx+ayou6Y3PPf7EqHXan2g8ulf19Ed0YKK120=; b=RcxywuOQ65YNcA
	8wtDK27V4vkLHLhb0t0lZ/IvcIGr+z7rDR+TK/VWROcAsZSC82L3uvM55TS/NQegOOCfCN43Ew8GW
	uHgrNpq/N/C7M/Nx4XV2jl55qljUhGjE2cnYq/PeSQkl5wov23vdubZR9qYF+FQqKEx9tdLlqd4vO
	9kw1xqTks34ndynOLWKoksL9RCTyXMEL6OBfVPjVQWp3+XTUBbeXxfzAO3GNSqOZTLmTvulQPStMv
	0Ve9POj/27T0B1quNYUJ1ZxD8MPf/VoeLTvYxvzI0TYRwdjEsTTk8z57dNPmSHxZE6m3flY3ihgZI
	L4I0AeT3kpsAgtXwxIyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPog-0000000Hb33-0uNi;
	Thu, 13 Aug 2026 07:25:30 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPoc-0000000Hb2M-29Cu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 07:25:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 509401A15EC;
	Thu, 13 Aug 2026 07:25:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1A0D6602B8;
	Thu, 13 Aug 2026 07:25:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F66711C4D9FD;
	Thu, 13 Aug 2026 09:25:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786605918; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=gi9z0zpx+ayou6Y3PPf7EqHXan2g8ulf19Ed0YKK120=;
	b=bQ1XmX7Zja82hyUTkT4mPesDx8oWs929yPKcRrUwI0/m20hHg4eA3HStZyMfRwR3o0Ajd5
	ypxAxkRMVKQwN5iuuM3BrSKjx3Rz3RFUVvRaL6mrlVitk/yh6kyZ2z31OcHJk5B/PiC0Li
	1+m82NRQvYcPf1bChBf4MqZnXv6WyunRg6Hfgx1duFFhPuDPaBTHHrznJBeUD7utvij2VK
	n6tBaH5al3KnhsB3uPREFx91Ktz+IucFmanRK9OxIeTJhr89mW+UCmlAiQOyndM4aBFUnL
	HQrf26ALjz0DoHjjaKChXgkWzqwcVuIB0gjCVxYGvsnlQyYJ9JCEN19ouc47gQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/2] arm64: dts: nuvoton: Improve MA35D1 support
Date: Thu, 13 Aug 2026 09:25:05 +0200
Message-Id: <20260813-perso-ma35d1-upstream-dts-v1-0-bb237fd7c3c2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAyA4VeRnBdoKpa5Vxk7lDZqDtWSOBmI7
 77i8Tv8/wnGKmzw6k5QPsRkWxvo0UFa4jozSm4G73xwT+qxstqGJfZDJvxW25VjwbwbjuMUKLN
 PjhK0vipP8rvf7891/QHHhWJ0awAAAA==
X-Change-ID: 20260813-perso-ma35d1-upstream-dts-99f61de2c01c
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_002526_702650_37FA08BA 
X-CRM114-Status: UNSURE (   6.17  )
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

I am in possession of an MA35D1 NuMaker board. The SPI controller has
been contributed, but:
1- it lacks a DT description
2- it does not work with current clock driver
3- it can be improved

This series is addressing #1.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (2):
      arm64: dts: nuvoton: Add QSPI0 node
      arm64: dts: nuvoton: Add NuMaker board

 arch/arm64/boot/dts/nuvoton/Makefile           |  1 +
 arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts | 37 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi        | 11 ++++++++
 3 files changed, 49 insertions(+)
---
base-commit: 1ec281b42ee249cfe9bad52a54149de29ed6aa78
change-id: 20260813-perso-ma35d1-upstream-dts-99f61de2c01c

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


