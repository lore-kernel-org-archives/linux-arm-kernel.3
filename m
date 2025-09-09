Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EB3CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dgSML/DthZavsnlbDnrmGiAVx3wcugzJPKg3K/xvLk0=; b=hM+7tqS+CSQ7y8D9nHyU4W7/AD
	7nSbtO7NAjQNqBhf4+qeHmJ45P2i79C+B1pO/xCKIQ/kV3xgvIMy+nGa/4hnMCf1PpYE2998Q/gM8
	JtECzlmZIS/y1GHMLvtkloKwVcnScOsE7lP3hwz/0OM9RmzOyKtbe0W6RrYJk4r0KC8Rbf4Jxq7p+
	RAmMYJm1zdy2Cidi0Ps3NedNRK7VJ4NVSq0miMMFgA0gSzEd7WChchsv9F3AgF9yeEym1WpwuCXPq
	AukBbMH/hpJJDDabAINj55PhPyN2Uzk1IofhQjTQTObjXLqaoFH/ibxi4GBQ7vSKfdz/uYDFPHRHV
	ZmbdQqdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1zF-00000008t7K-0nZs;
	Tue, 09 Sep 2025 17:18:33 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyRQ-00000007Ovi-28lj;
	Tue, 09 Sep 2025 13:31:25 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b522fbe3088so1530644a12.1;
        Tue, 09 Sep 2025 06:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757424684; x=1758029484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgSML/DthZavsnlbDnrmGiAVx3wcugzJPKg3K/xvLk0=;
        b=ge/+R9IUZivPlIZCVeXZYKIAJsZOpjG8rltjdOqDXoeOG0VHem4DVhZ0pEBXqX/QM2
         C65Dv+umAWEwqf2OLXuaf6bVY+5NvbyXLJnOHdTrJvsxC8LhBZ9xdHXowpZOhiJBc55N
         vpmao0gTF/GuAnlfMbNG9YKdHIOr98a/kz2p1ydiuwm38kFxJO8YxWn9IFBQbaX3zKHP
         HJny76QMhhUqWvBaDGxvg9+e/red2M5W60vJM1MLsd6pJBK611F+wncK1GFBXfJQUJeJ
         g3gpEWQ9hFzLi/pwVvY/S9uQDco560w8lGRJR9oiIL3xVW1K0WaERyorforTmPEkTB4o
         lpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757424684; x=1758029484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgSML/DthZavsnlbDnrmGiAVx3wcugzJPKg3K/xvLk0=;
        b=rVRxDP0dpyBduwDJPqqkOWZStjteEz9BgMQ/OE68xdpsApKJCD+UOwMuoeoHztgGLk
         1JDTuVO4l3KpS0sUqWyCzvKc9PbSe4UHAyizUA3UJA/9PTfHVHP5NxImDcmi0s8CRyNv
         rWPF23NS5CmDlovU9Uv8Uo5b676VBHvovkSTpKry7lic5vhvu+LmGNo/bO8GW37Ev8zQ
         cJgXk6abSotP4LBdSzWQwfm0S/FymTzyd7dR/1uHfnP2A2Nv3wCxhMZ0/rxVFZ444+Yc
         pKDJmyHf/rZe77/mZTcv7zD37YtB5jRc7Zc9PGADNd67jWV0gXJext+CpsLcVIALbQud
         w22A==
X-Forwarded-Encrypted: i=1; AJvYcCUYRwjiX4OPneKRtdbvPpY0+ueNbdc4MPEtu/WO3kvZ5AAoBzqCPhEuLJ0hjnkPJJpo7bubKM107y32unwl6KKN@lists.infradead.org, AJvYcCVcPrvzc9/1ta29WUv8TGicI6syYU3CNfUfKDwZ2AMSTg4RnQP9FVkUarEG6m4SKMTizCEw8XXiVd5+LN8Rtmc=@lists.infradead.org, AJvYcCWGnbwefCBGDL9n2rfJkby/sV39tDuPNOFBm6Q/dfJcF43YWFy/gwwDKPnOUAIsELAtEBNPllfKbs/i@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2crnMqVjNbIHRxjqLUsu5VHRg8Yw1naI1Kvw8ErOBWB4WDobX
	EW6or1ytqtfVWZ4JKm0JzADKK4Pn1dlUL9KcGV9j4RaCMLMTqixpm8lG
X-Gm-Gg: ASbGnctmSpS7pyTm9msJ6OfVX3JmP/lG4P4wriRrCUSkmlIozyosKwVhxaPItZ9UiIz
	C6PCzGqcsjQH/6iVoszupsnE9RsDEImLs7cedeQ3hJ0RSTt8cHvt5LyP+jeDQJ9nr3rdqvjV361
	aMWkyobzXCS17EbawsYYHxKHQV2Ilg9qjIVlVNl1aC92GtNZMAUnSNOW00qRI0AjK7Bp0RYwY3h
	kQzj20XPF1xlL7/jS2STjvj3kHVB9EBS+bTcwOUzIxAKFHhCFDKj6iUXFIwtQEhfWvnafxRZcBx
	FxZAZCLenOVHYKm4wsp2eJYIgyjvGyX55PdGvxOjWDKuhRH+wkXS+g+BwQpAcH3VUUYO39WyeyB
	EpHrMY6HoHOnUPKmafZMeULh+wm2Z0e4wUcH3N1CkznFB7eiPi+4=
X-Google-Smtp-Source: AGHT+IFh0492S5Vla97I5jRBRsyJDDPnjkq7JJGcXNqhS9uUo8pi3cIay9te3rObVGyihMKVHOaRpA==
X-Received: by 2002:a17:902:da88:b0:24b:1b5f:1c0a with SMTP id d9443c01a7336-24cef93b49cmr202420885ad.21.1757424683650;
        Tue, 09 Sep 2025 06:31:23 -0700 (PDT)
Received: from localhost.localdomain ([240e:3a6:1c4b:13c0:db95:4539:1490:64d2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dab173060sm810778a91.5.2025.09.09.06.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 06:31:22 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/4] dt-bindings: phy: rockchip,inno-usb2phy: Document rk3368 usb phy
Date: Tue,  9 Sep 2025 21:29:57 +0800
Message-ID: <20250909132958.26423-4-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250909132958.26423-1-cn.liweihao@gmail.com>
References: <20250909132958.26423-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_063124_548891_DC3D281E 
X-CRM114-Status: UNSURE (   8.55  )
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

Add compatible for the USB2 phy in the Rockchip RK3368 SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 .../devicetree/bindings/phy/rockchip,inno-usb2phy.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
index 58e735b5dd..6e3197c168 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
@@ -19,6 +19,7 @@ properties:
       - rockchip,rk3308-usb2phy
       - rockchip,rk3328-usb2phy
       - rockchip,rk3366-usb2phy
+      - rockchip,rk3368-usb2phy
       - rockchip,rk3399-usb2phy
       - rockchip,rk3562-usb2phy
       - rockchip,rk3568-usb2phy
@@ -192,6 +193,7 @@ allOf:
               - rockchip,rk3308-usb2phy
               - rockchip,rk3328-usb2phy
               - rockchip,rk3366-usb2phy
+              - rockchip,rk3368-usb2phy
               - rockchip,rk3399-usb2phy
               - rockchip,rk3562-usb2phy
               - rockchip,rk3568-usb2phy
-- 
2.47.2


