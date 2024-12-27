Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3482EE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 11:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGwPFK3xv/ptVPYpkqFPS9qGRy0Y0xu/iUwb0C9nXWg=; b=mkXoRBKfu8rnsBWH2LYOYwmye9
	iifox5FmU6Qchw8HsWvPKu9dQdNcCH2SLSZUbDvR/KmYQ9Mz/Dea+WKsgNmxwxqZdarwG5AM47oS3
	npbOD4JLNKM14uqe+tfZDbUkNaw4r9L9bGAQyo7zsKd8SEKUVg2Uh91FinO9f7C3iJn6kh7bY2DYB
	BgvcGTPxK956xML2SJ0SQYUKk9/ChAW/7VaEv+U2lbUmN75d/8lo4zblKlTexVkUQGTGRX8bZ3NTX
	rpaWEWKildL4N0lIrk56C8QhdzEyU0mqpMHTdQHC/s+585Q9HICgwZ+uo0aGeSLAKgx40178Tsn4/
	utgZCrcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR8Xv-000000006GM-1f56;
	Fri, 27 Dec 2024 11:30:23 +0000
Received: from omta36.uswest2.a.cloudfilter.net ([35.89.44.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR8E1-000000002gK-3Uxw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 11:09:51 +0000
Received: from eig-obgw-6001a.ext.cloudfilter.net ([10.0.30.140])
	by cmsmtp with ESMTPS
	id R6CGtdOKPqvuoR8E1txjS5; Fri, 27 Dec 2024 11:09:49 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R8DztoEI92Zy0R8E0ttN7e; Fri, 27 Dec 2024 11:09:49 +0000
X-Authority-Analysis: v=2.4 cv=Q4EZ4J2a c=1 sm=1 tr=0 ts=676e8afd
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=iM3t8g1HjrKnZeAfta4A:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pGwPFK3xv/ptVPYpkqFPS9qGRy0Y0xu/iUwb0C9nXWg=; b=PytkC0E6+h8OO95GAaBDa6ToD/
	X6RQBgyIH8yLV5owVMFw3iqDdsFtQ7HAhgXvnn++80/oOj9h12a7UwDVencs83+1ur5aknYnBbHfo
	IlFfdbs9vOr14mDdckmSR3ntnnAZ39LJPqK9lC9zqTQ61W7VwgBb2fhR4dR/yqC4cBYD6L/VpumJT
	bNXGByvvB0699BiYZg3Pq5nTJvZRms0xAAKqpyaFTYsQiwMDZS6p93PnIOLAOY9v21vNFe3extze8
	/a7mKuI+Y37MesfcysEOGPf2nUBXtjkITvlJqeP9HiOAjVoEXo2OmIrM9S6dUT+v1OzkqfB4blkEA
	K48J1JSA==;
Received: from [122.165.245.213] (port=50828 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR8Do-000bEK-38;
	Fri, 27 Dec 2024 16:39:37 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 16:38:03 +0530
Subject: [PATCH 16/22] clk: sunxi-ng: sun8i-de2: Add support for a100/a133
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-16-13b52f71fb14@linumiz.com>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735297689; l=1043;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=qvS7+D/RTyyMg86CwtqbsAA+5EMqHdzQTTB53paC81Y=;
 b=XNyGVAs9WW8vlM4qOOilUjJeSmld8IS3muoSSmNHF7R0BNHYwWiLQzsMYl1WyxP5KH08pxwbs
 XX/zJxP3xkCCWn9sKa9YqO1pD/IsNIo4ZzA57+3OXY2mrliF2tLuPq7
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
X-Exim-ID: 1tR8Do-000bEK-38
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:50828
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 470
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPWJDACjwZHTqcvY3CeQHYwB6Y+yHIvYOEunCf6YY64SCeBncpgbYJvaUXIr/Xockg6YfZyCWOtdula0ZbiIWs7fmIF/Oojogu/U82I1Cbp/ex1LzPSo
 tSM61QOaKK5cubazlw8v3pQ4riegJTIxzKwLPb4Q6qeRNXHqBCSwnTnrGki3GRaoqDKugakd4eNlpJtnCwFbsY6Ezl/mG78d4X+SG0ZhMkKFfeVsDBrPd3s3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_030949_923983_06BC566E 
X-CRM114-Status: UNSURE (   8.42  )
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

Display clock uses 1 mixer without rotation support is same
as v3s. There is also a hidden independent display engine
with independent tcon_top available in A100/A133 bin (based
on vendor BSP).

Add new compatible for A100/A133 to accommodate the future changes
for the independent DE.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index 3e28c32050e0..067820ab704d 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -342,6 +342,10 @@ static const struct of_device_id sunxi_de2_clk_ids[] = {
 		.compatible = "allwinner,sun50i-a64-de2-clk",
 		.data = &sun50i_a64_de2_clk_desc,
 	},
+	{
+		.compatible = "allwinner,sun50i-a100-de2-clk",
+		.data = &sun8i_v3s_de2_clk_desc,
+	},
 	{
 		.compatible = "allwinner,sun50i-h5-de2-clk",
 		.data = &sun50i_h5_de2_clk_desc,

-- 
2.39.5


