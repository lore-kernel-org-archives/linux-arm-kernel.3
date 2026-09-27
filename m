Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F37C98324
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 11:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gpaaXjdlXODSgCKCY/4Mr6bPE7Uezooe0w7R1BnxDYc=; b=w6bLfy7UONmGlN6Vqz6OC7ohgh
	DpxbmhlQoV6aF+foeZ6H2lHSC9XQwI90cH0lGjUJl4g70zbx6dyRW0Z1wQK1h1yV9sVRo9Nj0lFyF
	WJVTXJu2HSQV0lwzsnxHy3DZZbIOv6jVQZt865U5xW/KiIujpWoCuGnriPooKC8gisNb8RjuEK3Ni
	RI8z1os+jBk4ATJKBmMly2QsDUdA9ae+uyHmmMAKaV5aVEE7HVslDu4HFyEjW24Qpf88OMU0yRUHB
	Irklha+Is7ECOW153Q6Vq9wSExL3p68O7KjzNdDS6S0sQzAbhQjD5bBQwCQ43nKoIjn1iEFWl/nU/
	BnlGhpbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAmhN-0000000GEFH-1R0f;
	Sun, 27 Sep 2026 11:05:37 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAmhK-0000000GEEx-0HwU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 11:05:36 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 33D2C20291;
	Sun, 27 Sep 2026 13:05:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790507127;
	bh=gpaaXjdlXODSgCKCY/4Mr6bPE7Uezooe0w7R1BnxDYc=; h=From:To:Subject;
	b=OUQR4V4Dgked0gsUKk2lTLiP/OFrWmTognhjNjGPkQN7Q0U81msgw6Z2L3G3v0u5D
	 9Zhuid7q420dPOHY8rW/jmfULmWMHAHtusQ4sqqtuwSr5JpDkqJS0yt7Tn9EwD43Z/
	 jN4GvEgPBVv5OrDzRwyI9T1Yu9B26BUY6rocTxtsSmtRm43RJlpdrxJTqJkr5MBaRU
	 IH6qB4a3sqdybDm/aQgQEOY6GVj0JQ0ozrY4HK4Gf8XOL+S4mi/ZS5dChXZmwHPqZj
	 HD1SOso/JHWard5UrvZndRexk5sLynf4eAyhajvaG20sXEMAfJHL01c9AbnlE9Zey7
	 rgQgeXMYKUWOA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: freescale: imx8mm-verdin: add gpio-line-name for CTRL_SLEEP_MOCI#
Date: Sun, 27 Sep 2026 13:05:07 +0200
Message-ID: <20260927110508.60922-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_040535_167060_C462FA83 
X-CRM114-Status: UNSURE (   9.12  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Verdin CTRL_SLEEP_MOCI# (SODIMM 256, GPIO5_IO1) is the only SODIMM signal
of the module without a gpio-line-names entry. Verdin iMX8M Plus, AM62,
AM62P and iMX95 all label it SODIMM_256, do the same here.

Assisted-by: LLM
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index ac450fc6cbfb..4f64c5da8d15 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -353,7 +353,7 @@ &gpio2 {
 
 &gpio5 {
 	gpio-line-names = "SODIMM_131",
-			  "",
+			  "SODIMM_256",
 			  "SODIMM_91",
 			  "SODIMM_16",
 			  "SODIMM_15",
-- 
2.47.3


