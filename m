Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC4AC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 12:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjKGQCjlxoKyHC3MWupm0EMlVBTxZVB63YoUYqEoKt0=; b=jQDZ03WZm3t5lA/0KpkuA80xGf
	gN0F5fKz/i4jQCzN29VUnb25Pfc0sfRSt4Faa+DRiaWSCDkGzl4Q8xiasl+OIuSUXdC/gbtpQUVcV
	jctNXa6NAg3Osv38LhmE73rnOULWcnnfTXJbWFdWKBWseAeA8iazwCR8qSUUE6nhpjU8wA23rcoDJ
	TPMijJ5jEK+qDQ8yjeRJmyh6rwO8DeCnTJEChw8JDREg87n8WgfZ07y3KJ/zEHJSjhLIF0v2MMMh0
	YafJ3Se8r3f+RehMxZLzzbIiz4UeGjXW5CfICRt3tEWRbBlkqaMLTtaVhUHfF6+cghb82qur4hRir
	rlkM0aHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOf2-00000002K5l-3rh8;
	Mon, 27 Jan 2025 12:56:16 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOVo-00000002IHi-3rqu;
	Mon, 27 Jan 2025 12:46:46 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-436345cc17bso30865575e9.0;
        Mon, 27 Jan 2025 04:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982003; x=1738586803; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjKGQCjlxoKyHC3MWupm0EMlVBTxZVB63YoUYqEoKt0=;
        b=Ggrjn2v/Pt0GK3GbqiqnOO/jpDK1VGzoc/vTPIjXW1BROqjdqg8kbxDrBFlSYIwuEp
         KDJuwXegybN4cvuCEk2y/++IvYwSr6BsNLiBwd6jk6vYXqs5p5+imcMWR6NiKvJrxfjL
         tObEJFEhtUfCnXlPIg6V0oQNJV8W9LDyBzN+kAg51n9hfjaJqmlJ9km7LDjyAHctUUWR
         SJqxHY4QpN3nzmFXANmsBUVh6an1QxSDj/5THQe3QHrfjkJ1bIkSGoj7ldspYupICzO+
         IXc9vROcChfYajJNM23ZcDxQhGoh9dlGxMwMFET7jjDpd3oWhDm0BispWX2LrPknp1lA
         tsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982003; x=1738586803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjKGQCjlxoKyHC3MWupm0EMlVBTxZVB63YoUYqEoKt0=;
        b=FAri2ppBBhO+Q4WKAWueM74ir+CkVb9nN+U3JyCjguCH+Y7EEbHMPXz+UiwsVT/C39
         fOwtKoVpIrcBF40TsIo5JCl6jflqGQ9tCDqKfld6RN04/u/i/HyADLWMfHidSyHC526m
         x5ToL8Zfz+nBs4ThxvCcNyKz8g4VZViSnQSVrkZg3cs47ekoRSfQZN+OaxMuqubrCLHI
         7tlg5re58wdwHnrbHeYcYlzWYKpQvvIyf6EI0LKArUPxklaNaVCLDa5b88f7dSWGWa+J
         QQcphVQpO+iy+LKFJLFB7tChNKC/WLCkw7HfqwoZOhmUyC6fxUiSRH1vdrc+80SlSf26
         TKAA==
X-Forwarded-Encrypted: i=1; AJvYcCWnEYPEVRCqFu0OoksqIiOthEyycRH6zSh9c1AtLr8rV7IqPKK3NxbjCBEyJXahkcQhvKzt9CJhUG0fFjOlJOY=@lists.infradead.org, AJvYcCXhMIc+umvzo6XeaRPfYdhXGFsgo4N9xG+QBcCnKzZZsWeHDMWfZ8EZV6qjXbfwgBlIL3lfxVwvaNBWdV0jJlWx@lists.infradead.org
X-Gm-Message-State: AOJu0YzVf4+LoFN2SZXb9QJ+rFy1ZBJOP27chOpitorh7d8KSsdZNUlz
	Y5XbcylUsOpvFC6xsntksPRYBhooqvMjcMJXLYIJhVru9cJ6AlU3
X-Gm-Gg: ASbGncvqN0fQucNvEM6d9iclXs4myOZSFvHtefsWOOUU7KhJtueiaaAI2CU4JEhnpkD
	j11ZdMICpdH76bPy/+HKyOiqv3cGP0H0RC7mRSBE8cFJii0HnuMvy+QMArAhqZjA9cgeXKUpWRw
	st42UQft4Hu+u8cIpyT5qwx2sQSd0JvL8Yl3bzt4s6Ox+Oiw7j5lowaZcc1l+sTxCZ53qbW0vwm
	yQ/vx3kwlqQpwFuPKOQSc587H1Q6y/JW+9WwFp/G4BBGrJeenWVKAy9b4OhcvfZlFjYjXmnhnNm
	D2aO
X-Google-Smtp-Source: AGHT+IGprEO5pdaTEpJfI5A74FsQo9nZOJ84uFe/gZrOTEtv5xh0dMQj1A1tPsGDBpxW+UvsnKe8cQ==
X-Received: by 2002:a05:600c:1c84:b0:436:1b08:4c78 with SMTP id 5b1f17b1804b1-4389144fd70mr439685205e9.31.1737982003114;
        Mon, 27 Jan 2025 04:46:43 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f367sm130542655e9.7.2025.01.27.04.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:42 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:01 +0100
Subject: [PATCH RFC 06/14] ahci: mtk: Switch from CONFIG_PM_SLEEP guards to
 pm_sleep_ptr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-6-f8f50c821a2a@gmail.com>
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=uk7o4XEuCDy+1MRV3EDgkqSFL3eYMvAL/KrkBwR1yb8=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4ArP/dXj2VF2FWcstEGtxvysjudHRVgQcMUd
 svatcZOwv+JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 tZl1EACcS6SONQyqCW76vwJqLeVZij81JJC6Lc6vlKZCqpF4aZfAWFaEhJwoQq2lvvaUkhxVbdn
 tI7F6zVdj6qTx/f+C8UiuT/NXdG2SAOS+vNLfh0lESSQq5FpO6z7T9iuAZa0QYI6qvoX6E39MHT
 1hoEBquSExHROVnPh9jmPhMC9YCbZ3lLDh67T+Q+xxvLw7OSbRqZ1JYlxJHQhBXhj4YPle8ZhH7
 Hlzjaishlt+hW8zL1qz6E4ERE/kXUFe5NGXeMTbCHVPfQcM7EktMEsJdLikHP3JSWz23Apabe8+
 3/Toun6cZcuUJxBFaAUrKSqGJhN6ujljWR6PTCIJMdR3IQ55grzKXm8Ydvu5vb0ifeOc/sN5JRV
 LooLjdM9domNcQM2schcY9SveR8a+DUDNbgZQYDEiUtzm1y5ZZu5Yi78yfFFvnRFfio8LOkVkd3
 G1OfRNEeXzIKVj6dL95ruGiZ5C1xwqkSxgVlhFW3TxilnrbMb1M0jkO3sUpLa7WEWy4YDclUr93
 tRAJ/feyNqI/3Yg7YwiG/RTxiL1PM4dDzWa02BTU/BebkeK9ECvVK/a+W4Apgsb8UfKOTQU+5jj
 nuBWGDhFl5Rr0H1L/nXncvlVYG2RQZFmzn8IwfcHbBca4T36PelFvgNiALqkjPJi3s4PkzzqfOY
 +XkNBgmtI5tEOXQ==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_044644_964637_033757CF 
X-CRM114-Status: GOOD (  12.96  )
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_mtk.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/ahci_mtk.c b/drivers/ata/ahci_mtk.c
index 7295b9066ae213a72a8c180a66ecfac8c2f46ff9..4afcf5e90e3b660f17b2eb0b1e3df446bef470da 100644
--- a/drivers/ata/ahci_mtk.c
+++ b/drivers/ata/ahci_mtk.c
@@ -163,8 +163,9 @@ static int mtk_ahci_probe(struct platform_device *pdev)
 	return err;
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_pm_ops, ahci_platform_suspend,
-			 ahci_platform_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_pm_ops,
+				ahci_platform_suspend,
+				ahci_platform_resume);
 
 static const struct of_device_id ahci_of_match[] = {
 	{ .compatible = "mediatek,mtk-ahci", },
@@ -178,7 +179,7 @@ static struct platform_driver mtk_ahci_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = ahci_of_match,
-		.pm = &ahci_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_pm_ops),
 	},
 };
 module_platform_driver(mtk_ahci_driver);

-- 
2.48.0


