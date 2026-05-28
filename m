Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BC2CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 20:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yDIXwe3ooO105k5CTV06eh6doyUKsBOeZuBsSpw25Kg=; b=Esdzre+adxE8GNZ6w5qrXkrikD
	smBwZhVJWZYZqlteISeT3I44liqUtsyF04G8LDM6yRB1QrSthMU1Ohbcfk5qQOs732FLswCSZrbng
	TEZSvJx83quziFvAS/QA8M5eG/L3jZwAgzvFM6TLOy7zjiwnY9LysbIcmjDKvRS8nAdFeO5IgOylg
	0/ToaGgNCQBchgnS+Uh1O02NVAzZPtwwLhogeUW9J/e8zLN5kcTkYl3Gc4lcAtZQhEFW11ru8QNOv
	Tyys4KAvVEJ6gUeKgAwTWo+J8ybeY6CzSBPgURYKzx/Hf83kuRbKD+1KQ7M9lropwU4N9xHPiR7m/
	GKpaPmJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShNE-00000006M5M-2qdP;
	Thu, 28 May 2026 20:30:36 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShN9-00000006M4k-3edb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:30:35 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2bf02708e8fso8931345ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 13:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780000231; x=1780605031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yDIXwe3ooO105k5CTV06eh6doyUKsBOeZuBsSpw25Kg=;
        b=baOdDa1xDcXcMoge1f8K8evD00gfLtyN/q7yKquBadGXyAWmHrC8ZluwYTeve/Kiqh
         5RTPDlxNceKE8k3HjkhO4aVWz8hhUmnQ1RtCul6rZyXDtG5Lhz7f868DutR2V2dHBQGq
         xXDsPWeiPVFK0trkD6l+FX5212jLc3KGtaeOXutE1xd/DbtFuxWD2YyfsSvgTIBWYfRX
         I4QJ/jQfb3i5+yTf5BreT5mEoh5jtoUxCXRq5CTIXuv/5ubu5zJV9+kYvyyCzIM4hHVm
         vV9PCkGWSrBmwGkd9KjZHDh1sUFQhoOBRddiJCtPDXiyQGS+njbMNArHw/iPEcYQe2NZ
         w9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780000231; x=1780605031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDIXwe3ooO105k5CTV06eh6doyUKsBOeZuBsSpw25Kg=;
        b=kyGnKOYh9HVxw8yINqgOOdS4FHt/3xk/GLGOMS449U5M3gRkgr9ER2M99esNp5uP20
         NPThrHOfeQgIEkNlNqUFoU0QtcLLR5Vn1+mD43mLJ2MRBwTmBTi9w9XOrtMOvBtFeh95
         /UP/m+57ANtQ8RvgEcfprW1HfXmzTnWT7oAzYMqux+vWyJS82BZBF8sdh9c5lwemkBOC
         e0JQmIK5fYC3olTTCkyNcdFLjMwRIYzO/dCkCLo2SxJQIftxmMxsSbFS7ohok0NXQAKu
         NLramZWWPPDXTB43T7ucStlTWM4R+jl9uvVkgWYqkABceGrIJuJWkPX/shbMJ2r/1knt
         XECg==
X-Forwarded-Encrypted: i=1; AFNElJ8uCQbXPp2Md3TTGePXv2l/hKGbJpZw1FJ3O8yYJPD9z6OX9LNl7DNWx7fV1Mpg3zcmhsP0lunn1hAUGi4oNiZR@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb3fFcCGudxusFrPPlDqzXHOCf/lkWjcTgGaCEcEvxM+tnLmdY
	4RqeKzZtCnMVGlA7aS/DbKkisdan+qz1QwSC5c6Jl9OdaGV3G8uXYY5d
X-Gm-Gg: Acq92OHsZ4o7yuvgPEr54mn9o1EA9IoRrFUDgnDi2s2P2/olV0zdk99exnO5ipc6NIs
	vJe4Ni/7EvJ2HYRzSmm35Al+4K23jGLeqoTjbCW2tp1syquRHcpTaYuemC4BBYL8VrPALV4IMOK
	rbypVTWHYbQBiUWXX9qJp3kgu6eKoORXoK5HlobuoGv3QS+yRW8szHxaDLylVfHOwaX1OKcjS6T
	pVn8PhyR1o9IFSrcm+CqHB+Jm9cFctlB1dvYa4fSbIz0WI9kZtajVQAnZgSuNTkX5QIzTqpydVV
	rAGpAtXJfxw7ta2C7vd0eZJ++CXgf10dHxzBnuWd+GCVL+3w4Hzt7ETzxIZW+xBn3yi/v+O2knM
	SAbVO27rDnVB+NYveiCtGP/VmcH8/z0EBhLO8Xc+BrMPaZuUO79OW9OD80aeRIbZPRIfzG6kyVl
	c0cfQGFCSl4kdmcTaAZug/R5cF9Kgca7WL61E2HmR84nC9AFJld9AZSAtdbfYWl5YIbm5cIZ3E2
	J8/xvSY49CdVTCCIcO/j8gVeQLJWZSwn6bDoHuwS1/Nvw==
X-Received: by 2002:a17:903:2347:b0:2bc:d1ec:9f09 with SMTP id d9443c01a7336-2bf1ed5e4bamr3535035ad.40.1780000231091;
        Thu, 28 May 2026 13:30:31 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf1e604dbesm1786475ad.25.2026.05.28.13.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 13:30:30 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCH] serial: mxs-auart: fix 64-bit cast in probe
Date: Thu, 28 May 2026 13:30:11 -0700
Message-ID: <20260528203011.137338-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_133031_905564_DFC78EB2 
X-CRM114-Status: GOOD (  12.23  )
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

of_device_get_match_data() returns a pointer. Casting it directly to
enum truncates on 64-bit platforms. Cast to unsigned long instead.

Fixes compilation with W=1.

Assisted-by: Opencode:Big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/mxs-auart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 697318dbb146..de97c0f74e7d 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1598,7 +1598,7 @@ static int mxs_auart_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}

-	s->devtype = (enum mxs_auart_type)of_device_get_match_data(&pdev->dev);
+	s->devtype = (unsigned long)of_device_get_match_data(&pdev->dev);

 	ret = mxs_get_clks(s, pdev);
 	if (ret)
--
2.54.0


