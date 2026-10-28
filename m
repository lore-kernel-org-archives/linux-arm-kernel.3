Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB2D606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 09:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jCHraj3P;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LH/aL7JD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OebIWyDu5H5QPYFaukkWYKptPQKpBLTLxWfsT6Qb+f0=; b=jCHraj3PO7OQP5SlXiOaHGWCLJ
	HcTWyVcUJzNyPHZSFtZW/+iRSvhGpBIxHG2b5xw25+YQ47oEuIKtk0o2+yGkVUt/MBjZZ3OcJ3sDV
	nIw9+e2PC/QKVTJAuF/qRRAsK6K6GJ3m7sJWQL3lgRjrDRcP665ZnarjjcDdwblVQbc6zmrU0hhie
	sFMRnhje2NZfsyofbUJlSRgU91lDE3VSEuAokEv7XGkfzyr4hGOLjp4LHLKOpcq8PobBu4R8ADzKD
	4s4bsnk9M8ZibCRwEpbmd/4H+mNUaTYyei7n/Di0qNz9i1edQc/xTqjRbQM1erhc39An6oju0vzJE
	YdOKSVTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0H9-00000006hc5-2XNA;
	Wed, 28 Oct 2026 09:48:55 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0H7-00000006has-29py
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 09:48:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so6454765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 02:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180931; x=1793785731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OebIWyDu5H5QPYFaukkWYKptPQKpBLTLxWfsT6Qb+f0=;
        b=LH/aL7JDzstQfpKcxB4BjY/A0/oNngv9o0Zu7HMS3KLar3hHD7beIiX45HSFRvJHbY
         +b1nkfYQl7llEO+7ZA/sDXqqhLFeUSW/yHRkCEHL7iUnHy6wjCZEekwEA2OipI4fNZSw
         rn7EKt4jJHs7OEpORkTfZgWdO9Sv5Bir6A3lydFe9sJGfVd95upSFiE369+DOFtgqfSd
         DrHruBegmwwiTRuyD3qTsi2pOGzZCw/bH1Pm10Vcr5gmw9jxSyXizOy2LCCQRt4Z11+T
         m8Sv8HiXUydRlccjhw7fEdSviUubQgeXvHehwHfNrxP0ujU1Hcd4L7mFRV7/50/nCpOa
         s1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180931; x=1793785731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OebIWyDu5H5QPYFaukkWYKptPQKpBLTLxWfsT6Qb+f0=;
        b=woiwZdPFKD9UIVhjnrSX8mbQzX+PnRPg8Q0wRyE/mTfU++5WeRjpI97drioIBRWyKK
         SRdspaWVPVmLx6Qv5Jhy7wvqmnySZaI8jcjiVW8vn8IRYOy4+qy7BpV4Rc2ZKOUQWXk6
         IvJOgdGiGC0cSD/s8Ir3uR2jGIxqwl1uY+rBymWxd/aSvMLfc1VQPXc5QKacVMc4aYXK
         PVxSwRec/eE6H5cfMPg8nlSgbMjgA/2O9CWnbDxRG5cWlfhsg/9N7UsxoazrKTNzMd5K
         g1aupbE+AXjSmFH2dDaGLP3Vo87hs0h6keogXmdTw8QKRHOSruVbegPrNwXFeYDtyLJV
         PiAg==
X-Forwarded-Encrypted: i=1; AKwUvBwndVBk1jJYXpbu06zEAYif7Rtqh9srHFQb6xwW49+kNgGJkm3ycq+Xd1AnkrEOGREgyCN+7BdQ9GKWZ8tPO1+3@lists.infradead.org
X-Gm-Message-State: AFq9FYIO2PEij/84bXlDi1udzDB8heIT1lbanve2l934G60WobYVfHrz
	qF3gll/AqUABFHS3Omw7ePTkN/dTFALxBGmaXhB7S0UvqRc2XsV6mvM6
X-Gm-Gg: AYBFou0yVhmrsZORBV+jusMyU+1u0cmxlq4HDpI5v4RolUfvyQMBkEK89YVe+Wfa//J
	WZRufI6OTmJHSScdkrOFk0O0gVT4m53I5QrI9djJbANlOPJMCk+0oTdZQIUdE8Ny9Rd6Xokitxf
	ac+HC5i9Ylqf9oHWzuF+KOZCQJHuvUZk1Gyrd1Ysdf7WaopmctIu7CR7gYXIO0fLr2Mv01dQxZY
	75D4I+2jKEk0QLTjvhTkA641GGITnsdr5ju5+kWiM227PahDt/vvnam0EBmVoVNfUNXtTZLieay
	ugII+k4Ak1yW1wzRXr20VkcCOGPcutCVAYGJK08+NLa00jC6JTbq6dnxrpXowXbBPG4sB+24Nfw
	RAGSeBk9O0yAPUnd4iiag0oyHdB2/Q4WSswReg5Y38szRbkYtAQd7guso4VdTJL3Q7iUbY5sTUE
	UHMLoiJOtJ63sennNyv9BgvxNbPEnRfk5pacS8FnTurPJfza4ZnGrOO3ZxxwDYaPYF1aO/Sc5jQ
	4d+mu2Jb7JfY0pfwW+pj/dsYnTQbhjyk3CzOjwNSqZKkTx8kQrZIEaXp8bP275/NkWWVjffMtey
	z6F/ZQUa8qnXUeWeP6k3NikBsvLSP/AhyzNZbdX0EwWW
X-Received: by 2002:a05:600c:848c:b0:4a1:fe26:24f0 with SMTP id 5b1f17b1804b1-4a966b4afc5mr40262095e9.20.1793180931151;
        Wed, 28 Oct 2026 02:48:51 -0700 (PDT)
Received: from localhost.localdomain ([2a06:c701:4778:c500:47f1:8a3:6e76:cd9e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4115f496sm26408389f8f.5.2026.10.28.02.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:48:50 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] spmi: mtk-pmif: retain controllers for removal
Date: Wed, 28 Oct 2026 11:48:48 +0200
Message-ID: <20261028094847.764747-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_024853_569845_7DBADF48 
X-CRM114-Status: GOOD (  12.39  )
X-Spam-Score: 0.4 (/)
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_LOCAL_NOVOWEL,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_spmi_bus_probe() stores each controller in its private pmif_bus
rather than the parent arb->bus[] entry passed by the caller.
mtk_spmi_remove() checks the parent entries, so it skips registered
controllers and their IRQ and clock cleanup.

Record successfully initialized controllers in the parent array and
recover their private bus data when removing them.

Fixes: 078117963b2c ("spmi: mtk-pmif: Add multi-bus support for SPMI 2.0")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---

 drivers/spmi/spmi-mtk-pmif.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index 833c2b30d09f..17c0f9ae977e 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -708,6 +708,7 @@ static int mtk_spmi_bus_probe(struct platform_device *pdev,
 			      struct pmif_bus *pbus)
 {
 	struct spmi_controller *ctrl;
+	struct pmif_bus *bus_slot = pbus;
 	int err, idx, bus_id, i;
 
 	if (pdata->num_spmi_buses > 1)
@@ -780,6 +781,7 @@ static int mtk_spmi_bus_probe(struct platform_device *pdev,
 	if (pbus->dom)
 		irq_set_chained_handler_and_data(pbus->irq, mtk_spmi_handle_chained_irq, pbus);
 
+	bus_slot->ctrl = ctrl;
 	return 0;
 
 err_remove_irq:
@@ -849,6 +851,7 @@ static void mtk_spmi_remove(struct platform_device *pdev)
 		if (!pbus->ctrl)
 			continue;
 
+		pbus = spmi_controller_get_drvdata(pbus->ctrl);
 		mtk_spmi_irq_remove(pbus);
 		spmi_controller_remove(pbus->ctrl);
 		clk_bulk_disable_unprepare(pbus->nclks, pbus->clks);

base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
-- 
2.43.0


