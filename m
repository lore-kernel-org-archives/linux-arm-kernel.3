Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75799CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BPOBPfaBOIERCGNPLoOShLjN/VoHaXMpNeHByEOlGTM=; b=4tW75LTqkJsmVg/GK/1WlwJnPY
	MkYkSuKHZShSjuMFAI5150h35Y7fC7hvR0HwLeDWHK6PtE9AhJO/alp67wCHz5Ur8pkFJJ9N26XXj
	Pr4zhWVsECt+ZdO3uxFxRQJU3cRmf5bIVhISMt+2kotM8l1yarlemGcVhTD9RJoSj5Oyb+OGyBevt
	ZXXxehTQJ+TXWBmh34XJgVkEe0DvhHu3lqMWPhY/2o54+y+FttF7OSodChBeppKkr9Vnugh+QFfPi
	spyDq6xXVtECG3AO2G06+KDfX+nRJeDCe5NV0fZ8Y9e1ac0dKCpfjQcd4OhDnnnkwLeF6kdnYnD3f
	55PH6MIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uutqT-00000007uij-2zVA;
	Sat, 06 Sep 2025 14:24:49 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uutnh-00000007uWU-0P4n;
	Sat, 06 Sep 2025 14:21:58 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b4c6fee41c9so2344597a12.1;
        Sat, 06 Sep 2025 07:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757168516; x=1757773316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPOBPfaBOIERCGNPLoOShLjN/VoHaXMpNeHByEOlGTM=;
        b=VBIAZ88cQZ4KMS6lWQPzcm+IyXNwgnUKUm5c6Ixen98XOSQ9/bqbPm7H7XZiCgFh/i
         IbAO3uaEiPPyjDmaV0sZ8YLA3Q45btjpAwIwqCJjPewyOE3X94pmgmrzhHq1lous8aJ2
         WXwOQo8ZEv8WbVyi0CNeqce8aKr0NBG1DBYYhbhIjyTnIYzPdiwowrfkqikFagHC6HwY
         XdaxKeMIXddRnCkrMQEayiQPwIgOyowT7gfiENnv320fZ7fA9rvX3h2MiGTM9a5TzdKR
         h12ZEI+2dGQ344DT7tbshv45u0o3EstgD51a1tE4+5g5mBW1BdcUy2wccJ31SsqkvONQ
         4KIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757168516; x=1757773316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPOBPfaBOIERCGNPLoOShLjN/VoHaXMpNeHByEOlGTM=;
        b=YVw7Yv4DefBSfu2YnVsV54hrwXietNHqmwBAfy463POG1tnq4DmA26/kEFV2QzQMev
         L9OYCE23uHN+kG03n+23XZTjcOw9QpTMlm53SNs4MdQhkudats6e68AFZhDJ1dqHc0dr
         zxydBBONaDLpXDfK8UekakwY14zlNaTOciFk5IVUKruYWqitdWOw4NrL7TVv1/ewnVww
         cHVb1vbZZjLHbZB5FxSEkjtMnOPcS4Z9LtTWwGKeO6HVXFeFL6eNqKHmuX8eemz7SRrh
         fKyQ4hijF4Y/QA/TYZy1kOU4n4Df7VBc07O2qUSC54eT1+2XG0WOIqnXDL86rG/YED2W
         XD6w==
X-Forwarded-Encrypted: i=1; AJvYcCUUIV3ghGm/ChBThqr2aasm5wSt461woRQGqT/XSvqbrTCF7BRssRXwTHGVX0PLcDm48WCTtD7gQjthXAqvDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjYwrWQXFzdxlJ8w0ZGtWX2QuZqIOMSA5uLaXan3YiIg3H+7ga
	spdEb1uBDh2CZ/lX/bDesfGWZmUPnZ87werx0F0kx37UZDdL8hds4/zB
X-Gm-Gg: ASbGncuwY2EmfkNO0jSFCjrJOYV3+IVcT6qh5tsMmbN3VfyPrFUs83tDwMQSVAYEY6G
	SzLzbsiukIM+ka8xFIQV9x25STFv7dBfwW6CkHjd8lR3n1K5H8bAJ6i/53O9u+4f+Ngn2UL5qRb
	jKrFc/hConDHxD+F0TluNgJubcHroGYOyz9FMhRb/EFtdcLB+JnDxRfpW6R6IRrva/iW4tlhbO0
	ugTOfb2RFCYyWn0fQwCnAml+/4lznh8NmEVY9ONJuAEznIoJuKJiv8zcZCjpmJP6rfpsGx5zAYq
	97/anRX0gf0M784acnVXbpqjiUUfDEN2q8O6DIQfylCpDkhpjaA9z1ZlJ0B2ijDAnfqlJc4muMU
	tapGjrG4GOxewv5/KphsjmDk9Ue7krluM9LnwTOkPoQ==
X-Google-Smtp-Source: AGHT+IFkrP5dlF9HUPo7WpPFbiPuovQaEgyUiSeWaBKpepMZeU4dQipBUYLMjANFy1meGzIQ6VRGqQ==
X-Received: by 2002:a17:902:f70a:b0:248:bae3:ecfb with SMTP id d9443c01a7336-251738cd029mr34257925ad.59.1757168516069;
        Sat, 06 Sep 2025 07:21:56 -0700 (PDT)
Received: from localhost.localdomain ([240e:3a6:1c4b:13c0:db95:4539:1490:64d2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b14206426sm128267195ad.17.2025.09.06.07.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 07:21:55 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v1 1/1] soc: rockchip: grf: Set pwm2/xin32k pad default to xin32k for rk3368
Date: Sat,  6 Sep 2025 22:21:25 +0800
Message-ID: <20250906142125.7602-1-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_072157_157321_3590FE4B 
X-CRM114-Status: GOOD (  10.88  )
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

PWM2 and xin32k share the same pad, but some peripheral need to xin32k
clock to run properly, such as tsadc. I have observed that this pad is
used as xin32k by default on some existing board [1], so it maybe more
appropriate to set it to xin32k by default.

I also tested it on another rk3368 based board [2], without this adjust,
tsadc does not work properly.

[1] https://rockchip.fr/geekbox/Geekbox_V1.23.pdf
[2] https://ieiao.github.io/wiki/embedded-dev/rockchip/rk3368

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 drivers/soc/rockchip/grf.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/soc/rockchip/grf.c b/drivers/soc/rockchip/grf.c
index 344870da76..c0c2ec1296 100644
--- a/drivers/soc/rockchip/grf.c
+++ b/drivers/soc/rockchip/grf.c
@@ -98,6 +98,17 @@ static const struct rockchip_grf_info rk3368_grf __initconst = {
 	.num_values = ARRAY_SIZE(rk3368_defaults),
 };
 
+#define RK3368_PMUGRF_SOC_CON0		0x100
+
+static const struct rockchip_grf_value rk3368_pmugrf_defaults[] __initconst = {
+	{ "pwm2 select", RK3368_PMUGRF_SOC_CON0, FIELD_PREP_WM16_CONST(BIT(7), 0) },
+};
+
+static const struct rockchip_grf_info rk3368_pmugrf __initconst = {
+	.values = rk3368_pmugrf_defaults,
+	.num_values = ARRAY_SIZE(rk3368_pmugrf_defaults),
+};
+
 #define RK3399_GRF_SOC_CON7		0xe21c
 
 static const struct rockchip_grf_value rk3399_defaults[] __initconst = {
@@ -175,6 +186,9 @@ static const struct of_device_id rockchip_grf_dt_match[] __initconst = {
 	}, {
 		.compatible = "rockchip,rk3368-grf",
 		.data = (void *)&rk3368_grf,
+	}, {
+		.compatible = "rockchip,rk3368-pmugrf",
+		.data = (void *)&rk3368_pmugrf,
 	}, {
 		.compatible = "rockchip,rk3399-grf",
 		.data = (void *)&rk3399_grf,
-- 
2.47.2


