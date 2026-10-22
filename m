Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C172A60A2602
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 09:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LLC7fHug;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KSCVkdYf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YzJYBLOEFNhZEUyVt/ZR8mdxY6kWFw5Zp9fV2xapAVo=; b=LLC7fHugCnpYpT
	JleZCYaZMisFXrct73p4/4BNpiqvtj1wsxfKTkx2osRJtCC6oL2ed+PdTO/FtJQMnxxlyjZK0ZDwB
	LwKGWUm0Bg+/AMKz9y+XSIJUz2Yfo/+SrmjjBkSebGVg/Hsbp7D2Wzbi/HPo331cRNXugN7FybHu0
	DFASV7DSz4wL7ihqLEyC9k+8LtPnQeokiJ5dHkKUOEievxZeUYK2SJAAgQosQOU4a6OcoXoCuOnky
	sBskDP8fi9ZnGy7c2d4+sAVUsKG97jM9Ji4ku08LHqehMEnHuDmJXEfoMODU/5q7CX9+6Xg1jFxpS
	ldDjm5QEju4Faipsd/Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpJ2-0000000DrEy-3Hz2;
	Thu, 22 Oct 2026 09:41:52 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpJ1-0000000DrE9-0dkZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 09:41:52 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2e9995ce866so12789165ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 02:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662110; x=1793266910; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YzJYBLOEFNhZEUyVt/ZR8mdxY6kWFw5Zp9fV2xapAVo=;
        b=KSCVkdYf4w/f2u9jm8reWneaz21ZfG0+Wf/EMu+ImflYhWEZKFfGzAR7sFhPsTAOgf
         lZuJJ+WvZzXLUY3vZi0VIwNZzynUZuQt6opHYiIRlHj7h0Q2nFoEKPwit/nYC3T8XxTX
         d77bebXHUboF5Zavwm8Wn4Ufu99dcV/GBrsSELvDydKbinKd1uBsJgiJhsVs6qaNBWr6
         y4Ri91P8kKsA53MLXahlesVO813u/jWAS+hr9dSQAlow7MDZwxRGIWNz5DQsVZEe+qrJ
         3qU+1RhYO0G3TGy6WVFj40wgtLRCgDSLjxRjOQdf/NVV2yLv9dLp0zjnyy0d2dV9xy0W
         0zEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662110; x=1793266910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzJYBLOEFNhZEUyVt/ZR8mdxY6kWFw5Zp9fV2xapAVo=;
        b=H8E8kBMBntasQg70WWDF67vx9MI5KElt/9s7jCWlt0HJSD7VStn5odMT+yvXC1e/nn
         E63K1qW2agex0pFKa5MNgMfCxlMwQIZSLfVNsC/Ts5aFc/r54ZoCcEiuk7yY7i9rPYqu
         TAnK5bDVVBo+oZ6295vscaWjtCK1gcyks2aBlyBR/OImXVTU8M0QylwzcCHTnFA8KO+I
         dubxgdoNypb0FbtsE6k935y5z4yv1P9VV8th4Cd3Lvy6TKkph3qhJCjKhx46GKtbrJLe
         EV376YPR6SyPjAhuANGOJrqHiiaRDyvav/NGs211VeIytU1QbufYSM28HXlxvjoEGu26
         ssyQ==
X-Gm-Message-State: AFq9FYKze++szp59Kh4HEbX6dNMztXWL79KM7F0Y0w2fvfK9GY0BCcCD
	cfjgFsFXrtHkwFthKvNO/iIyW5aMS8/Gz+pGGxpcbOSiuzAFxT8pqS9eONK/AA==
X-Gm-Gg: AYBFou3hSCoBZa5suxrQfEZhLf9iQuiQH+R4Be145XF4CYOrlvhAaugqraTFMb5shIT
	N4LWW9qzemahG3YahP/uQio7tr+rreHTUe+mvkhMkam0My64ir8KWITTHEUAQxbge/q+vkds4te
	Jd5AmAddgxAklemX198U52hOazBZzFywcXXChuNUTsmD5KCh1SMPhE4SZU2JceQBVSpnY1qSCzt
	56d1qM4PS2+7K9a5DWIv9ZBna4ZiD/vQmd22kukNb6VDqKyuiV1uERTxZEG49dbOQmjM70FIzBt
	dyIwYrsUgQpZphzznNl3rMpeH5EsPlMF6MGc9GzmRrSjCRl1Vw4PO9fzpV1p/HmzhdaSErLNy6L
	Ls5MBWXHOQj0d5bnmj43UqMkPtUEnP4IIENPS5yCWd19BbBLjjHSYfC6RbZfbzwQfpt7gok8iqe
	dsZRKoJFF+gY+0a5tYNLYPgf+Hw9iIDby01ajpiB5O/e4WodgWlRbl8FuaEl1YeioJb6YY+4We2
	f8c6MjCZXFXhr/R5VZARxI+Pd3D+Ya+GuIMWMJu6RJ7EZ9w
X-Received: by 2002:a17:902:da8e:b0:2e9:6788:9369 with SMTP id d9443c01a7336-2ea43e17bb3mr40452615ad.34.1792662110457;
        Thu, 22 Oct 2026 02:41:50 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701f:d27a:ab05:82e0:7670:1951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4356c1sm21483075ad.38.2026.10.22.02.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:41:50 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Thu, 22 Oct 2026 09:41:11 +0000
Subject: [PATCH v3 2/4] cpuidle: psci: Allow skipping the suspend mode
 switch
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-psci-fix-v3-2-9ce2133c5659@gmail.com>
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
In-Reply-To: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_024151_210578_1D319D3B 
X-CRM114-Status: GOOD (  16.19  )
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

From: Alejandro Tafalla <atafalla@dnyon.com>

On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI reports that OSI
mode is supported but rejects any PSCI_SET_SUSPEND_MODE call with
NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and the
probe is aborted:

  psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
  with error -95

Add support for the "skip-suspend-mode-switch" property. When present,
do not call psci_set_osi_mode() and continue with the topology that was
already built.

Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
[Reza Kurniawan: split out the patch, added log message for skip case, renamed
 the property, added property check at PSCI initialization]
Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 16 ++++++++++------
 drivers/firmware/psci/psci.c          |  6 ++++--
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index 5722365b94..cc9f14769b 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -159,13 +159,17 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_pd;
 
-	/* let's try to enable OSI. */
-	ret = psci_set_osi_mode(use_osi);
-	if (ret)
-		goto remove_pd;
+	if (of_property_read_bool(np, "skip-suspend-mode-switch")) {
+		pr_info("Initialized CPU PM domain topology, keeping firmware-set mode\n");
+	} else {
+		ret = psci_set_osi_mode(use_osi);
+		if (ret)
+			goto remove_pd;
+
+		pr_info("Initialized CPU PM domain topology using %s mode\n",
+			use_osi ? "OSI" : "PC");
+	}
 
-	pr_info("Initialized CPU PM domain topology using %s mode\n",
-		use_osi ? "OSI" : "PC");
 	return 0;
 
 remove_pd:
diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e73bae6cb2..3226af6d89 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -791,8 +791,10 @@ static int __init psci_1_0_init(const struct device_node *np)
 	if (psci_has_osi_support()) {
 		pr_info("OSI mode supported.\n");
 
-		/* Default to PC mode. */
-		psci_set_osi_mode(false);
+		if (!of_property_read_bool(np, "skip-suspend-mode-switch")) {
+			/* Default to PC mode. */
+			psci_set_osi_mode(false);
+		}
 	}
 
 	return 0;

-- 
2.56.0


