Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11155C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 05:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uBBexglmDg860eeLxvF6Ft+pxKPH1DbiU+A4sUq4Hk=; b=BAI0KeLW8eAshXKWS/AMvLPouL
	WqCm6tBarRH9n40n2dAyykr7zLjEZfiHOnQssbz+89jjcSMhsd6DCj+RAu+HTLLkC63GZRgCN9GLP
	xgCaVlXKgAE2qfoLzKRP4SBxeif90tL4T5OQJrldCH81nNxEGZZXPbXZQd8wkkVphR1zc/3ZSk2x/
	M8YNateL+6fP/qr56lGMMpKb9fUZXNpDBveGda7HueVdO4E8j4vicd/JT3PQUE2roo54Ovc6ghdVz
	uDQKkhX25s0/mjzGkNyhlr1+ZrWr5VyjVWPiMItGJh2DxF5qBgfY4r3EFeI8dqVWZuZqr2Vgiz/te
	1LHJujNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPx5O-0000000FOMq-117C;
	Fri, 13 Jun 2025 05:36:18 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPws1-0000000FMx7-3G1i;
	Fri, 13 Jun 2025 05:22:30 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b2fb8226e1cso2780840a12.0;
        Thu, 12 Jun 2025 22:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749792149; x=1750396949; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4uBBexglmDg860eeLxvF6Ft+pxKPH1DbiU+A4sUq4Hk=;
        b=F3Z3Ziss6V0PScRrrmEBcoDfiBklA9evRXsSnz0IfZrmZjmVtI1aJrTr4GRRP23wb5
         q0aM1192uQDhBzhFs4rrbnOY0Cy09L3Jw6jprDMi8qZ+8CjBNUp5TyiPpsF2DG7t4MMC
         1OWAiRxPOYvVctn8LVs9kTeRlrE9z0ckUpuroRjzoxFPqNmj17ZTi20CU0t8BnXniVg5
         n2dVDO3hQKjAgfWyATN9Llug4h6FenZPyojCB/6hlM/0AeNjYggODpb9Pmubpufyt6nC
         Phgblylp2po3xHUjMgrp/Tq7RGGUmMZc0cdAE6d+46etZYcQyD+8OhJdPw4zqP80CH3o
         Gg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749792149; x=1750396949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uBBexglmDg860eeLxvF6Ft+pxKPH1DbiU+A4sUq4Hk=;
        b=WGTzsP3CMo1whDhHWSggcc4O24MToDM2CIX3STAXzS4PEOm3BLFUkN+Htt2lQTiFdY
         BMFNOhdxwc2U373lFdTEVUgQWRldzIwWwJwIesIaQ4mCqYH/cLWX+TC4oFOzuBNaJhtJ
         WDY2lbWU3Pnhr4enAE6ADx5swkPtt2azgHdDnoD9YQQ62g9qINyto/tdGOI79cDnLbG7
         RuSQ4bzEwc64R0D0vQTM0/UwHctjJqqCMjFhfk/2nF7tYXrmnkJE26cjs0WwAvshy7Wc
         /SSX5D8LE0l6qiuv83wueumWWMFt1DeN4nawinPKZPVp2RFBSUnKTY8wPKnEwgkCsaSh
         4Oeg==
X-Forwarded-Encrypted: i=1; AJvYcCW/ObF1EuM6as25wmEeMSh4sZgiZRhI6D48nHHJkOM2IkiTIyRyMejfKGYUrOOvyBCPNzOn+srtXWPzX8kN7G+P@lists.infradead.org, AJvYcCXyTw0RRujNiPPLZDbsu4m627V48Ax0giwj5K3h4zN6c5SMU0Ky1zTFv/UqylgY6QzxDpn/GtzcTQ4F@lists.infradead.org
X-Gm-Message-State: AOJu0YweklJ1I/+B5x8p7fDzHR5hPq7PT0RBYZih2XJLEgPMo71HfWe6
	hF1V8qVSxdARNOgKPhNPy+8AupbZrZjKFO/8v+qBdMTFaaRv4J+Wv6CEq8DSaLgK
X-Gm-Gg: ASbGncvB2EW9H68XKngEIZ9JUbaoc98QRKMWibZmUyt3m3iqag6Sd8F+uSDlLDPZILi
	tWmwxi+Z1zbbVxEVmEblPWLQggsvb+6gdW8/84QhqsyiQmqPJukRQ0oAZW/a+sAboIqSqHnsJv1
	AsQOtZ7ODA23cZEQ59SEDKe6WX8QDCRl36dnnyKddUO9xs0l+07IM1j0atBYegSn3FBQQu8pkRz
	r3hQ1VZXJkW+f4FfIJXqlGwVivO8EMohQi7/UpOqqVcz+TxRJc9/y+uw8qX22GbZ+lTfPPcbZs/
	sSsISz5zBZCNnXny5416da6T9zDrUAXNkFQpLXkuXYufgEUR3Q==
X-Google-Smtp-Source: AGHT+IFpkN3auFoUSur2HmEifJee1D0zvlbAS430sg92+kqbhRCmj5VMxWFWrFOefv7KFe5llBsOQg==
X-Received: by 2002:a17:902:ec8b:b0:235:1b50:7245 with SMTP id d9443c01a7336-2365f876f73mr16933175ad.7.1749792148844;
        Thu, 12 Jun 2025 22:22:28 -0700 (PDT)
Received: from geday ([2804:7f2:800b:7667::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de78565sm6223145ad.124.2025.06.12.22.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:22:28 -0700 (PDT)
Date: Fri, 13 Jun 2025 02:22:22 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 5/5] phy: rockchip-pcie: Adjust read mask and write
Message-ID: <e8bc1e12ad3c7c38bfef25e696ffbec2b25f312c.1749791474.git.geraldogabriel@gmail.com>
References: <cover.1749791474.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749791474.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_222229_817711_F9276EC0 
X-CRM114-Status: GOOD (  11.53  )
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


