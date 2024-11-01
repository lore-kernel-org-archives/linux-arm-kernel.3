Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9821CE67492
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 01:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxfricRE7uBgf4L4U+T/hPqm/Ex2rRvslCVlqeVs1RU=; b=geRzazzi7NDuB9lGK4aYy+DLrR
	t9TIltWvTwUQUBCEqHZfRmcvUgL0vJLdRiOxlQRqthVni5AxhP4Vc7Dr9IjkMVs8XeCAAQ52X97e0
	H0/TtnzucdgGXJwUT8u/2r8RfYge8egDmZlysEhHp9OlFOVJixn93zkauUHECOzJj/ZCQOTLBhY1D
	dm3UV+UQnJVZjgQ3PcSzquHqils75AKWdgh71OwUn+Gp/LKggGEaA+HlYlsPPU6fdQCtk5IxmoKxS
	iUHEXF3uSAM+JGUI6Cr7b/3zhEZLgX7Ya+wWPStd17LAoYKVeHMEdKbNoqEmfSJyxQvZ3C3cWBAyf
	ouMmqNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6gmh-00000005TOm-29D8;
	Fri, 01 Nov 2024 01:49:07 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6gho-00000005SMV-3p6h;
	Fri, 01 Nov 2024 01:44:06 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-72097a5ca74so1280098b3a.3;
        Thu, 31 Oct 2024 18:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730425444; x=1731030244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxfricRE7uBgf4L4U+T/hPqm/Ex2rRvslCVlqeVs1RU=;
        b=l/y4dqQxm59FudQYaq0OeXxN+LSYWzAVrsg8liZmbQku9RmLjgEWLz0I35BjJNNyH0
         BSDft8gUsTqgi2qynNUgK6s6L/9xfFQg38dv8BMuPMnfkBFydNvedm5B9RPr0P4nfwfy
         BJHTSL3O6HC02cIppdwlNYI7qhCCPbOk16FlYEFmxEcxFGcKO5Xvdpa+t111tlFtPmJl
         hX/8mKpLPo3KSpOpVXg+oSIaEWtgXr4+h3a98lf9/MaMIJzFhU8BlM5l5ZMscSUW7LUX
         vPUf310f7jCdDqXQ5OsC9gr9D6eiDjveUEnUUgNTA/ogKTLmBcJQqArpNqni6IynfVbj
         iVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730425444; x=1731030244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxfricRE7uBgf4L4U+T/hPqm/Ex2rRvslCVlqeVs1RU=;
        b=wNOJIWDSgmqEsWMTdaGkpr6Wf3evw2Oq+ojeKgSchjgoa+Lm1e1vgVGxpr+gNvAbGE
         g2A6mzPhRR+dTOM+qj2AEjM2NrH2LAFNAfX8GTNm98oAix+hsZgssCs7NZ5HOAAfmyKe
         d2LqRM5+YKKNrN0UG7cQ320EdBEv7EbuVwSczWNAlryWCWU3+U7v/rcwoD1wzCeTofJl
         aQlLSsgGJSDsUEPB5JGMqJ9fIthGQ1V2XYAyO6Sp9OF9ztY7aIVE51xu+zsPvcje0fF1
         fyHb5h3p2h6jBC2lGw3i6xonlDKiHAPYDUGS/cA6gBED9tq75N+FCTezZ+MqcA7ljJu/
         D9bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr79rv4QtbrfAGQavaHgmr2fwjnzzX/W6+Wt97LzxbJJA1+TdbU7AImEDHh2/+bqdhINbo70ne32fNJU4=@lists.infradead.org, AJvYcCXLmUKiLiUazBMx1+a+lTRCoJ4l4mxSGFn/oTKLjbubBD3YOjFVYhIT0IesDpepd69++IqHwoCqYs97YpmchDSf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+sUpXSiAjr4+YzkEDH8hUGqnidPeXDWb7wuDq6j9DRdK8chjK
	xjua2nux18JrApX468F4NkX7qIeQ0MX23/dvUbM2rlCSlivSHZhIbhAylA==
X-Google-Smtp-Source: AGHT+IHZtCCUDX7mDEeuB8aZyi3qRWI1DKZU0sOe1chkb3X/72NCuBzDYpNglTWXoR6Evrq69uLEFQ==
X-Received: by 2002:a05:6a00:a93:b0:71e:f83:5c00 with SMTP id d2e1a72fcca58-720c98a19d4mr2723785b3a.2.1730425442887;
        Thu, 31 Oct 2024 18:44:02 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2e95a6sm1834390b3a.145.2024.10.31.18.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 18:44:02 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH RFC net-next 2/3] net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
Date: Fri,  1 Nov 2024 09:43:26 +0800
Message-ID: <20241101014327.513732-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241101014327.513732-1-inochiama@gmail.com>
References: <20241101014327.513732-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_184404_970628_7808C995 
X-CRM114-Status: GOOD (  11.40  )
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

Add "snps,dwmac-5.30a" compatible string for 5.30a version that can avoid
to define some platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c   | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index ad868e8d195d..86ca39f89447 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -421,6 +421,17 @@ static void stmmac_remove_config_dt(struct platform_device *pdev,
 	of_node_put(plat->mdio_node);
 }
 
+/* Compatible string array for all gmac4 devices */
+static const char * const stmmac_gmac4_compats[] = {
+	"snps,dwmac-4.00",
+	"snps,dwmac-4.10a",
+	"snps,dwmac-4.20a",
+	"snps,dwmac-5.10a",
+	"snps,dwmac-5.20",
+	"snps,dwmac-5.30a",
+	NULL
+};
+
 /**
  * stmmac_probe_config_dt - parse device-tree driver parameters
  * @pdev: platform_device structure
@@ -551,11 +562,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 		plat->pmt = 1;
 	}
 
-	if (of_device_is_compatible(np, "snps,dwmac-4.00") ||
-	    of_device_is_compatible(np, "snps,dwmac-4.10a") ||
-	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
-	    of_device_is_compatible(np, "snps,dwmac-5.10a") ||
-	    of_device_is_compatible(np, "snps,dwmac-5.20")) {
+	if (of_device_compatible_match(np, stmmac_gmac4_compats)) {
 		plat->has_gmac4 = 1;
 		plat->has_gmac = 0;
 		plat->pmt = 1;
-- 
2.47.0


