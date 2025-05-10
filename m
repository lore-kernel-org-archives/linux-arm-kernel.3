Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE87BC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 10:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oE1Ex4iGsssyaIBLKiOZrSIgezQkyez+G/tcna3LlvY=; b=xItZZPBTbS+0Civ/Xwg7VhFXRV
	10Y9o9o/4fOc494uhtNrydeBJjoyKaFEF52A7u0aPlgETvDgbIEg/61mOcZ7zH8MQdk0przk64exc
	m0YvO+z/s33aie7fA5Xx3Fq2TxPFcfNBTGcJPm/5zpVX10T3z986s5p470dvKRWQl9/KmyW7ub7Os
	IY4fPNr3z729tYHR6kiuJiJ7W6Q03jsRQmwrPhQ+suHQDXYVtSJ2yDUS5xJMdCGRF5jvV1NlI96/Y
	Maw83lBBuNF25iTC+LNrHk8bxaoC0revTQMM4hAiB6AGX31XXA5E+q6OH7AltHdBlYKULvA+Bife9
	GpMJ1XDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhTn-00000005ohK-1rVP;
	Sat, 10 May 2025 10:30:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhNe-00000005nfR-0AXN;
	Sat, 10 May 2025 10:24:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so29048405e9.1;
        Sat, 10 May 2025 03:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746872668; x=1747477468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oE1Ex4iGsssyaIBLKiOZrSIgezQkyez+G/tcna3LlvY=;
        b=ncPMcLsFAz3zMR66JGHLYcvSbqnmlY4ILFeEvqQ6Dqajt1lHYQ71zlWjuXh1oS/3s1
         459x9RFOdGAW2p48nol8edv+dTBycc7CrIZ5WAf70eKVqBopCEjs9vW/xNNo6+ccp+Ed
         Ldxp5yf9uTQaNgxPeMG+kyWBdsoF4OXquE0X/BXMp2csOb4DWYPI81neHQK08cFQF+oB
         nDlQaqt/8NkDbnRQxdO+yzcrLlX8cBCF2t41Hnv41zT4dvPuX11m2V2LdLab390PO6vu
         bKsyx42y5/LcGebk3Qh5ADvu9Ez1qHlrUwUPHhIUIo4kJIqZBy/IO2TxlNZlVhyC3DOx
         dGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746872668; x=1747477468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oE1Ex4iGsssyaIBLKiOZrSIgezQkyez+G/tcna3LlvY=;
        b=jR+xkAW8eix1wqqQRQ5ode5gRjlMR952hqRn1rtun5nd/AlsW4PT4jhpDTrOt/j/F6
         95IffXelrfuAREwuhOFvCWyqrnCd6T/1AhAR/LUKwv1B8fwZOSKfYg3vSfAWuNAh6Aqz
         y9e5w2mAjgvAyT986qx3b8Wzpum8s2EWXxBeFqprLU7vjQuabn0Hsj1Ahl2WNixKY/Ea
         xrDawodGG7hyMxVDxq5TBcuDktf/mTMHrU7D12QKHt8Varrtnfch7Jb80It/NxM2PWDt
         CoXziGUz1dE4ftgAP9j/uUJnaLWeVb5pue3/nSK+Dw7iPelu6kR09c02JogEd7CumHpV
         /W8w==
X-Forwarded-Encrypted: i=1; AJvYcCX5z6vWZsV8OP8y0+AoyIJ9fOWxb45vlil3Dx22wG7Nb7DcJtsTACws79n/R8mqYWCnEgSKTJzSfY7x1KLZwfQ=@lists.infradead.org, AJvYcCXN02Zzt38mwd7vfgO/HsdKG6SMLcegjU9HPAQHTtJQjuMIgAMkEi+IjMws0BknJ5cPrABzAoSkF12AxrCWQh7M@lists.infradead.org
X-Gm-Message-State: AOJu0YzYww540XWxogmtev+opFpnfSaI+cSN1qrHe6aneex0+5fS74eI
	YWaq5sZe639lt/HWu3x59eq4EtKu11FnQsUUWIswJN7rHWeryclfS7+fUw==
X-Gm-Gg: ASbGncvtH6pZReZ2cwrXS8PLnsY+GwveKSu6TSZ12bw6XYG1kB0Dyn7tWzhsKliv8wQ
	lZ9lbESM8MKgux6BoGc9UBRh53Epw8xzs9Jz+PNYxJHitVh2CSEASUrorLD7AM+fVwMDGrLjYkO
	LbXiTgJPIr0Cr6CBbTqf5ywPQQCVHtr+UQak6WRWvfF8D9+HDbGJfvNB8sSOjOGf9gTNQAmtinu
	YPhpuFddGGMx7P+YqthVvTs7g3NMGIESmJqV+6zS+4CE2EMBGYhFilWMaNIE69XZQhxrIs1/ULe
	LU9qpl+4Wm3Inm78nm1Urnl+aYcHpt857WdoqP4sew86nCYxwafed1MFIgAo4FeHGQyt5+DDfqZ
	UCBxffHH34TwdlO2tADbCxn8TlvIRwpA=
X-Google-Smtp-Source: AGHT+IFj2rbQdHTQ/nd9uAjG0V1vqgaY6+WktosXYyiS+kWJo0c0aXetW+yPBLrq9z7YfQOtUlYQTA==
X-Received: by 2002:a05:600c:6612:b0:442:e147:bea6 with SMTP id 5b1f17b1804b1-442e17571f9mr7712275e9.11.1746872668065;
        Sat, 10 May 2025 03:24:28 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67df639sm57981265e9.13.2025.05.10.03.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 03:24:27 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH v3 02/11] net: phy: introduce phy_interface_copy helper
Date: Sat, 10 May 2025 12:23:22 +0200
Message-ID: <20250510102348.14134-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250510102348.14134-1-ansuelsmth@gmail.com>
References: <20250510102348.14134-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_032430_078078_DED1A424 
X-CRM114-Status: GOOD (  11.67  )
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

Introduce phy_interface_copy helper as a shorthand to copy the PHY
interface bitmap to a different location.

This is useful if a PHY interface bitmap needs to be stored in a
different variable and needs to be reset to an original value saved in a
different bitmap.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/linux/phy.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index d62d292024bc..9f0e5fb30d63 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -173,6 +173,11 @@ static inline void phy_interface_or(unsigned long *dst, const unsigned long *a,
 	bitmap_or(dst, a, b, PHY_INTERFACE_MODE_MAX);
 }
 
+static inline void phy_interface_copy(unsigned long *dst, const unsigned long *src)
+{
+	bitmap_copy(dst, src, PHY_INTERFACE_MODE_MAX);
+}
+
 static inline void phy_interface_set_rgmii(unsigned long *intf)
 {
 	__set_bit(PHY_INTERFACE_MODE_RGMII, intf);
-- 
2.48.1


