Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9679C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4uBBexglmDg860eeLxvF6Ft+pxKPH1DbiU+A4sUq4Hk=; b=iLeHINjSGAZghXEXWc7cQzYF6q
	EBWfSmipK9l2j0sWzRGy8Y6ZfPwCD0+8CtYpDqq+5ZiWuGWyWfKjehNtnmCGP4ajL48EzeKK8dk2W
	X8B0eEZbnUey1CRijwvD62qJbMxU2e4uy2k2p6BCcm2EzPpnUzoVJCXa+yFE+Bs+C12gmbdxr6pas
	z8SN4ADvRS0pPv6+GkM9MzCjCwod6Eg20RybbVvSfVpuz+eYfcvjfvPW311d+dHXeUMXVRF3w9F9w
	50AD6BTWZq87d2VNQEe3il4aG23HR4RglqAMk58rAKPifxqRjHtj6F0vylQYPbsu40J5zjR6gbJHx
	btQLZdbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrXE-00000001ahq-2KH9;
	Sat, 07 Jun 2025 11:16:24 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrJO-00000001ZX8-1Eb3;
	Sat, 07 Jun 2025 11:02:07 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7426c44e014so2517081b3a.3;
        Sat, 07 Jun 2025 04:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749294125; x=1749898925; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4uBBexglmDg860eeLxvF6Ft+pxKPH1DbiU+A4sUq4Hk=;
        b=aHqiYVc1CvBxq0Q3vigmzWdSp2PUSTFX+p/Zm6k7Vq1MOhQYXaI4PYynu7ecxoVDo6
         kVuNBqiqdz4tk7dsUQfVkxGU6b2+Rc59FptohJyj7edfbvKoekFahA+8VCiyFdtTl4kX
         jk/E1cfZ+sxFs6u6W5LD3esg6LdTut8R5NwU+gYavsQiXUF32dkS5sXvOLUGkknHB/EX
         Z7u886pSWP0G1fUqTXdYZ2syP99NAIuEEMmdlKI5eb7K7unxqGz2wvQsct/ZwARsB1qp
         zrQUYECR7lSGVfqEGm99ZmTEmZw6Z+0gaRgqzbFx0hoYvoXG5bxTA5cfgORE4VCC/jiz
         Ankg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749294125; x=1749898925;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4uBBexglmDg860eeLxvF6Ft+pxKPH1DbiU+A4sUq4Hk=;
        b=U6+RIJSw+7X6qtae5ENFFM9T0FuvsTt8tIMiZoAurADZ4VUATPOvEAhfDbwE8m1j6I
         8Bh1hQRN9q6p2Vzxm2YBVchiV+NydEvcCWWEbGIyyAw8KVdB+bI/PAgyTyuespo7TUAJ
         sqGHjQ86rquEqKgBI3kMzsnqQduvsssBbC6ANmSS7Mo0jySMdixroVsFtVuU2/hiINc3
         YIU7ux8AvvVjVdjcyCY9L62IxGWuzC72gCDryTG1K0QoTsPyeSvaPWhR8FZVq1UqDJzR
         gcExZXwgU98wqx9KciDZ6DUb8J8tvHZNu5pcfJyPTk1TVpzCjidEquob+uPR0qrD2gwa
         2vnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTGnincd+4JxBerc7DG2UsOh866bq9hJkLcibkrZV1wKh2j2pTQgK63GTHzoHI22i7Pki7qZYcZZB4ieB3O6tc@lists.infradead.org, AJvYcCVVSdEOActXy65FKZ3ofjWLF9VDxcTiX0fRG1Ku2SN35CTl2pK1W3ztvV3vpciJt1Ln8/mUF9rmI4+t@lists.infradead.org
X-Gm-Message-State: AOJu0YzXPSk9GEkolu0o53ZB4+f++ai13A4ohruA0AnhYXjL5u+r5mOn
	rYoGPwF9PIztZ2zNt+gze2NLr3gDRzmdPTPHzsugc0lsudGDZD8daPDENBLXEB6F
X-Gm-Gg: ASbGncv6dMx4sC98VRQbhPoM7ug04+ZCd2R4psoIvEdy8baEg9AuLCMTV1VSvrEqdlc
	YaumyDAIWzoWiqgjKJUeOmJL+fAV+7deQnHWhpM2M0votckB8z2ULt7NmtuWov9AxZMA9+THr8I
	LdZfKf8zjrTxYjIkqGwh7L7GYWQjsBB/md2QX9qK5h3sBciq77EeWrwx7WXl35C4voRdd6lCsyH
	qwTwHAjtZYLtGvbnA9O407vVklgt51ZKgh0ucTZ/SAVKtvl7FF22ZoHXBRoK/pjbWCRI1cFLyw/
	uVjVuioveiiG9ohLufNLHwwhi+lFcry9sApUtqQWge9FlAv4ag==
X-Google-Smtp-Source: AGHT+IFYL9anMnNxKV2ckcM3gDwV1GsmgLUpZL8PFIBko5cIs/9IiYHRWTIxEtw+MUY9myL9CJHr3Q==
X-Received: by 2002:a05:6a00:2e07:b0:746:2c7f:b271 with SMTP id d2e1a72fcca58-74827e7f485mr8075913b3a.9.1749294125519;
        Sat, 07 Jun 2025 04:02:05 -0700 (PDT)
Received: from geday ([2804:7f2:800b:2bc9::dead:c001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c6649sm2538048b3a.113.2025.06.07.04.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 04:02:05 -0700 (PDT)
Date: Sat, 7 Jun 2025 08:01:59 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/4] phy: rockchip-pcie: adjust read mask and write
 strobe disable
Message-ID: <aEQcJ7L5AlxP2Z6w@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_040206_334931_CB53460F 
X-CRM114-Status: GOOD (  10.49  )
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

Section 17.6.10 of the RK3399 TRM "PCIe PIPE PHY registers Description"
defines asynchronous strobe TEST_WRITE which should be enabled then
disabled and seems to have been copy-pasted as of current. Adjust it.
While at it, adjust read mask which should be the same as write mask.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-pcie.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
index 48bcc7d2b33b..35d2523ee776 100644
--- a/drivers/phy/rockchip/phy-rockchip-pcie.c
+++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
@@ -30,9 +30,9 @@
 #define PHY_CFG_ADDR_SHIFT    1
 #define PHY_CFG_DATA_MASK     0xf
 #define PHY_CFG_ADDR_MASK     0x3f
-#define PHY_CFG_RD_MASK       0x3ff
+#define PHY_CFG_RD_MASK       0x3f
 #define PHY_CFG_WR_ENABLE     1
-#define PHY_CFG_WR_DISABLE    1
+#define PHY_CFG_WR_DISABLE    0
 #define PHY_CFG_WR_SHIFT      0
 #define PHY_CFG_WR_MASK       1
 #define PHY_CFG_PLL_LOCK      0x10
-- 
2.49.0


