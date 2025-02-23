Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C2FC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 12:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0wQhVsHeKChXXBl+h2UsEWEersbr5rCyfY+lWbHqbE=; b=CM1JkKjB2DwonmpL+jirZ9irGQ
	xiQSNawW5mwo7J+uItm145HgvR5dkgcNS8P2Zw0nkcp71WmQl7uTY5KDGUDQj5Bqn0IBenv0BNtxh
	TKwGB1gKChX0XVMaect9k7s4BA7X00KAJbEmuEHuRFJD1q/M5Zzr9ZJWjVtd7fiWPx7Y23sUa2k47
	AbuHa3UFltqU+/MR4huthjF7bMdXakqQwtfMkv9EJ+BVGYAS9Uyj4iIZ927xD1z8kwY9+/pKMj/+6
	5Dk/Sv60CjN/omqV16N70GmmsA8TRdgSdAJWHVS6XTsYX/HNNXtzOHNd3IUTDwPToeHMzdZ1IbbuW
	X2uW9rwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmB8w-0000000B6J2-1Efd;
	Sun, 23 Feb 2025 12:31:34 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmB0J-0000000B4s7-0jxB;
	Sun, 23 Feb 2025 12:22:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso20681855e9.0;
        Sun, 23 Feb 2025 04:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313357; x=1740918157; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0wQhVsHeKChXXBl+h2UsEWEersbr5rCyfY+lWbHqbE=;
        b=hno8D7DrTc2KXniycq/eXrMFpHAfFfbozCKS4JUADogtjJ3wUazx9uSu/+vUA8w9kF
         PvQFrmwt7LA2O/HRQ9llLQ9EB9xTOunn3hXYxWC7vONOT7gaPkMDk3VJS9rgaKS86kaf
         1mioZJ+ZkZ2hn2fTLJNQshbBMLbollhicLPC5ElGOa0XgNQu/67s/VHD/cRMI/IHgNmH
         mMjzyLTzk0q4KRFVpANXeAUOvy7KlFQiwA9sGvaod1oa8l7LjgL9B7E24V9C/QM7dW31
         SumaGtjjSKy2yu5ef/YQluC+9YiTfKx5VRV9bqqMVaWz0b/GcZaUAfN0kKlsGXzf//Fs
         kxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313357; x=1740918157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0wQhVsHeKChXXBl+h2UsEWEersbr5rCyfY+lWbHqbE=;
        b=hjpmEag5y2/eFHmpKV4CuOXLxF4hbAAYKx6rEzlEI2ngQOsGkNMO1U9BBUKqzpl9sD
         +GJBk9F+GNxHFQmGyO3M6dQ5poHY5RvLQyQXWSK3VU+0GvQsDmb9eLuuU+vEtdHpURNa
         8jFiUDAtmR+74i5tg8LWfPHFCy7C2qc4trIbCo36E5KBigbdDQLcuE+LXD7P0kwkvg7/
         iulnYQElVfqDRrzJCPccPKJRKjeWBLn13teM83OReX91NImHVDn0ejuHs/RBRZam8+Lx
         LBD2Izhtl5wR1QEJ3CFazu3CR2Erq/XlrOm5khU7T5qR2dJKcDsevdoZYSkJLVjmwYZA
         9Dmw==
X-Forwarded-Encrypted: i=1; AJvYcCUqWs8lJWZGiaK3zz5u+NudyULrV3Z91/EwWFPsAB2VgdJX2U0KAV8iLh/hvWwItHxL0DiP5st84seo@lists.infradead.org, AJvYcCVPCfXFajIekDA8Xgp/RjhTv00qk9TeU37TwuQy76Zv1F9+36pVTCsRzKUJbnQ3smcODSAhdeuGwV0jxKE0Ct7K@lists.infradead.org
X-Gm-Message-State: AOJu0YwdJrtpGsk14lN0MhoIBX01WJd0UgGcFyFHJ0l1+iLe/qE/KEj8
	LnQg91liGizNCbbD3RQ/rYXemTzrVZamgZZFB5NqSpi1WjDWnYIH
X-Gm-Gg: ASbGncvHfO636kUML1TIJaW+ze2f0gbVtf1WqVj3zw0NE+UjwOSygRgxMIv0zFDMs9e
	dyKPyy7chFZOz0vKQ/BYN4p8WQ+SiZCLSQaolZ/HpKnEEu75265PlRW8P2aSABIS+9fpswpSrDn
	+hZGiHXsNYWyGL4+BDgHkQ2YBI/cKgDcbnOA/fagyxbStqGdN05VG74DTSEitD0EhdQEEY3OCCJ
	HyU68N7R7g8zsoBL1Na85NvfAZ2YCPTXxfFiQ7NLa35w10ehQPtxXiErLTT6j2Pf4Wt4G2zVCMF
	U//OvCe8RR736r1ezRlbMsf5ma906ZJYBeCVUNA1s/XPgKMzFLjw0/rAbpGFaz3OKU8Kx9QAQwG
	HGA==
X-Google-Smtp-Source: AGHT+IELhxBegLSVK0u+lmVP1P13Q3bXTlowJFOfv8B2pMlO46HBtKWfy8VmtqQKECimk9UdAMZdXw==
X-Received: by 2002:a05:600c:4511:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-439ae320687mr67074255e9.12.1740313357412;
        Sun, 23 Feb 2025 04:22:37 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm29611608f8f.94.2025.02.23.04.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:22:36 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] phy: phy-snps-eusb2: make repeater optional
Date: Sun, 23 Feb 2025 14:22:24 +0200
Message-ID: <20250223122227.725233-6-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_042239_532293_AE9A8515 
X-CRM114-Status: GOOD (  11.34  )
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

Some platforms initialize their eUSB2 to USB repeater in the previous
stage bootloader and leave it in a working state for linux. Make the
repeater optional in order to allow for reusing that state until
proper repeater drivers are introduced.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/phy/phy-snps-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 4e5914a76..dcc69c00a 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -461,7 +461,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "failed to get regulator supplies\n");
 
-	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
+	phy->repeater = devm_of_phy_optional_get(dev, np, 0);
 	if (IS_ERR(phy->repeater))
 		return dev_err_probe(dev, PTR_ERR(phy->repeater),
 				     "failed to get repeater\n");
-- 
2.43.0


