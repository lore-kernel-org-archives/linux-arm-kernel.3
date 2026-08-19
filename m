Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360FEC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MVVnQZpsnH8AWbTGeS0HwvQAF/scb90pwaSD2kjboo=; b=xyVDFqAOEHtzmefti+F4ML8+wl
	NkH3ARB/JwZD+B3rQpIzvK/14AHnnrXb8gfrlglecSlrUwO3+MNyQbUYOu++s04yCjMX3go4Jou9h
	P1U1ZpVHsbN+3j5esxZ/DnOl5RlMy6XcmKBd/EpiAwboCp2Ok37gGguYSRT/lQ373Z1VxPDBzSTH4
	h0SZm9J0lbu6/5o1iWaY8ySDGm5e44711+mdmd+15xkjys0WEY6ZSYlDiZUZnItaajgrOwrYCaqk+
	tKL2bHqe6Njqg0bAsZJ96Ov/j1hcORbjkdFf7182NBFJkOlCdnP5Yj6/TBehRDLO1r88/5GlYdkA9
	ewTP87yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOV-00000009W7Y-3UaJ;
	Wed, 19 Aug 2026 10:19:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOB-00000009Vqy-3juV
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Aug 2026 10:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4MVVnQZpsnH8AWbTGeS0HwvQAF/scb90pwaSD2kjboo=; b=IoSu3gPV1K6ap+P+PVBSaR1MfC
	VJcJL/SL+jzLlKDYF5gn/qdvWMWoujIoGNvgHIXplvUa3dr2P4ibsa2ftqZAMDt2BVDJKTefhDLVx
	+IdTEjwYd6ZvTZX6nc0CDH5V9Ne7aPTvnkKICa0cZMEwN2IIZJiE5lVyxjwjQz1RO/qB24TfpYl/P
	6HrtQMTnNc/Max3EbLOEVNok9ImCafVnnUgLxqgjigKOrvbUya3jNxFadOzAbggvmQC7GBx/Wo8tM
	RCgHoVrFjW2UtxuSQkYCNj8uEyFvMCs0n+WpAdg5Nr3KKBr9NgnUk48cAV+/rB5cgp/n5/uLE5dUE
	dEH+VMgA==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdO9-0000000DUbC-0qwD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so10056635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 03:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134755; x=1787739555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MVVnQZpsnH8AWbTGeS0HwvQAF/scb90pwaSD2kjboo=;
        b=jplD6Ypw1jKdxD5RsVicSC+7cWJzE3umhd4uzO6h184bIlYsXX41k/7y2rEEeqduDY
         kJtTZyDfIsPBoNyniahPJKPqfoJfXmjdocrsZvgoxF20ResHSOr5SBI2jcjscYk44d1O
         Qou7d6aklSirl8e8HgYvwQ6IPj3Z6c7ofat+YMfuLlaJ71Id/curlYUQjMpw7SzIrH/o
         /LLJH3JmwehAuSxj0OMskXpxv3ixoxZxXg+4dJ6lifE7n2yI7wo1mDoB85sDXTOdOjC2
         FmcKsx1mq+nw8kvC+3BJxxqpWOnZ5+lpdM4/B4Ym0L/x0t1XxiFlOIOpAF9d7fjBWXqL
         rCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134755; x=1787739555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4MVVnQZpsnH8AWbTGeS0HwvQAF/scb90pwaSD2kjboo=;
        b=lXjpFG8QCDB6c7c8xfYra6YkUt9IB7/148yI6vzIsZ3UqBBBvWye8PbiZ6Wo9kDsNc
         tP4J/Yc4SFzFX+K75A31HSA78KpIZ2yTWSFfpi4yl+XUS8E5TmWACuzRUyQvNbh+WZSO
         sSocuzKAPEe2ndJ23ofGyXbWzD0o1lDFX3y/i683dqCW5YECNLRZtgwXqxnBn2hV0+yf
         Rma+IJt/DGnvQYyT9GDGXByDdGDy+HBmGSYEnekzQIUejN27OPihN+2dBG6PoRe7OC3K
         Bif7FvDd8ZiiogONxz12FhXHGljE0OSgzvrb5VW8qto2IOw56h2VUoESxLoJ2h0Q/LDC
         LKMw==
X-Forwarded-Encrypted: i=1; AHgh+RraQ9ZB/zpxUNI8vPOhRSI90HWU19O5L/d15vbdfOJ9WHDbiihPgKXNJYWC8WXDmSV4mI4Hi86vaphrVYCL34+K@lists.infradead.org
X-Gm-Message-State: AOJu0Yygp96H5J5FQpIO0cYaCNsVMy1iilUMZAEJ++2mBJP4RjY2Qta/
	rLOS/C3X+enQ3bWfSkElxLuXONnNpGHmTuicsxGSYd/EY7fV6WIcmwJ7
X-Gm-Gg: AR+sD12FLRoHC5QXh2y05IS8iCiUYaG34wYi5pRApPf0GVpb6PWle81Zh/o7RRY2vE+
	4hjAqgZmPuvJw7WiPhZ+dSCKe/tAWZVkuY08cRk74Vd/1IYGQ+xvqUmzTwdH3ZgdxWkhCluZQFM
	BpKiO7Q7gcSDVmot58TkPGefBSw2/ivfdXC3p56NRUeMMf+o15T1Oe5S9U3NLwN8FnNMnsKGGiR
	cwqScGjoMLDar8Hs+CJCNKeaKzn+LweTICq4BhNulzBku8jmAuGA4JqdsyNV99psB9B/bY7qY1F
	ot+DNqb3qTk2IX5foXQfIRTK1opMVlQSMxEXwvzDQqdfrPf+UKYYur16s1Qp35YtUsz+oFpjFz1
	jMUWYi5q8M5KwsanPP7Od6VnzVgok9SEckKerrgb4lGF/T4IXQ+SxIo9xqjCmRuhieoc3fCuuYZ
	a38h2B7iJaW9OapbGUUa+S6To8d/QCfF446BKo6HoVsw7815sy94kCkw==
X-Received: by 2002:a05:600c:4e15:b0:499:8a3a:fd3a with SMTP id 5b1f17b1804b1-499aa19a7c8mr69046125e9.5.1787134755440;
        Wed, 19 Aug 2026 03:19:15 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9b7c987sm27316965e9.1.2026.08.19.03.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:14 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/7] arm: dts: mediatek: mt6589: Enable toprgu reset controller
Date: Wed, 19 Aug 2026 12:16:24 +0200
Message-ID: <20260819101853.44681-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101853.44681-1-l.scorcia@gmail.com>
References: <20260819101853.44681-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_111917_291279_D50DF29A 
X-CRM114-Status: GOOD (  12.28  )
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

Enable the toprgu reset controller feature for the mt6589 SoC. This
allows generating reset signals for the 12 subsystems managed by its
top reset generation unit.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt6589.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6589.dtsi b/arch/arm/boot/dts/mediatek/mt6589.dtsi
index 46dea445742b..2ba912a356af 100644
--- a/arch/arm/boot/dts/mediatek/mt6589.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6589.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/mediatek,mt6589-wdt.h>
 
 / {
 	#address-cells = <1>;
@@ -147,6 +148,7 @@ uart3: serial@11009000 {
 		wdt: watchdog@10000000 {
 			compatible = "mediatek,mt6589-wdt";
 			reg = <0x10000000 0x44>;
+			#reset-cells = <1>;
 		};
 	};
 };
-- 
2.43.0


