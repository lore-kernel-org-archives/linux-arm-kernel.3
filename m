Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441C6CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 12:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzO6vrA9N4fsDhFNeH4o0N3aibrDbQ4U2XBDQBbfshw=; b=AnVV6OPw5fhmaym32W/5TdSGSO
	400gF2GDIXWdsc/BbZR5/QICcLABiIUlbLwyaekWoP/FMmrPqXk/EIZK+uddaz3deZFn8MTCpjRi8
	HpG1a6IR+y6K+Fo9x0lytsdDfTMli66qHBExeVczfIFBmyR6k+IQfijaIjwPvBBASSHG6cBnvY0dU
	DUAt0/7pxV0BJc9iQ9H29wjxcOwO1qCB1uS7SXq6LxmHP3/kgNkwK9cj9ZF/lHFWLJYY4o5r3SJXz
	8aXGmlPl0EDXjUBT05IBZtKbMdzz3BDAfn8uAsJuRXuzGkidCF8Y3Xi8xiQQAOgZEjSECdX+LeOGQ
	Pbvll0fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFsyV-000000091M0-0c6y;
	Sun, 11 Oct 2026 12:48:23 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFsyI-000000091Bd-0ZFA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 12:48:13 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4j2gPN0KsyzKnW0;
	Sun, 11 Oct 2026 14:48:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1791722888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KzO6vrA9N4fsDhFNeH4o0N3aibrDbQ4U2XBDQBbfshw=;
	b=e2HTwqKds/FLVAnUTpusFGyWZPzFMRmVtMPD2wB7BdlQtrq4Qjo1YPprCXGQvliebHwbu9
	ipnYthdph7t3SBbUtV0xiUnjXLaHzGhAGpMDEiNwXJL69J4bwp45W0gkBd4fyXSmuFDXi1
	3/mzAJvz42WJjId+FDNoCXYWVoErRlO1MRY5CavYkg5pqFFGnviG8slGPZzljWalkFLDCZ
	yD0T/z7Adpy9ba0tR6HD7KlIfG++f+cQ39TSg/LyKXSqeQyR8WpyCm5Nq9SpvVYCllp88G
	1w8v2pzaeHFHskFCvVQUIgyzTdF4WhwYmbWuUSoFO3lRqqM+dbJznH6STzufZw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of foss@timmermann.space designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=foss@timmermann.space
From: Lukas Timmermann <foss@timmermann.space>
Date: Sun, 11 Oct 2026 14:45:02 +0200
Subject: [PATCH 7/7] MAINTAINERS: add entry for Samsung S6SY761 touchscreen
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-lat3st-google-raven-touch-upstream-v1-7-2a9f55159b9e@timmermann.space>
References: <20261011-lat3st-google-raven-touch-upstream-v1-0-2a9f55159b9e@timmermann.space>
In-Reply-To: <20261011-lat3st-google-raven-touch-upstream-v1-0-2a9f55159b9e@timmermann.space>
To: Lukas Timmermann <foss@timmermann.space>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4j2gPN0KsyzKnW0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_054812_532207_EF7F15D7 
X-CRM114-Status: UNSURE (   8.82  )
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

Add a MAINTAINERS entry for the S6SY761 driver and its binding, which
currently have no entry.

Signed-off-by: Lukas Timmermann <foss@timmermann.space>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..9de472b68ea9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24430,6 +24430,13 @@ F:	Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-lite.yaml
 F:	Documentation/devicetree/bindings/media/samsung,fimc.yaml
 F:	drivers/media/platform/samsung/exynos4-is/
 
+SAMSUNG S6SY761 TOUCHSCREEN DRIVER
+M:	Lukas Timmermann <foss@timmermann.space>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.yaml
+F:	drivers/input/touchscreen/s6sy761*
+
 SAMSUNG SOC CLOCK DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 M:	Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
2.56.0


