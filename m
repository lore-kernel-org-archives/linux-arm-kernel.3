Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03430C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUz1mWBpB/XSD0ZgFsInGJUX8h9hfweN14oEZfYpX44=; b=ppNN3to5+V4OhzjdPtO7ldI/IG
	WLJbgbKlyZxTu35YUXnEEGeY0MoQ74TF8zAcJyYfipAwL+2S4AlxruTLAE8tgLFUgN85Zh9Gy7mLC
	vkXOYZtwbKGT84ogPCbHa7nUZC0O1tZw2WyscqKch/3L7u4gecRlw0O/HCSpn0VUWk0meKx4x86wr
	HRN/s37t5eXLdW6v7fJWYtmTilACZIseYw06fusI26X+ngm6DF38PkgIlvH/eGEYGGCH1lAxYYEQR
	x1dSuP8XiBP1Iy3EpP1NjOzK7z2Vt0hQ/GcG/hHKwM06wlL3LIBTppvpo6Q6eflKq4kT9jfSABzzX
	hv40HGcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9DH-00000001BI8-3JZd;
	Tue, 04 Aug 2026 07:05:23 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9DF-00000001BFk-0QEk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:05:22 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso4607032a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 00:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785827120; x=1786431920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUz1mWBpB/XSD0ZgFsInGJUX8h9hfweN14oEZfYpX44=;
        b=EOa3JH3NgByN421kDv15ODX8Rc687r3EjSrXn6CGYqm395iZ4zD5XOL5kDd9pZzJd/
         vhp5qv1wB8eE51GziVfW1Z9KGMY1VmxyEcViNLu3lLt3PmmtN8+UowxqStSGLpdW2WGL
         vW7zd9xLIvqcSuUvNKcK61JbrRFDZEWRYFgQXBGQDppPPzvnkUldbgNbj1FhPeCmFnlo
         5K+pbX1/AIRyidz+CBY2EvKfZL35HFTLdevPvFJKeGMv76EooP4nDrbXfEL9Js8SjtoP
         QOTmvQTYP/BkMh53gLAX04SDJHp0012EKAULQLSuPHcf62H2AUQvODuFwnHJ7GJOR73p
         9ilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785827120; x=1786431920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUz1mWBpB/XSD0ZgFsInGJUX8h9hfweN14oEZfYpX44=;
        b=Tvv/mwpfpqaq0+IEXfYIiRSz+DBRqGPPNCS9ryIsAjF7DF0VFJIIis6Pz4WOXGvc2J
         6WiNgdspOEhJytpVvXL+6hjtCOv5WE09wnLWjCOzH2iFqUJ0HqW24lDfX72iSVDZNDxm
         UOrYi/2JJu6A2FAGbvd/jwVbAs/VOEa5fuQl/UI0drxaVf71az2qfiH6HlReU49E2PB3
         ttQWIX3xMJqYNOelXJM7Lao/qqmjdvHjPlHb+HRwLCVmAq9Sart2rOYPwi7jGACG82H0
         h7Psfzd6loXqSQHxmQNo/Uh2jQDBbPBkXF+lEMcdEg/56Oi8u9/+5dpuBWItMxr5jwN2
         lEjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpIC1BZt9q8cJdI8ov3slb7mfiTVpDhlCMf8oqgWmG7wreeI0lZlpJfI0Unj3pbzg4yQFWJ4vCO4fSdRWoWZQik@lists.infradead.org
X-Gm-Message-State: AOJu0YyxxSFsmGpwk6/drM67U1NFbXXoYDY9hDlzaeWQxg2YC4u5NaU/
	FuMvgUPmc1qTZ8EGUSOjs3AVb2coz2wQoxSFyn7rH4Cvp87C69zDT+lV
X-Gm-Gg: AR+sD11AcC3oIGSd0QALKGxyJWMQMl4e3b8lI371r0J+2+b9sR8vUJoFB5SCVO/GfNX
	F3dSkjTCRZB+l2jfu2ylqr+2e1GkuSWFZ3u4D05NPJhGoqLvSu8HKa3CdrcBVYZoo7GkRnNlpXT
	PGFkgBA8I2hg1hdU4+yIwOryt77oVK2dPNJGfeAq5ORRregsOXu0mHqtQy0YMjikI5lYUc4g0at
	TzJkpDJH3mnqTj5EZ6WHZz+kSFMBLIgvcJtEfAAY8JG5iSrLh6oNmVIpUZijd2kmXX3bj63I+23
	MZsqNAT6sYQ4GKakoYTgFYy9qbf84ElLyuJ4Eu8JpBADriqayVO+9Y4Dlh0BMZr0f62VSpbdPed
	ReYoj7t9SvlZjsZd7FYcQM3neg6OHPb22RJtJ99CbrWGDGdd7J0uOAYD41H9CbBJ8bAJG8gJsoR
	brImaOHmraCGQxF5JWx3m2tNSqQp3U8O5qC5A5IWeGeZgbLE3ZHReOmqcrAWJStG0gabs5wvQmD
	8cNKD9pknM/NFoQeGyb6hX13p8q/VCn8adbQBqDl6lg7yw=
X-Received: by 2002:a17:90b:4a11:b0:38d:dfd1:7a8 with SMTP id 98e67ed59e1d1-38fbc4055bdmr11835563a91.2.1785827120151;
        Tue, 04 Aug 2026 00:05:20 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38febfd8ff8sm859815a91.4.2026.08.04.00.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 00:05:19 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH v3 3/3] arm64: dts: nuvoton: Add WDT node for MA35D1 SoC
Date: Tue,  4 Aug 2026 15:03:51 +0800
Message-Id: <20260804070351.1846165-4-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260804070351.1846165-1-zychennvt@gmail.com>
References: <20260804070351.1846165-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_000521_143406_516C307A 
X-CRM114-Status: GOOD (  10.68  )
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

Add Watchdog Timer (WDT) device node to ma35d1.dtsi.

Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index 7228ad4735b5..14fd17cfdc5a 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -82,6 +82,13 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		wdt1: watchdog@40440000 {
+			compatible = "nuvoton,ma35d1-wdt";
+			reg = <0x0 0x40440000 0x0 0x100>;
+			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk WDT1_GATE>;
+		};
+
 		sys: system-management@40460000 {
 			compatible = "nuvoton,ma35d1-reset", "syscon";
 			reg = <0x0 0x40460000 0x0 0x200>;
-- 
2.34.1


