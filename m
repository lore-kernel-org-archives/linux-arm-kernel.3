Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDD9C83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 22:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMkTHKD3jio2hpq8BtE0DToF1CwksemxWLN6Z8dMYEk=; b=VehE8Dl/FynQz/M5zjJc6S8ulR
	+vg6HcNIRglfohtWqOrmJKYy2HiQU9NfQ7Fe4QZZVsffvWxMp/oMDoNN2TJd7LO2GPTqKWv/AM59V
	zXUVyc6TTuMg2IzFVq1FP1jSR6gxNlgOzzPXibtm5BuvHgAxxpsKpXn/Kmyi3rygrNOqFhpFexiUw
	sBiMhtVs2k4/uYwuIBD0bnKcxZ4D7eD7Dr6i5nRl5XY9ReBG4mUWL6e2TAMf/OjuUfugPwmxp5Vr7
	jCK55vDxtcT9H+c/3EoiMJ1SykcvJ7/R1NnY9eJUukg9hASD3P4d4ayligs12530XGdckIkxXDJH0
	Bz9j29Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWN65-00000003cmf-2cKt;
	Mon, 30 Jun 2025 22:35:33 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMwS-00000003ak5-2Ikx;
	Mon, 30 Jun 2025 22:25:37 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6fada2dd785so33313686d6.2;
        Mon, 30 Jun 2025 15:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751322335; x=1751927135; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rMkTHKD3jio2hpq8BtE0DToF1CwksemxWLN6Z8dMYEk=;
        b=l9o1aJXONzKiK+UIOEbudtIklsIpyElT9Hn7dpKtiWTSGnhnAL/c5kEj2ZgerhEM9M
         xDpz0pLuf233B459ER1a1lb/tN27pRus3NYmwz9q4oZKeXVazZgqA+5SJRqioixQni2Q
         ILtHSiWsN7VJbJXxYbzet2JVaWSBkcSWkpfWjqFjO6mbhbUxYUewHDzAB+2sjmv8gFot
         MyD+THaNEWJFsveLIYzg190ej4pl/011Dq/dXZ+rg1qo0zQd2pZhZijfvNmjatdfwgjk
         nVfL2jjKLoIGE8YC1ma8s0hatgC5agO9GenO8YNaNQMMXYPzWlg/Q+QBs71tiTLjn1+p
         zfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751322335; x=1751927135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMkTHKD3jio2hpq8BtE0DToF1CwksemxWLN6Z8dMYEk=;
        b=AyCNYKG9JGic15isrHTiVvFN91MKOW6cAkNIeeF6LsrvMGYR9iKK3cyipKZxCGgNs5
         Qux3+UpzQEo4W/3yY9rtiwvCouPi4FWJS3NoQbx6Bgfmjh1EVZhOzyU/QaBWULBGWeiv
         jGFIAUo5cJDV/qCpUum077Ojwj/anTi/N/wYMe/+MT3XtNkf07uI2sdpZ3fVou2cdJ7c
         MYEZv72/FBmilUmzar5rwMzsjm7OI8Jb4LEyA5C8WoWBnYjLo7dDPpIiPJ4jg194Mw2X
         2cbR5kjIWUoSqXLidwTJo9K1vldYFltXXvrZ8H9s+BE2+JJicGnKVsV+P8ZPN+BT3o6q
         VB9A==
X-Forwarded-Encrypted: i=1; AJvYcCW/sJLcMyFpzRGwe5yYrqz8XS2ixEG8BJN2Pvk2KAtCm+Uv21YlDLdOUERgNZxh1pyZcCvgcs8P0D6l@lists.infradead.org, AJvYcCWlnd+lbmoWO3y5WOaP73yS1X458zVY7EGzxhH6WGIvTL0zD6Sc0SUsNfXkKmt8iE2Bp2aFnB6qUha7aDEWNRGJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yye6fC5MvvZboem+hHm2eo2dsZ5LekXs6zU6l22WixgLY0Zq5Vy
	7q2eJIKvrPjKnRS3ldn6z4M7IUP7HpcGHiKrRW7aHzvYTUngzmG0uAgBkC6r+Nu1
X-Gm-Gg: ASbGncthr9FW8ijxxG/cYplKnKaa4fe2biIEJtANWPda8fPUyNmkxV3lqlym2bPlvWp
	YhgvXWUBmg5kY9EiLLesvZc4sTESYBSbC+VT/kKxs7GC1vzbUgjaz/AdSrJD+SGi3L5ypbyuN5a
	tRIZYZZ3OooI/vAtRLKh1bFCmiUt+X2iUBvmdzYzn1NWx5/bLZQ3iZ5O1BV1T9XrDpIvxpi1+KO
	mxQdIHo/z50sJaE6Byn3weBIAES4j0+suvuMnnd7Odi+oDTzx4dlyqUBEz476ZmiEsay6M2moFj
	j66EfPm2eBsokr0YLt07QtQ5hivmTb7xNjq7VPEkhrLOz0dBqw==
X-Google-Smtp-Source: AGHT+IE4iPMoQHELkr+tznv/l/wb/8KLRUH+p7JvVVca5CKnURWz4GeCY3XtHhceEVufm737DrAHNQ==
X-Received: by 2002:ad4:5ba5:0:b0:6fb:5249:59fe with SMTP id 6a1803df08f44-6ffed7a5653mr221531976d6.2.1751322335383;
        Mon, 30 Jun 2025 15:25:35 -0700 (PDT)
Received: from geday ([2804:7f2:800b:4851::dead:c001])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e349dsm74788696d6.68.2025.06.30.15.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 15:25:34 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:25:28 -0300
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
	Neil Armstrong <neil.armstrong@linaro.org>,
	Valmantas Paliksa <walmis@gmail.com>, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v9 4/4] phy: rockchip-pcie: Properly disable
 TEST_WRITE strobe signal
Message-ID: <d514d5d5627680caafa8b7548cbdfee4307f5440.1751322015.git.geraldogabriel@gmail.com>
References: <cover.1751322015.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751322015.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_152536_580433_2384F929 
X-CRM114-Status: GOOD (  11.23  )
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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


