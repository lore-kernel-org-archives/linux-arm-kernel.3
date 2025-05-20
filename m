Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F50CC54756
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 00:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HRIphWRJ6yxqwHo5avSEOKiJvJFPrkseN7ZgeLPZB5Q=; b=xcCSNFyLdVFnFqfG7Ow/gkLMng
	j1MmGZaUXksIwBb16ctUDYQ/0+2pyfZcJoLbyuCwbBeNJdYAwJ1lBgYqLLCJoq4eo6N177ZAlDUWN
	GdfnW1TYdyV9uUl3Q4YtermadJB6NHWmo32WAM7e0AyJAErGwqQwSn2yJw/Ci2a9HtBg3UHeOHhHM
	4o1AF5WcupCUL6fanFQBxIuMYw59o7qBB4m+JXY+24yggtc1eXNzRl3JDwv7fm4vDuDN3AA+ARPrw
	MfApxX3jGftkv3r++cg5P/qMcUeM3DwpkGPs49WYz+bOiside3kVRN8QVRiIXkt/Bo6rZucZtwN5d
	XML/VRCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHAxc-0000000B91f-2oWa;
	Tue, 20 May 2025 00:36:00 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHAvS-0000000B8Y2-2x02;
	Tue, 20 May 2025 00:33:47 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6f8aabbffaeso47254856d6.0;
        Mon, 19 May 2025 17:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747701225; x=1748306025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HRIphWRJ6yxqwHo5avSEOKiJvJFPrkseN7ZgeLPZB5Q=;
        b=g/arkDOTQLJnKM1IG1yNjzZKJ4/cVebEduccuPBP3BYZ4ze+C8reanVeiC6+WZlH1K
         m9GF9HDHhUbC7XBT2fFDFPp6tufFYqkQ3uPZAcQtYUPJZEWJ5sg2q4MdURCzPll+V8JZ
         2FypGMsjwq+beV3bvuLi5xeqVE/HaNNkIgv5LG9wEzNShPdhzl8enjqypRIMSwc3fZ4S
         xB4UnDIRpO+PuEnLWKmRBUWAyIx/DEnRGiX8MSAeF5zai8mBe6o5HqIQMpqUPpSbxrTx
         jbXchtAndWgsJ0/HJuAvCBReG/4j9mK1IFHmfmHRcIIM7kuLecxTnv1HkH8Syo3uudRI
         ciQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747701225; x=1748306025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRIphWRJ6yxqwHo5avSEOKiJvJFPrkseN7ZgeLPZB5Q=;
        b=gy0xLbsQ/55l9AxcEzH/huJANPEQEatdqbBAzuBkxM/6TXj7goqZ6mumeNamvMUMRp
         0/NWYDZtfixFrfcdpvo1HmVeGscvdouWoAAYHwwpEHkHxHR5fL/H4cP6U3agUY8kfNma
         IoQed/WD2emEHJza6Q7KHFcjG1FaHEodP7rsb/XZlbtAuC4xlekxSbcGkZ0CCmgFFn7I
         +ReTfRKG0sK6o5S9MzkKx9bEYQDVkMPQwVXbaXBE0tYrO/KDsrxrgEeMCsqp+nEUccBR
         gSFVbP047tpbzMJbiXHxyM8M1F3kW+eXZFZDdcxXKM+R5ACJOl/UTXk0l2k7s8LnHe9r
         Hw3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVo0hQvFn2lO7Qwd88qJBH06EvkM2CMR3rcKxqglNjodXTEudP4gIz+eaOkkvK3DywFgP5U00sObsdKTNHTZmw=@lists.infradead.org, AJvYcCXrLbVy4f2OAuAZgd5nddtAEKhlp7devyjF4U8jX6NyaKS13RVEsA+MPQLO+9mX13tYTVMxvS8p6w9VnwE/rRnb@lists.infradead.org
X-Gm-Message-State: AOJu0YwKD41xxvYCMy9KHSqPVC03XuVIqWDmmrIDw37JZTESrKk/as7x
	gpxijLRBa/nVB2UNBLAW7skVTUWz3/NumpltIKYCGiU3sN76K3vA2OE4H/lj7IIf
X-Gm-Gg: ASbGncsIHyOOs9GlVrarHyQXRJW3O3l5n7zwqqlNARlpyb864CHEdClLNTVx5izL6yP
	dsPSKMG2rKCghM10TfwVNIOUVbvhO3uq3GZeDbqbSUMw6KIL2Bh35kGxsvl7RuB3p161ptUajSw
	6ltsND+txZjI1lrTZEZpe4es/G1A+jvKknASh1ytmLRfCjhtaEbq4KQdsNBDzzDxvfrilV+8RPT
	mGqvSqQcn5edb/cFSZvvqbjoKgo3/3vrruDxSIRLFUE+14u2VVYCFL+lJfM+pYgvfmuMrJ5SvTy
	H0bTlqjNQT05wymWqfpzFI2lnArqmgcuv9D0iymuD7y0vCQjYZCTXsxOcI/fYTQ=
X-Google-Smtp-Source: AGHT+IGiV7pijz7nvI/loSmEGHbHPxhDuQhRSnkTls6HLJSpISucF/2MKr2dOMkrTMEVSR2T2vf4Hg==
X-Received: by 2002:a05:6214:248a:b0:6f4:f458:7ef2 with SMTP id 6a1803df08f44-6f8b2dce6d3mr219912446d6.43.1747701224942;
        Mon, 19 May 2025 17:33:44 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08ac4c7sm63479556d6.45.2025.05.19.17.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 17:33:44 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: nicolas.frattaroli@collabora.com,
	detlev.casanova@collabora.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH 0/1] arm64: dts: rockchip: Use standard PHY reset properties for RK3576 ArmSoM Sige5
Date: Mon, 19 May 2025 20:33:31 -0400
Message-Id: <20250520003332.163124-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_173346_744370_B5D1379A 
X-CRM114-Status: UNSURE (   8.63  )
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

This patch updates the RK3576 ArmSoM Sige5 device tree to use standard
Ethernet PHY reset properties. It replaces the deprecated Synopsys-specific
snps,reset-gpio, snps,reset-active-low, and snps,reset-delays-us properties
in the gmac0 and gmac1 nodes with the standard reset-gpios, reset-assert-us,
and reset-deassert-us properties in the rgmii_phy0 and rgmii_phy1 nodes.
It also adds pinctrl properties to the PHY nodes and defines gmac0_rst and
gmac1_rst in the pinctrl node. The phy-handle property is reordered for
consistency.

The changes have been tested on the ArmSoM Sige5 board, confirming proper
Ethernet functionality.

Signed-off-by: John Clark <inindev@gmail.com>

---
John Clark (1):
  arm64: dts: rockchip: Use standard PHY reset properties for RK3576
    ArmSoM Sige5

 .../boot/dts/rockchip/rk3576-armsom-sige5.dts | 35 +++++++++++--------
 1 file changed, 21 insertions(+), 14 deletions(-)

-- 
2.39.5


