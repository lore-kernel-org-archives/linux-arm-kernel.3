Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08ABC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uD97zpV+wlCAc5Dqa3CJHXuYAasrjMGVcgw8nIaOK+Y=; b=WxWOVxYXXA5WgZ4ZPfYjZDgfoR
	6XIgadvPMu/2vUIyBJhbr0Dnpc2/cp13cq+iIf3Y6d278yT5yhxutaxl4rInoDOdBppRGQBsxaXrc
	HlLhCJ6e2UQt1QQIHXfFR9iIbZRw2O16l6jEquRMoZOGW2CfqcPxLjXsTBZQ6aly1DOkd/EnA577h
	h4SPbGTaoqBM4C7jPZaiQcoY/EGr8RgMGGMGZM72rUKPw4I6eI268QggLB2PaqWxDvtlGsrtzSPjh
	gEK0wZ/qfT5KFQWsWWxaKEGrRTs1481/ERg8i3ALNn4b+iByF7bob6p+yKNtn4ncEzxvAO2KgN90K
	TPxxp7Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvd74-0000000F3RI-3fpA;
	Fri, 21 Mar 2025 14:12:42 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvctx-0000000F0Xu-2S05;
	Fri, 21 Mar 2025 13:59:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso1831849f8f.2;
        Fri, 21 Mar 2025 06:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742565548; x=1743170348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uD97zpV+wlCAc5Dqa3CJHXuYAasrjMGVcgw8nIaOK+Y=;
        b=bnnTj29NSjNuvbqBGdf2KAsIrAhRw3GmeocbR8RsldzDsrUpA5i3Rh8luK2D4MxU/c
         wE4T5H1FSllUwaO/AirAouuzDnU0B95DGLx39g+1REh5UfON2hdLRtXj2vTxg/wREQ7L
         LE/Vop3BKmI7xVfH61Wc/2pGndJ7agEwAYOPkrgbskMO3Rp6l6fzVkUCPdkb09F9ql4I
         vcrHftfWPbaztI5oVob12oOFsLizlkWZ1kginggW4iUSDrvHp55Lu6YXe/W9OjIbziz4
         BKj1UohSJWphEW8/n8wAb3Om4ZfaCeTEosV/rQFMvE2GHXSHsdWoQNTQHGkENjXSUb4F
         kOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565548; x=1743170348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uD97zpV+wlCAc5Dqa3CJHXuYAasrjMGVcgw8nIaOK+Y=;
        b=hU5JxF5vg05zx5Jq01Cl+klZas12t+yddfzNH0vS0+rRsyXaPEqBHG5nFyMoNTjTtZ
         vHe9IO/lHhRa23Xj2F63rj804juNZyx/8E14ZXFc8YXBVSTE83nPWLAZ1qYMV67Axqv+
         4gwboqhi3xHH5GtvdrQwOnEdZ/Pey0V2tnOGJK2KvRmWtEErs8Xy3n9nlNsgLrEpmdYv
         CBvYI9kxaKTObDzn1UeGiCK1c7FaZgvnskTvrvsSnmtNTneisi9/KUPSV688RZaflxit
         TmBnmYQ6kLW66oAGUjzWEOsMHwkSGjvqtWPZZFyu8ghFC4Djtq0xG5HqMmEXPmGM1Dqc
         cXVg==
X-Forwarded-Encrypted: i=1; AJvYcCUiPMImquwaxCdsNe3dE55UmnmXuHjXamY6ccIF04EaNyy819SMsaY6o92DuoT1erpLbRJ4Ggth97CU@lists.infradead.org, AJvYcCV7HjsnkCn5tDMvUHVE4ZsuI1sjttTW1ZikTS2wNtNTA3VoZyuJFtAVm/4FWFwWYcwE0hcZmqMqULVeUwRgJtxq@lists.infradead.org
X-Gm-Message-State: AOJu0YydEHLlF2ekb4O92ed9gZLptfuQT6/qAdD13aRIe8ur3lyQkDOC
	Hhj0LPPfZC0lhMIyYT0uFEHbUDET+Vl/pCZPV01GvWZhF9i2OHU4
X-Gm-Gg: ASbGnctSmKbZLPxHWlh0sa/h3Y2HH+SknlX794aP0MDhdGmGuvj75mp09oyf426uRo5
	vEtFYdAyM/hwBxVEc/j/5KpiR7HY94bAH15Ww4g3jcDpGgDGZRQ3M9AKFRbPenuroC8ewRvxvCP
	hX1rccmZdCCfSEmHxQ+qa6qCA+6IYnjiUVooeZQUtHW8t6WUPVw8AIb6/Hsoj4hz1EeJYvive/H
	rXYpWC+nRYVEevJsYxNgIpYRO9TLR00P0iQ1HSQ7jDkX58fb3gyD2XqvZntAssiGE5gDU+ajir2
	Ie66q3Ik9GN2HRsa+xl2gtS9lYZINSZ3AggDgXxs1dNIy94zU7KeBeJsQr9piOACYq5IDpQ5xS6
	hsiK8NBBlurQYjyX2Otln
X-Google-Smtp-Source: AGHT+IHNglCQ4pfTDqUg0F9f2emm3ZLLUSteSk2Ug+yZnhnzh83HDlmHCb8q2+bgezMSK3osOJoQPw==
X-Received: by 2002:a5d:6d88:0:b0:391:1473:336a with SMTP id ffacd0b85a97d-3997f937d76mr3249245f8f.36.1742565547842;
        Fri, 21 Mar 2025 06:59:07 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm2437162f8f.75.2025.03.21.06.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:59:07 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 07/10] phy: phy-snps-eusb2: make reset control optional
Date: Fri, 21 Mar 2025 15:58:51 +0200
Message-ID: <20250321135854.1431375-8-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_065909_622410_23426000 
X-CRM114-Status: GOOD (  11.39  )
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

Not all SoCs expose the reset line controls to the kernel, so make them
optional.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/phy-snps-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 8ccd432a0..1e7e75bbc 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -410,7 +410,7 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy->base))
 		return PTR_ERR(phy->base);
 
-	phy->phy_reset = devm_reset_control_get_exclusive(dev, NULL);
+	phy->phy_reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(phy->phy_reset))
 		return PTR_ERR(phy->phy_reset);
 
-- 
2.43.0


