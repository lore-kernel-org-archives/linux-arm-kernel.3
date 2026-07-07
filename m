Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA24C44506
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 07:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+brjFLVFjY/4CAFVXT8akEWDnOfxHjuH7xO2k8ZWc/w=; b=YUIECTwWW4q2a8Fzmr3a73KWvR
	cSKECSJLO7E17X/hDa+K3e2L/fBE9o6mdsGxF9z3eYCJdO95eFhwRa6Mf9YwjR0rX8X6+uIsC0xf8
	E+s3HMq9+z8ukqmZKuIAxNN4x9tPVC7dmRkBBt79M5HdzL3breQHyn3UkXFZF8iEWth2AAZZqD6vd
	V8Vjt4I/rzjvYl4O+s+gY+MsrOYHd0xTqw7R7/nLfBdPUs7HR9QuyI9Yqxvzq6yTfBZya6J98dF1X
	ovlks64N2/+H9P8zC+0NcLrGUbEXSu6oynWysgwGu1Rlq+ATyo+8meUEPOI7JuJ5aRw0J7g3MC2RB
	smcr7JQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0Yg-0000000EMTv-0Hbu;
	Tue, 07 Jul 2026 07:49:37 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0YY-0000000EMMy-0utl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 07:49:28 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3811f512167so3634009a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 00:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410565; x=1784015365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+brjFLVFjY/4CAFVXT8akEWDnOfxHjuH7xO2k8ZWc/w=;
        b=Q2QXsDxMSyRD0fYILyK617pBlWf1Wj24RhdY29Kxtio1nwpIavfMM2d9m1e+mkT/Z8
         cH8DOcB0Wh83Uc82bwBxRP8qMsgL62JS8xrvgG5OHnkaMxyE5euce+tHr9XL7CVoB7mz
         s78jFd4bx3mz2x7sFhS1jOneNTCptGFBSAw3GfWvzqegVOVtn2ENPYDZqx6rxrGoLBI8
         BJVHi2UvW1SkWmeDMVFlCDI8/bkJ8BX4oECAStTd2IkXZl0MOtlSIR4BVqIPK8pnsv/t
         rPIKLKMjkEuVekIy07MOB3pvPBwFBTBrLiGBVXNm62QCs9jg0DCKJAgJ0lnXa58CbhxT
         sIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410565; x=1784015365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+brjFLVFjY/4CAFVXT8akEWDnOfxHjuH7xO2k8ZWc/w=;
        b=flqFjgBKhHIuS2qU9yR9s+54hYKM9WWJUaos5PwxaV68ZpX9K7nzLOYYoEuYtbozN3
         2fdD7gTDgOE/kres44oHw/ggUnfpuFj4jUcC5HUYpeYopnYslN3Lwf+67L6BOfakbR7O
         ge+BvGUWf2mzc14SZI9TAtbGlHJSI2xEVa6pg8L2yOA0UMu8WMKd+HmPUCB6bndF6HAj
         nHWAlWjxrTG9wgg4YiRCFX2XdnRIZcbKOavlGs91YGYIpRWVi+fsz/rcN02qfOJ0KX3a
         q0tC46BUoQ2KgwCU8UIcFI7weUJsO3yEnjpzaOrJULMUgwfVmtJZ8ppHBVGDQWWRTBP8
         220Q==
X-Forwarded-Encrypted: i=1; AHgh+RrKYCOlCkXQaiAt4wS4uWmtTlWcH62NfBebfWkXGAs4cyterD35nWHLLtdGBhi7X/CKhH2P8vcSVHKIT0YNT9k0@lists.infradead.org
X-Gm-Message-State: AOJu0YymeXUP3hFSoM1Bz694T4fOPh7rP4awjGWvfIzNp1sPT/lyr+/J
	vW8+W5WobyJcDCUU6Q3DOTY/21gH/5tEYR76lTgGL0PhYwktY+bns+nL
X-Gm-Gg: AfdE7cnLHQyI0oINo/YmM5awf9cNE0mfqWL9CuR6a1CMFkC2dFJzVIX/VaozXA7G1Po
	PtRXSLmz/Z8hOgvCBfbROjBDc+0n2kuJD4xCrRx1yBgvR9sFnZf+clYJn48Td0cXhnRS7o6jBxg
	C7+bDrjI5PNo2JHyTMOe52uXUkGaD/1cylRAqgYm7vEVp++Ml6JMRl7k2NPsJy247qXyr5ytfol
	SCDCJw3MjIJgWCrxYwU6PsGVHjvWDEejmc2qNRU4vjaQbcvcFDt/0zY0u2p7krHTUgcLLu5NmK8
	5iQ1tIu+9VUFFGB9rdBtVqdePoGTZBtaK91PIhWp+X8ljWK8uXyrnZfmhM0J+BzlEFLVxncWQPL
	LjUfXx70FrbIVHtFDWInSfTRyhf9I8vEDlhHW3wdeXmUdSyF0BcMkh40D7LmDN5qGWAWbNUa7OS
	oaBxSPbcaaaRI6kicSqUeYkSCJ6fxgm9amohybT2/jMQhT
X-Received: by 2002:a17:90b:2709:b0:380:9d0d:7af8 with SMTP id 98e67ed59e1d1-38758260ad3mr4159340a91.20.1783410565340;
        Tue, 07 Jul 2026 00:49:25 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm626710a91.15.2026.07.07.00.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:49:25 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	stable@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 3/6] clk: mediatek: mt7622: fix memory leak on module removal
Date: Tue,  7 Jul 2026 16:48:32 +0900
Message-ID: <20260707074839.240676-4-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707074839.240676-1-akkun11.open@gmail.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_004926_273092_A60C9A3C 
X-CRM114-Status: GOOD (  12.60  )
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

clk-mt7622-apmixedsys.c and clk-mt7622-infracfg.c do not call
platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: c50e2ea6507b ("clk: mediatek: mt7622-apmixedsys: Add .remove() callback for module build")
Fixes: 838b86331c5e ("clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt7622-infracfg.c   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
index 8a29eaab0cfc..fae8abda14b3 100644
--- a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
@@ -109,6 +109,8 @@ static int clk_mt7622_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_gates:
diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
index cfdf3b07c3e0..cec19447d637 100644
--- a/drivers/clk/mediatek/clk-mt7622-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
@@ -90,6 +90,8 @@ static int clk_mt7622_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_cpumuxes;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_cpumuxes:
-- 
2.54.0


