Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB79EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 12:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbqdsXVR3N15jF5g1M1GQwDGOPgdER4+dFi3kR5bHSs=; b=DUylRX5bmeYL/1L2Y6VganMgpH
	FLUC/WuitYGURUZYxt4KJrEq5I0qMXHWd5WXNnjpX2deje7Ny+cw3PIpn7/5XMA8XshbyNgwRqWlW
	e3ueDkFh80oAxuAtGUNWrGAI6keJMgSnlZI39c2aO7uwA3VsZJjeTAbfV+voeVaz3Koqr5e+aolkN
	uHVr3UVSj/Fh5GYCu4r4Lnt4oihDb36Vhs34v6BJ46T979QUgsb2EGGgSmRHE2O+oTgvGj25PUFI3
	A145uKMv0lNNLwn3/sO1qMFrQQZtG2A66lmSVYohr6y7L93ucNPJ2oJg/SEYlRKDZDzSIOFNDmBUD
	aIfIypfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tje0y-00000001ncL-2xwC;
	Sun, 16 Feb 2025 12:44:52 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjdwm-00000001ms2-07z4;
	Sun, 16 Feb 2025 12:40:33 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7c081fe0a5eso291052585a.2;
        Sun, 16 Feb 2025 04:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739709631; x=1740314431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbqdsXVR3N15jF5g1M1GQwDGOPgdER4+dFi3kR5bHSs=;
        b=H/vCyk1TwHywVxqbf0IhQLw5SGqi177G2wTd0uJT8Q9Y5DGePKUE/W0yiopBBfnHOI
         5HJOgUFGOLM9biFrihmElLlEFeF2BsBp4MUglVF+2p/TJifo1gD6VhqCV7yg0SNcZRpm
         aKTYVtQs7eKQLpopgtktpoLviWAUa1jp41IlfMwVO7VpXRj2OOD/QGSO6ck5gjo+/3vX
         qQvPkHel9nUCNPHS+OZrOG3eLo8ekQ7qM4s7k4hLAOWeQbscmoYWNiF3TNSPDr4Iw6/h
         XJaSAkdMC81kW9yreSk2D88Qm9Xf2gL5Ild06/e21zccu2Bc3sAPvRNAUxgyhhbmOmet
         sq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739709631; x=1740314431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbqdsXVR3N15jF5g1M1GQwDGOPgdER4+dFi3kR5bHSs=;
        b=SMLqs9aFh7F1k1Y39+dhowDosscF3tOut9qD8bv+GQIJaOMmoPstIau/StcrIO2Jfr
         rX3uA49ZFOF5eBLiqHmy10FUxZZJOXXz35cp6mXcRQx9ChDRrtKO0UCromjyQgNVrqkN
         mPRNsVfouh83e08D2BM5dWoCcs8uAO0sFuVpy6egFJR+NwD3wylDJCS/kblvjOm4a1wX
         DDVfp0KnTYBrCS++4zWajtO0n39smNqfLbzdjzcRmgWjN5K/QO4KMaZj3oS/vWwjElep
         xOHouydsMp/tFuDODNunc02BABLq1tHQvmEi6YHnAmEjKX4bdqfjzR/AinkOIRvZF3EA
         8WjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1tHOlGFC4dUg8Zzrnfmrt2KurQPugxvjLZEuGWJ6iZtZtW8136MJNXj2MntmtX6Rpk5BLXHvXK9a+5LvjzhUE@lists.infradead.org, AJvYcCVzRT2k1BF7Puai3xFi8WFwMu9XnqYJEWX5SqULff95k30nPIvp34XXPgqcBqQP6ul/KSdhNUmmU/fjGG8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1Ktpas/jVDZNr9EconLMvxGb03sNTNdlf7yoisPhDhEtMBhRo
	QuAZnNmAOlH190cPiLjT1/dJqJzj17ZQy+8WnUMRbvKDrZvY+owl
X-Gm-Gg: ASbGncvtVUgBOuEmHl2Nd/peTY52pgRfyh0N8xIXDw/Iq0jMAVY5JOy4WdtLWDDBJa3
	xp1jsP7rTaLPmWdm8WWTFwAaCxNdA9npRdauY3VV5gj+PAYI/2VRCaod9ZNtMqTYvFaXP7rGBlF
	gl3/nAAEBvT+lP8kNXFLbOY19FW0fZoxgS8Pl4q20i3AerHX/ELRjYtD8rj4S4lzay+yOIytkzO
	GZzvtESQqsuhbVZd3Ygtyf1qyk0kd4LFV6CVPYMGp80To8zMDSV+UqXZxtRGAFXbUE=
X-Google-Smtp-Source: AGHT+IF5XSuhiI2P5QLx2nsbWyypxYdcETy3LCJ+aCkIcrEcibIXS/f4XBYvlBrBHEwSP+ZxkyRe4w==
X-Received: by 2002:a05:620a:4010:b0:7bf:fffb:5818 with SMTP id af79cd13be357-7c08aaa2cc8mr943249585a.57.1739709630750;
        Sun, 16 Feb 2025 04:40:30 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c09a14d45dsm31099185a.10.2025.02.16.04.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 04:40:30 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Hariprasad Kelam <hkelam@marvell.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Furong Xu <0x1207@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Serge Semin <fancer.lancer@gmail.com>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH net-next v5 2/3] net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
Date: Sun, 16 Feb 2025 20:39:50 +0800
Message-ID: <20250216123953.1252523-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216123953.1252523-1-inochiama@gmail.com>
References: <20250216123953.1252523-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_044032_067577_762E6FE4 
X-CRM114-Status: GOOD (  11.31  )
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
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c   | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index d0e61aa1a495..8dc3bd6946c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -405,6 +405,17 @@ static int stmmac_of_get_mac_mode(struct device_node *np)
 	return -ENODEV;
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
@@ -538,11 +549,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
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
2.48.1


