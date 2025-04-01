Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD07C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 13:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EyDNMW9IBuY8jRB69DY3fJHCsQyLv/GHW0iXNqQGDTc=; b=yVOBn6riu0NaEA+N7Yg2gc19eF
	uNcQX7gOzS7LfMpM8mCnB/gwERrNvI/TC5rxzlVvpsFcx+yBV3B7AffPxC3lW/FcICRXtVHNz1wOX
	G+TXlh4HQy7sUYlJsOK1kpstoWHSVSJyybWun31+WiGD7/xF0fg6TpR8Mw4x27pbDjXGzbfeX2r58
	4LBSVC5TQsJjwyNa8Mc8pILvVq1GLQlK5vYtXS6P8ZrP5erTPZ+APHa3F6sVJOQ/JGLJl+cdVaV8d
	xDISDJiVogrwg730xViO3Mb7NuAiNL3xLw3z2Y9HVeAYansI1LTWwbFylvzO7QnMeEO/6NAjRKIko
	gHXVqZjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbdo-00000003Qys-2smx;
	Tue, 01 Apr 2025 13:26:56 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzbah-00000003Qgt-055S;
	Tue, 01 Apr 2025 13:23:44 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-223fd89d036so116943005ad.1;
        Tue, 01 Apr 2025 06:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743513822; x=1744118622; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EyDNMW9IBuY8jRB69DY3fJHCsQyLv/GHW0iXNqQGDTc=;
        b=UTvot4iMOdpU8d4qo9w4hRP1zi+TmLf2Re5bqK+7ZTMCsE+HwWAb0KwKOoGmmkgyAz
         zns0/FvJmR0B2pBUYa/7dOwgaLNewHKjJAiPzVZWZDkDfilva25fewoc/mNIxLSfAJNu
         V1MFBX7H9bzReR9TRj4xZxPCWGDqDnoU/P3FqKIhiym4RaI0RmdWkR8Yawicv64uerY6
         Z5BH+kYoQjjh/8VXZBMFjvOyr+xyvUt0Ml5LRgRLnKZrW9PzRa/VfSvhdoJOD+nioGEv
         GWu1/lW2FjhMD8VwFMobVcmmE164OzFsBfmems+YVDXppJ7OnaYxN5CGBnpFYMbLxIzf
         Y6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743513822; x=1744118622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyDNMW9IBuY8jRB69DY3fJHCsQyLv/GHW0iXNqQGDTc=;
        b=anhINZue2GO6+/qxe64la1YIztYSu7GntqoxnwBleuP2T6S/bv+xybxqfhqtlDD+FP
         gYNLmfNqW/b/PRQFT0x9Wo6S91AiRuZ3044/srjsR83A9FfPAsGPo/XtgNVNoActr/Qm
         9DIOuPzvyZCBZ2vahK0SSjXdeYAQnxmaKzjtKcFbGpALsF2xOYaDkHbousprFxlCBm/B
         Igu5qWOtxpYwxHF5EiAQojsyY6RHZPSEkX5pBJypYKtDOzVpK3Pyu60xjda8OqxokEfh
         RnhjNQZrbnTU+u7Zci1oyx2ziPTNKTKIYwocL5mYxywuNHP/swMoZr/sEJiRcwBhOsxD
         CN0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuajrnO/OB6jBEFwFGSxcKmPHa+wg4wEUlPemgsnYPzw/GSG20XVOu1igFKxtENITJg24ytXXFhnW34D5qLb96+g==@lists.infradead.org, AJvYcCVfpOpSWmD8Kz5rM2/c5EGbDtrBTQ+20xB+V1gSVETVpQm6OgOLQbLLLC7fFEv65Tp7rOZXqDYOonEc8Bl8jN//@lists.infradead.org
X-Gm-Message-State: AOJu0YzSmO6I+SR34Blz/ar2BxcOJbEmMQ4LE+K8LCoECDBlAvIfnUe3
	Jd6uq52YPcppnV0sJlUEMaAVjL5akMR/6vwPArOXQN4Ryd5q4uvh
X-Gm-Gg: ASbGncuCR7ZIJesB+WIhtIlqxZlhG/n3QAGl+wCpm5X4lPb8JRkCx0o61DmKPLExkWK
	zSYJ9JuwOyXEEeVT9T6H2uizBiNmaL0A+kTxJSKYnCJs74JDRc6uqxUZgYVBGzlSR2qWDF/vev3
	2ZR4nAQbO2mPJes8m0GAY8Y3EU8jrm3P3BPasCaXmshJEH6w3+nohRo65G94KwNiVJcvp3w6LWG
	I1n1ba+Cg4jhoDm5f76EV/q3FYhc3DNaRAuSOcRANaYBkZW7gmDAQbiIxUCwwVqU6VMNy82FIAi
	67kGGEEadEI/ft0QRe1ardyu6o1hZQtrb8Z3wYPXOKMH0zVdPhmPDIzNP9+sV5APXzak8tU=
X-Google-Smtp-Source: AGHT+IEd9GQsC4GBsA6T7gbOkBVQnrLNIkIyEnQBb/RXdcexhSvAxnX9gO7Xk2mjUWmPOHqdw1MCaw==
X-Received: by 2002:a17:902:db01:b0:215:8809:b3b7 with SMTP id d9443c01a7336-2292f946440mr203250275ad.7.1743513822231;
        Tue, 01 Apr 2025 06:23:42 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eeca1e1sm87901995ad.2.2025.04.01.06.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:23:41 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	dave.stevenson@raspberrypi.com,
	popcornmix@gmail.com,
	mripard@kernel.org,
	u.kleine-koenig@baylibre.com,
	nathan@kernel.org,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v1] clk: bcm: Add NULL check in raspberrypi_clk_register()
Date: Tue,  1 Apr 2025 21:23:24 +0800
Message-Id: <20250401132324.27312-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_062343_055972_74600DB0 
X-CRM114-Status: UNSURE (   9.46  )
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

devm_kasprintf() returns NULL when memory allocation fails. Currently,
raspberrypi_clk_register() does not check for this case, which results
in a NULL pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: 7dad8a613185 ("clk: bcm: rpi: Give firmware clocks a name")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 0e1fe3759530..720acc10f8aa 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -286,6 +286,8 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 	init.name = devm_kasprintf(rpi->dev, GFP_KERNEL,
 				   "fw-clk-%s",
 				   rpi_firmware_clk_names[id]);
+	if (!init.name)
+		return ERR_PTR(-ENOMEM);
 	init.ops = &raspberrypi_firmware_clk_ops;
 	init.flags = CLK_GET_RATE_NOCACHE;
 
-- 
2.34.1


