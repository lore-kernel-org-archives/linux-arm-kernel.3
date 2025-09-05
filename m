Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BC5CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 03:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfJfdss/38RSY0RTrYoaMq8nr7FJ7yMCmd7sDXOBIE4=; b=LKl4qxWeWLiJl322LuhDtBgdim
	Y5vYv/2ETGyxqZfSpEyfcs3EjPbEXZYFsU8twn/V9wbbbu90/NjRGLBw2AD/w6wh9T6lW/67xLYGX
	x2bcMrzBxaMXg/BGx5sRDd8Q7zzroMDODiwkDky8BarLSCYznOgiaz625pdC6ibPNUyxNBqEAvcdg
	woKfG6vm9RCjIf0IWi3LPY7fg63WvLDT+4ALWkkKCrlLKNrmyR9lWf71incXDjvucJWTgqvI0k8Bs
	qvt6ySV8fuDBS2JC+bVFCwBLOkh/CXGgodkdcQIBq4Pb/W7+vpEMs8EtnDxblp/8O90N5F6q8BiIv
	wkgvSblg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMwC-0000000GO7h-3K5E;
	Fri, 05 Sep 2025 03:16:32 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMdj-0000000GIPs-0U4b;
	Fri, 05 Sep 2025 02:57:28 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-323266cdf64so1342564a91.0;
        Thu, 04 Sep 2025 19:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757041046; x=1757645846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfJfdss/38RSY0RTrYoaMq8nr7FJ7yMCmd7sDXOBIE4=;
        b=mU1X1X9E8SoHjNKZKWjUpIkmPkYjKWwfiulpBI7/riMxWGm1eRiy9QzHdKDino6sEQ
         56bTMk8aw9iJj5R1eNDxP4+H0+mfWRJmdsrxwtD83rwidGGqpL1bmoZ9CX3qYIVLNutJ
         3i9xLaKaCy3z6/rho0Lg10TMQM6CPuPDW3FPsuzShmX1bO2oVg+SzhtXdTCYREg8oYQe
         cpzEM+NSZdCJ+tC5xuYOwevcGjfULHDNLsSV/WS+Yzwk5UswHjf5GwRlSjIcpvj5LwWL
         mSRCigTLVIQ0s46lnOVp9C0spC+ZY/zYSYdr1jg4ay+pfABd0+uNARpaja0zChbi9Qw+
         dVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757041046; x=1757645846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WfJfdss/38RSY0RTrYoaMq8nr7FJ7yMCmd7sDXOBIE4=;
        b=ZE6raR/E+CYxlVYKaE9D96xcEHBSS2hvAwiW/yH7O3H0sYXRN3NbS76FStHqXAoKXt
         jwBGUhmAWWH/ZSF/pevSfh8gDTuQB6ninbByiKh1jK19/M8tWgsd8M1vaXYIXTYfKbW9
         lp/J0cSTd9kRRkZ7oMRc0GSaeDkNe4eq2dmhbVfZ4+TKry4lXaCozTYARbot/VGCJ2R7
         34tA9Rg9htLDEdF4l3/noOEAC1pA0pbHcjR5x7zbg4TFiP/+FJ1o+5VaPSSYKDM/7WQk
         HD5/CsSd75FCnMhO9gPllFPyL6JVVXMp+JnBOi1JJI1NJlfw4E7ehaAL690GZLuI93M8
         u95Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0QOBBmaVRyjO4L7p7DHHmHwDLKqWicNGH+8Ljg32FjEmCObYvYXgHQ9Jw1h/Jg4BIOrkoH3SlVxihgXl5iYyD@lists.infradead.org, AJvYcCVhGIQ9rEOCa7CRheVoKgELQGKecUnsHFgqvQOv2s/UKzk8zemJnCZp/+4vZLwVsO3mvC2FkEM7to0asqRd+w8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo461XCuAubhzseIK2b6dMca0RBLrde+EwCyFcdB2CbB3hKBq0
	3ur8q6dyGgeDSQBCpk4iOVMGSZlheULM1pCDd65H1VLPoZixwT9uxjB3
X-Gm-Gg: ASbGncsYyAWPSz7YGn8c9qXPmCh5BkiWckFBaZtEOMOGodHca50f9jR3eGpIr9JlHtn
	rzvdK6V7gkwc81R3n4cmLYzc+VXbmS8lHhYVefuumy4xr06hVhE+4iQPqjK/PdwongXhLP0PhMB
	a2fvItz859D/CkSfPTDK9owGNLU31nGfCA/v6cEKYygQdMLbAegwyrSoTWSfbH8gLvJHTy7uqHI
	3dXmrLQbfcbdNLDx9mrt+P09F/9eTvQRPqGYYGU+/cUYCqX/XL9azScss2VGMkzTWtO/JviFgNr
	ngFR8BkrFviKGQmuTU7ROGUVNS1KyVPJ627BezIZV8p20clT6q/z3b34NZTuIhEuZVbfZS7I45x
	9419OFnellAiO+Wpk9we4kA==
X-Google-Smtp-Source: AGHT+IH6KfxiNdSMUP/BpJqmlXaqQA2mXpzUuB8LyWMLU6lfm6qdp3trN+zpO7M53Lc1wJ4tYGO6hQ==
X-Received: by 2002:a17:90b:17cd:b0:32a:e706:b7b6 with SMTP id 98e67ed59e1d1-32ae706be21mr11175451a91.11.1757041046306;
        Thu, 04 Sep 2025 19:57:26 -0700 (PDT)
Received: from localhost.localdomain ([2401:ce20:10::d4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329e1c8e07bsm9428588a91.4.2025.09.04.19.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:57:25 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v2 6/8] arm64: dts: rockchip: Add D-PHY for RK3368
Date: Fri,  5 Sep 2025 10:56:30 +0800
Message-Id: <20250905025632.222422-7-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250905025632.222422-1-cn.liweihao@gmail.com>
References: <20250905025632.222422-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_195727_152456_E9E64178 
X-CRM114-Status: UNSURE (   9.66  )
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

RK3368 has a InnoSilicon D-PHY which supports DSI/LVDS/TTL with maximum
trasnfer rate of 1 Gbps per lane.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 9761dfc88..60e982a3d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -883,6 +883,17 @@ vop_mmu: iommu@ff930300 {
 		status = "disabled";
 	};
 
+	dphy: phy@ff968000 {
+		compatible = "rockchip,rk3368-dsi-dphy";
+		reg = <0x0 0xff968000 0x0 0x4000>;
+		clocks = <&cru SCLK_MIPIDSI_24M>, <&cru PCLK_DPHYTX0>;
+		clock-names = "ref", "pclk";
+		#phy-cells = <0>;
+		resets = <&cru SRST_MIPIDPHYTX>;
+		reset-names = "apb";
+		status = "disabled";
+	};
+
 	hevc_mmu: iommu@ff9a0440 {
 		compatible = "rockchip,iommu";
 		reg = <0x0 0xff9a0440 0x0 0x40>,
-- 
2.39.5


