Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80414CA5FFA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 20:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkEV3NU/xjxq6SJuLLAVWiQsTCv0N4E8zuSVpty49hU=; b=aZc3SAcEvMgz02sjmGXwZYoUcQ
	8JHkLmuRpm/nw92S7HE9nsAO9z92xjpFJTCxkkcRC6FzvUgZXXR7oSd7Fq59SuU1o/nGyS40lxQRp
	w7QxZA1zI+sYdrKNOtX6+0dYSQ+XGZ+5OxBO9dtcYAIHOFXxtEBVbd6LVWMZ7LqxtPf2nskWJmnnQ
	kFOEsY4FqsyVcyPuF6YW//zsOPxc/eVYrbMjCEO5DmpITDPkP8m7K+nj7tbS1AnJ9kEtY7KmRSZC7
	blh0VgLHCHDUQS2dITicOGw/kuOAQEgMrqecRXbWmvXUzCY5aTvbzjtI9fnPgSZgfEGEbhsgkHgjR
	XbSdcTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDT6m-0000000FI2f-3vlt;
	Sun, 04 Oct 2026 20:46:56 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDT6e-0000000FHxZ-0JDy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 20:46:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 80B2A1A1138;
	Sun,  4 Oct 2026 20:46:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 523C2604FE;
	Sun,  4 Oct 2026 20:46:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BAFA410328384;
	Sun,  4 Oct 2026 22:46:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791146805; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dkEV3NU/xjxq6SJuLLAVWiQsTCv0N4E8zuSVpty49hU=;
	b=B8g8hXODUslb8dZcCbNk/4HFLAqzCpRG2AbkMuuvsHj9p8ERklG6Dzk5e479yHYAULx5Nv
	0ALgLMGUc2ugVjJbuc+wtxP6+kjk2A1grcOVZlH3MPSfhPo/K1067oxt/GhaPpGq7zSI/S
	eogJWfmbHotcIpPiOxZrUq/yjHUMp0EvLzY2ezJWkst07lUTGfCQsbcUvFx+oUqRauRcgL
	fQIyIddWF750bshCUOl0pdoazQ/UFy7OaKNTDO8mM88rqaPDZ5Ba5a/6cYwmcXqL/fUJCV
	/2bZ6+gcbBFnyiiTIb99lyiM+FsyEMkkZznZGfi8TusQBqxXiAkhpAkVSkhXNQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 22:45:30 +0200
Subject: [PATCH v8 6/7] arm64: dts: nuvoton: ma35d1: Drop HXT clock output
 name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-perso-ma35d1-upstream-clk-v8-6-e1a106a128c0@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
In-Reply-To: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_134648_270814_2EFFC001 
X-CRM114-Status: GOOD (  10.60  )
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

The clock-output-names property is not useful since there is only one
output clock, and the naming of that clock would already be clock-hxt
after the node name if we were not providing that property (so very
similar). Just drop it.

I want to clean this name before introducing another very similar fixed
clock in the DT: LXT

Another solution could have been to rename it "hxt", which would have
been more aligned with the other clock names. Sashiko complained that
this could break DT compatibility with an -EEXIST error because of
the colliding names.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts | 1 -
 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 78534d613486..d7670afb0a63 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -35,7 +35,6 @@ clk_hxt: clock-hxt {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
-		clock-output-names = "clk_hxt";
 	};
 };
 
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index a029b660e8dc..8f3cb18d39b6 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -35,7 +35,6 @@ clk_hxt: clock-hxt {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <24000000>;
-		clock-output-names = "clk_hxt";
 	};
 };
 

-- 
2.55.0


