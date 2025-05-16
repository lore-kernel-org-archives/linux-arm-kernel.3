Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37A1C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 07:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0bZtQnrAbigRgok22yw4g3798mI7fLMxITNSqQuTVaw=; b=TvoRvWIdCZdCJ3OrjhVD4JvdeW
	+1Bug0OsOFtKmp7ksamBVqBfLisyuPdMPoM8zf2xFSR8E3m1LB58sX6ys8P9stXC0bJkgxIgY2Zni
	vEk+6mqc9g4uNUQ6FDbszlB4nr4B9GjH6n7ovtDby91iL2nMv6lrQ6XOAskUwbJlwNEwUHowacu+q
	9NGlRRBc5lCA0+VElwv/yhkUmNYmeeFV6KMMybKBckEFiFVZ/7cHcUw+0I3kTANjlFzZWeqSTLiYI
	Gopk1UodWGBGuyCVR4FyWoiK6DuesNfcqwrZBcZNceSXlLb9eK8Y6BXuT31VxhGCmGL4VcAX1PGuN
	riSBfTGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpPU-00000002eY0-18tO;
	Fri, 16 May 2025 07:23:12 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpNM-00000002eOr-0I1v;
	Fri, 16 May 2025 07:21:01 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22e033a3a07so18705765ad.0;
        Fri, 16 May 2025 00:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747380059; x=1747984859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0bZtQnrAbigRgok22yw4g3798mI7fLMxITNSqQuTVaw=;
        b=DWXS+8fkSh8H4l2Ul4KcvrfxaRPynwBc+8N31l9iogoVY0ZVCEWmtjGSDcP7IsXe1F
         YHQ0ujC7324IdZTw2pjJgmbumTuIlMDQF6p4AcfDnPSoXMdLHfGI5Dbodntn1W+jl+MH
         Whxq5H5NzRG0OxXEltuslaBpvftMSmc1T8Hra1zgIzKa5j0X/40LbOFD5f6l9bG/8q2P
         fziDXMdcKXxNuG4wY7JNMqRvtnNI5gnTGt+S7PcAUt5Tfh6PEmW4aOoMHu4irKZolVcz
         OFIKaFhR/tn+5U+xCgjTHPY6lKkRZuytx1lneUvyKTmQG1YSczcvkUsMsYVsomfklnC8
         9zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747380059; x=1747984859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bZtQnrAbigRgok22yw4g3798mI7fLMxITNSqQuTVaw=;
        b=WnRKxS0/zB6JbwCR5UAQ3+f9NGFJNzqptKAYhpJEA+RMU4FSNNZ7EDkv7FJuiM9ull
         NVdU2bgoZngnZXvqIKPmGknKCHBXDJnhZAmzeKfju6JcM4k92HTwbRRguMEpWymtf8mm
         FeNr4mp7Mn+Zxa07yE89qIE6fbRt9IkHSdNeqspB9rCU/14ujZacJrRs1WIAL63wC/eN
         jP3DkSYjSbxaj3yVerHsNVAPXsEa3x3L5wKfYsEloDYM3lpPgMhgELAxJ8BsVVontPXE
         pkI5AvNnh6YmqpYcsfGfxX6lliWcu6EpXcXbo1zYD1CxQqW7qOkTtS1EaPMHYH5L3Va2
         a+/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyqSDiAhR4Avj1e3eWdKGAeKWpfSpZ+quZK9time+mMRMhAACEbktc/ZQJppMnG0zrS64UtIhbITpBMZnfbrer@lists.infradead.org
X-Gm-Message-State: AOJu0YzRJ0orQCRVMW9PtMb84ZupdwfUm/ANV52TL2Rog20XlE1u/t1G
	BpK/jC9B2VbnGYXq4vysNSLDE9LSsesDmCgTNNzmJ/IXuB5msZEO46ESikI26MvB
X-Gm-Gg: ASbGncumjc7PlT3B8LsmP0I74XMNV4dpAewYDe7xeQM2RuUa76XZXiqEOh33b/97fdJ
	w7/mjp20b7nKpCyh/qyZxAwN63e7a2b5zrFXmjW+srGaARjvprlavQOxoyxLvf6DfQdPOySDcpX
	pDtkjtgQlCA/mbPG1oBsMrhptbAKWsQ2alSSWpan07x6ZrW5xqPkqb8SVidgOvYwBJG2DXZ9Oz1
	GudYsB4H4n2OY1k7A/a9hqskHniRJ0soJI/192vJ1pBAoeUAzQ8afmvpQDNzSWjgEj+Hb/+nDAb
	BUyuq/DcKZUXpBZWXtvtSLNN/5khOR1DPBJOTfyv3uvBVpkbtEnbbt5QfZjRVhcLG7nWLT5wFAa
	vSWPkJhSemj1FAFaWlRlX
X-Google-Smtp-Source: AGHT+IEHgegbY/RBwhcOsjlIgozbZNU96udSDFfRZZ7XnQaa466la0CQFAVhXq7j400HqayyRJK7Ag==
X-Received: by 2002:a17:902:e80c:b0:231:ba23:c7e5 with SMTP id d9443c01a7336-231d43d9be2mr23575485ad.6.1747380058519;
        Fri, 16 May 2025 00:20:58 -0700 (PDT)
Received: from fletcher-beelink.. (syn-172-090-047-185.res.spectrum.com. [172.90.47.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebad0bsm8498385ad.196.2025.05.16.00.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 00:20:58 -0700 (PDT)
From: fdostie@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fletcher Dostie <fdostie@gmail.com>
Subject: [PATCH] clk: rockchip: rk3288: Enable clock rate propagation for I2S0 output clock
Date: Fri, 16 May 2025 00:19:58 -0700
Message-ID: <20250516071958.837174-1-fdostie@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_002100_108008_9C738550 
X-CRM114-Status: GOOD (  12.08  )
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

From: Fletcher Dostie <fdostie@gmail.com>

The I2S0 output clock (SCLK_I2S0_OUT) on rk3288 SoCs was missing the
CLK_SET_RATE_PARENT flag, which prevented the clock framework from
properly propagating rate changes to its parent. This caused the I2S0
output clock to not function.

Add the CLK_SET_RATE_PARENT flag to ensure that when the
I2S0 output clock rate is set, the change is correctly propagated to
its parent clock, fixing the I2S output clock.

Signed-off-by: Fletcher Dostie <fdostie@gmail.com>
---
 drivers/clk/rockchip/clk-rk3288.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3288.c b/drivers/clk/rockchip/clk-rk3288.c
index 90d329216064..0f24060761ac 100644
--- a/drivers/clk/rockchip/clk-rk3288.c
+++ b/drivers/clk/rockchip/clk-rk3288.c
@@ -364,7 +364,7 @@ static struct rockchip_clk_branch rk3288_clk_branches[] __initdata = {
 			RK3288_CLKSEL_CON(8), 0,
 			RK3288_CLKGATE_CON(4), 2, GFLAGS,
 			&rk3288_i2s_fracmux),
-	COMPOSITE_NODIV(SCLK_I2S0_OUT, "i2s0_clkout", mux_i2s_clkout_p, 0,
+	COMPOSITE_NODIV(SCLK_I2S0_OUT, "i2s0_clkout", mux_i2s_clkout_p, CLK_SET_RATE_PARENT,
 			RK3288_CLKSEL_CON(4), 12, 1, MFLAGS,
 			RK3288_CLKGATE_CON(4), 0, GFLAGS),
 	GATE(SCLK_I2S0, "sclk_i2s0", "i2s_pre", CLK_SET_RATE_PARENT,
-- 
2.48.1


