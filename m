Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3920CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 15:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o2folU0O4bOJirQCG1bT84vwZiHZNPZr+tDe4ocPaDM=; b=faVkvZHmSmSiHdkaRy88S1uXnq
	2fpWVw0G/JlHJQDa4AN78Jelb7f+zJksR2HGMqzuHL75NypVE1TeA0+d1nhuCYnaPolrYKHK09mnt
	1N0+REAJN7JDLbWMjT917PQnzRwB5Xs/SvPx/s30mxIEIo+3swikiEsvjN60p859UCwUb23IiPyPU
	BuVJOJNzQCWhe2xX6U+PGwhXMdVbzhu2iEsReONFFNRT4dSBnj3pIxGn6iyiCc+mV3f5NnyEnWTWk
	37WDehTbQV0SEsizuUAoMvBYJ2iP0aM248w17+YGBnUup6WhVDJ0mUxR0TRS7miqofTwJMv48kUvn
	YSOVw3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHk4o-00000003JPe-3g25;
	Fri, 16 Oct 2026 15:42:34 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHk4m-00000003JP6-1nHQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 15:42:33 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-3514b90bb89so6385850eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 08:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792165351; x=1792770151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2folU0O4bOJirQCG1bT84vwZiHZNPZr+tDe4ocPaDM=;
        b=f1NAVdDnZrYHQ/XaN1Jgonj65cBwOaoyIiHHSnj7wuUBciUkUUgijLVVumBda6BBkA
         27++XTspU1RQ0+9SqzWD6XfCcW/qWc8AS28gs4QxIYOSwLWJZcox5oQBqYmtXtAk5BFx
         MyYYprOLNZ/HTz3PEmmSDtgkR5ixMluv+fJH+yuoYwsHAgBklU1VgnwX4K2aK5gY/fVg
         AZnlyfz5w2W9eQ0CPrW4WbTzO051O/wACp7PIEgpml6WPSohj/hwDNRg8XlfPu6Lk8DW
         /7rlaGyLeboqGxy0WwGFoyKwhDyU48yHXfZar5pkL5up+ghreasDUVEN05xhe1zSdLjQ
         x9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792165351; x=1792770151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2folU0O4bOJirQCG1bT84vwZiHZNPZr+tDe4ocPaDM=;
        b=JirIEnf/3kNUX0RR88DTSollJA2UBG3DpUWslyaXKomIHARjGeIH7Te7RERvRDoCUl
         vJhRyN4ftLJnCUY/qX/IZIBMSoik760UTAKBRwBaCW0w/cL/bChJuAfrRu092gOw6lcy
         Y27VpgOdcN6jsBcULkmpe6SGHRzr4hH8d66BanCGd2etJ40hRYfmcs94faGzt86Y26aP
         FebUY1tsNPYDS14TWTxTDLTEhEaE60/D9XNauGLPG5ZDl0ubR85wxCHIuP4V5irJjJjg
         rIBmnpsVXUv1MlloiJdsNEK1z9OmLAIw6xODUnayhhPM05HGBmOxliNkCAmE1J7XJMBJ
         c2Ig==
X-Forwarded-Encrypted: i=1; AKwUvBxmANH1Rg2i9D/OYp0O8mB6rvnAZ1l5QYW3USBOkkBVj62FYAqS5GaeYp//YDAxjEhZmPA57DGSmj6L7dxxf8Q9@lists.infradead.org
X-Gm-Message-State: AFq9FYJGbOcdwsv02iXxry9aovX3BmCH6saZC0zKPHYXTW8hUxi+d/nO
	VrJHXGIiYlyOcSlpG78VEi3aRb12d9e+03F5i3i8y9kl0VOjb5vUOb3YZUvldUL/ciI=
X-Gm-Gg: AYBFou2lP95p+CQZH0t+cManavdkXyNVW6Mo+2eooHGV8TzgmrCNHfae/x/UTv/KkpL
	O1x0iVkklFA/HNSqn+p7q7ovR1I9rJqtZLOv11t4DX1Ury0BWPXDZ9XsX1znbhYx7XtrSjWAggH
	TjzkDfUqhTKY3pf8QcIIdlTu03g6BpcrEDMKzm/8yfeaErs2dcQBILKGBLyICeALL1Y9xgxqSpL
	gXdrkE5e6t2NwuNjnUyqR1bjytsm0acPdED0IuUuG0JeAXXtHb06gOCiJtDfb1x/L9+R/jKW8yv
	9/kaIaA2giSG1P2Cpd8Dyawg85sGnHzafn+QDNUX51OfEotCgr4OykulMbbRZIWve7NV6k0UPOu
	Cnb+aLqNRvKkeTciijOyXnxIVBw/AeXSfnW/sg7hvBgena4mwsiz1fv420KiXj4xWS5kRPDkhJa
	a79Sfs5cXZmFWWQ/ErFRe/XL8c9urCdwjfbQ79ltzxHSOmf6asrAMeXHBZ+iWoCjjm1fuooxdev
	C2ECjrDR4QKz74j6Us5CI0Rujwj51Q=
X-Received: by 2002:a05:693c:20cc:10b0:328:3944:ee53 with SMTP id 5a478bee46e88-3619ed11502mr264970eec.2.1792165350843;
        Fri, 16 Oct 2026 08:42:30 -0700 (PDT)
Received: from hp-OMEN-Laptop-15-en0xxx.. ([122.172.84.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082e81a06sm7273806eec.26.2026.10.16.08.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:42:30 -0700 (PDT)
From: Jayaraj Devaraj <jayarajdmit@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jayaraj Devaraj <jayarajdmit@gmail.com>
Subject: [PATCH v2] gpio: lpc32xx: check devm_gpiochip_add_data() return value
Date: Fri, 16 Oct 2026 21:12:09 +0530
Message-Id: <20261016154209.23193-1-jayarajdmit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_084232_461403_9476160D 
X-CRM114-Status: GOOD (  12.79  )
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

lpc32xx_gpio_probe() registers each gpio chip with
devm_gpiochip_add_data() but ignores the return value. If registering
a chip fails, probe still returns 0, so the driver binds with a chip
missing and no error is reported.

Check the return value, print an error naming the failing chip and
return the error code. Chips registered earlier in the loop are devm
managed and are removed automatically on failure.

Signed-off-by: Jayaraj Devaraj <jayarajdmit@gmail.com>
Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
---
v2: use dev_err_probe() as suggested by Bartosz

 drivers/gpio/gpio-lpc32xx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index 37fc54fc7385..7fb46262e18c 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -510,7 +510,7 @@ static int lpc32xx_of_xlate(struct gpio_chip *gc,
 
 static int lpc32xx_gpio_probe(struct platform_device *pdev)
 {
-	int i;
+	int i, ret;
 	void __iomem *reg_base;
 
 	reg_base = devm_platform_ioremap_resource(pdev, 0);
@@ -524,8 +524,11 @@ static int lpc32xx_gpio_probe(struct platform_device *pdev)
 			lpc32xx_gpiochip[i].chip.of_gpio_n_cells = 3;
 			lpc32xx_gpiochip[i].reg_base = reg_base;
 		}
-		devm_gpiochip_add_data(&pdev->dev, &lpc32xx_gpiochip[i].chip,
-				  &lpc32xx_gpiochip[i]);
+		ret = devm_gpiochip_add_data(&pdev->dev, &lpc32xx_gpiochip[i].chip,
+					     &lpc32xx_gpiochip[i]);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					"failed to register gpio chip %d\n", i);
 	}
 
 	return 0;
-- 
2.34.1


