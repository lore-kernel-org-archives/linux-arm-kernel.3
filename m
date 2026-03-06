Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55AFAF01804
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNZL6ywL1OAuIdWm+yAfpw5UV28qpCGV8xcIfaqxSBI=; b=hnUEO35OzX+ApVqeW8NB6G1o33
	F0fNIo1/u4yp7XekE7J8fnxpUzTbQJDBpYMtuq+pCHyPWvyIwAkB60TzptnqggZY6r+k7dZDJG+bN
	rSKH7Ot3i6iyUvJq0r+qgtwmxFjUNPy29i7G27PdGUBXoBac+S53RAgOq0gG7wY0MTIHygyAuDcCk
	ku9UXQj+dJXSYBy3ekZPCiv1kx6kQZ7v8zzaIo+DJ3Z04sPXUkM7qLVK+36KLTzMFVY8quncqObZg
	y5Pwa2STurdShVVDwLuIb1b9W90u2Z7W1cJRR+gRc7xS8YXaHWJ9MFOMp/uhkafI07gyOWAq7IUal
	O9ZVJKtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1w-00000003Bew-1tko;
	Fri, 06 Mar 2026 07:55:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1q-00000003BaU-2TCU;
	Fri, 06 Mar 2026 07:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mNZL6ywL1OAuIdWm+yAfpw5UV28qpCGV8xcIfaqxSBI=; b=NJ/EbFI7Qd4ZkDSC5e9rdw7gVi
	kSNo7liW43HQKcPgop366oB7JRrXP5tKj3FOkPDaqfT0q8tiYhBQwHiIKDthejylYD5lnz/Wq3sj/
	XMScOr0X2lqwvdxUOk4lekkVS1YN94/QmBOgfqh1erEx3ReIK6zOxz+NWT0NtSilPG0uObs7J+7I1
	gb8kEgQPTn9S8OXqNgFTae+3KiH/QdD0Ydl22vM+H5wKskZ/BU9peZkPz6jvlLMOVoUrKafUYjWCk
	Bm36Q+YkvVn9GQNwRbyEfBg4a1FdFGbUpXSCiiuJvpJu8T87a991DdPUwr1kVMZnZmjPKiYSG0WBu
	9+gpds/g==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1m-00000008EKz-1N93;
	Fri, 06 Mar 2026 07:55:21 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qjE332977152, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783565; bh=mNZL6ywL1OAuIdWm+yAfpw5UV28qpCGV8xcIfaqxSBI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=khOkR6PPGzyIr9BpGf8AHDm/0ktqKuW0BitpmO6K23Mjfvtm3kfODL5eG8odiK+t4
	 XVmGRRidw12rR716sC/sHdKhF+rZKZ6DFz0qWEyZHi6iq8Y4J2kIYZ8e/ztgZCvvG+
	 lVP1l+eSfNnYsdIl/bQ/i2OBxUklAzzIWAU6cpfwEnGr3FfhcIe5fOLT4zzB+0ce68
	 TWkYdQteoqDc+bjgRi0TiNJb18KAaUwzVv3mQv/vrTQD0mt4LpQfB8+S3RyEmb5uVB
	 ZfUknCI9QYTUj5cXlgPSxw9czLTBRVLIHBh9gIzLuncnNcu+eSNVE+7LVkCyHsuZD3
	 EwFIiiuei0BJA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qjE332977152
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:45 +0800
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
Subject: [PATCH v2 03/14] pinctrl: realtek: Switch to use devm functions
Date: Fri, 6 Mar 2026 15:52:33 +0800
Message-ID: <20260306075244.1170399-4-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260306075244.1170399-1-eleanor.lin@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_075519_187730_502F307E 
X-CRM114-Status: GOOD (  11.68  )
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

Simplify the probe() function by switching to devm-managed versions of
ioremap and pinctrl registration.

Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v2:
- Use devm_platform_ioremap_resource() instead of devm_of_iomap().

 drivers/pinctrl/realtek/pinctrl-rtd.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 41e7f5c2bf74..56fd3093c206 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -543,13 +543,12 @@ static const struct regmap_config rtd_pinctrl_regmap_config = {
 int rtd_pinctrl_probe(struct platform_device *pdev, const struct rtd_pinctrl_desc *desc)
 {
 	struct rtd_pinctrl *data;
-	int ret;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->base = of_iomap(pdev->dev.of_node, 0);
+	data->base = devm_platform_ioremap_resource(pdev, 0);
 	if (!data->base)
 		return -ENOMEM;
 
@@ -570,25 +569,18 @@ int rtd_pinctrl_probe(struct platform_device *pdev, const struct rtd_pinctrl_des
 	if (IS_ERR(data->regmap_pinctrl)) {
 		dev_err(data->dev, "failed to init regmap: %ld\n",
 			PTR_ERR(data->regmap_pinctrl));
-		ret = PTR_ERR(data->regmap_pinctrl);
-		goto unmap;
+		return PTR_ERR(data->regmap_pinctrl);
 	}
 
-	data->pcdev = pinctrl_register(&data->desc, &pdev->dev, data);
-	if (IS_ERR(data->pcdev)) {
-		ret = PTR_ERR(data->pcdev);
-		goto unmap;
-	}
+	data->pcdev = devm_pinctrl_register(&pdev->dev, &data->desc, data);
+	if (IS_ERR(data->pcdev))
+		return PTR_ERR(data->pcdev);
 
 	platform_set_drvdata(pdev, data);
 
 	dev_dbg(&pdev->dev, "probed\n");
 
 	return 0;
-
-unmap:
-	iounmap(data->base);
-	return ret;
 }
 EXPORT_SYMBOL(rtd_pinctrl_probe);
 
-- 
2.34.1


