Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086A3CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 15:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7UzLdiOi5LZpZjDmxVBQL0dGr7IdV3ZJ62uiej/iPEw=; b=B2T4YoQD1/SAEUn3JSP1uMZtcq
	KCLNDhzQI5nPKClsde2o4x62bxXbu6bVbjbDonhutsGVLWXACWCQ490sm4zhaQOOefN/jY2g0bJGJ
	Os/LfLGr/UmTghHeKUD29BP6cKVmn4RLIUUnvzQahTCcieYdWipNiKkaRAS6MBJVnb6UGdlmw+j0l
	saN0H1nOKW3lI48AMHiFMEjBK7iaEME00YPEx6wnrJmKd21FEHbQ4TIxNes2LUkTgOzMTI11jOjGS
	n8A2mRUtTU6J8YpnjNUenTJLYBoQVOB66KbVexzuS3/l2vGuDOSM7Whx7h5KLq2AiAgSLrQ5WpqYr
	aRh9puxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFz2-00000004O5a-1SFr;
	Wed, 27 May 2026 15:15:48 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFyz-00000004O5G-1QT4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 15:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1779894888; x=1780499688; i=wahrenst@gmx.net;
	bh=7UzLdiOi5LZpZjDmxVBQL0dGr7IdV3ZJ62uiej/iPEw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rVxUllNSyfGx2eGhn4EPNFe4EXxTFadBxmz4jrBYcTuITAo+D0pnkD2Iz3Y2Zyfp
	 SSu1i0JA/3oneO+HTi2+4nCCGkXHZU0EEoFHls2rUBqqIgmp0enz48loakrNxYlwJ
	 0MEJn0CW4cwjPiNxuwfVVHGuWLDXxVECnmvyEkpmQXHv1e3JA5Sf4hZFAMlHoTQHB
	 em2MvmOMPM/6kOF6pXJMLeP5eblhLpeQ+at506Byrb+vluvMEB/R844y59/pP08r8
	 H5S6No99bgip72TGSj+mPDldUOfoM4qib2pgO6z7Gx7pS/Hi+wToenImBJJ53c8zu
	 qNyuNVkoUyQRSn8Nqg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mw9Q6-1xIAEW2EEu-00vSxl; Wed, 27
 May 2026 17:14:48 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Frank Li <Frank.Li@nxp.com>
Cc: Christoph Stoidner <c.stoidner@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V2] arm64: defconfig: Enable DP83822 PHY driver
Date: Wed, 27 May 2026 17:14:14 +0200
Message-ID: <20260527151414.184823-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EueO/6D1vIc5/h6rH87/1PWK/73E98lUz1LyLJp5YTeHKY9T+MA
 MM8z2brehktsat3byJtEGRd26YGW1kgr3umFhuriVMjwc5RD57Y9kyA5+fhgjI+EXTHJg0B
 JGLUr2u8I/fd/GGGCCY5FG5JVwWE7/xE5+612M6OMpIcuaQZLy0QPRtVfezvWQSAbLdH1Zr
 /aDoH4Ub4/UFywxA25CvQ==
UI-OutboundReport: notjunk:1;M01:P0:cPdR1c0HO4w=;D3XGFIi/qgzP2gnKDmDnhonjUab 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_081545_665725_8E2E90DE 
X-CRM114-Status: UNSURE (   8.78  )
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

Enable DP83822 PHY driver as a module to support the Ethernet PHY,
which is placed on phyCORE-i.MX93 SOM.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--

Changes in V2:
- rebase patch
- add Krzysztof's Reviewed-by

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..20bbbd310d2f 100644
=2D-- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -421,6 +421,7 @@ CONFIG_AT803X_PHY=3Dy
 CONFIG_QCA808X_PHY=3Dm
 CONFIG_REALTEK_PHY=3Dy
 CONFIG_ROCKCHIP_PHY=3Dy
+CONFIG_DP83822_PHY=3Dm
 CONFIG_DP83867_PHY=3Dy
 CONFIG_DP83869_PHY=3Dm
 CONFIG_DP83TG720_PHY=3Dm
=2D-=20
2.43.0


