Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AF3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2QJddSx1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WeDL8XEG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bqYeLPaggZUFXZv738RSupX9Fo/Orf1YlGcPsK+V+Xo=; b=2QJddSx1JfAog9
	9KutLZ4Tusgv+Lcpkk6H3+r5aOvZJmcxR3lVOx8LEOW8rBk6BKRzUevwpVE1NnQ/O/5jTk0RcpRkr
	rVcAa3ySQseAYwGHFqY8f0upmXfnQeGZGHKw+fdp223I/AjHBdg0tTnwayiebbd6XUAdQFU2gLYAk
	Ud/QS7hRHWHhng5q5Z+VUW6zirYloD4cDgvs5+gf5N+l7HO1g1sVoAmNEjnb9F/cnEXMFoEj+8GNj
	jQy0HHro7QeESmZRYrA5kZuJJcxoS7BsgNIR2VcWCCSPYI03TQ+c3dNdHb4oE2D2in1iWpLuF7Jgj
	ExfPE1LeHVPTkkh1mJiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA5Q-0000000FoJH-2nSB;
	Fri, 23 Oct 2026 07:53:12 +0000
Received: from mail-dy2-x0b.google.com ([2607:f8b0:4864:36::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA5L-0000000FoF5-2E7s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:53:08 +0000
Received: by mail-dy2-x0b.google.com with SMTP id 5a478bee46e88-3535a54c09bso537153eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 00:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792741986; x=1793346786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bqYeLPaggZUFXZv738RSupX9Fo/Orf1YlGcPsK+V+Xo=;
        b=WeDL8XEGB9251D7dNAXu997T+xagi+Ht9KCXztA/FHQtp3XnhcxrVkObfFpy1W5Y9U
         Bq9mnJ0d+g/YO0Q4jiEuGMjXLEB4u/kJuuoV9bL1jyCiCuDJd9XU2vfp1Ai6GLfYQDJa
         Caqp1tkuLGs/GFB0zNgmGefZfCM1kTqC4hdrbjkT6JerKdhMx3mH+9o77t6Xgi8HSWIE
         Pw+vrE17m+zr1G598xUfTNGPuaxzZqpudz8jFnyCEtjuDauIH985OrdBWPr0125N+c6U
         HiOucA2LaA10rFq7qkQlXUBO5gc8G4SmU4Hg7DXqTHhx0tczxXtQd8F/ssZ4L+9abksh
         CW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741986; x=1793346786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bqYeLPaggZUFXZv738RSupX9Fo/Orf1YlGcPsK+V+Xo=;
        b=N3q3304IXl2ccaxU4lDZnKyXhU1GKXFMAmMjUAFI+9HNPOSGxGqojbsAjSZ273g9Ry
         XWU7iVXvu2x3lPhg8vmwJ1/E9xDEMFcmXgrZZ0YmFykYRZ4PecRpZUm9nD0suhzy9GHi
         H4nC5N0MMiRgeNMsmLqOUjCFLQbWy7WbqNl19coadgOzibElzzBH8IB3D0ZNqH9wxlNG
         +8EnoTn06XwZZ0uh9A4tWsIruQBevDwV7UbZ2px6irUOflWXzHS9MOOGgLgoNwOkHS69
         0K0/1uJ4b8YtMNI1SKF4WK4M/jKsq20NDHL8ebc9t4qPuAJs0Gz9k5shoFPpNv/fRoPt
         quhg==
X-Forwarded-Encrypted: i=1; AKwUvBy1i+8R2CDZ/1fWw2m4r/xlBsdfBWnrv981EOgpjUUCsteVCr2jg4dedVxnLOAnOGNqY3u0/GLEbnKpLJZ5/iaP@lists.infradead.org
X-Gm-Message-State: AFq9FYL/m6Nqek2h8Wq7s1GBUiP9yrwkZoXcYcVUa5R6giGK4QL8f7ZL
	+Q+UWjl43k9++Su7JtbOg0vJ+an/yn7bbDRJU4BUBYi8isccwqEzJe4A
X-Gm-Gg: AYBFou18027IdKbMES29mnxD6jyF1fOJ4cJR+Z4x1nWDismxI2YuL7gw1qi+/wtGJr0
	rGOIP6cQ0cN/GfiKKlTqmE2MTES85yTk8Wec7Lqv37Z1mdeJq7AHGlGjmEU8KmxBBADxdhXw5K8
	GuBr5tvDbl9IVMTuVMpCxnTJiuxS5esnI73w2yUQdPIE+JR5wrVuesepXSEb2qVMdlgy4AfDp67
	YJ0x2EvQVU5CYyv2V5StXRiiV93c9/BjBHzp13ipddTK8hs8CmGDEl1ziJs88jFyuatpSb1o8dH
	Agtp6dI1BZtLDYjlRxgA3aGu0NGAEElUrHzBUtExEGr1GwOMKWK831Aob+uzdvUiI2luX9/Xgs7
	6xjsSnJ3PQYH9LPWQbNP251V8SQw31xGIBpjdx0PYsY18poJKEogGk18GMj0+kOcKRIlGKktRe6
	4hTBYLn6zDWWcgmYTQeRx2BDAb8jSCDpE5HzE0e/37LenR+G6ii0smEI0eGpSTe/MM1A9oaoVTL
	NZ2FhIyFVjtyJ4thHyDTmLcIO2CT2reU/WEKH+Jt9Uo1fNIw0epZJSUyd+VYHZw9Pnlfaohaj4=
X-Received: by 2002:a05:701b:4512:20b0:151:2e62:fe6d with SMTP id a92af1059eb24-195c5ad2b3cmr2019767c88.22.1792741986205;
        Fri, 23 Oct 2026 00:53:06 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eae0e830sm4122132c88.10.2026.10.23.00.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:53:05 -0700 (PDT)
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
Subject: [PATCH net v2 2/4] net: pcs: xpcs-plat: fix clock lifecycle for !CONFIG_PM builds
Date: Fri, 23 Oct 2026 15:52:13 +0800
Message-ID: <20261023075214.1793922-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023075214.1793922-2-coiaprant@gmail.com>
References: <20261023075214.1793922-2-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_005307_595223_6D9DE9A2 
X-CRM114-Status: GOOD (  20.56  )
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

With CONFIG_PM disabled, pm_runtime_enable() and the runtime resume path
are compiled out, so the CSR clock is never prepared/enabled. On
platforms that provide a real "csr" clock this makes register access
fail.

Handle this by preparing/enabling the CSR clock manually in the !PM case
and disabling it in the devm cleanup action. The CONFIG_PM path is left
unchanged and still relies on runtime PM to gate the clock.

Use RUNTIME_PM_OPS() and pm_ptr() for the PM ops as well, so that in
!CONFIG_PM builds the runtime callbacks are still referenced and .pm is
NULL rather than pointing at an empty ops structure. This also drops the
__maybe_unused annotations from the callbacks, which were only needed
because SET_RUNTIME_PM_OPS() expands to nothing when CONFIG_PM is
disabled. Both changes are no-ops when CONFIG_PM is enabled.

The CSR clock is optional (devm_clk_get_optional()), so platforms
without a clock keep working in both cases, and clk_prepare_enable()
on a NULL clock is a no-op. Because the !PM case is handled in the
driver, there is no need to select or depend on PM in Kconfig for all
platforms; keep the current Kconfig as-is to preserve compile coverage.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs-plat.c | 46 ++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-plat.c
index 11c4239bfd74..c4404500bac6 100644
--- a/drivers/net/pcs/pcs-xpcs-plat.c
+++ b/drivers/net/pcs/pcs-xpcs-plat.c
@@ -275,6 +275,7 @@ static int xpcs_plat_init_res(struct dw_xpcs_plat *pxpcs)
 	return 0;
 }
 
+#ifdef CONFIG_PM
 static void xpcs_plat_exit_clk(void *data)
 {
 	struct dw_xpcs_plat *pxpcs = data;
@@ -304,6 +305,39 @@ static int xpcs_plat_init_clk(struct dw_xpcs_plat *pxpcs)
 
 	return 0;
 }
+#else
+static void xpcs_plat_exit_clk(void *data)
+{
+	struct dw_xpcs_plat *pxpcs = data;
+
+	clk_disable_unprepare(pxpcs->cclk);
+}
+
+static int xpcs_plat_init_clk(struct dw_xpcs_plat *pxpcs)
+{
+	struct device *dev = &pxpcs->pdev->dev;
+	int ret;
+
+	pxpcs->cclk = devm_clk_get_optional(dev, "csr");
+	if (IS_ERR(pxpcs->cclk))
+		return dev_err_probe(dev, PTR_ERR(pxpcs->cclk),
+				     "Failed to get CSR clock\n");
+
+	ret = clk_prepare_enable(pxpcs->cclk);
+	if (ret) {
+		dev_err(dev, "Failed to enable CSR clock: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, xpcs_plat_exit_clk, pxpcs);
+	if (ret) {
+		dev_err(dev, "Failed to register devm for xpcs_plat_exit_clk: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+#endif
 
 static int xpcs_plat_init_bus(struct dw_xpcs_plat *pxpcs)
 {
@@ -408,7 +442,7 @@ static int xpcs_plat_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused xpcs_plat_pm_runtime_suspend(struct device *dev)
+static int xpcs_plat_pm_runtime_suspend(struct device *dev)
 {
 	struct dw_xpcs_plat *pxpcs = dev_get_drvdata(dev);
 
@@ -417,7 +451,7 @@ static int __maybe_unused xpcs_plat_pm_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused xpcs_plat_pm_runtime_resume(struct device *dev)
+static int xpcs_plat_pm_runtime_resume(struct device *dev)
 {
 	struct dw_xpcs_plat *pxpcs = dev_get_drvdata(dev);
 
@@ -425,9 +459,9 @@ static int __maybe_unused xpcs_plat_pm_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops xpcs_plat_pm_ops = {
-	SET_RUNTIME_PM_OPS(xpcs_plat_pm_runtime_suspend,
-			   xpcs_plat_pm_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(xpcs_plat_pm_runtime_suspend,
+		       xpcs_plat_pm_runtime_resume,
+		       NULL)
 };
 
 DW_XPCS_INFO_DECLARE(xpcs_generic, DW_XPCS_ID_NATIVE, DW_XPCS_PMA_ID_NATIVE);
@@ -456,7 +490,7 @@ static struct platform_driver xpcs_plat_driver = {
 	.probe = xpcs_plat_probe,
 	.driver = {
 		.name = "dwxpcs",
-		.pm = &xpcs_plat_pm_ops,
+		.pm = pm_ptr(&xpcs_plat_pm_ops),
 		.of_match_table = xpcs_of_ids,
 	},
 };
-- 
2.47.3


