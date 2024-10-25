Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273A3D10399
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 01:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObJWQqbamWQLgW3lRvM1Wb6QskCzdsvaBlS+OW3U2H4=; b=OBOm6kpfrlauE7+wx8uUhADLNv
	a6CBtnl6ujC+RjS/MRW8viJ1dW7XsSCLGCrbnQ7TE2uKMZaCmHFQHhFO8vDSEaqwA5TG6swDotVFM
	wpWqrcvIMLJY1tHeIOLFCiXtGTCKIhr1vnfqR90CG6oF1GTqRJSjMYAQ0CWSOy2iySuxeWU2u4H4s
	ZmoAVfoww0fKSv8ulI65jVNkEgpATcTFdS4Twst6vn6VKeeGjLnU3Mjhb7+qII9tVpayvdLxPtibQ
	5P4nyk67LQYmMu7tZoqk7FzK7d2t7nvRey5PvKHCOtmC2psbicQaQuHk36PYnurfiPj9nSRJMJgUn
	N64MPsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t491V-00000002ALS-0YxE;
	Fri, 25 Oct 2024 01:21:53 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t48qX-000000028S5-0fyu;
	Fri, 25 Oct 2024 01:10:34 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso12340835ad.2;
        Thu, 24 Oct 2024 18:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729818632; x=1730423432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObJWQqbamWQLgW3lRvM1Wb6QskCzdsvaBlS+OW3U2H4=;
        b=g4IDjOvmyYecjWh0OCxpnnpuHQWOHWut+ZuPzEvg3x3uujf9cZrtRJvVNNxi0ew4GQ
         +jNhvcVSHu697uy5+XJgLN94h3Aco+6iRl5+9NkLY92C60FyIF7vZxcdhIr6Jw83yqud
         vFnnoYFdspUOC8JZzqUKk0UYxgbqqHeuofe4yjLLEnP5LL10R0raizRpQL3KycZdOlvW
         W1uNfTDXilSdJ8nLtYt07arNbC24nR0i+hENorwHsMBJaC05UkIaoU6dpYWj47JlkDfE
         QK2AwUQ3DxY5MqiYCf7G8L3zlTfx/NF0teur+IGjdrrkDF44Ff8Yfdliwuz6VfRvLFHE
         a/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729818632; x=1730423432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObJWQqbamWQLgW3lRvM1Wb6QskCzdsvaBlS+OW3U2H4=;
        b=KKGiowaw1eHcDYj0r3GtJdPxbuTfc2Pxxyz2epdou3eFc7/C5+bKuq+TwV3Zo+dRAY
         Cmnnuh01AG4mzKV574kcl4Wtp6QvELVDRpQRmjTC8PY6JaAbOSAuVm+ltBCrj650Nxvr
         yaOTfEq0MquN/2uRyI2OWGRKoHiuf075AD6fGb02odSAVxebwX5GOPzr8PYQBUHCv9iG
         brlf8So1AL0pUpNe6ruRqjzN773vJS3SNhFR4N7Au9hfDu3H+nfvUk6PeRJ5Mw8SFnnT
         c52R1VyH+wxVz1ZUo4cAEF9ECgF9FTMUtbx4ajIatVY9rcDaUo62jkQBzw7NTQrkKQIe
         myBg==
X-Forwarded-Encrypted: i=1; AJvYcCVTG2meIwhMWWHb2btb/1hZPxwb9zZLtQnD9gUjRUQqQbd1/AdGYvg3+0hQYirxdTC8HWLskGx4/4vUR0EwUnoT@lists.infradead.org, AJvYcCXlk7vblWDZKrFG8b5IWXQXj5EqxDcqmUYMtk22CSVZmbkWqtpOzGJGQAzPm8VQqJ5sr2gTmnxvfiPOt78=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq8gHFFJ7mr+aP6x/js4GRfUrvnGREWbYmsitdOPdaSMDp90rx
	XrbRhSuZUTZ7glJmRDzTiH/Z+BhAE6yBXzan83iVMktJKDtKDqs+
X-Google-Smtp-Source: AGHT+IFk4pp3atZr9i1HsCbtkP4FZ9g8J17pYJBoFXxA6qZJ156yPX2XT6nPSSu7qjRYC7DcVFlOKg==
X-Received: by 2002:a17:902:cf10:b0:20c:3d9e:5f2b with SMTP id d9443c01a7336-20fb9b382a7mr56934405ad.57.1729818631749;
        Thu, 24 Oct 2024 18:10:31 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc04b201sm559595ad.272.2024.10.24.18.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 18:10:31 -0700 (PDT)
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
Subject: [PATCH v2 3/4] net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
Date: Fri, 25 Oct 2024 09:09:59 +0800
Message-ID: <20241025011000.244350-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025011000.244350-1-inochiama@gmail.com>
References: <20241025011000.244350-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_181033_226862_581FC9A3 
X-CRM114-Status: GOOD (  10.51  )
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
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index ad868e8d195d..3c4e78b10dd6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -555,7 +555,8 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	    of_device_is_compatible(np, "snps,dwmac-4.10a") ||
 	    of_device_is_compatible(np, "snps,dwmac-4.20a") ||
 	    of_device_is_compatible(np, "snps,dwmac-5.10a") ||
-	    of_device_is_compatible(np, "snps,dwmac-5.20")) {
+	    of_device_is_compatible(np, "snps,dwmac-5.20") ||
+	    of_device_is_compatible(np, "snps,dwmac-5.30a")) {
 		plat->has_gmac4 = 1;
 		plat->has_gmac = 0;
 		plat->pmt = 1;
-- 
2.47.0


