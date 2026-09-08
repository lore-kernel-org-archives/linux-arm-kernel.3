Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42D4C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 14:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6okLRdiqhl4ZG2fHn/y2VobVZ/OBqeyek9hgtGn68Vg=; b=QVckQWMPvJBrFTrtVjxCXVcIxB
	4xVLJOUZb3LY5eNoaoQPtCENh/cji8XawMGGa+V4Qs9NOVqm2AfzLlewHQdpEOG+WdRZ280U1Aiwm
	OKjS5WlAMjY854KRJPT4Rzip64xs8AH4LLWid56pGY7YXwBMvB/SwGmJpRPcDrm4neRyaY2kV9P8w
	KZScLkeAWHI0Bvfh3ct0Y42NDmzXcdY3ndjMZsbggGGk6ijs9u40ghSURTxtqlT2AaxNz/w61ColF
	ly99Gpm6TBUIAck7PjL692uEJ5jcjefXngXU+8EobtaFqiTtM6IFSH2fKEWjTYQJtABRPzzgpg39K
	iSMvoo7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xBM-00000009KyC-1s5K;
	Tue, 08 Sep 2026 14:52:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xAu-00000009KHh-0xM8;
	Tue, 08 Sep 2026 14:51:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6okLRdiqhl4ZG2fHn/y2VobVZ/OBqeyek9hgtGn68Vg=; b=Pwe9bpb+WuLW3waNbmJtVppnI2
	pT8IPyscmd0XQhlDkoHWcKSm1fmydRZqZyQ+dWdj8810g0vpNY0QEaqmC8x7spXDAN4OKwBIXb5/t
	PNNxVW0VFosc7LGMzcaWfFfvO/JLwpPOmngs4eDqw8cet3Z5CGDff9jyetIgYQqelrL2WCLW0Wdiz
	pOT3/FN3R0DDxEdnrv1wOpdKXd0yqGtQffOAqW8JdD3021jtB0OwTtSd1P+6R3FIu16U582FKMc/n
	SdLiHOGwUR/2EH5jEiA3tpAKUkFSM46sdfYPri6O7q0N/IxPdlP0gsL3gAhpK5zXGXOFWlVX6FTKT
	DzrKUgwg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xAr-0000000HZ1s-1RUW;
	Tue, 08 Sep 2026 14:51:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788879101;
	bh=Z+Lzstt3geCgNqqc4sfbPOYtUjgypQ6xYnIT7nuZdGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F+EPk/5B2xyBMlHRVcf0uFe7s1um5d9n/42+dNT7XL7dkONh+jCNHIiXUgwjza0U2
	 YA8YAEipXhaNpbQQuCbecAN6BwE80DHQ75PtNmNy1zFoeVlUDz3JtfXSnI+jRnKy54
	 /qoKRtQ6hRdY1RD2j5qNRGWNpAeEuqKcVrc5QwDLLWDwrul9e7pPzMB6DRyXwxwr8f
	 x/ggPVC1/urtHe+DZ1bVPFkxWPBdcq4Z+LrWRQI6RK0FAQTPuwZHUXf46GQDNttbIW
	 pbOO5u7rPoJCBJzmRf2VHybHPD2MVICT/JwbJfzFajvd3SHmBl0B/FPFsWDtUOxVfI
	 5qq5942DtJZlg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 32F7617E0D43;
	Tue, 08 Sep 2026 16:51:41 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 94010480035; Tue, 08 Sep 2026 16:51:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 08 Sep 2026 16:51:23 +0200
Subject: [PATCH v6 05/10] PCI: dw-rockchip: Add helper function for
 controller mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-rockchip-pcie-system-suspend-v6-5-fbabcca9921b@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1964;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Z+Lzstt3geCgNqqc4sfbPOYtUjgypQ6xYnIT7nuZdGQ=;
 b=owJ4nAFsApP9kA0DAAoB2O7X88g7+poByyZiAGqgIPwgM3qXGwQtQCIgGMAprVKfcJl1XSgth
 pPm2ueEaZ34hIkCMgQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqoCD8AAoJENju1/PI
 O/qaDRYP9infvMVbVZC87GDb1FHBu40+qE6n9tyX2bNz/Vc1hd4eT+k6Lyah9Lc9rrRRcPOQLLP
 QZNDLTMXd4nesDB/ABjn1RVObkRca4RDC5UiLM3B+FdexIcm7zBbK7qxlWqqJ6CNZ7GRLP4ibGO
 wi65WzgfH0fjVOQNRgTNzrHOQ97NUNj6wCK9oywSGcbEdbGAF8gpiX1YwCA2az4C4dWFwA9orTn
 /1z5lwgmY6UTCpBW6PninQmgUMV7V3kwKPFCP5Q2tI5nxzbgs8PTBEyxgDdf1xyVHlyHDufGflD
 7fa1/9xQc8QsJfDa2DzJ3vHRyC2CGnrUltTfkgasOr/q27yunslJkZq5M1wzDvEyXuoasIRNHrl
 VZslbeOyYbXuj2zvzcL34BuREz9Q6nf3+9xJGQENClBwc2HIUs0smAnf/Fvh5ylqRrkrle3vkOA
 aHfoOfv8evhvnZzAyJvoFu0l3HgMx/C53UqsXrKAMyrlY79zXm6e6zCIExruFTWCSiBueAZSCdb
 810hrlr2wu9NaUphFvIML7AwJPYXOaJ1XGh+qppICAT/DZN5jFcvQy7lTTnw6hvaeFVPNbj93Wn
 Lp8rpWJufLmqOn2q0DyBLiMNe/pIMI1976gnSfQx8xGyuxlBk+0weE707IEBZpDakWcmjU38BpO
 9UNLFf8LSCYTYsJdCWDjz
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_155149_509609_FEF97890 
X-CRM114-Status: GOOD (  11.29  )
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
function to setup the controller mode.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 6f84b07406d4..211776bbcb99 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -708,6 +708,11 @@ static void rockchip_pcie_enable_enhanced_ltssm_control_mode(struct rockchip_pci
 	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
 }
 
+static void rockchip_pcie_set_controller_mode(struct rockchip_pcie *rockchip, u32 mode)
+{
+	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_SET_MODE(mode), PCIE_CLIENT_GENERAL_CON);
+}
+
 static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 				      struct rockchip_pcie *rockchip)
 {
@@ -732,10 +737,7 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
 	}
 
 	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, 0);
-
-	rockchip_pcie_writel_apb(rockchip,
-				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_RC),
-				 PCIE_CLIENT_GENERAL_CON);
+	rockchip_pcie_set_controller_mode(rockchip, PCIE_CLIENT_MODE_RC);
 
 	pp = &rockchip->pci.pp;
 	pp->ops = &rockchip_pcie_host_ops;
@@ -776,10 +778,7 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
 	}
 
 	rockchip_pcie_enable_enhanced_ltssm_control_mode(rockchip, PCIE_LTSSM_APP_DLY2_EN);
-
-	rockchip_pcie_writel_apb(rockchip,
-				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_EP),
-				 PCIE_CLIENT_GENERAL_CON);
+	rockchip_pcie_set_controller_mode(rockchip, PCIE_CLIENT_MODE_EP);
 
 	rockchip->pci.ep.ops = &rockchip_pcie_ep_ops;
 	rockchip->pci.ep.page_size = SZ_64K;

-- 
2.53.0


