Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBD7C678DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bW+KcteMx3KUNTcvwakQQLo/YUGvViEhrbAatOOYWoE=; b=G9ZvM/mJB60LVrSdISmADrIch4
	dfl4f/eYVREkuTJCHWS9Ajyvf12VMGqQnWPUUBw23zE1rFF9iedW6s+lKj5ZL0nnOCUvlETkfjr6q
	FB6KyLdOk3COrL2i19TS2f6cMQpLFcqfMRUqnH2N9OpHBCzEgoxW+9C6TdgmskVmtkUWs7k/Cu+KB
	5G3gXBTDxDlJQvSuHC1Cokh9SgAnNbUnyXeQ/GFb2EZONd859YP0pjN+7XZiZjmoQHuSDGk6qpRpM
	UNLp3/zHywDoPKd54ruHDcSl0JFBjl5klsu3uFhVIvcQckN9bofde4eYlmCovgMh8jOcLM9R+XW7i
	TMOi/N6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7nn-00000008J9S-0jJQ;
	Tue, 10 Jun 2025 22:50:43 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP6Nw-0000000867n-2xL7;
	Tue, 10 Jun 2025 21:19:57 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-4e79de9da3fso732524137.1;
        Tue, 10 Jun 2025 14:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749590396; x=1750195196; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bW+KcteMx3KUNTcvwakQQLo/YUGvViEhrbAatOOYWoE=;
        b=LJZa5fLcEe2KhfO/pckLMc9WPMLWSKucLwGkkmepfeM6W592LF0WWZpXS+b8UiXDZP
         bJHNU/2mFFcs1ntvuuq6igANfFqsvGOvUNxvVRe7pOBleVa/BS0UJMKWwdiLnpfngS3Q
         gPvONVIwErwxRcjfJUVt4UP+Qbof7vOXXxV4Dr0j1h0hAs9M/kGrvwZAFD92t/Av2r5/
         I5qzLWPhK66O34HWzHYdGUR82I0tUiiOx9AqqUvC3TKa7NgUVMw0nWTbApVHC4I/nyii
         JXV2OBgOWa8Ag8rWm+aQyhHDZ01hEkiE8XLeHyoDE6yqP+ZFakySuNL1cwnBOpbtYg2a
         zlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749590396; x=1750195196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bW+KcteMx3KUNTcvwakQQLo/YUGvViEhrbAatOOYWoE=;
        b=WSdtw444jou7Oi/MYPb2ISkasdiD7U/ysx2u8mflhHSPkPmdF/38BA+JCpeCUSzoOQ
         A771z6ddAENtqnxarGwMBh1ajtAzUNgosBVI1jhcwidTbJeqFqDFnZbxc4WWaD76cgFH
         jXDuF5jupCPxOfqLLGcWp+wE3bm6KYjnJcSkcMgzaAYjxIf7t2zmIZnopiulxKcEifBC
         nl8UwHJXD+G5xYtf/2H/DgACafhOYDLaSp8QkaZasvvTNG4hrGkWXqnvOayYF4vy3jtG
         EqOq/qoigogxTh//nkNJn/A9rN/nyW1EKO4XCzQUqnciIWV3mOO0L6F2H0H6hK5ayEPy
         Kxkg==
X-Forwarded-Encrypted: i=1; AJvYcCVy0zWTkYQz5UHjEUqZPoZNpJpits7pgl5VjYNo7K/XC7oCHGjyALxenfAewkAQiri8lyUjtc/CwAUZbIswO5/J@lists.infradead.org, AJvYcCWf2f34HYQ3eyiANmVPWPLhboiWE5N9los9Mo8WqYgZ3IPjqiDNQMCYk8TBhpHx3vdTVFkyOR/7Yxk4@lists.infradead.org
X-Gm-Message-State: AOJu0YwaS0sQ3RwkTeF2wVyRxSCZLMcT2T//mI/+6TGp/0C2B1yMepMN
	LyzaPT7imPU/N0kDm2Uss6dB6fKsuwSeRsL71G9jR6T24+raG5Cg5SBkVa6DLpuTD5z63NmF
X-Gm-Gg: ASbGncvUPmTZPSkGX+11JdBGLOaSa0DM9J3Wvq3sg5hGjvX1sFKKMpb3Eq0WcT0k0z5
	t11dqOzQtgAq3QVVDB3RKOnvnxz+gnx68zLrczSORha3D1w9jGesVXkY4CPzKfYCB564o3By5/z
	lkW+y+WRcMgTUrVutOgKW1gUpn7otDac9oU7DUyp3XS3B00CxJUdZ9DyWPoULqPXE4oKrJmeSgL
	GGLJ695nlzmuKRulwKYiOIDOfY2X5ZDBlcdX/f3Ig+/w5ndFTMO8LLWdWr6H05quFb5euDigJoY
	WWw+RVNGSOdL008cimljpsClFzPnksveILLiSi5ZHEvh0YlreA==
X-Google-Smtp-Source: AGHT+IFUKOR2IsRTBdY8aOGnyv438Gl/440UbjAA3/JAat2G2nQmpyhEiA+RhR87ZqQsV+IyUokALA==
X-Received: by 2002:a05:6102:4b1c:b0:4e5:918b:5321 with SMTP id ada2fe7eead31-4e7bafde5b6mr1050769137.25.1749590395586;
        Tue, 10 Jun 2025 14:19:55 -0700 (PDT)
Received: from geday ([2804:7f2:800b:5ce9::dead:c001])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7baeb6337sm382957137.3.2025.06.10.14.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 14:19:55 -0700 (PDT)
Date: Tue, 10 Jun 2025 18:19:49 -0300
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
Subject: [RFC PATCH v2 1/4] PCI: pcie-rockchip: add Link Control and Status
 Register 2
Message-ID: <28ae3286f3217881ae6ea3aecad47ae4567d6ec7.1749588810.git.geraldogabriel@gmail.com>
References: <cover.1749588810.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749588810.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_141956_745789_19F4469D 
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

Link Control and Status Register 2 is not present in current
pcie-rockchip.h definitions. Add it in preparation for
setting it before Gen2 retraining.

While at it, also reference other registers from offset at
Capabilities Register through standard PCI definitions. Only
RC registers have been touched, although in principle there's
no functional change.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index 5864a20323f2..90d98aa8830e 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -155,17 +155,19 @@
 #define PCIE_EP_CONFIG_DID_VID		(PCIE_EP_CONFIG_BASE + 0x00)
 #define PCIE_EP_CONFIG_LCS		(PCIE_EP_CONFIG_BASE + 0xd0)
 #define PCIE_RC_CONFIG_RID_CCR		(PCIE_RC_CONFIG_BASE + 0x08)
-#define PCIE_RC_CONFIG_DCR		(PCIE_RC_CONFIG_BASE + 0xc4)
+#define PCIE_RC_CONFIG_CR		(PCIE_RC_CONFIG_BASE + 0xc0)
+#define PCIE_RC_CONFIG_DCR		(PCIE_RC_CONFIG_CR + PCI_EXP_DEVCAP)
 #define   PCIE_RC_CONFIG_DCR_CSPL_SHIFT		18
 #define   PCIE_RC_CONFIG_DCR_CSPL_LIMIT		0xff
 #define   PCIE_RC_CONFIG_DCR_CPLS_SHIFT		26
-#define PCIE_RC_CONFIG_DCSR		(PCIE_RC_CONFIG_BASE + 0xc8)
+#define PCIE_RC_CONFIG_DCSR		(PCIE_RC_CONFIG_CR + PCI_EXP_DEVCTL)
 #define   PCIE_RC_CONFIG_DCSR_MPS_MASK		GENMASK(7, 5)
 #define   PCIE_RC_CONFIG_DCSR_MPS_256		(0x1 << 5)
-#define PCIE_RC_CONFIG_LINK_CAP		(PCIE_RC_CONFIG_BASE + 0xcc)
+#define PCIE_RC_CONFIG_LINK_CAP		(PCIE_RC_CONFIG_CR + PCI_EXP_LNKCAP)
 #define   PCIE_RC_CONFIG_LINK_CAP_L0S		BIT(10)
-#define PCIE_RC_CONFIG_LCS		(PCIE_RC_CONFIG_BASE + 0xd0)
+#define PCIE_RC_CONFIG_LCS		(PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL)
 #define PCIE_EP_CONFIG_LCS		(PCIE_EP_CONFIG_BASE + 0xd0)
+#define PCIE_RC_CONFIG_LCS_2		(PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2)
 #define PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2 (PCIE_RC_CONFIG_BASE + 0x90c)
 #define PCIE_RC_CONFIG_THP_CAP		(PCIE_RC_CONFIG_BASE + 0x274)
 #define   PCIE_RC_CONFIG_THP_CAP_NEXT_MASK	GENMASK(31, 20)
-- 
2.49.0


