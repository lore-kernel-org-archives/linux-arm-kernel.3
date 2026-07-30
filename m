Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B89C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 20:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L77jCv3f95ANc83ixm53SBXy3LLu0+ipYt59rygigCU=; b=FKxrPrJzuxLU6i3HBU+EzU/kn7
	89No/le0U2bQfUmJiCXlOfkSDUYC9XuSWJobHjmtvqOmw9TfaCwIgSu+W4yxiB9imRzb8yahvQd49
	yKy1UCubroHVqV9Uomdjp7CUDrSwh9HjqSW9ZtzXR2Dw8y4uV4dU6NYNt/t0vgLmay69rNCCucbBR
	PHkZhvhipNGFggfEJ0nj0haqain3u3chDj1xDVPup1y5PUezVygvt2yqRqAobrzWouBZA/ZfNjhdK
	nS87jTr6zxKRMVFHk5HTqmGqn2Jj3b0j4nID0Z2K5NDH9Cax4o3ouIYhV1JMf8R9XkRPAwZRiW/Xs
	l8e3aoWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpXER-0000000BJp8-0H79;
	Thu, 30 Jul 2026 20:19:55 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpXEM-0000000BJmS-3W1S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 20:19:52 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 40CC08468D;
	Thu, 30 Jul 2026 22:19:43 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8RPTeP7d8JI8; Thu, 30 Jul 2026 22:19:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785442782; bh=PHhg4NASLAVp09IUcpWPeWdg4j/hYt2r4k+sJeoXjAc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cItL7OfI6aoZel27BS3cVDgQOPc9T3X0eCQnbv0q9fdYRp54bc0B+x4c4Zx3iQYvw
	 JBV/4h2kzJNa4Vfaq0lavee50pn9kEOCWmNk82afEU5vNyKUFk+L7DexO5soT4AwlJ
	 YYtoRgygx2rXuNAyf5liDbbV9wgzw5QYVRwnQnviYR72pNEanftpW/jQMZ4zdRnq61
	 TXLfMIrDUJNFN1+h18bpHDVoT6LqN8ahpBEQzlm6rb68z5wKmz3Ce14+WF8n8o0pLY
	 roZxoTBmndDTQBAXdryTV1lpu/F+Nyd0byTwsCVOUH7tCrWew4ktWO2fOf/8fCWCIs
	 zyYUEgOOCFzEw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 31 Jul 2026 01:48:38 +0530
Subject: [PATCH v3 5/5] arm64: dts: exynos7870-j6lte: set mode 0 as default
 for zinitix touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-zinitix-modes-v3-5-2c8de712997a@disroot.org>
References: <20260731-zinitix-modes-v3-0-2c8de712997a@disroot.org>
In-Reply-To: <20260731-zinitix-modes-v3-0-2c8de712997a@disroot.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Srba <Michael.Srba@seznam.cz>, 
 Linus Walleij <linusw@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_131951_018910_85080E3F 
X-CRM114-Status: GOOD (  11.81  )
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

The ZT7548 chip in the Galaxy J6 is actually able to support mode 2 (the
recommended mode) just fine.

However, the downstream kernel driver utilizes mode 0. This creates a
problem in the aftermarket world where fake touch digitizers only
implement the bare minimum functionality, as used by the downstream
driver, to compromise on cost, which leads to such chips implementing
mode 0 only. To ensure touch works on those devices, set the default
mode to 0.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
index de30d0970336..bd8f798c9810 100644
--- a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
+++ b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
@@ -424,6 +424,8 @@ touchscreen@20 {
 		touchscreen-size-y = <1480>;
 
 		vdd-supply = <&vdd_ldo34>;
+
+		zinitix,mode = <0>;
 	};
 };
 

-- 
2.54.0


