Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30740CDB466
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 08:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AK72JY9546LAn2x2ESR9aaSSsyIR6+VYcMVygo1wvgI=; b=trNZYtM01FeqcdfqMBLMX82BJO
	hjt0yCM91d1dbrmPkHOwxjLZoud9iyD4Z1L/OE7NVmjLnpuyQB4quxQUnWuZKtibIHHO7HL9WF1O2
	bjwzcuEdGJb+hwqvKsjcYSX/DnOCOhPaEdJfroAjqZr3Cxo/yh2EBh9mh0fkkZDHVB6iX10iC/bfS
	T9Fmu4ZLEF5MihQ8udyn/9Bs57Ui+92DILlRsBlMWGYRdl+gHdEcT3gsVwFEQoNrWPr8hcTgRZFF0
	SAkpvnbrT8kD3RYzquM9tENYhPUeP1R+oIjvAUzy9Nq6VVOexPRx/MYh186lPHIqkBycYdkg3tNRt
	7LTuWWlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1warFK-00000003GM3-0AEl;
	Sat, 20 Jun 2026 08:40:10 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1warFH-00000003GLK-31UR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 08:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1781944805; bh=AK72JY9546LAn2x2ESR9aaSSsyIR6+VYcMVygo1wvgI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LZkRvsw8845tPJpYFmQ46MdmEmzdVH7BmIn8Sdc2QlENWSDBpPY+MWzSir/RrVuoY
	 BSl7n4t/bLPV0t8MbTJlSaxsvi88heayhd/DEaEmNNN4Eof9Es2ZzmPmOCWWpLWSqm
	 +me2J0C+7a4Ql3tb+hiCIonsxwcH/gWDKNXE6AKE=
Received: from ws006419.mbzu.ae ([5.195.0.150])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 9E3A1AF0; Sat, 20 Jun 2026 16:39:35 +0800
X-QQ-mid: xmsmtpt1781944797tdyk1m35s
Message-ID: <tencent_54F5634545908FBA724E758054BF03953808@qq.com>
X-QQ-XMAILINFO: MqG4KXyEKpQyyyHkx3pIRBPOwwLsAGMVPZQ4eguFQMDuIpiHoSkhbaPnF81IdZ
	 2z9voss3diVQvFh98JzA6ZC5Cri1wPM4ATG7x2zGsWwwkoZ0OMN9QeG2bJCBrIRWkpGgOf2t39MX
	 /R2tCxfnt2K4U+LvvZ16e16MCvM8+84TI1sw/o1Yu0ZCJRhWQzMQ358umxSHrO4yxdSUSweJR9OL
	 1Hd+I8z78s4jmVn+j+k+6Ru1EM0mbiQStkeOLgt5+tQyBiUkfy06BlggKyHJllbug5vLvPJHVHlz
	 Et9VdU3jCL+QKVlHIv63H/G3ui2EvBBXCCdKlScKRK5m5t6UQROFCvwIZOYl6N81iZnPC6Sr3SQq
	 Yy4uqXb9tXK1zfrjU9AM0Exq6Mnd8XVAVb0WW+aS1YQ7WE+YFx8PLAPFe0FcDbttlePwgX7BDcpi
	 L3gEIxzFEhiEZasPK1WRgBGh8hG3fHYeHEfrMNPaoXaKv9mDdTvhUMU7PrMfzoL+YJCyQM8uyJAV
	 QRhFgUF74Q+DcuGa7YfNpn6uzvsWdS9AJH7QUQzLXkcXNkqMEHG9RfJcn5TyaiixopyuW04sUHrN
	 JsKIkia++VloL6BVbmnVTgmRohek0acvg2wlM0h/RyB4Vs9h2QyT5dYS0LfSPyLRxed8F4beMsSa
	 iM0tzxSAuZ5fQt0UlAvNsrYYgWLgr2uVgqyZnZNmVkefcKPWHQiRiZw7rptceWj3mKwepQVC6hdo
	 m5yYZmIk/5xBf8oakTDvWaPAQFPROXf6W+YeylSe8cjmzzJ3qyVJp3obeUkZop84Q4UbwhczqX+d
	 S/xfJl2cglTnck4mlPXkkm5XqkaIt4Nx4PSBI58LMVvXRFhzvFJPrmz344PswNe15FM6GYkFGcFX
	 YmC8YL23s9wErND++x7tabmwyUOLTiNxfIas+BBuMQ1byAVQ+1nlgx5SaB4i2+gDzYDZN5t7HJBs
	 s8J8sEnMeK5VAlebYjkiWN1bfAZWaWY2xIw/wbocWMJ2N6yL05Hk353V/fFlsciWN+2ZWzvvknST
	 +t+ZZK1U/Ss9HcPbiLR0jL2s+mJNof4+eqfYIAkY4OkTOvup2wkIEmnzvCKdEr6rSjuprX4w==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Jiawen Liu <1298662399@qq.com>
To: broonie@kernel.org
Cc: cl634@andestech.com,
	william.zhang@broadcom.com,
	kursad.oney@broadcom.com,
	jonas.gorski@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	anand.gore@broadcom.com,
	f.fainelli@gmail.com,
	rafal@milecki.pl,
	olteanv@gmail.com,
	han.xu@nxp.com,
	haibo.chen@nxp.com,
	yogeshgaur.83@gmail.com,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Jiawen Liu <1298662399@qq.com>
Subject: [PATCH 2/4] spi: bcmbca-hsspi: return error from failed controller suspend
Date: Sat, 20 Jun 2026 12:39:29 +0400
X-OQ-MSGID: <20260620083931.1120616-3-1298662399@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260620083931.1120616-1-1298662399@qq.com>
References: <20260620083931.1120616-1-1298662399@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_014008_090347_8F6E6480 
X-CRM114-Status: GOOD (  10.01  )
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

spi_controller_suspend() can fail if pending transfers cannot stop.
bcmbca_hsspi_suspend() ignored the error and still disabled the
PLL and core clocks.

Return the error before disabling the clocks.

Signed-off-by: Jiawen Liu <1298662399@qq.com>
---
 drivers/spi/spi-bcmbca-hsspi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-bcmbca-hsspi.c b/drivers/spi/spi-bcmbca-hsspi.c
index 09c1472ae4fa..af88ce04948b 100644
--- a/drivers/spi/spi-bcmbca-hsspi.c
+++ b/drivers/spi/spi-bcmbca-hsspi.c
@@ -568,8 +568,12 @@ static int bcmbca_hsspi_suspend(struct device *dev)
 {
 	struct spi_controller *host = dev_get_drvdata(dev);
 	struct bcmbca_hsspi *bs = spi_controller_get_devdata(host);
+	int ret;
+
+	ret = spi_controller_suspend(host);
+	if (ret)
+		return ret;
 
-	spi_controller_suspend(host);
 	clk_disable_unprepare(bs->pll_clk);
 	clk_disable_unprepare(bs->clk);
 
-- 
2.34.1


