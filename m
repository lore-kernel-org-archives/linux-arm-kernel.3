Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65268E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 06:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JD+HHyCafXyKrCQhX3ym8rvWYyEUYARqH99M++djFVQ=; b=vk3biW+vaOudH4m97hp4R3YoGx
	mSf/7KyJ90J2BDtnOeW2lxjJjGnru3bmD2eGCtJxvjl9+NQL3ytDk+NtNjXmVYZfJSKH7in9q/3Xc
	zOwDUbanUOJf5dJSNjJ0Ag5Nt2sV8Z4p7VIeZvimKHT5Z7AcEdvhGSJFIFBpOaQuA1KiIid3GsQ8B
	AvRxchSz82cZxhznt5HCrscmKjAoYV+06wCgQMTije6+j4Zf5+7O8gIMOMyRhKCkH0TDPB5+s+nIq
	z4TLRc3S6qdQtGtJrBNl0dK9Ut6p+0eYaJ71pTqzxgNSytJiNFhpg/5qJeDHTMVfYgBLz1ARSYPe7
	VHalsFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSVin-00000006dOE-07Kk;
	Tue, 31 Dec 2024 06:27:17 +0000
Received: from [58.32.228.46] (helo=mail-sh.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSVhc-00000006dGr-1PUZ;
	Tue, 31 Dec 2024 06:26:05 +0000
Received: from rd03-sz.software.amlogic (10.28.11.121) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.39; Tue, 31 Dec 2024
 14:26:00 +0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Chuan Liu <chuan.liu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>
CC: Jian Hu <jian.hu@amlogic.com>, linux-clk <linux-clk@vger.kernel.org>,
	linux-amlogic <linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] clk: amlogic: a1: fix a typo
Date: Tue, 31 Dec 2024 14:25:52 +0800
Message-ID: <20241231062552.2982266-1-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.28.11.121]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_222604_403472_58FE14EB 
X-CRM114-Status: UNSURE (   8.76  )
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

Fix a typo in MODULE_DESCRIPTION for a1 PLL driver, S4 should be A1.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 drivers/clk/meson/a1-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
index 8e5a42d1afbb..d71109b9bbca 100644
--- a/drivers/clk/meson/a1-pll.c
+++ b/drivers/clk/meson/a1-pll.c
@@ -356,7 +356,7 @@ static struct platform_driver a1_pll_clkc_driver = {
 };
 module_platform_driver(a1_pll_clkc_driver);
 
-MODULE_DESCRIPTION("Amlogic S4 PLL Clock Controller driver");
+MODULE_DESCRIPTION("Amlogic A1 PLL Clock Controller driver");
 MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
 MODULE_AUTHOR("Dmitry Rokosov <ddrokosov@sberdevices.ru>");
 MODULE_LICENSE("GPL");
-- 
2.47.1


