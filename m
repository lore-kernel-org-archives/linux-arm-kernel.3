Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F16AC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 18:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/Pliae2eQBpyDaB/rhM+Xrce+n5H7ftTZ7yML/5v4Q=; b=Otl+Fi8CaxU5x2N1VS8wf+r79J
	ztOgOiX6U+z8gIJcSp18e8aVN0vJKsPA9XUN9/VJmIvZ7t4GnzFrvzae2bek/JONqtZTGzscz1eNr
	eRBQIf1Fo9i+9TbxyADtfQ8C4na+wejQ1tDVsz9bdBIos1o9Ohojj6UKrO2apO1pbhGse5ND/JOJ5
	3oa4LWa/vEijU4uFqGfCbtHbt8uPZ4fIBDT7Awu43GO21g68xvqhyDLOXOXbj9A0A4qbommPffeI4
	iW94r62qfMI9krbtcYMDOzy5eh++TXt38mH8E0EvuEamA2h59f1I+uMKpMPtfAHPQHoVzU/phmkw1
	ej3K/sXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk5R9-00000005YAi-0qBX;
	Mon, 17 Feb 2025 18:01:43 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk47f-00000005I9h-0Ido;
	Mon, 17 Feb 2025 16:37:32 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38f504f087eso845f8f.1;
        Mon, 17 Feb 2025 08:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810249; x=1740415049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/Pliae2eQBpyDaB/rhM+Xrce+n5H7ftTZ7yML/5v4Q=;
        b=G5qRWMpkUn19M5HR/XfBS0J7GIQ7c3x0dsI5Vs1Kbxuc6UG6TauPOKZQnGC7XCaM7Q
         971u/KyhPxtTdTLEvCf6LzyMwGhaht8MlkqCLq6GIC6xRd64ioXp8t3QfcJNPEzq7FoT
         8wNVHFd6OgZsxYi6SB7/N+tBrT59HdAwG6244Y6WacfwMsPPO9m2s4VEwbAPx01/zqrH
         6x/+mQwfd9PA04rcLqGPgZHPslskV6TPpg51pYURg7I/kjszgkz0xaBjFQF+QZapLlbv
         Jh4gm3Mg10SLHLPV6QmMoRlcI26oiyxyWny0JohSSmzR8+KbTc1NteEOPpDxjZ3zNM6n
         vaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810249; x=1740415049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/Pliae2eQBpyDaB/rhM+Xrce+n5H7ftTZ7yML/5v4Q=;
        b=D8EUvs2pB3aSr4XJog++VlKHckQZcAtdL2u5/oW2nygNCI8KDBEy9+QpS3OGpWUtrx
         rNgaONKa2dHVaZOjXuXWf+wLSZGw0K0oIbauj25KK1C06BNdZXG/0a207F/x5YEY30Hx
         NV9hVhWth7+f3IxvvehD2GOyhmH2QLKPNPZryC2fuKO3qc4mO5ifrRX/YViis3bf/eAx
         8vSmpd1Y6iyg3ROJTpAWhy3WtdXjch4tS73rZ1xwDSAV3RDXIUIBFgabkFHhkGf6sd+L
         YKpnkfQ5QzDkE7n37oyBg9sZPa8591aIf+tcNabl6vx/86LnR8b3Si38Mtw3akNccDEs
         e78w==
X-Forwarded-Encrypted: i=1; AJvYcCUM1WGwLcvYAJwLCiVPB05MAYGVbSl/qFmtGBkVrpnnyNJ9fvZzeOFOTTOyPj7OQRPTACgzgmRLs2rh9Uw=@lists.infradead.org, AJvYcCVKRgHa0FFq9BkCAJ2mJcwBXAp97jLWpV/q8n8vBQOLPp+OMFCZBVmg7vBQqw6l60xanUL+TUpjlqcTFJenE93o@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbr3SAToifyT5kiaz5PuCcezNkoKHX3WqsDjuKl9Z9873k4sjj
	K5bCxrToFR2+mEfKsBoxn6XHgab8ZIbJpenWoGXLHQDEWv9aM6DGIQN6uQ==
X-Gm-Gg: ASbGncsax2k9sXt8BdroAUtiz/ESxZJxfK8G0BtDQr0msYoHbCI1SfWs8dYEzmfmitC
	Sycxjy2o3HgbzBdh7qZTusRDaIwRk9cHFh8aaU+GH+SW49370xrp61iJBDRIuvOQcoq+DcokQ3r
	IC8peDjxm3hMvzQaKasw+Z7B+T9rEkuq1JTUBVBZNHg9amULpnLJpMG7Mdm3ZKWZteNpk1OLjCD
	MhMllMCmnayof+m4+sdQgnazYk5J1G7qzuo2LK6VhfWVxU1Nz4fBkMMrx009jKFuMeymaI0ErDT
	cwYJ6jEazKrVZTuMIODt+95B/udAkymmivIYWWQrrdXgYPkSRTb+g9UsXxa1AwlOlyvTzmkN2fa
	Ff6L6e0U=
X-Google-Smtp-Source: AGHT+IEcmZoV9E3nZ+6g02c1M8tS19/XgVVrKGZ1S0RbQ0hvdrhxp+y24wkbvweGnlTFrgLbDmIhiQ==
X-Received: by 2002:a5d:6a0a:0:b0:38f:2e78:450c with SMTP id ffacd0b85a97d-38f33f2961cmr6950160f8f.19.1739810249186;
        Mon, 17 Feb 2025 08:37:29 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f259fe1efsm12791371f8f.97.2025.02.17.08.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:28 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] clk: ingenic: tcu: Embed syscore_ops in TCU context
Date: Mon, 17 Feb 2025 17:37:10 +0100
Message-ID: <20250217163713.211949-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217163713.211949-1-thierry.reding@gmail.com>
References: <20250217163713.211949-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_083731_110134_0791DB69 
X-CRM114-Status: GOOD (  13.97  )
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

From: Thierry Reding <treding@nvidia.com>

This enables the syscore callbacks to obtain the TCU context without
relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/ingenic/tcu.c | 54 ++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
index 85bd4bc73c1b..503a58d08224 100644
--- a/drivers/clk/ingenic/tcu.c
+++ b/drivers/clk/ingenic/tcu.c
@@ -53,9 +53,9 @@ struct ingenic_tcu {
 	struct clk *clk;
 
 	struct clk_hw_onecell_data *clocks;
-};
 
-static struct ingenic_tcu *ingenic_tcu;
+	struct syscore_ops syscore;
+};
 
 static inline struct ingenic_tcu_clk *to_tcu_clk(struct clk_hw *hw)
 {
@@ -332,6 +332,24 @@ static const struct of_device_id __maybe_unused ingenic_tcu_of_match[] __initcon
 	{ /* sentinel */ }
 };
 
+static int __maybe_unused tcu_pm_suspend(struct syscore_ops *ops)
+{
+	struct ingenic_tcu *tcu = container_of(ops, typeof(*tcu), syscore);
+
+	if (tcu->clk)
+		clk_disable(tcu->clk);
+
+	return 0;
+}
+
+static void __maybe_unused tcu_pm_resume(struct syscore_ops *ops)
+{
+	struct ingenic_tcu *tcu = container_of(ops, typeof(*tcu), syscore);
+
+	if (tcu->clk)
+		clk_enable(tcu->clk);
+}
+
 static int __init ingenic_tcu_probe(struct device_node *np)
 {
 	const struct of_device_id *id = of_match_node(ingenic_tcu_of_match, np);
@@ -430,7 +448,11 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 		goto err_unregister_ost_clock;
 	}
 
-	ingenic_tcu = tcu;
+	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
+		tcu->syscore.suspend = tcu_pm_suspend;
+		tcu->syscore.resume = tcu_pm_resume;
+		register_syscore_ops(&tcu->syscore);
+	}
 
 	return 0;
 
@@ -455,38 +477,12 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 	return ret;
 }
 
-static int __maybe_unused tcu_pm_suspend(struct syscore_ops *ops)
-{
-	struct ingenic_tcu *tcu = ingenic_tcu;
-
-	if (tcu->clk)
-		clk_disable(tcu->clk);
-
-	return 0;
-}
-
-static void __maybe_unused tcu_pm_resume(struct syscore_ops *ops)
-{
-	struct ingenic_tcu *tcu = ingenic_tcu;
-
-	if (tcu->clk)
-		clk_enable(tcu->clk);
-}
-
-static struct syscore_ops __maybe_unused tcu_pm_ops = {
-	.suspend = tcu_pm_suspend,
-	.resume = tcu_pm_resume,
-};
-
 static void __init ingenic_tcu_init(struct device_node *np)
 {
 	int ret = ingenic_tcu_probe(np);
 
 	if (ret)
 		pr_crit("Failed to initialize TCU clocks: %d\n", ret);
-
-	if (IS_ENABLED(CONFIG_PM_SLEEP))
-		register_syscore_ops(&tcu_pm_ops);
 }
 
 CLK_OF_DECLARE_DRIVER(jz4740_cgu, "ingenic,jz4740-tcu", ingenic_tcu_init);
-- 
2.48.1


