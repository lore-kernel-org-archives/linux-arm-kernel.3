Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFD9C36014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 19:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FtKKaZcXk47iiUQqXYcQg1ldSqcYql830B1aWQQ+RI=; b=S9CKAj7LcohBmmvo843iEvMQ0R
	vQ8lkdp8RjF/F3tt14HELxFzp8wBQlJFCu8uqd5ZM3HSwjpJxB1RwHdxb20yi8APFWhWSKD2jseaM
	+EJqECMaD7Htjo8/zuDLLAPefmJYBmTEHihQ6xwKX2/u2TaEyHvQ31Eh+sD4kzPqFE11JvU+vcD+2
	ITmuARWoYXC3sQXkxJ2ISl8wp9ApOXQYRBZzYFD2jP6WQmzDL4fgncuW95vS+07Pw1+buWafA9piy
	xR/dWT8MbBnDGzZnWl//gVtGtB+HYOkX/IsPvJO32iH5Ll2qai/HCahgMLkKeJtjUWiHVr0z6RZuL
	ka3emlOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0QSN-00000009njo-3kVl;
	Thu, 03 Apr 2025 19:42:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Q38-00000009hCQ-0weg;
	Thu, 03 Apr 2025 19:16:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7133044C78;
	Thu,  3 Apr 2025 19:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A8EC4CEE3;
	Thu,  3 Apr 2025 19:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707785;
	bh=sDaOFhGbRXKWWgBDXTjF3gFFkmNVkCcMKXVKbM97/jg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dDATM6KdwA8pBnk71COgokFTPaH5slXGlZJ6aKzqfl15z76e0RYKEdHFVe8Z/CAth
	 HIHdR/bRgA3zmYV+ZAS7sjrhNjKxsjeeudlZCD7dZNYcT6vIN4Us2IX4n+LPl1NNmc
	 cwWQCDvO19g4ci9A/rQ8RbtzB/3me8S0HvfjZeB4JHHwuYWI4csJiegKiFJvqGgiBH
	 GG30+Ye782RzGiieInIteze1bULL4ceWQkos5Z8jcu1wAd2oBDAs+Jv26zAzOGFtm5
	 Q/EgAp4hMlHexTajZ0PFBYH+7GocjaSIUXyul4yKDR+jhIthn/v0a4xf7diq+VYjcn
	 ckLNiekzf/XDg==
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
Subject: [PATCH AUTOSEL 6.13 25/37] PCI: Add Rockchip Vendor ID
Date: Thu,  3 Apr 2025 15:15:01 -0400
Message-Id: <20250403191513.2680235-25-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191513.2680235-1-sashal@kernel.org>
References: <20250403191513.2680235-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_121626_306736_981FC567 
X-CRM114-Status: GOOD (  11.50  )
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
index 3aaaf47fa4ee2..b5c8422fd2f04 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -85,7 +85,6 @@
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
index a51b087ce8786..f9eaac9c8ee5d 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -198,7 +198,6 @@
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


