Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2D0C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 13:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZocKeaP4+m6t9O2v1jxFvpKpeZLmzryJkfebv96Xm0=; b=Qq/Lpfl5+e7GwYBFKMRlGw6PBS
	RHlAZFuodznTWjninP2AFppxYDUYo3F7gjGhaD9Y2Fdgtnzq8DrzcWDMWt+s5JUCYuSfOt1mFbu6W
	IAF0snBq4YNg8Q/AVRjhddy/zRM6455ZxekM6iHHkivo94CIGWI/kzw3hnteQknUFuKde4rOsB+60
	lu1iopuee9H2YBCZKJnIxXzKWmJEZk4sMjPAQUUiRXcHkJaYVMklmKIhwnvsf2Jq1d+ricdey+tnY
	Xjt+BhoLBXZO+6FAQkgZVgbkq9ENhRaUJNVR9hP4edtn0WDXv7kDE7Ib9Ozt1xxVqFKLOGdA2Yvk2
	DjJRAjUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trH38-00000000cx1-1jZr;
	Sun, 09 Mar 2025 13:50:38 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trGk5-00000000aWd-1hGt;
	Sun, 09 Mar 2025 13:30:58 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3912baafc58so2327327f8f.1;
        Sun, 09 Mar 2025 06:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741527056; x=1742131856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZocKeaP4+m6t9O2v1jxFvpKpeZLmzryJkfebv96Xm0=;
        b=HK1Xc/w66j5XZyLfgtVvEeSLSZb1xRUmNXHzV1zyGm7icVltSxlHtM0PylNAmaR1OT
         /fvHqIb5Xa9HDnEis5Mn7/uuCqKKvzC6tejkj7gAZZsO5tEa8HpBDfcABYe2lshJ+vLK
         6Rj3kVNfvpPSlZcYyuoAUaPgUgn5h9Q5gnIY3mgoJeK7+0anF4k4URLDysPCrFv8u8Uw
         tyoQbpylsvNIis+Y6uveJ7xs9gcnpFd7REKZ1QWMvLwgfUIvDlvAKBuDtAh4URWBRdsT
         mAeObAK9/nmIifClU6Yl5TVYSy8vNGUwYmfzl7uIG93rYNrhvq9Ih0c//vProfndDspq
         uXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741527056; x=1742131856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZocKeaP4+m6t9O2v1jxFvpKpeZLmzryJkfebv96Xm0=;
        b=w7ofAjGTdyoueZAzvFlXMXeRASJn64XN0/+l2LQonh4D/HZmj8pgJ/itmseg1QwOEK
         x7IA2dLCQX7wlkt8j4Iv3c9far4ZOfyhFQ/ff7Hh0DXv907iFVKq2cpenkeuH8jjMib9
         /9cILp6g5DSE/lji+5ppXFkcTUftI7TzbbEnLFowNnwxaoaUouB1nBw7Vqvu0lNGSRgy
         Rdd1VeTjOmRAFXj0C9tc4KUr1ISZx0QiEJsGu0Z8TFJdgiHuFhqQmC35t5BpCn0MIjxK
         EGPZJ2vZqWm9YKUJy68tcb7YlSxu9nopejaGqcJRokb02vXW6VHOjTPaaEExU9f3XBHm
         h7ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqeSyP8qWWPQzK+ncyYV7jBP3p8qqPRCd0alm0+BVcTtTiZRMOyxe1BQLM4Xktajb3JzSRmYN3Iv9tDUjBya0J@lists.infradead.org, AJvYcCXQPOvX39/8hhXhkIpuUsL7EtTMpTDutUIse87/pkcw70s3+MEwpzt4JI+xWedR28FoosKZq2ojmkRlwE9WFKU=@lists.infradead.org, AJvYcCXb/3CGUKA9iYjCAOZxMHIjNclvfC3PrceQ+4ryozlGzJRCjFsAPU4pno1lvgOTOdVjZwcQsuyvKkMJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyM3G+SOX2uoVJ8CkRQ8eoK7HEsJ2+/ZFJpvG/xV1YCvOF2QJ6i
	CxaGFGqb04CtTJReuetvx3Or2z1ktz4LFhUvv/E5UeTHeqcGR6Oi
X-Gm-Gg: ASbGncsbyi8evFeeLbCVzVfdka8D5CW1SM+TNQPGFMH0jjX5OPa81zBTA6zGvAw90Sq
	JeWpIajdDGBT60CpNYzzKt07QBoyKyMCgTzZzg08Trj4gFxCWEBuNHjGkaKeRoamzUg8n2PAQti
	OXwmIaVn7vMxbVLvljFbVAcfq79KdmhA0HsI2QO4Pt/D4WK71HYh2pZOJFWzzQ89rY1aNVPv5ii
	SIWjFeh87aBwJpEQToE1nFNCDJPSxon4ZA4SOiQbsNQz6NzAW1hOtzVi7aKjTgsvkdNNRqS+Exg
	t09SRZLdUu098eeaHjsOyP6MPLMrsrHn8mr2VxE7uuI24SD0/miwj8SZyk6RqHX6ERDUgHQ0//L
	YqR6eqYi3EenF7Ssc5BZiWc/A
X-Google-Smtp-Source: AGHT+IGueJHW1j9BhtVPmDBGX8blLXmKHwrxWVgv1ht1LrkVtNBdxRa6fjj8ZPsr1C+nUsiR9Cs4RQ==
X-Received: by 2002:a5d:5f93:0:b0:390:ee01:68fa with SMTP id ffacd0b85a97d-39132d6cfb5mr5971194f8f.24.1741527056010;
        Sun, 09 Mar 2025 06:30:56 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bee262esm11867536f8f.0.2025.03.09.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 06:30:55 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH 11/13] usb: host: add ARCH_AIROHA in XHCI MTK dependency
Date: Sun,  9 Mar 2025 14:29:42 +0100
Message-ID: <20250309132959.19045-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309132959.19045-1-ansuelsmth@gmail.com>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_063057_442354_2E47DD31 
X-CRM114-Status: GOOD (  14.15  )
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

Airoha SoC use the same register map a logic of the Mediatek xHCI
driver, hence add it to the dependency list to permit compilation also
on this ARCH.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/usb/host/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index d011d6c753ed..9d8626f36ca6 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -71,7 +71,7 @@ config USB_XHCI_HISTB
 config USB_XHCI_MTK
 	tristate "xHCI support for MediaTek SoCs"
 	select MFD_SYSCON
-	depends on (MIPS && SOC_MT7621) || ARCH_MEDIATEK || COMPILE_TEST
+	depends on (MIPS && SOC_MT7621) || ARCH_MEDIATEK || ARCH_AIROHA || COMPILE_TEST
 	help
 	  Say 'Y' to enable the support for the xHCI host controller
 	  found in MediaTek SoCs.
-- 
2.48.1


