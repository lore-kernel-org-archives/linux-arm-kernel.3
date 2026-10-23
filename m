Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19634606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=shN/hIm2;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EVFnJAJC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LOqLZKJMT/w+vtW751BtQ1dEmz/kTbksIe//V4Kzc00=; b=shN/hIm2e28r54
	adIuGQVzIRL5TancxxI2R9rcxMFIFgWvlP71A4WTZTgtaUHxES9AvIt2QQ/s0o/nWrEfiMw3Dd9m3
	OMN1ENNqdwp7f/xu40TpScPcvYNZ4uKHeCtxLyxEB6+s5TrDgkIONke4oa1PR58/DqehJQWDGISeS
	LUzUL1Vnb3HWSWkXweiiGlt58viKn+Hq+3CGGwd6SuJvrOEbTCCmXSHC/5BSGKO5pVS/3/yFCYm6K
	vHL0XrBbTvlKVQ3z6R60u8K1AHjrhEzBDktwFIayfATmXZT6qIfqflrxank4Q1uewa9r2dAw2HT1B
	CyIpR7WPWpMYOGePEXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA5K-0000000FoEN-1y0A;
	Fri, 23 Oct 2026 07:53:06 +0000
Received: from mail-dl2-x09.google.com ([2607:f8b0:4864:38::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA5G-0000000FoBH-3TZF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:53:04 +0000
Received: by mail-dl2-x09.google.com with SMTP id a92af1059eb24-164f08a9e84so136559c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 00:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792741982; x=1793346782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOqLZKJMT/w+vtW751BtQ1dEmz/kTbksIe//V4Kzc00=;
        b=EVFnJAJCJ4RHOT6XEIff8y1QssBR/Lm6T9kmKm2m8esqRdZmUTUsRlNztZi9o4e4yJ
         j+6ZPmmhdeGoaSon6MTEvJC9DVI2KSdjyXN3NHCfXzEBgi+qoS8luNUnkv2BI2PY9vBz
         n8DdzNJXm92lpgTPNjA2bhGwwA9ZvMhEq+SIOoatihYmiWKnaSKy9LttiuHGj5PJUIoP
         /zlljpEhWP3gRFlho3o1xgLeH2i+mR+pP/OhOkRwbYc1ybNoBMIqkgjPePv7CnBJP5/n
         IkK8kuLZJEN3o5xRrTP/cc0X5OBmslCr0LVbOq1uM6MKTQ+8tWRCW24M4kIlZzJVd3N9
         r6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741982; x=1793346782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LOqLZKJMT/w+vtW751BtQ1dEmz/kTbksIe//V4Kzc00=;
        b=jqeQrovL6Vv2IY61fnhECC0p+0CIr7+J3Hf913ELe9jaeMqgn9dZ43sKm3vuNDf+Z/
         DbgCdJrYNf0zqnrrSTtjqw47ZJ+KvermquLGCDYLeOM4I85/mDH+KHUanzfVfeA1IllI
         3/pI8EQDtiifsxuZ+wWk5PTZOKJySILK/3BDMcYOIKXHla7TZyqrBuByq1oFwcOs80sN
         Y5dk+8sB5ZKXvWF678n8gqv6SOSK3iZMfJzSvckoyyzKwDPOowhiUbqYIVUgEkBOoOT+
         Hgmt/nYQyuLzU8a3686QQUbWWs3wbt3OoCXTu3VW14+K+qLGsK6pGe9/SWqDZL1yBtae
         LOdA==
X-Forwarded-Encrypted: i=1; AKwUvBykj9NqyQVf00qirCkGJfxbAcXw1CARu4WNU2/HG8RH9jwnqJ8wXC2iJBf47/l1B2DERraVT2lRwX4XAP38/nQk@lists.infradead.org
X-Gm-Message-State: AFq9FYLth+MwrlC1Os92HjLpJUq7aHAoYQ/aICr89a/YzYgG8zYe9AyP
	WMjh5sceIOUHWvy+3zaZ7u3cD653Vygv0vqgCUJ8vKXS1Y48orNjaBOf
X-Gm-Gg: AYBFou2SXrmxYlsbH4Tpk98N6DQ04ybk1xzPp8jrOaEmX/uQTkoj6t0tFrcCHfrxhH2
	KXvnt3fhL3I24U5760p3RxQS0JtvG2VW1Pj32DtH08WwzrNgp92jSt2pe6repNrDVGaAGPNPg4a
	5VZKRXbry9SOjEkGMCIvz2w8ulDL+7xe/Zqu6lxqOtZCdTIweWpiAQwsnAkYDtUtqv68BQtVgKt
	GRqDahuP9dD+GGUwaOJ9FJM6OSV1OaSAIBVZTMtoxlbiNUpccZTllpouplHXh45Km2V32/NE8tl
	9aynB7Z5ItKXU+SMtXF5Oh4TdStjI4BWeN9WhXF3AEjpR0HgDQEaH7/sz81RBuJOzPoVzhRmAYK
	Tu+bWIulMJ8ZlkRZbI8AYXjoL7IA4GAKj4ojfXYnv5Nop0pcDQH7NCpTINTfKokT6IvvAvWohBR
	EKr0WD2r3eeoSNdAE9+F0oEaKonz+9p2kCuVVE9xrsqUadTvxlNyoo7FuKQ5wSjUOD2hETSF20R
	FvNuFnw0AqlYByeiJOiZwc9MjCO4M4gCLqiZ8ogNMj+AH29s7QAh9p98Anb/RVTF4aQks4UhgI=
X-Received: by 2002:a05:701b:2914:b0:187:a2b1:7b3a with SMTP id a92af1059eb24-195c77a82c2mr1718936c88.41.1792741981479;
        Fri, 23 Oct 2026 00:53:01 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eae0e830sm4122132c88.10.2026.10.23.00.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:53:01 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Coia Prant <coiaprant@gmail.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/4] net: pcs: xpcs-plat: fix runtime PM initialization
Date: Fri, 23 Oct 2026 15:52:12 +0800
Message-ID: <20261023075214.1793922-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023075214.1793922-2-coiaprant@gmail.com>
References: <20261023075214.1793922-2-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_005302_915309_1D859747 
X-CRM114-Status: GOOD (  16.80  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The driver calls pm_runtime_set_active() before runtime PM is enabled and
before the CSR clock is prepared and enabled. If the device is later
suspended (e.g. during unbind), the runtime suspend callback tries to
disable a clock that was never enabled, producing:

    clk_csr already disabled
    clk_csr already unprepared

Set the initial runtime PM status to suspended instead, and register a
devm action that force-suspends the device on teardown. Without that
action the CSR clock would stay enabled if the driver is removed while
runtime-active, since nothing triggers a runtime suspend on unbind.
pm_runtime_force_suspend() is not checked because the runtime suspend
callback cannot fail.

The clock is enabled on the first runtime resume (e.g. during MDIO
access).

No upstream platform currently enables this driver with a real CSR clock
dependency, so the issue is not reachable in mainline today. It was
found while using this driver as a reference for the Rockchip XPCS glue
driver.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs-plat.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-plat.c
index e669a7b248ac..11c4239bfd74 100644
--- a/drivers/net/pcs/pcs-xpcs-plat.c
+++ b/drivers/net/pcs/pcs-xpcs-plat.c
@@ -275,6 +275,14 @@ static int xpcs_plat_init_res(struct dw_xpcs_plat *pxpcs)
 	return 0;
 }
 
+static void xpcs_plat_exit_clk(void *data)
+{
+	struct dw_xpcs_plat *pxpcs = data;
+	struct device *dev = &pxpcs->pdev->dev;
+
+	pm_runtime_force_suspend(dev);
+}
+
 static int xpcs_plat_init_clk(struct dw_xpcs_plat *pxpcs)
 {
 	struct device *dev = &pxpcs->pdev->dev;
@@ -285,10 +293,12 @@ static int xpcs_plat_init_clk(struct dw_xpcs_plat *pxpcs)
 		return dev_err_probe(dev, PTR_ERR(pxpcs->cclk),
 				     "Failed to get CSR clock\n");
 
-	pm_runtime_set_active(dev);
-	ret = devm_pm_runtime_enable(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_enable(dev);
+
+	ret = devm_add_action_or_reset(dev, xpcs_plat_exit_clk, pxpcs);
 	if (ret) {
-		dev_err(dev, "Failed to enable runtime-PM\n");
+		dev_err(dev, "Failed to register devm for xpcs_plat_exit_clk: %d\n", ret);
 		return ret;
 	}
 
-- 
2.47.3


