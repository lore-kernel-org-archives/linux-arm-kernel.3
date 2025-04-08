Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284F1C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 06:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P1ZXUlXFpxCk76Zskk3n3ZWQ72WfXAgt8H3OlOtqE54=; b=gXKrbLZGeVj/oKqodLHKhM2IBs
	a+VuR/Oo78yjiPhvG4KnicQ9/syH2GJx9HgqLovjeggITls61Uwwweb5JXsBCOhOT3lqJaWBYZw45
	cMnpAXGIOIaq9/OOz3AYRQRf8jogaKQJh3loQjOEFKebP+eH6y59teOCHURK37B3W2SO4ZNCrwLQM
	abJ7NGrEomD5vbdRK0N1UGnMt0DPJM8/ilSv68a2W9QO2H0QvBglhL2Ui0Rux82HDOvzSPXrPahHZ
	TyE6AidU3ZYoucQ8YsYh8LqRJAfUipBmTJXlGyZod4zK7lucU52u5qlppy0wDqPuueNamP1p016kY
	sgpi+iyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22lQ-00000002xL1-1xt3;
	Tue, 08 Apr 2025 06:48:52 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22j6-00000002wz4-1AJW;
	Tue, 08 Apr 2025 06:46:29 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54acc04516fso4861507e87.0;
        Mon, 07 Apr 2025 23:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744094786; x=1744699586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P1ZXUlXFpxCk76Zskk3n3ZWQ72WfXAgt8H3OlOtqE54=;
        b=jKolJHIEsnGcHNsCxWQOptt85WidIW7k1NGD2rsfAalmmpDatQZg9Mz40F/q5L+K0g
         sryObjRNncqR9auxoF0bCx6MgFwTqolBbSZxFubKo/VSiHBTbMWqWiDssGRnN2a2gFyO
         lF/q822BBP1cQnyfMSiffzJovu9XwLqv/bDFz90xiSnIVxfwMnyqHgHmy7UpHHm8pY/+
         i8u2IhPQdKcW4ToGBKW1ZoTbgSc03scPO3c3giFpIHcyVy03h1VYG3gpU5KzsQx+XuqZ
         Zewgcxl9sDPMCuaiTzZ4z/2Crf00U+bTImHBpvZ12yuWo1a+jQqbvOnkSRqid+OSYOZD
         ouhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744094786; x=1744699586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1ZXUlXFpxCk76Zskk3n3ZWQ72WfXAgt8H3OlOtqE54=;
        b=pJzHGdTNCfO+UBDhTG6TbCim/p95CVddzdijF1BPZSswmGDMuwAuTSDHqMUxLATa50
         rAvFLTALczRKkkKYzgG5yAAPPGv2tOFt+yRQPNbIyC1lXf/Q4UQamsp5oITD+5Et7XVA
         LvyIkgZ/I1Hdj0DWD9MYwDrzVzju7legQJaUdDEAeLaRJYUg5162c83kUD9I2H2Pddhq
         XI5KwUTtWrix62k0vyeMZ4tre7nP6vRN+2QrmEztmrhnMZnpzcn4h1BJxzxH13obEwDL
         JWpWPj09h0BIYgG3kG/XTakXs1GUmFcZ1jFEaKfoMYBksbG8fOp3B5jn+6xYH1sYF+I2
         fcAw==
X-Forwarded-Encrypted: i=1; AJvYcCVhTicpZCk2Al5YPMza03KVmI5NzA8qp0B7hdqpqR5sZQo2m7CbFEhRpdnaZVax4Dw7fEZ5B7X0txOUg/sSRQg4@lists.infradead.org
X-Gm-Message-State: AOJu0YwnaLseUQL+r8TQ2uMqZJSW2SDq1v6p21nxQ8f8byT+QlfPKJOD
	p9k9w5uBR7sII/gBdSp2UOfhtaZNp/hrxHUUsoR5Zw1fd2J/i4lgO67xFZhU
X-Gm-Gg: ASbGncvzUsrpg7mkX406WPQLZizjn/x7N1v0id6HMYlbOrJf/kREeV5nOkVF20/3W6I
	g0uOTX75O2uOyb04zbDY/WLKRLADowZf0/yIWhmYeBqlqyRTDj4+17XxCdXwIqyNjFlUrKP1eFU
	BU5PsJ2QCEIhqObY5d2u3F0yQZo8hvZeNMCK+0AunmBCJ7J3AuoMC6dtnK+KxjjCFI930Kq2Ud+
	5CuBI6lBaRBNEkQeAPUn640c6rUALgtABfmndNQ66K+c3n+ZBD9j0M11EGHNBoPt4xRMRdW7jED
	f4DYAkW3Iy48/0t83nyFv+kKTyizJSrzXO9HIVbns+laQ3EeqnzVxWHWBVgJ71wJUm4=
X-Google-Smtp-Source: AGHT+IHgHWsakrfLfhmmiWC4HHmMMPaI4hd/D/q0s+PSgcAGf6f/l/AVumjrJcERbVfKlMMm58iWIg==
X-Received: by 2002:a05:6512:110e:b0:54a:fa47:b2a5 with SMTP id 2adb3069b0e04-54c232ddfbcmr4204887e87.23.1744094785709;
        Mon, 07 Apr 2025 23:46:25 -0700 (PDT)
Received: from localhost.localdomain ([188.243.23.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e63709asm1440800e87.145.2025.04.07.23.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 23:46:24 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH] clk: rockchip: rk3588: Add PLL rate for 1500 MHz
Date: Tue,  8 Apr 2025 09:46:12 +0300
Message-Id: <20250408064612.41359-1-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_234628_312837_FF29EBDF 
X-CRM114-Status: GOOD (  10.38  )
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

At least one RK3588 clock (CPLL) uses 1.5 GHz, so let's add
that frequency to the PLL table.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/clk/rockchip/clk-rk3588.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 4031733def4e..1694223f4f84 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -64,6 +64,7 @@ static struct rockchip_pll_rate_table rk3588_pll_rates[] = {
 	RK3588_PLL_RATE(1560000000, 2, 260, 1, 0),
 	RK3588_PLL_RATE(1536000000, 2, 256, 1, 0),
 	RK3588_PLL_RATE(1512000000, 2, 252, 1, 0),
+	RK3588_PLL_RATE(1500000000, 2, 250, 1, 0),
 	RK3588_PLL_RATE(1488000000, 2, 248, 1, 0),
 	RK3588_PLL_RATE(1464000000, 2, 244, 1, 0),
 	RK3588_PLL_RATE(1440000000, 2, 240, 1, 0),
-- 
2.39.1


