Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DF0C79FAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 14:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0yyKvVrbEjA8aMbziGuN+Vit5DwsbBbwIjvkpSs6Hc=; b=494zP/AAFIACZ/rw6Shu6RD9cM
	SSdrJn7744HcAPi2InGcp3yobLS/AUTpS4V+U81mqpexW6PdU6eFAme8rN1fYyYwlRmPVaSlGkdYO
	4AzvLEQrQmgupIKQ9Z2XIoo4pArsFpOtgztKjWDxW9kW8AB8tsAdxgdFfFQe60LskZ6jcYoleCnUP
	rYjX1migC6HY5H1alsKPpcU3DqLy32YGa6P/Nc3OMJIWDHTc7Jmisl+GiOyh3rQjnNKxImYl4Oq+8
	QWx8mTGt0ZvYEtGlGwISnj8TcM8w1CGK7AUFOki4pahBwVfdC0WQcReUQIgREEEMAmg5khyID1YFn
	0pHsCIeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xAu-00000009KJq-1C2S;
	Tue, 08 Sep 2026 14:51:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xAs-00000009KGa-3YWo;
	Tue, 08 Sep 2026 14:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=n0yyKvVrbEjA8aMbziGuN+Vit5DwsbBbwIjvkpSs6Hc=; b=fDVn/53U+Z9YVsDfEo8XgE2yIN
	T1Rpc3D65rb9WpJNMfyAh+IgPu1ZJIgLB/+dx83aUsVlzE39NH3mLAgbgaaEvHJGuioizcUuNnJ6Q
	FvJRskmZLcP0p3WnE4tMbGLwoFra7B+eBxjUnMVv6Cq3FgL4Cfi10y4ORw9+ewW/48wfiYRgKa0Yo
	CdzH/oD0zer4ZDIQE/jJNtMdD7cn5b9kfjIGbb1oD/LRRGvKSz02yJ0xRXV8iP8Y999sfyS25XwVB
	7qFDyk0xZgrbt7A/um+/z6FHN/cdYd/HH/j4gj8gvqyJJSSEI0NSt+2sknbld5SaLLEyC7ZsjphqA
	bHVCm0wg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xAp-0000000HZ28-0vRb;
	Tue, 08 Sep 2026 14:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788879101;
	bh=T2E33x//zZv34p7VqHG8S4S8Gcb0wfJ11dQV0Vms09o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gx4zacVme7Cb/WJWMF51IiBYVhNXoQuO/Xg/biEFIQ7ZxnpOk+pDC8fkq54ejfm4P
	 1O36Gxw31Hk18mEtWBVUfHHKrEe7dQiW38KdKJi3WzjBIGA8F0AABqIuP6RP05tHHV
	 0Xrbui6o7JQenjtc8LeGM8MBWzckBp3HdZBrhNkPZOI9wScUHzv/iF4SrNHfBf4BQ3
	 Z7qIsDWx7S1CPUnXL3kcSyYXbRxfPikx3WTkqwKlbYq1H1YCKH67Pvdh8aPXnbLTcp
	 PxQYrukrhkz3gfyJQ4hT1Pb4mUfapCTSunF8xZ6x0zXH+2ghJqNmp6RdzNHrUVgftM
	 vM0Rj6pE/ydZw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4A8C817E0FE2;
	Tue, 08 Sep 2026 16:51:41 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9CC47480048; Tue, 08 Sep 2026 16:51:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 08 Sep 2026 16:51:28 +0200
Subject: [PATCH v6 10/10] PCI: dw-rockchip: Clear debug buffer before
 entering L2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-rockchip-pcie-system-suspend-v6-10-fbabcca9921b@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1731;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=T2E33x//zZv34p7VqHG8S4S8Gcb0wfJ11dQV0Vms09o=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqgIPxM5BtG5TqRDBVCuGbS8z6iuqCgAxY17
 ahfCBQp2DV9c4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqoCD8AAoJENju1/PI
 O/qaty8QAJ8td11B3+qPI+KtA21Q0cYszi6xEntVmNV9V2BWUiJt03mDyIPet2ld7lAwolemgzq
 TVRfdWvL+N2KcWgZMYSR9dltxPr/dKma7J5cKLmzgVhJ7Y3VktbMMkjKcwdgOYF24vlLkIBnniA
 WsAQBy3/m2to0+B/Ls+vRKcqYfeqyAkVoeJ6xgHb5wGhomZxgYsbYwgEswXMYsNwMdmEi1BCrz2
 NYWu/g9F7XNSnLTBhml3knIvqvJBHzbyQElF9CSa7cx8Llolln6oDIGxxGTUAFmBh+T88izWQN5
 8w2+CxxbXkgeaSkQKjJRsqr6trosRMWDUwh+93+AqvAtYjQ96Ag0b4/NIkvmX9lSlyr1kiZ5fNF
 bYnKgReb6bV4QLSSGzlriXluJAe8iA/9+CLob0Pu8BYvmAcmFREPsuK0OyjuGHAAXzHP/xWpsoa
 4OXHcmML5E/jUery+AuXb6cBAyLX6kC6mveQ7NGkLJB+JFlV3ACzQRlZZG4np/vXM2U12E6j/wY
 LqOp3uInUWUoJ/zw9CEWip9bW9qEi+90c5nJ/N9ATtNJJlkgy6Vkb2qarOxYwwG5PuvrgIQdTqH
 yk1d3MUu+ChPPOdZjW3o7O2jsitRGjNXW6YrzMemUAmXjE+MCrvg/X26K5SCs2YKqa83A/N+rSv
 PIdn1Jmtwcez+fHGZzWAePA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_155147_426962_51E2CB22 
X-CRM114-Status: GOOD (  13.03  )
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

Clear the debug buffer before entering the L2 state to ease debugging
link training issues on resume.

Cc: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index e675918ba184..a508f4fffd2a 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -77,6 +77,9 @@
 #define  PCIE_CLKREQ_NOT_READY		FIELD_PREP_WM16(BIT(0), 0)
 #define  PCIE_CLKREQ_PULL_DOWN		FIELD_PREP_WM16(GENMASK(13, 12), 1)
 
+/* General Debug Register */
+#define PCIE_CLIENT_GENERAL_DEBUG	0x104
+
 /* RASDES TBA information */
 #define PCIE_CLIENT_CDM_RASDES_TBA_INFO_CMN	0x154
 #define  PCIE_CLIENT_CDM_RASDES_TBA_L1_1	BIT(4)
@@ -1043,6 +1046,11 @@ static int rockchip_pcie_rc_reset_root_port(struct pci_host_bridge *bridge,
 	return ret;
 }
 
+static inline void rockchip_pcie_link_status_clear(struct rockchip_pcie *rockchip)
+{
+	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_GENERAL_DEBUG, 0x0);
+}
+
 static int rockchip_pcie_suspend(struct device *dev)
 {
 	struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
@@ -1056,6 +1064,11 @@ static int rockchip_pcie_suspend(struct device *dev)
 
 	rockchip->intx = rockchip_pcie_readl_apb(rockchip, PCIE_CLIENT_INTR_MASK_LEGACY);
 
+	/* All sub-devices are in D3hot by PCIe stack */
+	dw_pcie_dbi_ro_wr_dis(pci);
+
+	rockchip_pcie_link_status_clear(rockchip);
+
 	ret = dw_pcie_suspend_noirq(pci);
 	if (ret)
 		return ret;

-- 
2.53.0


