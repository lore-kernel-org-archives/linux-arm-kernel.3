Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBA0CF9C7E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 18:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RExy28cj9QkD+uGmena181X3aoXaellaEJhmZl5Ril8=; b=s75ZYHZsNSNvjfkIIhpNuEyQ97
	wEyX1pQo5EWPusxu/H9c+BqI97D/Siprxf8HsnNOp2eJTqb62ULuXH6vmH0fh1tubbJ5IRKzK0gD/
	NrqiWVylP8SxaZiwiHVpXeoxq2x49URJBxYbX8E5EwawQj++rGSS+zzSTmlRX9n0ybTcI3iLUqUXm
	HMpZeoECauteBzjo4CbMxsHk51XeYsjupKbJq7xt4LGqasX8kcEKkMdPUV2QDe5AG4DM42otC6jhv
	q1bsrGBqX5lugnfWS5NbF523nNauL2EuS23cuftogTp8z5+hM+Qf4HQHkUSYgdH3XRqa373BZysW0
	6KRVOxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9cQ-00000007EgJ-27bo;
	Thu, 20 Nov 2025 18:42:58 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9cL-00000007EeK-1zzU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 18:42:54 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2956cdcdc17so14744645ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 10:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763664172; x=1764268972; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RExy28cj9QkD+uGmena181X3aoXaellaEJhmZl5Ril8=;
        b=2uhLM/ivkLLemAWliLq9wAxzzU6C7nxiBM41fRE4FprWq42p2HNT9jUlVQwv3K9Ine
         9giBsvWBJFiivcLCov0HhxZgDjIpbcVnsWZ1G7dkIrP+jWn9Ti7RnGu5XrXperwB4e/4
         S1PIE3rFZAusTDszH9rdHbbGFtkzaJU/C45po8Gh3i0PU1krl8HSAJWQ5DUdvsXlWAqr
         HejGrLk1KgVAjo/z557FYxEGL52bmbq9ykm73faWxeBf3CZx6RjYjISSvVOgJm7aR4hu
         kO0YaO/VM3/k+DOl94D2cIgckkox4Ot4xGgls+bdx8qotqo6CG10T9Dl90ygsOG1HchC
         /r6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763664172; x=1764268972;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RExy28cj9QkD+uGmena181X3aoXaellaEJhmZl5Ril8=;
        b=IdEOjzbkNRPQFQy+EG6No4D+FYGEwDQffcALoQhaQu3tXztwmpix3w1l5X7mxBZXu4
         FuO3C9UUGp2BWP3CjNZQa92iwaiFSBhv21G/j/4xoLx4DFFF6uyhz0d9x6azq1zrGo00
         vPlYiZv9l+03jWGPjFm6aYPcI2EaJl0T43H+g6irFOpREoIgFGbc49vL7MKz2/e2jKeO
         gBYN+j/5Appouw+QTIH22Z/WtAjSloh/yf25z5Ys8mWHlqeRQhadAWiATH26yE1F8jMB
         SF/z6IlsmwE2Mw/wJxuvKTx1AZEH1RGs2wQZOvEIjFwheHpwEP1ZYcmIOiPktbtauKuz
         /8IA==
X-Forwarded-Encrypted: i=1; AJvYcCWWLVXrL8fvH62m0/FA0A40gYTu0qljw8AcWQedlmzobUdomy9UoB6uvr8k1WDISRIugFHKh5hIO54dvTC4g2FK@lists.infradead.org
X-Gm-Message-State: AOJu0YzosXX835432u5IJlJYrTbBmHXoLpEoEch8sdHET1McJefDYEfK
	lWIpmR6onl8IlH3F5d1dJ4uhasdnlhNoK+9S56Y1Qhvsz3ZFbP5DjbTTAqzZ9MZ/2LWYD1EfGNm
	8Y5PrtuxNPnVVjf4UYajC4qGA5/Di3w==
X-Google-Smtp-Source: AGHT+IFj4eYCHjnDTY78qqXAXzFjDOGfRWJ8FzD3bwljbRSaDt9DxqaN4Q0Zg0pQMA4iTkvLUZBi27kxn8VVOeQs6UU=
X-Received: from plek19.prod.google.com ([2002:a17:903:4513:b0:268:c82:4230])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f607:b0:295:94e1:91da with SMTP id d9443c01a7336-29b5b0f8119mr52722365ad.33.1763664171869;
 Thu, 20 Nov 2025 10:42:51 -0800 (PST)
Date: Thu, 20 Nov 2025 18:42:29 +0000
In-Reply-To: <20251120184242.1625820-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251120184242.1625820-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Message-ID: <20251120184242.1625820-2-willmcvicker@google.com>
Subject: [PATCH v6 1/6] ARM: make register_current_timer_delay() accessible
 after init
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, Rob Herring <robh@kernel.org>, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_104253_518736_90BBF92E 
X-CRM114-Status: GOOD (  14.43  )
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

The function register_current_timer_delay() is called from the
exynos_mct clocksource driver at probe time. In the event that the
exynos_mct driver is probed deferred or the platform manually unbinds
and rebinds the driver we need this function available. So drop the
__init tag.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm/lib/delay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/lib/delay.c b/arch/arm/lib/delay.c
index b7fe84f68bf1..acfb87143f21 100644
--- a/arch/arm/lib/delay.c
+++ b/arch/arm/lib/delay.c
@@ -62,7 +62,7 @@ static void __timer_udelay(unsigned long usecs)
 	__timer_const_udelay(usecs * UDELAY_MULT);
 }
 
-void __init register_current_timer_delay(const struct delay_timer *timer)
+void register_current_timer_delay(const struct delay_timer *timer)
 {
 	u32 new_mult, new_shift;
 	u64 res;
-- 
2.52.0.rc2.455.g230fcf2819-goog


