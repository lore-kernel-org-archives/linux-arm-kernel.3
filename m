Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F2EC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wh3m6n4ujg0xUO6NVE4ffQo0e8xmeTU3ZpGCHU+R104=; b=z/47zFhcJ8BEQdh8UuCo9F5EAr
	/YxtpffnB2rijgYOqzmrDSgKy9q/LWyqoUJQXXvma8r6NYliEqAw4a4H2TBwYxUqkdvj4rt+uAKjv
	GxEV0ugvbDaHDg57WvqwoUx75QPQshoRka/mBoW2NlZGi3O4fyFnD92pZV1pKA0KUtO2DpsUTX+us
	JMHDpkOMr+di6WIx3IRn5M4QDdFC6kG06ligvgXmPNA0rJhfBbeVUEVsgZFVQMS2bQk+bOpmpuvEa
	sUuZ3p0WvpPBVSaaHL2OWbm/ayse7wac0ejDfwaVOp2FbuUDUyIf2nUF284TraRBl9aKBkb9iwrXu
	nU/R3OBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xAw-00000009KNs-1Xh5;
	Tue, 08 Sep 2026 14:51:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xAs-00000009KGc-3jXj;
	Tue, 08 Sep 2026 14:51:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Wh3m6n4ujg0xUO6NVE4ffQo0e8xmeTU3ZpGCHU+R104=; b=cgtu1XesThG3lyILW/ajiqKTE0
	xP51iPGdM5kp53bcHTEAvfNAQlskC0vXT13ujL35LmeiSweEeRolTy5S/jsz2B3y4z0CM8mNN72RI
	56RvZb923qfqsti5I164zujImgN4h/m4grdXz+vd/7FbOZ1FXtXKM0He5g6K3S8AkJeoxfRWlkiVW
	+m6l2GCjqhyZyPUA3Xr9YlCIm+EJnsRN/H+M+PLzpnCMOouB17edSDFd8tQ8YkDe5zonZBFVRauw+
	Kylq+ovEwZL7q9FEodAZdknGVeXNfy3ZZsmksFJl9m9UfMzoCFD6ZYbK33DM/bLo17/xlk+z5uPAF
	a22QnI/Q==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xAp-0000000HZ1r-2Xo1;
	Tue, 08 Sep 2026 14:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788879101;
	bh=L4M7hLiRxDRX1JjACPykw3mztl3t/GK4QMLCwWFrxIo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kW0ee1qC0mWQjAr1zWej6iBHaL/pedHxs0MoPFbMbpp7UHet1M/me8w/7ikqnvwio
	 OfFPrVq+Eb7Bce+wUGuP6RlreC5vX7HV/Hxazj4uin98eiYsZelg+EAGSdSMGG19kv
	 MCEBdfZmGusea7/XGt7YQKccST+LYlBcWfbPOmJG1fuGvih8yf10Bll8Wd4hxEuHWG
	 8P6AfXMxKDZ5LD5xymYcGdszsoMH0CU7gNdH+S1L5LVVWJjQ75CmAFxK5gacYkJoTz
	 wL+gOEHyuDaS+42xwy77K5QK2UoOCz/3BsE7N1pi1nmbTp2Nhh3Lo4yr8F5ZD1SeIr
	 PN9XAbud11iyw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C67E17E0D81;
	Tue, 08 Sep 2026 16:51:41 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 979CA48003A; Tue, 08 Sep 2026 16:51:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 08 Sep 2026 16:51:25 +0200
Subject: [PATCH v6 07/10] PCI: dw-rockchip: Add pme_turn_off support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-rockchip-pcie-system-suspend-v6-7-fbabcca9921b@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3022;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=L4M7hLiRxDRX1JjACPykw3mztl3t/GK4QMLCwWFrxIo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqgIPwONPLCUoy4DvvoogqBm9II90BbJz5ht
 eejLik2EOCWKYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqoCD8AAoJENju1/PI
 O/qaGZQP+gOurxzOFdXPQH/FppuFVPfAZBUWPfQAUq/RHhR7nlu/RavTNBh/+wmJnox+7OcVRm4
 IpCPBVCl6o0sXgL5myrdgqw8EyUIwyvcX9PSAQ0tBM+F2bdW9FOB4tDwtwI+kt/4w7j97QZdWlB
 O6Nf6na/zPD4q4V93PqLTQC07pczGYcXRo08398LQU8kTFETitEm/X3KTLl2mZSbAMsZAjKTyvA
 ZaTVaL/KBXEWLlsbC9UzhCPquLIjvhO/epJCiUc3LPNOJN1g6PFBz5llnyEIn+g+u9+j1hiLjXx
 JSV92CfOxYxiODNfSY3ZqTiPBgTwVj6BV/jlwkEXzJ+Spxi1yFnLcXi8RNfvNzYhuOaqxbsZwLI
 FiB9366KJiii4d4KNdP25wgnWhRt7ZRJAVME3Tt1RMzXSq462vWVb8c/yM4rhTITMc3abgYfjfi
 I6834iZKidFeqelUf3Z/LeYEbnzNWtM4FcJyxC8ShTvSyso+VgJir8+SHfdk5QJvhSocyNzt0RX
 AiewwJfk7FyPrGdkr13fNqRcfldOTP9TddhpnZ9aUrpCvqWVNqaOzwvH+zNtz4Ekfld7t2XtZLP
 LLRUrKEl91b2pqck+Xdh8R0W8SCTb68aGa4CwgjyqrHQQ6Qjf34PZ2kF2jGwuUpN9r7ZYKFjqlE
 WZCE/bMJ/ugNr3eB9PV4zcg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_155147_776321_056F7C54 
X-CRM114-Status: GOOD (  15.33  )
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

Prepare Rockchip PCIe controller for system suspend support by
adding the PME turn off operation.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 1e48099e36e4..17530507e41b 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -45,6 +45,7 @@
 #define  PCIE_CLIENT_LD_RQ_RST_GRT	FIELD_PREP_WM16(BIT(3), 1)
 #define  PCIE_CLIENT_ENABLE_LTSSM	FIELD_PREP_WM16(BIT(2), 1)
 #define  PCIE_CLIENT_DISABLE_LTSSM	FIELD_PREP_WM16(BIT(2), 0)
+#define PCIE_CLIENT_INTR_STATUS_MSG_RX	0x04
 
 /* Interrupt Status Register Related to Legacy Interrupt */
 #define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
@@ -64,6 +65,11 @@
 
 /* Interrupt Mask Register Related to Miscellaneous Operation */
 #define PCIE_CLIENT_INTR_MASK_MISC	0x24
+#define PCIE_CLIENT_POWER		0x2c
+#define PCIE_CLIENT_MSG_GEN		0x34
+#define PME_READY_ENTER_L23		BIT(3)
+#define PME_TURN_OFF			FIELD_PREP_WM16(BIT(4), 1)
+#define PME_TO_ACK			FIELD_PREP_WM16(BIT(9), 1)
 
 /* Power Management Control Register */
 #define PCIE_CLIENT_POWER_CON		0x2c
@@ -452,8 +458,46 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
 	return 0;
 }
 
+static void rockchip_pcie_pme_turn_off(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct rockchip_pcie *rockchip = to_rockchip_pcie(pci);
+	struct device *dev = rockchip->pci.dev;
+	u32 status;
+	int ret;
+
+	/* 1. Broadcast PME_Turn_Off Message, bit 4 self-clear once done */
+	rockchip_pcie_writel_apb(rockchip, PME_TURN_OFF, PCIE_CLIENT_MSG_GEN);
+	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_MSG_GEN,
+				 status, !(status & BIT(4)), PCIE_PME_TO_L2_TIMEOUT_US / 10,
+				 PCIE_PME_TO_L2_TIMEOUT_US);
+	if (ret) {
+		dev_warn(dev, "Failed to send PME_Turn_Off\n");
+		return;
+	}
+
+	/* 2. Wait for PME_TO_Ack, bit 9 will be set once received */
+	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_INTR_STATUS_MSG_RX,
+				 status, status & BIT(9), PCIE_PME_TO_L2_TIMEOUT_US / 10,
+				 PCIE_PME_TO_L2_TIMEOUT_US);
+	if (ret) {
+		dev_warn(dev, "Failed to receive PME_TO_Ack\n");
+		return;
+	}
+
+	/* 3. Clear PME_TO_Ack and Wait for ready to enter L23 message */
+	rockchip_pcie_writel_apb(rockchip, PME_TO_ACK, PCIE_CLIENT_INTR_STATUS_MSG_RX);
+	ret = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_POWER,
+				 status, status & PME_READY_ENTER_L23,
+				 PCIE_PME_TO_L2_TIMEOUT_US / 10,
+				 PCIE_PME_TO_L2_TIMEOUT_US);
+	if (ret)
+		dev_err(dev, "Failed to get ready to enter L23 message\n");
+}
+
 static const struct dw_pcie_host_ops rockchip_pcie_host_ops = {
 	.init = rockchip_pcie_host_init,
+	.pme_turn_off = rockchip_pcie_pme_turn_off,
 };
 
 /*

-- 
2.53.0


