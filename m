Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833A0E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 13:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qiSM89V4SzYcC8gEAu73STXv5s6bgJIn4sStUDfq04o=; b=CJ7B2ErVq8QXL7yr+lunbJSomN
	/R8cdMiuIuVgOX4cW+TL5+jk2/9yaJVzY0mD4BtdzbmfeLmQ4vWQUa1cZdFctNbJB9s4966jaKUDg
	LH5f6X/nNWeyN42EESSlJbAMis5sDq4bVp5ngUC83Fp4CGohQJXO9dmqm/ldpZUJpdOPKCC4caS0R
	qmXzVWUA+T9wpeo6jdTImLR5OTXnJxrYONME098VIyPNBf6qn7EUhhM6K8eaYIFoUJGI/8c1fTb2Y
	O/54JkCv646An3NQaGHfP9J/j7XUCwX6VnVxgQp4PnGmUEbsr2jqZPi1ZNIiXgI4MYXF9qgsuH7yf
	Gw8reSig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRA9Q-00000000FpA-39tZ;
	Fri, 27 Dec 2024 13:13:12 +0000
Received: from omta038.useast.a.cloudfilter.net ([44.202.169.37])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR9yl-00000000DRK-1XZ9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 13:02:12 +0000
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
	by cmsmtp with ESMTPS
	id R7g9txT2JjMK7R9yltMDo7; Fri, 27 Dec 2024 13:02:11 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R9yit7otqlDL5R9yjtTWSy; Fri, 27 Dec 2024 13:02:10 +0000
X-Authority-Analysis: v=2.4 cv=LLtgQoW9 c=1 sm=1 tr=0 ts=676ea552
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=85KA4Hw53eMu32bbZw4A:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qiSM89V4SzYcC8gEAu73STXv5s6bgJIn4sStUDfq04o=; b=nAvBZYSHbVM62LJFidG3027XxF
	P1mTdQOMTI7WGFrHZ7SB/TQXd/qSHL9afyj7g+55u4Mo3fvffZ2Bqvgh+Qprf1K2Y5JSm2ZgEAbzh
	J5dcIX4wcBz18dE5gTYR6YPWeSBIxEX514UWoaxdgrGLzx8UbxPcPl0la7wXwrTWl1VOJEy43sXpZ
	GudsLc/zFvQSzaFXM+OZiJWlxRWaa8ix9rkMQ9sdt74F99oAhtz48NjAiqZlEIypv2GZp/kO+pt7/
	0QpOX9XxfrGL5CUTiI7SCRB2TqCD3chLgNoZ6C5Ey6jCZu5W7A15gWiSVU8Gm8V4VgdVcqelHu8a+
	l9Yf9Ekw==;
Received: from [122.165.245.213] (port=58270 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR9yd-002EaQ-0T;
	Fri, 27 Dec 2024 18:32:03 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 18:30:58 +0530
Subject: [PATCH RESEND 09/22] iommu: sun50i: make reset control optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-9-abad35b3579c@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735304469; l=819;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=P54KA5XqlT/VEM0AcqfRzSVceip5YpdV+G0SVeiVvo8=;
 b=8wSi51Em0At7HsSz71oEg/YhUEgaqaYrkhUkAvLX2MM9QDxn8dPP28lwLddLbKktgDyWiU7Tc
 l3RwlzT+P5TCMp6XfAOhpTqm0j4VKJyRoKL3HrRZ2WA1jmVmAqjXW4O
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR9yd-002EaQ-0T
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:58270
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 290
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfILxsCPJeMSt9mu+GXAe+13y9SjssK5MnTJTR0+jev9DJlwbUpbRQwQZX123gKy3wwkVDpThRmy2NE/crMyMQr5uPMr1Y3gD3UpfRB4i3pBy61xt1o7R
 NV9UqSu2ztIHuF6y23kW0filIUjB/ubRdjCaZtXVRlpjVOrL9n+MDMZNHplKrg5TtqTHlXrcC9lwQxtl66VmEVfxj4eDB9WxSIDc0wcdWuhyg0llKKw8kBeH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_050211_473036_58F98BB4 
X-CRM114-Status: UNSURE (   8.22  )
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

A133/A100 SoC doesn't have reset control from the CCU. Get reset
control line optionally.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 drivers/iommu/sun50i-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 8d8f11854676..2ba804d682dc 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -1030,7 +1030,7 @@ static int sun50i_iommu_probe(struct platform_device *pdev)
 		goto err_free_cache;
 	}
 
-	iommu->reset = devm_reset_control_get(&pdev->dev, NULL);
+	iommu->reset = devm_reset_control_get_optional(&pdev->dev, NULL);
 	if (IS_ERR(iommu->reset)) {
 		dev_err(&pdev->dev, "Couldn't get our reset line.\n");
 		ret = PTR_ERR(iommu->reset);

-- 
2.39.5


