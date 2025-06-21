Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CEEC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 01:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvjviZOYrIKurfYh7ExfJUlmx0DJYashywHEqMq8QKk=; b=v+zMsvoYMItTe3ymw1u8dorVXM
	jLKcV7NNxOW9AQKH0KQnVbIIgzOvAQ5tY/N4f6+Yo36Gr2Lucv+hbeddnepb37bzIeZr2jyuVAqGA
	8+G37UcWhkNMIP0k7ZY/jVqqohmmHLGCeFQzutFVPqJcg9GgS4KJQpfD/4XnHnVYqTfgLTxAQ2B0h
	BRNtykOnqQEhf4QxTNqSwcLpK8xmVaDXxk74NarDYZ97YkZG+hA49T7ot/z0/lqWJxNISNzuJSArg
	7ixNej8TAMd6YpBcEQEhjtkF7joiQPW9zPxpQDv7R594FzW+K1xF7XrPMWPjBzMdyeEcl9qPmt2W2
	2p3GINow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSnW6-0000000Gx0N-0c4V;
	Sat, 21 Jun 2025 01:59:38 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSnLw-0000000Gw5i-1snW;
	Sat, 21 Jun 2025 01:49:09 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-23633a6ac50so33957865ad.2;
        Fri, 20 Jun 2025 18:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750470548; x=1751075348; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OvjviZOYrIKurfYh7ExfJUlmx0DJYashywHEqMq8QKk=;
        b=ewjagLoQiF2IqqIEq2skq9hZ8jgNmqycC7BSyEUxM8X8+ebPNBOzsjDbjhOshQMdLm
         4eWDftRTFcAQjfN3bUaMb83wFaPv9LSBTcYX1/uTz1f/Et5enneEHHfvAvr2lrCpEZcb
         8YxPpA9SIey+uV4jT6hq40RwBbrxt2xXgPl73kyvyeKW6gR5ruP3M52ubcwIJ8qkVgOM
         xAjchpDF7doCflVeNhevyCy8J8HJ4SEwpRpl5Lj/uGgmb+M+dN6HotLAaIg8k31/Mw74
         sDF0/lzwxagvhW2xTxV565QuE1zhheEAujsTCgEhN+Kxj1i4eTOIV2KAD61yPUSUL1zl
         7c4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750470548; x=1751075348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvjviZOYrIKurfYh7ExfJUlmx0DJYashywHEqMq8QKk=;
        b=kvVpmos99fxhEUXpmH+WvHyM8q3a5/rzkOpj/8DP5EGKCqmYPWBwxGaKu2/F25aYhB
         KocBdr2lE4gezYWh2tWWKr2bAN0rJeu3slCO66m8ohTE1f3239eRkj7fD0LeOziXqlhr
         FnH0iIkEBg0u0FRzBP7zbulLcHZk/1F7Us78hgAXbjtcAtp7yAb/t78HZ9J4wxxShaCH
         0UoMaM8POeDXw+KRvyjp8OCmvu22kKoKqgs3unzG3dnpQLQtDBEVwLnKRhVOFoB93bY8
         yeWwGd5TH12F4H3FXICgwQ9Wv7A0hQQgiO/CJSgYeDYLoMjuPG4EjbOI0svQPYf3gxSo
         924A==
X-Forwarded-Encrypted: i=1; AJvYcCU4JB4k0tF27/XMvFOXfSriqgfada22vWPTs0JujMeF2FPFTdrcrOAUXYpsinkMWjtD1rvMZv6ZwxFUxLYQWGMD@lists.infradead.org, AJvYcCXrSTB1CymsrqbVk7OklthIOjJZF3TgyG+kYJFmtC2y7pHaZQimCDdxBntlWfXVciq56AY9uKwvJVhw@lists.infradead.org
X-Gm-Message-State: AOJu0YxKRM9hHexyy717eRMWLOtzvWAhTvy8RzRvgcBDqDNox4bQWGES
	7NeVuptzVtwvYqsviwxXq4dNaNgFpX0tTI2xHppJ9HzZHHxrVXcShlXFJaVqqdtV
X-Gm-Gg: ASbGncuAMrirZYKhpDXU6cemrKV8gwM21nLIhQRGuytZ7zwUxdyy0fShK1obgb1p9DR
	9fQZyxl72CM2NI9NX5CnmodBJJxbdAnfRZUksKNPWerTLBl27AY6ZpzDFctQgIfB6FV68J/J32K
	wtLJTvfFMWz5fnQSRuwDlNAFm1PRoIPTq3SjofZac6wfd7YfeJyYyiKVKNddL7lAXNbRBmfTOki
	NenLYmeUA3JOVs/P5zY1M8HdvQq1Vn5XWeEwsFCM5BUlgBRcoiTycH8NMMtntV75hV9R9VHnncH
	wh9qghDgzBgtBaI2zJmRNpNU45IdE/xI8+nVy/A0vVXClIqWWQ==
X-Google-Smtp-Source: AGHT+IFUK+7UlH5yN/+V0QdO1GZAV34EYzEeJ0R6CtK3UbXVMrL12gPTfahF9bU36fRJMkeuEcy8rQ==
X-Received: by 2002:a17:903:4b27:b0:236:937e:633a with SMTP id d9443c01a7336-237d94c1854mr72427915ad.0.1750470547692;
        Fri, 20 Jun 2025 18:49:07 -0700 (PDT)
Received: from geday ([2804:7f2:800b:d1c8::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860b496sm28183235ad.91.2025.06.20.18.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 18:49:07 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:49:01 -0300
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
Subject: [RFC PATCH v6 4/4] phy: rockchip-pcie: Properly disable TEST_WRITE
 strobe signal
Message-ID: <60ad1985a0de0a6b47044ea9c0acefe6ff865aad.1750470187.git.geraldogabriel@gmail.com>
References: <cover.1750470187.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1750470187.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_184908_485481_DB04432D 
X-CRM114-Status: GOOD (  11.01  )
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


