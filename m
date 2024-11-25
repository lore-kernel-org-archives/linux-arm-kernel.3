Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5F5D3B7EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 08:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VokN2zx5/a7fgGVGyKWlkWcp8WKF3/t1J4RYnujfUYQ=; b=XlqiXgV/D3PwNOYpofFRdjTVlf
	tgY4Udelfw2mSuCgxXUCGX0f+QBit3uBGNvz8SU12gtNnigFW6SprL8EhBsk+6N3adT8gGjYMnMtk
	9e5yyoiigtu2VUTvPpC0+bHOenWwgTmpocPwNjW7C3pM/kOS/fEmS0sNDO6nV2rh0zDYtwrblhJlJ
	TZ22za5YLShX1puMw/kuFF5MmeLGeAx8MR2yr1SbECrafoNQZwWMh+R9yHZQItfj8zaB+NN/KWbuO
	o1Oj+AuEvKE0tEQgar/9ZSTgzRc3QHv0vJghuFRvBvJc8Qhk1mSkJpNe+RsBITapi8owQf5n5MgVt
	/7Ul/1Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUT1-00000007NiB-1orA;
	Mon, 25 Nov 2024 08:29:11 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUIu-00000007M5a-1pfD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 08:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VokN2zx5/a7fgGVGyKWlkWcp8WKF3/t1J4RYnujfUYQ=; b=ppKY9K0QngzwQmsmUbJNKx2azH
	5f1UvKpoGUdXhA3yJc/v8yO7nYpk612Ln860A5xTeypGMSYaRSnTKX7rkgGC4aRwIuEobC/adEz+J
	gCxfc0dN8aN0Hfsxw/mcT4+uU/AhFQNCXdMwcRRqe0Li0PfSGPYQhTHRJ0BY0fWylmoX09pEnlUSI
	3lFHuDHN6u5JThxKQk0pWMcJZOKN5pMr/0N1jlgjSYmsj8OGQ3XLsi047LzHzGneTrSJ98CdN65Sh
	93dZVgLUuErELOcFDZZ11lFFeG2WaErC0WveQptEFzvCjPe+mM4kNG6jj9OzCW6P+DrTX9D2Emjrb
	KiALj/Rw==;
Received: from [91.26.50.162] (port=58340 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tFUIt-00Eq70-1b;
	Mon, 25 Nov 2024 09:18:43 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 10/15] arm64: dts: imx8mm-phyboard-polis: Assign missing regulator for bluetooth
Date: Mon, 25 Nov 2024 09:18:09 +0100
Message-Id: <20241125081814.397352-11-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125081814.397352-1-andrej.picej@norik.com>
References: <20241125081814.397352-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_001844_638007_E66DD11F 
X-CRM114-Status: UNSURE (   5.99  )
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

From: Yashwanth Varakala <y.varakala@phytec.de>

Assign the missing regulator to the bluetooth node. Absence of
this regulator triggers the warning message from kernel as driver
uses a fallback dummy regulator when there is no regulator assigned.

Signed-off-by: Yashwanth Varakala <y.varakala@phytec.de>
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
index f5f503c3c6b9..defe59d957d8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts
@@ -266,6 +266,7 @@ bluetooth {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_bt>;
 		shutdown-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&reg_vcc_3v3>;
 		vddio-supply = <&reg_vcc_3v3>;
 	};
 };
-- 
2.34.1


