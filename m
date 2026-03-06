Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A044F01808
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4WWKecG/iTSsh2dycXEkAFiD9abnKWJV73l5Pt4Z3c=; b=IcBt+g7DSDamzIOpfeaqEH0ukO
	rxEhm+OReh1h7f0Agkex7uSIfKxoygrvPeQmB/H6QkXvCT6GQslKF47ra9nH2e9TxWYaww/qp6gdM
	9wF0PmO+u0ORl9IbHNBe9T18t+kycLd4MjVZ82Ea13ahGb4D3BtDFJ/YW2O4VMEnzB43K9Xs8san8
	NXrRWJO7JeKBzKpHWc/Cn3L6guMyzXe48lyMwfM2VMD0P+JPTNfM8GsIulpYFpOWHXuVTZPHqaOpA
	ArFBbcQWAjrSaxG0YZfMnhx/02+LbvWyT1+sXso0mPYdqaqAQYGORDdBPIlm0I1G20Ny2RMfdErkb
	7vuV+XVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1s-00000003Bb9-1Fp5;
	Fri, 06 Mar 2026 07:55:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1p-00000003BaG-39G9;
	Fri, 06 Mar 2026 07:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=x4WWKecG/iTSsh2dycXEkAFiD9abnKWJV73l5Pt4Z3c=; b=hRY+OJNSncFYexmNPYRfFbEQfL
	LffJIbz4+EUTp3rGSALWlwnmZ28ORnObNOMWzWSBbAOP9G6Et+svZRC5bseECJtj8+HbKrEe2QHWJ
	La7ab5md54JuCg20oISHG5podKFJPvyMpFZoRa72pqXXxsYKzsnIyEOSWmvHmt4ux6r7GR5o9tors
	dMN9Bd7UJITs5j0AIWioOc3RkVIwGJZ0FuTRnpMBL/bmcrwm7QwhER/ujmsYdcsT93e6bQU348iGy
	1zOURHQEmJokBax76OeiGPcqMVNmoTLMIvgNW/6cApqCHY5EysxLt90w8BP9ueCS4BcRcGrRQDvaW
	Rcc8rF0w==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1m-00000008EKy-1NDT;
	Fri, 06 Mar 2026 07:55:20 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qjQgB2977148, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783565; bh=x4WWKecG/iTSsh2dycXEkAFiD9abnKWJV73l5Pt4Z3c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=MfZdK7upk91YY3jTXxdhhBU2oS4uaTO5SzgQT+dLT/5rBEjEUyl3vYhlXoB4hBaXn
	 dPiA93ajusIehwSJyxMkmgAi/smLJk4o6HT4FMat/ABG4TQECQ6EC72dx3GdyamsyW
	 YfpfvCR0/dCZUxVhWRwhM6UhsI1HOHpGUZe/Gl0frAFr4jR258HyKoiumNvwwBBPEc
	 VjvcYGnRBxEaLieC3cPP9xBdAOk8J0WPtRU6QkHOTO3D/yPTKoEBxNdf073mABHvCp
	 xnyUJUFvbvWEEJWOb4JOGlu8wxDc+erotcSWKwcHjzAA+eEAyxVeIq413a86sH4q07
	 qXpBlHyeiJP5A==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qjQgB2977148
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:45 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:45 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 15:52:44 +0800
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
Subject: [PATCH v2 01/14] pinctrl: realtek: Cleanup license string
Date: Fri, 6 Mar 2026 15:52:31 +0800
Message-ID: <20260306075244.1170399-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260306075244.1170399-1-eleanor.lin@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_075518_807384_9C7D39B2 
X-CRM114-Status: UNSURE (   8.78  )
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

Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db
("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v2:
- Add Bartosz's Reviewed-by tag.

 drivers/pinctrl/realtek/pinctrl-rtd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 244060486332..eafa0d7bb19d 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -593,4 +593,4 @@ int rtd_pinctrl_probe(struct platform_device *pdev, const struct rtd_pinctrl_des
 EXPORT_SYMBOL(rtd_pinctrl_probe);
 
 MODULE_DESCRIPTION("Realtek DHC SoC pinctrl driver");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
-- 
2.34.1


