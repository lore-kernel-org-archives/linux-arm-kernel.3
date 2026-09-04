Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7CF5C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9voOvOOTmE0p/jaZPF0zwsc+G6r4jecsh5ZNm8BZdD4=; b=UUe1IkuiNRECE8
	WaiSeJQHn5XoF+S6wyz0Uxux+wIVHVuxA1qxi778QqmTOKl9e+aNTYY2XHzuvdfwRcTKZPkIRGL3a
	H/Ys4l/ryGHZgN03SumkKrpBsn7C82qqtIW65LTPuyQWwONBSxMOHG1Q90YHUuHrvrQgtaqGuujKz
	xQi35O/Jecs3zrfahvjqR/7paBiGtoB8esCHAFml4Vu4XvbFItPu6pL7ANoJWuMrJS9JbecRTSlVM
	fq/nUdFFnuUlAgmqmuQu9mBECyJWDPnH4FooVNadiMVYvQXtpzzkVvLskYJlGeCwdTvLXudyr9LT7
	9GSccH9lFQSuChp0JKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TZa-000000025j7-3gJI;
	Fri, 04 Sep 2026 13:03:14 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TZX-000000025h7-2vN9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:03:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 39B471A19A7;
	Fri,  4 Sep 2026 13:03:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3C966057F;
	Fri,  4 Sep 2026 13:03:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C16F511C7AF01;
	Fri,  4 Sep 2026 15:02:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788526980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=9voOvOOTmE0p/jaZPF0zwsc+G6r4jecsh5ZNm8BZdD4=;
	b=hRJt+QRA+No1CnkIDYoIXKnfSNyd1Mz1wkaLsDdBqyJBHvUjD+bkoe6u/PD64UW9s4/EDM
	lSz+quQxiye2eZko4D6WuOStXc4WADQswlrpZKvgdEcUyfhqYi/grT9TItgcGyGC16sw3C
	6Ow8nFWcY7ybb2gmFAj47iPJRuJn/Vowy1UXRrczpw9ex90xdi1yNGiYXsO8GJu3+0hCqx
	wwq6gFFMowq1BWvm69+lWkkQ59wm4arsOn1bLGaYMrH4e3mJB23a87MjxXuoEFhkKNGoko
	xViPnCf0gOdrBDUcIs4xonh4x86YzNiYACPGaVqQdUpgP+b2wk3wTpa+Q0uzgw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/3] arm64: dts: nuvoton: Improve MA35D1 support
Date: Fri, 04 Sep 2026 15:02:35 +0200
Message-Id: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NTQ6CMBBGr0Jm7Zj+RBBX3MOwgHaQSYSSTiUaw
 t2tnMDle8n3vg2EIpPArdgg0srCYc5gTgW4sZsfhOwzg1GmVFdtcaEoAafOXrzG1yIpUjehT4J
 1PZTak3FKO8j7JdLA76N9bzOPLCnEz3G16p/9p7pqVNj3xlaDr5x1pulDSE+ezy5M0O77/gWho
 giIxAAAAA==
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
X-CRM114-CacheID: sfid-20260904_060311_899226_D4267AE4 
X-CRM114-Status: UNSURE (   8.60  )
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
Changes in v2:
- Edit the binding file to mention the new compatible.
- Add a model and a compatible for that board.
- Link to v1: https://lore.kernel.org/r/20260813-perso-ma35d1-upstream-dts-v1-0-bb237fd7c3c2@bootlin.com

---
Miquel Raynal (3):
      dt-bindings: nuvoton: Add NuMaker compatible
      arm64: dts: nuvoton: Add QSPI0 node
      arm64: dts: nuvoton: Add NuMaker board

 .../bindings/arm/nuvoton/nuvoton,ma35d1.yaml       |  6 +++-
 arch/arm64/boot/dts/nuvoton/Makefile               |  1 +
 arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts     | 42 ++++++++++++++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi            | 11 ++++++
 4 files changed, 59 insertions(+), 1 deletion(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260813-perso-ma35d1-upstream-dts-99f61de2c01c

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


