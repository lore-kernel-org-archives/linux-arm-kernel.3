Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEDCC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 19:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EbTqGurQ+C2nquCjc54L0lkOz6dcfe6Fw6tCzzhJAg=; b=T/l0cohT6lRx9wf7NU6zPeskcz
	wKu4F1YR8KS1fYLfNO2jR/KvWhqg7H2hpqfUht1PsgMtxxGrBQcni6zRj/VOLQ5gl0nKYH8PJpoWr
	ETvXpLfve9qX2UhC+rde5HkWxk2/u/34rVrhI5LKpdii7bgz8eb766Eh3cmbwvkNLjKxLRnGTyoEx
	NabIscumfmYvWYVzbR4xz/CO1cYSrAGorng29wsOUqFjLNx3S/DtQKnefBX3KDS/myGzfr3G1B28e
	sly1OiW4J8S0yc7vmS5ftd+Jw23fxU5PPGPRPWniRBLXAB4f5s0/2B8pm9OZtWm1R6CkObyk3o6b6
	5mk6YClw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0QN2-00000009mbQ-1ugK;
	Thu, 03 Apr 2025 19:37:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Q1P-00000009gVq-150k;
	Thu, 03 Apr 2025 19:14:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B1806614BA;
	Thu,  3 Apr 2025 19:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97257C4CEE3;
	Thu,  3 Apr 2025 19:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707678;
	bh=71wBi/cNBET7g7tuz2d1oBbbk5rq2cJkkfj8t+08GTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WBuH+QjAvTrLe3JdD6N32A7iweSTs54Ez/o4QXpclFpUKcDAs/nJNBvIUeyxixi2r
	 grEE2CGDYyHm5r5JAt3xDGVFqewhlATYyfdbM/YmuLZHEPsU+xoQnjjRuWXLu/Ouan
	 GYCgPGHAUIKi0gYSCMOP17+r11OtrJ5d3MydbnzX3TUfKoFJEvCXMV5p+alTQlRjZi
	 mFPJ4+gaLUVLYk2+6HyZj3E382c8THPUXsJikvb34WaO9NHMroJWXmM5p03yM6BLXn
	 d6dJTXChd1GumN5dCJ3MxQ2+z2YyaIx4Lw1sCMh8/EF6CCgQ/nT4c0c3IWpi/8VXCf
	 bGaU7LgBsqr5g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Niklas Cassel <cassel@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	manivannan.sadhasivam@linaro.org,
	kw@linux.com,
	gregkh@linuxfoundation.org,
	lpieralisi@kernel.org,
	heiko@sntech.de,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 30/44] PCI: Add Rockchip Vendor ID
Date: Thu,  3 Apr 2025 15:12:59 -0400
Message-Id: <20250403191313.2679091-30-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191313.2679091-1-sashal@kernel.org>
References: <20250403191313.2679091-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
Content-Transfer-Encoding: 8bit
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

From: Shawn Lin <shawn.lin@rock-chips.com>

[ Upstream commit 20bbb083bbc9d3f8db390f2e35e168f1b23dae8a ]

Move PCI_VENDOR_ID_ROCKCHIP from pci_endpoint_test.c to pci_ids.h and
reuse it in pcie-rockchip-host.c.

Link: https://lore.kernel.org/r/20250218092120.2322784-2-cassel@kernel.org
Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Krzysztof Wilczyński <kwilczynski@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/misc/pci_endpoint_test.c            | 1 -
 drivers/pci/controller/pcie-rockchip-host.c | 2 +-
 drivers/pci/controller/pcie-rockchip.h      | 1 -
 include/linux/pci_ids.h                     | 2 ++
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index d5ac71a493865..b002740acf8d5 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -88,7 +88,6 @@
 #define PCI_DEVICE_ID_RENESAS_R8A774E1		0x0025
 #define PCI_DEVICE_ID_RENESAS_R8A779F0		0x0031
 
-#define PCI_VENDOR_ID_ROCKCHIP			0x1d87
 #define PCI_DEVICE_ID_ROCKCHIP_RK3588		0x3588
 
 static DEFINE_IDA(pci_endpoint_test_ida);
diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 5adac6adc046f..6a46be17aa91b 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -367,7 +367,7 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 		}
 	}
 
-	rockchip_pcie_write(rockchip, ROCKCHIP_VENDOR_ID,
+	rockchip_pcie_write(rockchip, PCI_VENDOR_ID_ROCKCHIP,
 			    PCIE_CORE_CONFIG_VENDOR);
 	rockchip_pcie_write(rockchip,
 			    PCI_CLASS_BRIDGE_PCI_NORMAL << 8,
diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index 11def598534b2..14954f43e5e9a 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -200,7 +200,6 @@
 #define AXI_WRAPPER_NOR_MSG			0xc
 
 #define PCIE_RC_SEND_PME_OFF			0x11960
-#define ROCKCHIP_VENDOR_ID			0x1d87
 #define PCIE_LINK_IS_L2(x) \
 	(((x) & PCIE_CLIENT_DEBUG_LTSSM_MASK) == PCIE_CLIENT_DEBUG_LTSSM_L2)
 #define PCIE_LINK_TRAINING_DONE(x) \
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 1a2594a38199f..2a9ca3dbaa0e9 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -2609,6 +2609,8 @@
 
 #define PCI_VENDOR_ID_ZHAOXIN		0x1d17
 
+#define PCI_VENDOR_ID_ROCKCHIP		0x1d87
+
 #define PCI_VENDOR_ID_HYGON		0x1d94
 
 #define PCI_VENDOR_ID_META		0x1d9b
-- 
2.39.5


