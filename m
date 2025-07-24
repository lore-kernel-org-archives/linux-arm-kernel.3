Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B53C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 00:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5L6Yw9qj+C+fk9cMl6gaUwf0SSDSeUHItDrsTR+grto=; b=EY1iL7INPRUESOhtYQEDs1HJlL
	0To1D4+ggndyZjxXmvcbi7Nk/pF981TlJHBGw/h+VWx/P1ZJh42Y3fKJ/VlCAVu51TDvLpaARwgZR
	otUFn7IZflGZ/bgdFtx0wkb3UYx889npBEtLJJu+QAq7lfT17dpyRK5m/aDFRwRUo7FFpLTkPwH3I
	hx4GZLiNe65A9F2lBL8d4GJzSgsNzdwMeeP3xb3OamXoOV3Ygczs69CsHoCWiXfJhZuOIyb62i5Q6
	9KC4Rakshn+y2kM6JVnRZBH+FQZN+RKqk0d2HZMwBvNBLJO9SJVjKkCF5aTHj+haV+XikNYGvaqLt
	J5470fEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejeZ-00000006E7m-33B5;
	Thu, 24 Jul 2025 00:17:43 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejZc-00000006DJ9-1dsZ;
	Thu, 24 Jul 2025 00:12:37 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-237311f5a54so2701035ad.2;
        Wed, 23 Jul 2025 17:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753315955; x=1753920755; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5L6Yw9qj+C+fk9cMl6gaUwf0SSDSeUHItDrsTR+grto=;
        b=i1tCfkyOefYUncivuIUyhx7VHZM8o8aor/p3DHIYh7jNRzAq6GH5SYIl7AygS14jVa
         YYjmFwrek3PPELuTs7velV9P+x77G67J6Z6zu/eACefj13RLSyL3DUD+faJTRHg0CCfp
         uwpz5Ecs1jfFUG2k42/DY7u9LUV6JK3j3IwhEbZWgGTt3Am5YHzchvNFLkI5apWqj8FI
         8pvu6fCHL5JpmQotymDwIfyK/SkeHyaA+D2SmkKKlq855uacZd+d9bW5g0Yn68yBx0cp
         FlHz3rGQh2F0NMqOam4keJDiK9H/Eokq7BrhcSzvYuSLFiU5wzNJX8zlFLLOzfg9/z0b
         hC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753315955; x=1753920755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5L6Yw9qj+C+fk9cMl6gaUwf0SSDSeUHItDrsTR+grto=;
        b=quaeSkXdi4n7ywM5NAcBalEf+c4d2xnnRnRhSEkOSr0d/y//BCTqz4RUTDrV6VD4jO
         HqV6KZDK/uVQpv8rxdZzxEVI7EQptZt4oQQtpGGRZqgj63pCS0FSgdQhBAmrqQXLW2/B
         XS4GC1lxjTQK1KY0x0y4svMWFSkWecpMs6FrY9JORLe8MUQUL74UWaZhI4IOkyO7PuXV
         P4AhosyQC3S2Hr82IUjU0p+DWfUH6J8G4KlDVBprYICp/KPVDNKhf5a9SAV3qI60bN9Q
         eliz5zmPuC0rNAw7vxSMcsPdguYRuEYnjxPZkkEWOrHmzEYhhEm3zNkAdUpI1W8m5KZk
         MA4A==
X-Forwarded-Encrypted: i=1; AJvYcCWoh7FfqQna/dfKY0fJQJzGeeSKNbHYEHI+bakAgo6a6nqtF7YdaeuXj51ixoJ8xsyY8hKACmRFmJkvdpuOHRgs@lists.infradead.org, AJvYcCWzhjnr+6Y4DOhwDe+37U1axzbQ8XsFiHt1G5p8elI7xzEsVcQeVtLsAiIATqdiOcit4wijtzSRu4B6ulsHBPw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzwADVf0dEci3T/OezzEiTCsoraWdPvBrEYstu4kcO5l/YSJ1md
	9QULXGuGtkXKZjwfqWvPXLNecsxsnY3oefjRo/YJ8n8RpzwQ0NJThOf8
X-Gm-Gg: ASbGncv/EVK2R4aVDagr0+ietUoy9YZht2KqlTDVbAFdQIF3kBNj9KxWdZ8okg5JQjs
	Ze4yRZoOJG0cHeOD5hEa/iwArrQD/QJq055zceIbVFAR5+7dsSOuvh60A6jCYnnV41+NEZxFlAA
	0bTCZujBx/fXLV2tFDZzFIIYGYEYbcG8rsxOdIiEB3zvvZF2UZOdvD0+XYv3pTOynGRSPkZO421
	zSOqzFW7Achz8R1uSDVDTnjtUPm0sI220iYzGPJJaeC+fCKQ/OuYi+l75mWDHY6+06ptXVhWm1Z
	Z+/6wJOcSKbkKpTFnu6bz+UZdZVtgtfyDQgJY8zDZXlU+G6myR5YKdO+ZPGJ1w5YjM6tOPt19fK
	n+qI=
X-Google-Smtp-Source: AGHT+IH+ENFLH33+1T1wQ3ORvxI/s245nJcYnuJqXjCwexDbtRPk7xZm2WT0Tgl2ZpfXyPs5PwABTg==
X-Received: by 2002:a17:903:fab:b0:236:94ac:cc11 with SMTP id d9443c01a7336-23f981403afmr60364405ad.7.1753315955528;
        Wed, 23 Jul 2025 17:12:35 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa476c131sm1872265ad.45.2025.07.23.17.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 17:12:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv6 wireless-next 1/7] wifi: rt2x00: add COMPILE_TEST
Date: Wed, 23 Jul 2025 17:12:26 -0700
Message-ID: <20250724001232.2275-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724001232.2275-1-rosenp@gmail.com>
References: <20250724001232.2275-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_171236_434656_0BFD9F36 
X-CRM114-Status: GOOD (  11.83  )
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

While this driver is for a specific arch, there is nothing preventing it
from being compiled on other platforms.

Allows the various bots to test compilation and complain if a patch is
bad.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/Kconfig b/drivers/net/wireless/ralink/rt2x00/Kconfig
index d1fd66d44a7e..3a32ceead54f 100644
--- a/drivers/net/wireless/ralink/rt2x00/Kconfig
+++ b/drivers/net/wireless/ralink/rt2x00/Kconfig
@@ -202,7 +202,7 @@ endif
 
 config RT2800SOC
 	tristate "Ralink WiSoC support"
-	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620
+	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST
 	select RT2X00_LIB_SOC
 	select RT2X00_LIB_MMIO
 	select RT2X00_LIB_CRYPTO
-- 
2.50.1


