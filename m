Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6605CC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 22:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DsWrwEPA0jf6ymSLm56xpLPPzeLpifAMOAkYO6Yfc2c=; b=Uk2Wm8qpMow+Qz5a9X9DynBgE2
	nzMqSc4+8KEzWw8ZAj/Uiak8c9f71R80rmziuZra4aQNb/tc8ud0oRcpeIg1UUs7mS1q1wV8qYGcN
	DBg5UCRxdqe8ITvFINN+EJZ1iyDR4q1MWDpqQZpy1SDNgxyKcmv2HO3jyWsgnmiriPvL37jgjsOSD
	kjtJjY/lFJcM266xfWFDP4WCfVk33EZfXSsvgZAXn8bMdCblmGj4mv3+Zvn9wd8tLy2pZzDOIdn2t
	teZ2Ioi32xBiaOCoNXxSbw1aUtNQao73jGSHY/Lu7n5TlLMUwaadpKJXIS6BFGLFyGQZLTA7Id7vI
	P7oLpyjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpES0-00000002UiC-0cjn;
	Mon, 03 Mar 2025 22:39:52 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpEOy-00000002Tz0-3Jhq;
	Mon, 03 Mar 2025 22:36:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A22F433EC;
	Mon,  3 Mar 2025 22:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741041401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DsWrwEPA0jf6ymSLm56xpLPPzeLpifAMOAkYO6Yfc2c=;
	b=Rpblhqao8kf5CWt6HF8hM5sP3Tvdp8xstZXn92PJGdHbs3OyuH9BEap43QkIEf5cJCeUMX
	stpwL9vYoSsajgkyN0q8uKU1ulrJh5C5K+bm5uGD89KXVsb0CMQqKL4WrqIR1PgRTrZVql
	MJSscjUf4FKka+jA5tr4Z/9a7pFYRgALMuo+4vMqCJRKF2x8fJextvyPR9EDVwyU2cOoMj
	/vyfOVZsIfaK/h3Z5p7WkogAslqAC5ycYNIgXcGf5QE2LQmrrFxTpQTPIpek/XxM4SxAH7
	fpDYx1s78NIu0Y9Xr7C8q97VYQ7PyeZ5CpC6Py0H7OpawQtbSywUmJhcDDGhsQ==
From: alexandre.belloni@bootlin.com
To: Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] rtc: mt6397: drop unused defines
Date: Mon,  3 Mar 2025 23:36:37 +0100
Message-ID: <20250303223637.1135362-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddtfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmnecuggftrfgrthhtvghrnhepgedtffeugeeftedtfffhiedtjeefieeuveelffetledvueeludeggedtjefgveevnecukfhppeejjedrudehtddrvdegiedrvdduheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeejjedrudehtddrvdegiedrvdduhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopegrnhhgvghlohhgihhorggttghhihhnohdruggvlhhrvghgnhhosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgv
 ghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_143644_968867_9665E515 
X-CRM114-Status: UNSURE (   6.74  )
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

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

RTC_NUM_YEARS has never been used, the other defines are not used since
commit 34bbdc12d04e ("rtc: mt6359: Add RTC hardware range and add support
for start-year")

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 include/linux/mfd/mt6397/rtc.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index 068ae1c0f0e8..27883af44f87 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -60,11 +60,6 @@
 #define RTC_PDN2               0x002e
 #define RTC_PDN2_PWRON_ALARM   BIT(4)
 
-#define RTC_MIN_YEAR           1968
-#define RTC_BASE_YEAR          1900
-#define RTC_NUM_YEARS          128
-#define RTC_MIN_YEAR_OFFSET    (RTC_MIN_YEAR - RTC_BASE_YEAR)
-
 #define MTK_RTC_POLL_DELAY_US  10
 #define MTK_RTC_POLL_TIMEOUT   (jiffies_to_usecs(HZ))
 
-- 
2.48.1


