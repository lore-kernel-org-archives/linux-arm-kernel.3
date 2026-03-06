Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB3FF01804
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=km0x8u84UprX6FKm0eCiSzTfi+chOgnkYlBpdfCRF1w=; b=WcxC/bFT/ly4pfp3zfk20tjALG
	QNsqFl2t7WvMTcWAAbjyFtZGObnixIQzwHsiUgGNRaOE2EUxEA6wVPuMLjmmcmhr7RKnBcjDWabSN
	GnSR4oWdyMRU1rjWorqw1OUn9kxN+h0q9HVuKDlwQPDPrifYLf1oriLpW5ia1Ani/ywol67DEpuQG
	JW5e+GuQO8434Js9XMbnG5hchk4ytw/Os3e4MBWhnVHwuVQRpwFsKWSseXhzlcAfUb65IN3cwjZc1
	2TKyaqe3pI0eeMWPMWOpRcsjpcJUu0mrPnulVhNMqk6Aoo+m3MilXdLTFpEfEFQ8cX6pK4B1yjpPm
	soBudgPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1v-00000003Bcz-0Z75;
	Fri, 06 Mar 2026 07:55:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1r-00000003Bac-15lc;
	Fri, 06 Mar 2026 07:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=km0x8u84UprX6FKm0eCiSzTfi+chOgnkYlBpdfCRF1w=; b=RxEkVqJZ51ChNoChzDiLTQ6nNz
	EHzfzME2ZwciLoEnCCqGgfuzU6LrieIi2j/omMPkw5GzpYQ0LC1+y7cz3zZckeS3FlqHnjxDv+9Ez
	OYEWVpnM0B323uR4o97cE1J56AfzNmpmW1/yCqSkD8f51d6TkVx1oXA3z7C2jqekP6ljYXCH+e6zc
	2sY7yunEBDL540LoSOwoTb17BlCc5sPeoyZ3Y3+Lgc+65bCKoo0ycTeTinpHBmm49hKw0xLuPyjaF
	D502Z01XQYYpkDOCsBxaOvM1tKdcIopfnLdgUnrXf6cbxdCPxZ0r6/eJPRMX+BKAVtTTSjoA/pvus
	XZCW4waA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1m-00000008EL2-1Mxk;
	Fri, 06 Mar 2026 07:55:22 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qkHU32977155, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783566; bh=km0x8u84UprX6FKm0eCiSzTfi+chOgnkYlBpdfCRF1w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=WLT1etobrskNSLFgL4x45S6Ky1Cm9gNTB+vnKSIkod9CeqM9cOCCzKdrAEgHipxWr
	 BdlOc9I2pTzQM3iK0lKibDnU0KNUWBa67kd8n8GNC/jwsOoct1MGAgsptQMaXEc/Hx
	 yaiojwYtdIIjgcnts0x86B+HztlPNQqRqajMp9zTJbKm/T00OprrKM75piso7CdMfu
	 DCRyTSs4uj1c2CxvnidR7Or8gDCsoWaOO8ZNHrBaNS3RbNceurLNXiXayExji2cMyj
	 CoAzSzm5WOA/EujpgFVQOfFu08J0iuIkfUmJY2kzRLtSTLC+InM9mJ/1wVQwcoAclf
	 Z5C4Pc9tK9MIA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qkHU32977155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:46 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:45 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 15:52:45 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <bartosz.golaszewski@oss.qualcomm.com>,
        <afaerber@suse.com>
CC: <james.tai@realtek.com>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <tychang@realtek.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v2 04/14] pinctrl: realtek: Simplify error handling with dev_err_probe()
Date: Fri, 6 Mar 2026 15:52:34 +0800
Message-ID: <20260306075244.1170399-5-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260306075244.1170399-1-eleanor.lin@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_075519_313830_FAEC0234 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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

Convert the error handling code in probe() to use dev_err_probe() to
enhance semantic meaning.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v2:
- Add Bartosz's Reviewed-by tag.

 drivers/pinctrl/realtek/pinctrl-rtd.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 56fd3093c206..382bdae54bf3 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -566,15 +566,14 @@ int rtd_pinctrl_probe(struct platform_device *pdev, const struct rtd_pinctrl_des
 	data->regmap_pinctrl = devm_regmap_init_mmio(data->dev, data->base,
 						     &rtd_pinctrl_regmap_config);
 
-	if (IS_ERR(data->regmap_pinctrl)) {
-		dev_err(data->dev, "failed to init regmap: %ld\n",
-			PTR_ERR(data->regmap_pinctrl));
-		return PTR_ERR(data->regmap_pinctrl);
-	}
+	if (IS_ERR(data->regmap_pinctrl))
+		return dev_err_probe(data->dev, PTR_ERR(data->regmap_pinctrl),
+				     "Failed to init regmap\n");
 
 	data->pcdev = devm_pinctrl_register(&pdev->dev, &data->desc, data);
 	if (IS_ERR(data->pcdev))
-		return PTR_ERR(data->pcdev);
+		return dev_err_probe(data->dev, PTR_ERR(data->pcdev),
+				     "Failed to register pinctrl\n");
 
 	platform_set_drvdata(pdev, data);
 
-- 
2.34.1


