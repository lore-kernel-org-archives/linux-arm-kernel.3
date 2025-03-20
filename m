Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CCFC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 13:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1i3DRbTdyzbpnAKiDfDQZ1mLdcscqRmuPns+JX+LUjs=; b=vbYttYI8hXkv0TiDZVQNdcTlNW
	qkHS9mtaabfKb4wuGRI43lk0/oNizj1FSUopC5xIDdZzhpEGjSEGELBs1qX/+G8Fcrwemcv46lBIP
	7eaJYNuAlbrlcLhrTiHeSoBegrlEhFHXKCV2GXYmwfF6fHc9vpVTKHm6RhGPe4/2zQNOXEaoYDSuh
	Riv+lqLWSRhIzyJLhBWXHQIO49B8zsyP/5xtHzKaLpf4H4oyzN0zcWZzxmuk5lUqDMveDUNzsorH+
	ip07aFOctJA2YEyNd3IuB9uMqhSL2iYaxw/uIWrziqRjWqWmIn3Byt1PQbzlzcm0UEUGda73Jpp82
	FXq5um0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFh6-0000000CCF9-12xS;
	Thu, 20 Mar 2025 13:12:20 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFWo-0000000CAeE-3DgK;
	Thu, 20 Mar 2025 13:01:44 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3912baafc58so630460f8f.1;
        Thu, 20 Mar 2025 06:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742475701; x=1743080501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1i3DRbTdyzbpnAKiDfDQZ1mLdcscqRmuPns+JX+LUjs=;
        b=nYWHyQm94Jxl2s2XH8oBtnsOxBKBFrzARo2U1u68sZver3yQjk88Nb6Zcb/tvbD9My
         YhahQcPS71Ux7XmatlJzydWVu63hp2oaBpuvex2+yjxKEpmzuBchMThsdED5/4OtdU0z
         +4FD5wlaaRXsKHhLo15fLbpbB//9bS8uep1IAAIENzNVuTJfy56ZRJ9qT0Snubna17UO
         dybnxgzJF2L9KsYRpy5urABv/Xktdy/diDs5pQ5xUCGiDpeIQm+Py9kEvgiFxhbb5d06
         /oL1Vwt3kNruXHUqodjmRsZtAtZWLDaJVH2v0fiRj78qNnIdsZpIcIeyvdWSQ8qhHOE3
         6aRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742475701; x=1743080501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1i3DRbTdyzbpnAKiDfDQZ1mLdcscqRmuPns+JX+LUjs=;
        b=NtAzYExjpdOzfZFXf2uQS961bFZ9m2g+i6EKYnojV61iHZ41FCJQQvjUwDbIFV8N0+
         Te7SC36xM5giQpS//UaivZUuBrVhPqfPMPzTMk0XcXQHWVaN9UhFFyG8mGD/cJwtaR/k
         rGt2isN4wd80blFANhElxR2/iQELojYA2r90Hil1URmQQ2in0izOEmd/u665+tquKqYL
         u3ChFnxhiQi6O3T7xEv3t0uYIvfm46sgLSjMdl+a0WvQcOP1otI023Bgc1/MC4UETbuI
         QBoGERBmd2WOnSONxHF8MjKM+1WMUpTAUM6jnbbDXSk8EYy/4sxL+E3Ur52WrBS4EDqI
         Ldug==
X-Forwarded-Encrypted: i=1; AJvYcCVO7+36KXZPoktN3NQ4pucDXAHIouGYrssMC8lbL23a/2iIQvNPfcYxH49pFq0LHUc2QT/v7keexixq@lists.infradead.org, AJvYcCVeVJTTCgcRf/8rFlD2NHtse0xnYO0a49B6aOKstKeK42BVSY2aGgJmo0kOH/hygCpgOiB+NGtiiNly1aQPL/U=@lists.infradead.org, AJvYcCWg44lvqKWVMhSXcCnMTZ7mX+/6oUePBimwzPivBJ0h2EuKLmlVkenh+MnxKlX27hoHtV7MIsyn95YMfzTQj/DQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyO318Smoi9cByh3wpb9g4SIHFBNLNE9MNbzpdGKypRqFEi0OLi
	4oGMaNQR01OaYYFe2xpIciQuPknpCsJTYivBZpFP6R5BMOQmbsHt
X-Gm-Gg: ASbGncuXzFioPXdTc4bmuVTWTdQVhphUHRQ5ysvTYIvsiXZpqNBDbj+daPkrB1iwMpT
	JiTFq+A7JB/cDdD20dKrD6WJF81A2BXeXcJ9yVbU77V0VcE1NJ2M17VfFnrE7XQiX8e1XE2q8ih
	vqcpNbHT98uOxZTLonoseoaa9uTMa5t2V3KwbrloN61IvpEIDc9mwNTnywLJfk3zpejCHZorEjo
	/uBJ5dihXa6n10f+UufH0iSnbBIu7fjPasKU2liy7KGD8nCNU3POtIpn0K3DUNyAktSNHArBAlE
	zK9abZBJf43DMqXmlGFNZ5bu6Q64wGA8xNGj5+bdSI+QauBdEb3dc/FEa4g2uK0XEZKuN9qfin1
	sgsfqS3JC8g2qGQ==
X-Google-Smtp-Source: AGHT+IEQRynyz9JGzu+Wy/hCcpiQtdW/bJaEM9RuaZOW49I93OxOlyiURvahKTtdmPXSEWXajsfaYQ==
X-Received: by 2002:a5d:6c6a:0:b0:391:4559:876a with SMTP id ffacd0b85a97d-399795e77d5mr3094168f8f.46.1742475699266;
        Thu, 20 Mar 2025 06:01:39 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-397f2837e61sm18492328f8f.97.2025.03.20.06.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:01:38 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v2 06/11] soc: airoha: scu-ssr: expose API to read current Serdes Port mode
Date: Thu, 20 Mar 2025 14:00:29 +0100
Message-ID: <20250320130054.4804-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320130054.4804-1-ansuelsmth@gmail.com>
References: <20250320130054.4804-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_060142_822573_A8B9CCEE 
X-CRM114-Status: GOOD (  19.00  )
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

Expose an API to read the current Serdes Port mode. This is needed for
pheriperal attached to the Serdes mode to validate the Serdes port is in
the correct mode.

Each driver will have to define in DT the phandle airoha,scu
pointing to the SCU node to make use of this API.

Function airoha_scu_ssr_get_serdes_mode() will then parse the phandle,
and extract tha Serdes Port state from the SCU SSR driver priv.

Driver will use the new API airoha_scu_ssr_get_serdes_mode() by passing
the dev and the serdes mode reference from dt-bindings header.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/soc/airoha/airoha-scu-ssr.c       | 50 +++++++++++++++++++++++
 include/linux/soc/airoha/airoha-scu-ssr.h | 11 +++++
 2 files changed, 61 insertions(+)

diff --git a/drivers/soc/airoha/airoha-scu-ssr.c b/drivers/soc/airoha/airoha-scu-ssr.c
index 29e17577e9a4..3fbc36f793d0 100644
--- a/drivers/soc/airoha/airoha-scu-ssr.c
+++ b/drivers/soc/airoha/airoha-scu-ssr.c
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/soc/airoha,scu-ssr.h>
 #include <linux/bitfield.h>
+#include <linux/clk/clk-en7523.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
@@ -54,6 +55,55 @@ static int airoha_scu_serdes_str_to_mode(const char *serdes_str)
 	return -EINVAL;
 }
 
+/**
+ * airoha_scu_ssr_get_serdes_mode - Get current Mode for Serdes Port
+ * @dev: Device pointer of the Serdes Port peripheral
+ * @port: Reference number of the Serdes Port
+ *
+ * Parse the phandle pointed by the Device Node property
+ * "airoha,scu" present in Devide Node of dev and get
+ * the current Mode of the Serdes Port reference by port
+ *
+ * Return the mode or a negative error code. If the pdev
+ * or the driver data for the SCU can't be found,
+ * -EPROBE_DEFER is returned.
+ */
+int airoha_scu_ssr_get_serdes_mode(struct device *dev,
+				   unsigned int port)
+{
+	struct airoha_scu_ssr_priv *priv;
+	struct en_clk_priv *clk_priv;
+	struct platform_device *pdev;
+	struct device_node *np;
+
+	np = of_parse_phandle(dev->of_node, "airoha,scu", 0);
+	if (!np)
+		return -ENODEV;
+
+	if (!of_device_is_available(np)) {
+		of_node_put(np);
+		return -ENODEV;
+	}
+
+	pdev = of_find_device_by_node(np);
+	of_node_put(np);
+	if (!pdev || !platform_get_drvdata(pdev)) {
+		if (pdev)
+			put_device(&pdev->dev);
+		return -EPROBE_DEFER;
+	}
+
+	/*
+	 * Get pdev from clk priv. Clock driver register
+	 * SSR driver hence it can be assumed present.
+	 */
+	clk_priv = platform_get_drvdata(pdev);
+	priv = platform_get_drvdata(clk_priv->ssr_pdev);
+
+	return priv->serdes_port[port];
+}
+EXPORT_SYMBOL_GPL(airoha_scu_ssr_get_serdes_mode);
+
 static int airoha_scu_ssr_apply_modes(struct airoha_scu_ssr_priv *priv)
 {
 	int ret;
diff --git a/include/linux/soc/airoha/airoha-scu-ssr.h b/include/linux/soc/airoha/airoha-scu-ssr.h
index 0224c0340b6d..81f2c1b57889 100644
--- a/include/linux/soc/airoha/airoha-scu-ssr.h
+++ b/include/linux/soc/airoha/airoha-scu-ssr.h
@@ -20,4 +20,15 @@ struct airoha_scu_ssr_data {
 	const struct airoha_scu_ssr_serdes_info *ports_info;
 };
 
+#if IS_ENABLED(CONFIG_AIROHA_SCU_SSR)
+int airoha_scu_ssr_get_serdes_mode(struct device *dev,
+				   unsigned int port);
+#else
+static inline int airoha_scu_ssr_get_serdes_mode(struct device *dev,
+						 unsigned int port);
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 #endif
-- 
2.48.1


