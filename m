Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327AFC982DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUEDhthLVuxR2718jDNKdRGiGEMQjCBAe/tRxn/+snQ=; b=XWdAJs63W8M7hnTR63eJxNfL+6
	yxyRaVs724CL7ArTqcIDm8XX9MAw9q4Kv/TXApTCVvSmDp09HMVJAHSNdKqTfx3gCu7//PkVkazWy
	JHXerbRT8QDVspGbha3563b6zidM84wtPxLI4IYv3N66wDB7Mkyr2ahRP8+DmRkkfbvhNpvezi/1l
	hvlekJi1WnGezR5XjUUJIlX1GiNHb/x+LHSo/hZg937Rt2WGmzp1Uo1EDZCBDcpmuJHG0M/Q/e0fM
	UH7bTxiLyjp0ExAETaxre9aCW/bd2/r752YaEbc4/tY52VuNBVUTMo4rj3njaPtUktAYEcsVXjzDh
	oWc+xiwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Zjz-0000000Ek7r-0cxs;
	Fri, 18 Sep 2026 14:39:03 +0000
Received: from mxout2.routing.net ([134.0.28.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Zjw-0000000Ek5e-1kbV;
	Fri, 18 Sep 2026 14:39:02 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 7BE6D6143C;
	Fri, 18 Sep 2026 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1789742334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RUEDhthLVuxR2718jDNKdRGiGEMQjCBAe/tRxn/+snQ=;
	b=DISv0Eq2ohtzhZJGzuiCqsNl7e4SYVmhSXbU++jql8NRjDfhxFkELnjmX49hLDpPxRByEF
	ICUTJu4L/5bi44PdZE4m9reQj7D3g+x6jmYXj3G/06b4BhDYkpEh9HkNTySJhOfXItDs4y
	WoSXn6ATyZRZmBJ5aUS7K1EGUGEOh84=
Received: from frank-G5-5590 (fttx-pool-80.245.73.6.bambit.de [80.245.73.6])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 486C31200CB;
	Fri, 18 Sep 2026 14:38:54 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: mediatek: mt7988a-bpi-r4pro: label gpio-hogs
Date: Fri, 18 Sep 2026 16:38:43 +0200
Message-ID: <20260918143846.30458-3-linux@fw-web.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918143846.30458-1-linux@fw-web.de>
References: <20260918143846.30458-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_073900_691205_A1DA7FDD 
X-CRM114-Status: GOOD (  10.28  )
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

From: Frank Wunderlich <frank-w@public-files.de>

GPIO hogs were tagged with name "?" in recent kernel versions (7.1+) due to
commit d1d564ec4992 ("gpio: move hogs into GPIO core").

7.0 showed the unit-name which behaviour is restored by patch [1], but
labeling the hog directly makes things easier.

gpiochip0: 84 GPIOs, parent: platform/1001f000.pinctrl, pinctrl_moore:
 gpio-0   (                    |tx-disable          ) in  lo
 gpio-1   (                    |mod-def0            ) in  hi IRQ ACTIVE LOW
 gpio-2   (                    |los                 ) in  hi IRQ
 gpio-12  (                    |cd                  ) in  lo IRQ ACTIVE LOW
 gpio-13  (                    |reset               ) in  hi IRQ ACTIVE LOW
 gpio-14  (                    |WPS                 ) in  hi IRQ ACTIVE LOW
 gpio-21  (                    |tx-disable          ) in  lo
 gpio-63  (                    |?                   ) out hi
 gpio-69  (                    |mod-def0            ) in  hi IRQ ACTIVE LOW
 gpio-70  (                    |los                 ) in  hi IRQ
 gpio-79  (                    |?                   ) out lo
 gpio-82  (                    |PHY reset           ) out hi ACTIVE LOW
 gpio-83  (                    |PHY reset           ) out hi ACTIVE LOW

after the change:

root@bpi-r4:~# cat /sys/kernel/debug/gpio
gpiochip0: 84 GPIOs, parent: platform/1001f000.pinctrl, pinctrl_moore:
 gpio-0   (                    |tx-disable          ) in  lo
 gpio-1   (                    |mod-def0            ) in  hi IRQ ACTIVE LOW
 gpio-2   (                    |los                 ) in  hi IRQ
 gpio-12  (                    |cd                  ) in  lo IRQ ACTIVE LOW
 gpio-13  (                    |reset               ) in  hi IRQ ACTIVE LOW
 gpio-14  (                    |WPS                 ) in  hi IRQ ACTIVE LOW
 gpio-21  (                    |tx-disable          ) in  lo
 gpio-63  (                    |pcie3-cn14-hog      ) out hi
 gpio-69  (                    |mod-def0            ) in  hi IRQ ACTIVE LOW
 gpio-70  (                    |los                 ) in  hi IRQ
 gpio-79  (                    |pcie2-cn15-hog      ) out lo
 gpio-82  (                    |PHY reset           ) out hi ACTIVE LOW
 gpio-83  (                    |PHY reset           ) out hi ACTIVE LOW

[1] https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=d54a489c8c4b627775445d54a6cbd32f209bda8f
"gpiolib: use of_node_name if line-name is missing"

Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso      | 1 +
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso      | 1 +
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso      | 1 +
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso      | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso
index 973b76ba0cbf..e9c322df15fc 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn13.dtso
@@ -16,5 +16,6 @@ / {
 };
 
 &{/soc/pinctrl@1001f000/pcie-2-hog} {
+	line-name = "pcie2-cn13-hog";
 	output-high;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso
index 90b2a64459c3..9d8de737ca40 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn14.dtso
@@ -16,5 +16,6 @@ / {
 };
 
 &{/soc/pinctrl@1001f000/pcie-3-hog} {
+	line-name = "pcie3-cn14-hog";
 	output-high;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso
index 9750916042de..57ee7dacdd78 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso
@@ -16,5 +16,6 @@ / {
 };
 
 &{/soc/pinctrl@1001f000/pcie-2-hog} {
+	line-name = "pcie2-cn15-hog";
 	output-low;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso
index 9830fb0fd97a..7830980ac95a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso
@@ -16,5 +16,6 @@ / {
 };
 
 &{/soc/pinctrl@1001f000/pcie-3-hog} {
+	line-name = "pcie3-cn18-hog";
 	output-low;
 };
-- 
2.53.0


