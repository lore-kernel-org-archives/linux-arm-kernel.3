Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8E7C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JFOnH8cD4PvlLOZx4om0E7f6rgZHhO9wfe99KbcAgA=; b=CM5QICVA/L42MAVQh8x2n+1NCf
	4Ep9XOMc2fGrhi+6w7ynJaDC9e/qQUF5FYgpfx2IgASbLCpt2M4zSdaKSYEFSLun1fJC8n0lKAzLF
	sKLYOgPPUFHdPMFNJXqAW621GOnWQGs4NnjL16Z4RsOUY3t4GHxz9G34da+pHiJD6II8N5zEW8gFa
	DnwDwlMt0sKl7g7MS3WvSvH/HZzJXs0LP2Qx8kjbLexKtsS/ZLa0atvVIqMFPF4PFMXbDsO8WPQ0F
	Y3Tw8RobolSgRa6wYkGdgq6Rm0av5Fdg12xJ6WT5xlsvO725I0ru9bMvyTJWTQhVAG4e9O3fROGKe
	Kv+UxqWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xAu-00000009KJ9-0EH6;
	Tue, 08 Sep 2026 14:51:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xAs-00000009KFb-1LXA;
	Tue, 08 Sep 2026 14:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3JFOnH8cD4PvlLOZx4om0E7f6rgZHhO9wfe99KbcAgA=; b=UxAwiUdeJ83i+UDwJnVs9DBFwr
	p2r5ibRNW6BTiezL7oDokLbT2IKE6m/tYKRseypXWc8y6P6d2admMzhtUxQEj6ndT/QQvigAj27lN
	3VhvhVeiD7kxXvinURADsw3odThW8vz2TymSGyJyWB1B5meRU5aMMuc8FFbcTiyV6fAxq1+q6n3Ek
	eGfl5UZ9Tw5QIWIZ0LYQicweBXWIKggLtrqEPL1wiuOr7Fjarsk1sQy6zltMThVuUGSjikiz8aPsz
	PoHihpeX/338UUnjSkisJxfV2d0J/e7qQCbRQBA8rl8NKHaXFzZYE8ajHexVqeQi44Gh0+1vqPWZN
	x2nh6pDw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xAp-0000000HZ1g-0gPv;
	Tue, 08 Sep 2026 14:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788879101;
	bh=/o+l1qIsF9Zr/xYqxxnlQCMTg653lSAB0Qv1ngIO08g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P2GCIKL15/xCxvt7wOi42I7oiKGRF+hd++o5QvHbYSf1GChB6liobxvA2WNbaF7mq
	 2IHZ2CQQ4TeCOZGIVLhkYeqUc0xsVMmD9ft95zB0dxnZTiqlFHq/5R1QvflwtqsBus
	 sNAQ3GTDQSRxGLWYCe3HorG6hzRSw11B7xdIr9Ozx+BrAbv7ItUxwtE26+bAy9tSmc
	 kd7mNCkLJzyNaPhc4kdhWpfuqbG8lduBvzUWkrl9bZfMDw7a535MNSgDKu03FAdV9b
	 bqClAkFEkMXiac9nz4z/NGJCqtUX1DUbtP6005gZROeUYGtPpGsNSNHPt2kURg2ss9
	 sL1XwydXArVig==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DAA1717E0D0F;
	Tue, 08 Sep 2026 16:51:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 925E4480031; Tue, 08 Sep 2026 16:51:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 08 Sep 2026 16:51:22 +0200
Subject: [PATCH v6 04/10] PCI: dw-rockchip: Add helper function for
 enhanced LTSSM control mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-rockchip-pcie-system-suspend-v6-4-fbabcca9921b@collabora.com>
References: <20260908-rockchip-pcie-system-suspend-v6-0-fbabcca9921b@collabora.com>
In-Reply-To: <20260908-rockchip-pcie-system-suspend-v6-0-fbabcca9921b@collabora.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alexey Charkov <alchark@flipper.net>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2254;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=/o+l1qIsF9Zr/xYqxxnlQCMTg653lSAB0Qv1ngIO08g=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqgIPzG8lmf1Uh1szusvt5lHxBgi9WY2KwuF
 JSLZyp8YwB67IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqoCD8AAoJENju1/PI
 O/qaiugP/irEE4CMxtrHvE+jLBRNAODaQtvniKHUCsg1Dui4RZeRWOrMkatpx0yQfd3m/lqzzLq
 VB/GiIvW2SjsEIws9Il5gVm7DrshhDi1zwNPtEaSeuN3i21wEF6nhWLrL1iMiMZGO4vWt6/zwJX
 Y4QWYZFnQK47VhAY7bXo0bt1HxWruTkMxFqQOgsh/lyYopXQmWr1oVeLzT+gMCJkMxB8rQrnNxz
 Ow/EuJpdK5TOVeG92Hj75E0bZQQ3WXGdSCXZBbExap5RLSAg9YAHdOWDoAzx0WrBpkMmyLYFdOq
 slS7sroO83knebfIwbQLKZEMhHKYQWhKwheooFKj2w6Nj8Ex0OKZ+0ZBNPvKEXqe5K5wRkf8rCE
 v/sG2REwrATwK4oE4V67p/mOpTDFd6sdfDOh30CagXS99K+RUK5PxiS1FLrfK4EIhm6kfs7ESW6
 WB9WHuvUWNPwW9b6elpwZPWZIdPDsd0zpDVfXAcNoMojcrQL3BK17Xv+/ixMk7FbYFYdv8SVgCV
 nrmoUyVLXv0WgZDQB8Ko9gDq9CR/Gv0gkfj+OtW1pocTaE7FkJaLLyR4NJwPiPtbCnbAGPYOiAc
 2oRTAEDGOK7LL+JCqjDnWTFFEurtLNiZTKz+F02QslDP2ws2UVBa3OWq7MMne3rH0EoKC5vzIrJ
 3y5hzlaLECTR4PyU5KN8tqg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_155147_416030_A7516E73 
X-CRM114-Status: GOOD (  13.60  )
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

Remove code duplication and improve readability by introducing a new
function to setup the enhanced LTSSM mode.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 7472ec78b473..6f84b07406d4 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -696,6 +696,18 @@ static irqreturn_t rockchip_pcie_ep_sys_irq_thread(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static void rockchip_pcie_enable_enhanced_ltssm_control_mode(struct rockchip_pcie *rockchip,
+							     u32 flags)
+{
+	u32 val;
+
+	/* Enable the enhanced control mode of signal app_ltssm_enable */
+	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1);
+	if (flags)
+		val |= FIELD_PREP_WM16(flags, 1);
+	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
+}
+
 static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 				      struct rockchip_pcie *rockchip)
 {
@@ -719,9 +731,7 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 		return ret;
 	}
 
-	/* LTSSM enable control mode */
-	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1);
-	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
+	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, 0);
 
 	rockchip_pcie_writel_apb(rockchip,
 				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_RC),
@@ -765,13 +775,7 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
 		return ret;
 	}
 
-	/*
-	 * LTSSM enable control mode, and automatically delay link training on
-	 * hot reset/link-down reset.
-	 */
-	val = FIELD_PREP_WM16(PCIE_LTSSM_ENABLE_ENHANCE, 1) |
-	      FIELD_PREP_WM16(PCIE_LTSSM_APP_DLY2_EN, 1);
-	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
+	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, PCIE_LTSSM_APP_DLY2_EN);
 
 	rockchip_pcie_writel_apb(rockchip,
 				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_EP),

-- 
2.53.0


