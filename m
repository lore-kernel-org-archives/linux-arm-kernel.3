Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1491ACD5BB7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=og4Ss48qjWaYlmsfdFxPi0Imv8+Y+Dj/6CNrwGbe4NU=; b=1wPX/sDgabyHzRg0SpiD4RN4ne
	t+gY5N+8bwpSzWUxu/QQ7h+J0zOn8BIS7oKh+9Dhn5I4DEcOwoddcpp+ZXTA0ZFTvw+qF9eK5M0z3
	LzwOk+DHtU2kWcSPYnyiQmLeKcnHe0ZhH8PHOovOVlWHQE0gPc4+Em3GyEeHE7il+fWqaHpFhdn2N
	3H/hmCTeJjuDTxkYxGLLFIJlJomoaH6FqUK/bnLyWfW9B9/gs5u6+09xEjJ7Vt8b43TV3XMrfRBoz
	leRydi5uaCk5nbRNm8FKOZup/+a7mnWqfm6IkLLajHxjHnIRH0VioK5mn5vyZOsNrd+9ZXM5Dp9Xi
	E+q35x8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPoE-0000000AwW5-2vlu;
	Fri, 22 May 2026 13:21:02 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPnw-0000000AwIf-0a4v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:20:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48d146705b4so78847855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456042; x=1780060842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=og4Ss48qjWaYlmsfdFxPi0Imv8+Y+Dj/6CNrwGbe4NU=;
        b=LcNA9o7kHuRuosloqTTZe5rFFdEHsjiYnppJge3fCO4FLFFapEL3i3CGiUaQYFKWCV
         c+manbC2xoQKQdYuqIUoSXA4YQPYGJ/D+Zvn6xvYgvlfc4gl+hXHcNASuLl6hnuOyPtY
         B+8wee0HXbVO4K1r0AW6TcbhzjK0Mx8dBmL0IKaspqbBkYQLteezeNh2N+wCsKyPZF9T
         6iv5x/2d3uPw4BdkruSK6NsFDbOK0qooen1xiKrf7afubO4yikNQHFYocsR2oUIfV4GC
         Qru1wPWHo7f9sKa5GWu5w4RlBCcRdVSdUmBPVnM++meGag4+nucF0qbAWoyyXECNMq+8
         +szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456042; x=1780060842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=og4Ss48qjWaYlmsfdFxPi0Imv8+Y+Dj/6CNrwGbe4NU=;
        b=AxLeG6oV8OFDm8GkwbEBTYaZbbCcmr3FsnRKD/eRRqLXcnR2CHmBNYZZd7sZ/RC85V
         QqDOThuxHt9n4Ldrh84zu6KdBEYAKbQZ/f52cFGPj+2FcqLvHgar33QhDOQOuJdyy0Ht
         JdMhLY8piP8erTyjKIyQv2Nb0gBsJDwdqL8c1i3f0fcFesjfQp9bk+JM+emLstx+O/+F
         BPa0Pxx3gurlFmO4iZnBO2I2mXJymTk2iFoWDWbCfxwpe9tjiEOf0W1p8r/p0YMPq1Ca
         r+IwXDxxIa00/28u59c8i8iEBcdk3khIj6uIAo/JgiZl2ba2XJ3CY21kfhGN4qHYq7Fb
         7S3w==
X-Forwarded-Encrypted: i=1; AFNElJ8EoKmaCJdp9HrfPlnnsQjlXlh82xs5oNHLsKYyBBu5KP3r1ub3qTNBj+HRrFv4cv5QgZ2q5KIH+Z3Xt8WNocLG@lists.infradead.org
X-Gm-Message-State: AOJu0YxSifdS8iNCSsMPcYREvZ+301Jxf7waGhdnoZlq1Y4sHUOUIL4N
	KkOrtSErc6jwsXZfO2PlAqk8MNIUIr0YxJ0WgCH2bFpsEYt4cEY5IKx8
X-Gm-Gg: Acq92OHNdlnSoMLZvvG/7DyYsCvRYyZi4BqWN83AK/4DG+XWAtgv3Fz8yF4qWH+hFRg
	a9Y9EYsSsgOlB6f/y6T6MoTtw2lyOniZWZm0AaGarKnln7cTAtBiy1gZ5byHE2PeFbO7IH3jE+v
	aAEkffLBAuGv8tvshEWjknvRGW5Eygdgp0yJTrmIN1593WI2He7lefBe6bDxiIL61d1ZwDVWd+O
	hKNivJDrGdOfixicyBqia976ip6HVFOcMJyHn+LT0AAW9TnqMkI/OYnDHaPhEZnM2R3cYXsouVT
	I2bgO6r+yDds3WIovyjmz6iSU82ITXuqofF5r+Ewh1AtuDBfQgnFd1GJjwr9hsS2wlFhSpr2n9Z
	R0N+wYk10NK5JWQoALqjZDsTcQUH+aBqEk85EZJkiserfSG5VHVaJgDsEMUaL+om3dEjj+nNfn0
	pwB65Jf207y+1Rh8tIg6zDizjJNHmBBOgwPBdnmuuA9A==
X-Received: by 2002:a05:600d:8445:20b0:48a:89d9:a419 with SMTP id 5b1f17b1804b1-490424ad4c3mr37503325e9.11.1779456042100;
        Fri, 22 May 2026 06:20:42 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm52220755e9.10.2026.05.22.06.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:20:41 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 04/11] dt-bindings: display: panel-lvds: Add Riverdi RVT70HSLNWCA0 and RVT101HVLNWC00
Date: Fri, 22 May 2026 14:20:17 +0100
Message-ID: <20260522132014.226721-17-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522132014.226721-13-ivitro@gmail.com>
References: <20260522132014.226721-13-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_062046_546618_DA43C9AB 
X-CRM114-Status: GOOD (  10.11  )
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

From: Vitor Soares <vitor.soares@toradex.com>

The Riverdi RVT70HSLNWCA0 is a 7.0" WSVGA (1024x600) IPS TFT LCD LVDS
panel used in the Riverdi RVT70HSDNWCA0 display module.

The Riverdi RVT101HVLNWC00 is a 10.1" WXGA (1280x800) IPS TFT LCD LVDS
panel used in the Riverdi RVT101HVDNWC00 display module.

Link: https://download.riverdi.com/RVT70HSLNWCA0/DS_RVT70HSLNWCA0_Rev.1.4.pdf
Link: https://download.riverdi.com/RVT101HVLNWC00/DS_RVT101HVLNWC00_Rev.1.4.pdf
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 .../devicetree/bindings/display/panel/panel-lvds.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index b31c67babaa8..b89f86bc0683 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -58,6 +58,10 @@ properties:
           - hydis,hv070wx2-1e0
           # Jenson Display BL-JT60050-01A 7" WSVGA (1024x600) color TFT LCD LVDS panel
           - jenson,bl-jt60050-01a
+          # Riverdi RVT101HVLNWC00 10.1" WXGA (1280x800) TFT LCD LVDS panel
+          - riverdi,rvt101hvlnwc00
+          # Riverdi RVT70HSLNWCA0 7.0" WSVGA (1024x600) TFT LCD LVDS panel
+          - riverdi,rvt70hslnwca0
           # Samsung LTN070NL01 7.0" WSVGA (1024x600) TFT LCD LVDS panel
           - samsung,ltn070nl01
           # Samsung LTN101AL03 10.1" WXGA (800x1280) TFT LCD LVDS panel
-- 
2.54.0


