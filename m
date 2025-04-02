Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067D9C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 11:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R2b23NS7UiSTlKd9WJb2J2Um8kc5Bha20Y/h3PxIymM=; b=EB1oVa6Im6mPFWFr87nKv5aSkE
	yVsjP00KZaR1/O3amtaxz/FgWAAwaXkKiytBq3IHFe7fUVBfSGbHNIsq6A6VPI/zTD6XFF1x6+vEN
	OFT6T3PnxZ82fXOjRvY7YEY2BBSdEQs7XmcEa9hH1n6EJ7zE+GrFLeP03Ft/ce7AIUIVS80UiUmiv
	AqLEbSqpngsVZ0ZnwFThqxQDpZHRalkZ/KAgNrSk0jJiJA3mY41lP6uxtXJEc+eI1YYav7KKIy5mR
	Guc7hU2EasO9ZHGDJjKLtS0v1XrF50KkVc4c20qLsIKIr8xRxw+jK7KKI3quMJ303hC5nvKKsLn85
	OFz1EPNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwdT-00000005yV0-2Ft9;
	Wed, 02 Apr 2025 11:51:59 +0000
Received: from mxhk.zte.com.cn ([63.216.63.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzwT1-00000005wQv-2FoI;
	Wed, 02 Apr 2025 11:41:12 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZSNH75fKSz5B1J6;
	Wed,  2 Apr 2025 19:41:07 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 532Beuck066915;
	Wed, 2 Apr 2025 19:40:57 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 2 Apr 2025 19:41:00 +0800 (CST)
Date: Wed, 2 Apr 2025 19:41:00 +0800 (CST)
X-Zmail-TransId: 2af967ed224c2c8-28bb5
X-Mailer: Zmail v1.0
Message-ID: <20250402194100610qY6KQ4JPISk-4v214Qs36@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <vkoul@kernel.org>, <robert.marko@sartura.hr>
Cc: <kishon@kernel.org>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
        <samuel@sholland.org>, <zhang.enpei@zte.com.cn>,
        <linux-phy@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <luka.perkov@sartura.hr>,
        <vkoul@kernel.org>, <linux-arm-msm@vger.kernel.org>, <heiko@sntech.de>,
        <linux-rockchip@lists.infradead.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHQgMC81XSBVc2UgZGV2X2Vycl9wcm9iZSgpIGluIHBoeQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 532Beuck066915
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67ED2253.002/4ZSNH75fKSz5B1J6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_044111_730050_7BF94776 
X-CRM114-Status: UNSURE (   5.60  )
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

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Use dev_err_probe() to simplify the following code
sequence:
  if (err != -EPROBE_DEFER)
      dev_err(dev, ...);
  else
      dev_dbg(dev, ...);
  return err;

Zhang Enpei (5):
  phy: allwinner: phy-sun50i-usb3: Use dev_err_probe()
  phy: broadcom: phy-bcm63xx-usbh: Use dev_err_probe()
  phy: qualcomm: phy-qcom-ipq4019-usb: Use dev_err_probe()
  phy: lantiq: phy-lantiq-rcu-usb2: Use dev_err_probe()
  phy: rockchip: phy-rockchip-typec: Use dev_err_probe()

 drivers/phy/allwinner/phy-sun50i-usb3.c     | 8 +++-----
 drivers/phy/broadcom/phy-bcm63xx-usbh.c     | 8 +++-----
 drivers/phy/lantiq/phy-lantiq-rcu-usb2.c    | 8 +++-----
 drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c | 8 +++-----
 drivers/phy/rockchip/phy-rockchip-typec.c   | 8 +++-----
 5 files changed, 15 insertions(+), 25 deletions(-)

-- 
2.25.1

