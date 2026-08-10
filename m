Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0C2C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soxlGetKzVjXmXQ8H/b16sW9NlqqcrgZu1yvmW+k+FY=; b=pgdSEF1ad1L4GrktJ7GMUb1yd5
	5LiMGv3KxWIlwJnMFcbEn3oah7jaIGrwxbpcz4qvYrvU1Gu0gP33CTWDOVhRMJcQl3Gpe7gfNVQ5t
	80zELjSWxzHAqXa7bKUbuH/Diz2/AjVr2VODrLMEy4q4JDmwO2JgCZMl2zEI6LHU0bXE88moTq39V
	GxYQnh3vc6lmeZkaRIhHEKy6EOuGx2Dk8VhxbF1dRaC0D6mazSDy7tVVaW9tKteZDuxlDni7GpVVX
	FkuCymLaTzfufoorY8axttEF31jp2EJa0eOBrTyIBmSsi8wSQZnDyGMYAk8gTypi2BwOusEyRgItI
	CVAeks6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUOB-0000000CaS5-3rPt;
	Mon, 10 Aug 2026 18:06:19 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUO5-0000000CaNT-1xHi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:06:15 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A8073887;
	Mon, 10 Aug 2026 20:04:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786385094;
	bh=bAhkAhfV+UwhDLmqT4RYDOVJXy9eV/GY8lQW0TkBwzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=byfFyMcyVnJ/m2y0hWL/dJUS0/6qfWMDj1O9zE8j3sEsT0feE5Fy6V+CXqO0bWwh6
	 3Su5oJAH3Xv5AJd6jMX9n3A7lH6mVYoxCxSSCjVT2n7/gFXk+TcW9Cj2NmaI50wPiB
	 PvRHATH5jrQLREHAI1cMIpN9jFP5/UmQ/hlsFbd0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 2/7] ARM: dts: samsung: exynos4412-midas: Replace clock-frequency in camera sensor node
Date: Mon, 10 Aug 2026 21:05:59 +0300
Message-ID: <20260810180604.3034255-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_110613_648304_D8B99E7D 
X-CRM114-Status: GOOD (  10.64  )
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

The clock-frequency for camera sensors has been deprecated in favour of
the assigned-clocks and assigned-clock-rates properties. Replace it in
the device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
index 48245b1665a6..8b6c2e2baed4 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
@@ -638,10 +638,13 @@ image-sensor@10 {
 		svdda-supply = <&cam_io_reg>;
 		svddio-supply = <&ldo19_reg>;
 		afvdd-supply = <&ldo19_reg>;
-		clock-frequency = <24000000>;
+
 		/* CAM_B_CLKOUT */
 		clocks = <&camera 1>;
 		clock-names = "extclk";
+		assigned-clocks = <&camera 1>;
+		assigned-clock-rates = <24000000>;
+
 		gpios = <&gpm1 6 GPIO_ACTIVE_LOW>;
 
 		port {
-- 
Regards,

Laurent Pinchart


