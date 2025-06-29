Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B98C7EE39
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 13:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvjviZOYrIKurfYh7ExfJUlmx0DJYashywHEqMq8QKk=; b=QyRvxzH+EedkwYxHxft3sTbHMk
	LtoZOJM+b4O3nGMQN+lDo/Bz4Dmq31JiK0Al+dHoYR8kSH28ZkhA0JpVLwxJPWzWSypO+nhoB/ewo
	HN/upnWy+F4WHu5TtdPVd5tNW33EzxFPkeQu7gzbT6SBzxysMdDg0SSSPHYrGPiCfHi8nhqLWSyTh
	kEe3cWaaeJckBvQauIoCSObEImYDKixmO1MdmIpBpgrr/X4S/xco474nS/bEXdOCEDco/T32RPqi4
	sLtFWo0fVREgyagsadBfEqmSW8pE4bHjud5T2bWcrkC4xXxjRVIMMZD2JRxhUDSvFZRsdFGrw0I+s
	yspcKbOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVrrQ-00000000H0w-0OxB;
	Sun, 29 Jun 2025 13:14:20 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVrSS-00000000F50-0m3H;
	Sun, 29 Jun 2025 12:48:33 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7d20f799fe9so404362785a.2;
        Sun, 29 Jun 2025 05:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751201311; x=1751806111; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OvjviZOYrIKurfYh7ExfJUlmx0DJYashywHEqMq8QKk=;
        b=S48m+xg2ln9ZcU1MDPwQ+4o+zg0B0Ws+nRkmnIOv889AC12j0n03GSe7QTzVK5j6MO
         q4QHawlRbbtLOOa+ZFm1dKSN4m8zXXlrfBb+BbT2NG5WgRxnTxZ3HqnmVchU0zlpGmO2
         AmWBBJey2Tr2vELNvcsAX+X1onczjC1qJyIViuJbSFJbJF4BQyx6ZWK/63/32nkxRY+b
         rZ+0cIExv5u0wwDKndhwfNNyssQyZxtmEN5USFbaTet+DLDoruA4X107Li87kAitRwOV
         Kzhiv/pczhfalyQimtXP0KFif2mANrp9IikiyBl4b/5PsQzItX5zF5sdULS658vEzwYs
         fxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751201311; x=1751806111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvjviZOYrIKurfYh7ExfJUlmx0DJYashywHEqMq8QKk=;
        b=adKtjFdy178eIInBN7A8ba598RsU6KBRR9CyOdXyLdhI/1hwFxqQt+dLK2sSmhUNhn
         A6iHP8R50AjND8pG4uGVOycxgmdOGiT7/plzToN6V/tvzdaka+E7Bmb+Zvh5F/magQjj
         X9Q/rrtOzXbVOt5yls5yYuqGDDt5CluxNCrN6wyEuU/gu73JUghC860SyfQLB0esbDS9
         Y9Kohi2LAe3XFf++sDzzqrPGwktVScMgbVRHmsV0dhbm5ooEvAbBEm2Uqyh+ZPXWcMoq
         l+XNXyehxUY+j6OgUSissI7rVktqEcAzcR0hXHVjQMA677/XfdiXrOwIptEbyML7vnxQ
         TuDQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6HkmWNpU/Rch9bnCjPIgo51vefWGHqt5csmvW6PE0NnHixJp+5lLCFmpHb+6dN5uJoS/tRIdIYrxT@lists.infradead.org, AJvYcCX6cRVWwDo5gdYnfOYnAU5BHw8MpeJezqYp+K06XOhFmgRPwSxGuPrpw7JsiBOmHL779GVgHnitB+nwu0NKxJLu@lists.infradead.org
X-Gm-Message-State: AOJu0YzUH2X0UJ7fUQkx1oanQ0jDa0PmwspSJsXvKAUqhznUIkQQ0g86
	J4hsOB+LRYY2LbEdWLfy/4edjgRgt60gaLlfUo9qL5/oTOPWZg2K90oTUdiV7zmyn5nvyOVU
X-Gm-Gg: ASbGncue/CdYib+F7zNqJ1WleKkIy1+ZJXrHuDQzv0w4sXFSIuR6g+aNLsLa8wdKYII
	Mbd951S69DDZ/87M3AKBccws1xbC6C56cjoTZyzpFcQYIckhfcg7ass0RIF+xgrQR4PS2abv6nV
	fKPvcVXl3URAirEnU3Szy+7sdx7pxwOESfOyothU3c3a9Gt3eFSdu1Gst66r8t3TNDZcH0X0U4i
	cK4TznYUkTMDcD5H1HJyNDsHqCbUhadz+DQbwiapDzEhTSHROCOpDymz8HCjBf2dHArrysguJj4
	ojDMo/yhn9eufPhMkbEfINSAYXzxeTxAVngPagL1Xi0BUI9+aA==
X-Google-Smtp-Source: AGHT+IEL/USEP/o68qM8kpTv7RVt+yvEVYuaMW1bky10qQjPlYApX6JjeupaO/caQhzoh8VdKrp98w==
X-Received: by 2002:a05:620a:2556:b0:7d4:567e:3df3 with SMTP id af79cd13be357-7d4567e4429mr264478785a.46.1751201311114;
        Sun, 29 Jun 2025 05:48:31 -0700 (PDT)
Received: from geday ([2804:7f2:800b:24f4::dead:c001])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443203134sm435231085a.67.2025.06.29.05.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 05:48:30 -0700 (PDT)
Date: Sun, 29 Jun 2025 09:48:24 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/4] phy: rockchip-pcie: Properly disable TEST_WRITE
 strobe signal
Message-ID: <60ad1985a0de0a6b47044ea9c0acefe6ff865aad.1751200382.git.geraldogabriel@gmail.com>
References: <cover.1751200382.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751200382.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_054832_220964_1D57DC04 
X-CRM114-Status: GOOD (  10.97  )
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

pcie_conf is used to touch TEST_WRITE strobe signal. This signal should
be enabled, a little time waited, and then disabled. Current code clearly
was copy-pasted and never disables the strobe signal. Adjust the define.
While at it, remove PHY_CFG_RD_MASK which has been unused since
64cdc0360811 ("phy: rockchip-pcie: remove unused phy_rd_cfg function").

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-pcie.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
index f22ffb41cdc2..4e2dfd01adf2 100644
--- a/drivers/phy/rockchip/phy-rockchip-pcie.c
+++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
@@ -30,9 +30,8 @@
 #define PHY_CFG_ADDR_SHIFT    1
 #define PHY_CFG_DATA_MASK     0xf
 #define PHY_CFG_ADDR_MASK     0x3f
-#define PHY_CFG_RD_MASK       0x3ff
 #define PHY_CFG_WR_ENABLE     1
-#define PHY_CFG_WR_DISABLE    1
+#define PHY_CFG_WR_DISABLE    0
 #define PHY_CFG_WR_SHIFT      0
 #define PHY_CFG_WR_MASK       1
 #define PHY_CFG_PLL_LOCK      0x10
-- 
2.49.0


