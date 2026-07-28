Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF61C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxBpcLwQpOW2vKL5WhYL3BFfyuddH3BZqW5fz8lS/T8=; b=EVSFJR2AkXA7xdc5k57SekPLAE
	eOEacGovMt38UKh1nPu+k+8zMkGwMbI82BI9B+8Iwxl3NP7M0mKWqdJx/fad0+pPUHg6w1WDg9Oh2
	7I9XLKmUGrTxn0nm6WD0GU8MSQnwtOuBdZfst5F5r51ZRY3A1uho9FcOlsSZmrKOSoLQiSL7t++Kc
	VwQTzqRwcouslArTwpGR4sEQLbPsPqza/y1xMw/0JhtxQEuZhN8g4SsIDsApp9EQFVPfQ+Q3XC9b4
	V1UfT6QQjTfGULGZ1wQctrfTGffy5VJ/6tqTT4WTdxpVEows6Z8P7LcolyJ+mpD5oPS/R5xHoW7pY
	bp2AupOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodxc-00000004nGl-0dpl;
	Tue, 28 Jul 2026 09:18:52 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodxM-00000004n25-0BXz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 09:18:37 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso40474345ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 02:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785230315; x=1785835115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxBpcLwQpOW2vKL5WhYL3BFfyuddH3BZqW5fz8lS/T8=;
        b=epkDjBmGX9y2lCG5oUAr7otbsMEUP2L1DUUdeyXziAjvz65s2GVwS4b63p+JeLUiVF
         V1mXIL9GnupUUNd1etmrNNr4FEPlM4ucbMII2I9l3CAAgkyBYv4OjDFU4kK6EGK44Lk6
         fY3SbW7WWGi7B4GzWhQQ1FcWoFXNBaVeaB7YY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230315; x=1785835115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxBpcLwQpOW2vKL5WhYL3BFfyuddH3BZqW5fz8lS/T8=;
        b=kD08rKCXnERwIyEzI6wIJFHboKPg6jyq2sXtMXWqdhs047PKE0m6LW+V/xSRmhYetb
         soi4lJ9Gm7r3k7J9psoZZSZ7LyjH5xXOkjC61aU08PL15xT7uN6201To7ytidyxtIIe0
         q1yJN7tFWptOvZL1uFnsNZHF6kElbXtfRXIqiLQRKYeCWfXrzwVkUTaaoNHq297nNmtv
         Db3ju1HxZ7IQ6FDp8zPs+XJj7BgZ/whUNjYS71OQ7mTgo5isDf+ZABD7+JM+AQ/N5IVO
         lFfI67a/0Lp2FbkqAvnyVT4G2Z9KbUIyRtE4z8DtHcY/vu91Xtf97roqY2XTW0r8eHlw
         0yXg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6hFHpmX4/RsDBNlyF/CDlTc3oEoLWJw7NoiXPDUGjnx2/mMYUAHHXOO/Lt7KXG3IWjlxwjls/dnVcr3A8o6Kd@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7fJs8mMekmwq+ffU2Ud+uZdqYYwAxdBHJmQ3YBkajRPJqQOsA
	mhsr0wLHZ4ClyFCaE+bjS+pYJPtnbG1TevepDSGiCZnwMaChfn5aPanSGk+M8YqB+g==
X-Gm-Gg: AR+sD12UzBvVRisqXJCQ6YOWa0UBGEAv7SwnsAfc7Axp/ZIHwIiuguSwkOxr3usmMfF
	1blNEBrhehUceIt7RV1t2kneV7hA4WNmWgreOHqt0b3e4ivwA+lF+OxR3XLGNQV382wuwU+kUNg
	OH5W5JJ4JQ8yinZZDUZw8aPDqxtjfH8+tzrpdYCau4dd4L8vgcfH4zRvbrwn8AIpGRCN3YSbErd
	5Cu740b9s/nQjUIVu2FCzemKNOSurASPDoTKnhum8mFD3B/UOMR6CvDP1t1n+/OQ1ZEmbyLWKZR
	uc9CfIYiOntxpdcTtGadOWVKnqMLT0UrD8WRWcOwIdWICLR6GxNE9KAnoEma9KGNuY493ZwPmhN
	dVavJcu/70lH/SnN+73AV6m32juIomAAjWfKfe1Lp35EdbOFf7WkDvdNDXpuj5ZW8ag6XbjZrcj
	o56h7GOHP6wCDNPUQiMWS2TAkbKQXe3fFi73iI8okJwb4I4AoHTxQH8rgWHM0=
X-Received: by 2002:a17:903:8c6:b0:2cf:6f7f:55d8 with SMTP id d9443c01a7336-2d015cfb0e2mr18391495ad.37.1785230315142;
        Tue, 28 Jul 2026 02:18:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c85f:b2bb:a077:d544])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81dcc1sm48616965ad.84.2026.07.28.02.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:18:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH v4 4/5] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
Date: Tue, 28 Jul 2026 17:18:02 +0800
Message-ID: <20260728091804.382753-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260728091804.382753-1-wenst@chromium.org>
References: <20260728091804.382753-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_021836_088665_C2B2EC82 
X-CRM114-Status: GOOD (  15.85  )
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

The MFG_ASYNC domain, which is likely associated to the whole MFG block,
currently specifies clk26m as its domain clock. This is bogus, since the
clock is an external crystal with no controls. Also, the MFG block has
a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the block
diagram, gates access to the hardware registers. Having this one as the
domain clock makes much more sense. This also fixes access to the MFGTOP
registers.

Change the MFG_ASYNC domain clock to CLK_TOP_AXI_MFG_IN_SEL.

Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain controller")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..556e806b7787 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -505,7 +505,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
 				};
 				mfg_async: power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
 					reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
-					clocks = <&clk26m>;
+					clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>;
 					clock-names = "mfg";
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.55.0.229.g6434b31f56-goog


