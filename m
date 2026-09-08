Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C130CC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 14:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/kbJmlclBeIjVR1T3ghM1yG/9ADw7M7rmty2JqJur4=; b=tpp/Gfb9WL1UngXr5A1SkIGieJ
	7aRGnQZQ5qUF/XZLOWK/z98z2/NxALat/kp/mYbRpQod5bY5Ih7wX7KDMfnIvwJLJKJ4QYQ6B9p9I
	Tkh49vc9yCutwxgKPnhYfNTA6hjDCHb4vt7Jfn7I9PHHEeah9XTYZp0d2gCq9DKPjhwTf/F+XXea9
	Gb06rdDyJ2Ng0C16t7gfB/rxe5EpS2z+rrKS7RyNmkwZM47KGelBpGbME+T2g03IdnpigCZNkjeS4
	9RqciBnki/3VsQuMEkiJbATkS4NbaDANuQBB1WCTgtKc/Zxg8edYX02YhUGjPQ8Zvkx+8Py4O21JZ
	umRA/A5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xB7-00000009Kgv-0ARO;
	Tue, 08 Sep 2026 14:52:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xAt-00000009KHK-38bi;
	Tue, 08 Sep 2026 14:51:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=N/kbJmlclBeIjVR1T3ghM1yG/9ADw7M7rmty2JqJur4=; b=YBt5CW4l3G6jWWL+rEmIX/7BmL
	+t4I+yMXXVAybiUbrq//EecH3I0+SrBfGhOoyRekaXokpIyfzaaHRQbKTxSnagbVSObsXH6taM5p1
	LRY7KvkrTMQbG3qwRreK1dllhGVolsulWGRaES7qhUug3yCNvA+1W+iHRUx2ZTL08XCf0uF3JbP6C
	Jgfso92xtnnOC9FvJ3a6jwYQEAK1eB4j5VPSR9J+YqSgYJxIJfYBhBe09qInUOLrEpUCdriAKt2kE
	Riohi7Z+3nTwwQsOc8B+I6tnVJ67BS+msIWB92cahuItrvgTRnrg75J1D2kDdVDAWzpRUt6g7SC+X
	0bztoZoQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xAq-0000000HZ1q-2AXn;
	Tue, 08 Sep 2026 14:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788879101;
	bh=ZfxhLkyDar7QOwr+Kdk2fm5x7d8U5zVs/P2O97TfAjw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I8lYyIa0jegdk6hb0a5KgEp36jQFVuep5w5QMNSwxJSwbbvei3voypD/SjpgVV+PQ
	 FekQYpH+Nb2V0PUaYtfiKJL5uUbr5ZxEFI2yPogmJQ/+ybmyhZgttpRBF65Mtq+JDl
	 1IQIYwO5yvqjeuudSOFROf93L6sQGo70nSSUHUl+frTsZ20741C2lln9Whfuf5Dv5r
	 dSaVkLevPHWJQFlV8oeEN9x0TDsdmnkq1G8W4icmNBRq2gsiSYXiCU3imNjn9lDffd
	 8C6liZz8vnix6mm5Nuj4R7qt47IuuYOPyDe+LFK8f6QFYpmqPcqXB3VM97m4MxtUyf
	 xekszrCj8uPfA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D84D17E0EB0;
	Tue, 08 Sep 2026 16:51:41 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9949E48003D; Tue, 08 Sep 2026 16:51:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 08 Sep 2026 16:51:26 +0200
Subject: [PATCH v6 08/10] PCI: dw-rockchip: Set broken L1SS resume flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-rockchip-pcie-system-suspend-v6-8-fbabcca9921b@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1793;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ZfxhLkyDar7QOwr+Kdk2fm5x7d8U5zVs/P2O97TfAjw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqgIPxJGUR4srONtxKLTKD8iRMLzHqyacXSU
 urMkN+gYiF/WIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqoCD8AAoJENju1/PI
 O/qa4bQP/RAVyzs6Q5cmYt9KdhW4mRITRHknDz3whcxrHmHfBVHR8lxrZjeVOY8kKCeKoKdCBlP
 Q8+d+B9u8hBwrsaUfYbUzR64z3LvmYtzFkaGCWXEjS2RSIK3xHtkaOP2dsZLzgzkU7ETC7etRmN
 KdV6I/rtKWN3wCLRWHs8HZvn9FoXv6as4FKnqBKiMIhNjWJY5fBKKrFoPrSxJMlUIkwYU6/skbJ
 lnFBE5aJt7IO0YXXfI7yJox46FidoKltTKj8rxURAeDkVORKcxzVMTOpLiBIytq5SykfP44Ax2o
 61se21x8mhC0PQ2owE3FcF44GUDxyLqK//1Bgv9VNiNJ00Agz2TNWH/RtQwsP+VflY/ypb+kJ1L
 nki861JQYSP0sTvTmIu5yc8DvI7xJXGfOxmkaKC16+Gq1LHQhMnH95OgrHXOa++KTKxLgn7ySuV
 nXSPPqLkKEgX7lbuiacIfQkaAvEEsgDL5OmRzipsB9XmGUsIMp0gaa25zqdgRMa/NQQviC3V5G+
 v1nreo7Tt+na2cI3goYJGb9uGCKiqnOhlSxjYW0llTJeqegXj7J3yzLPo9BV2DYA8IW6bjALz4E
 cDhgCbUUD42jX0GaYCRvdcICEEpmiL/OYtc8mo34hXWdYI/AchN+++U1xKsOve9grVeUVS9XmyR
 /teDWU0A0DDvas9bAQSArTQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_155148_677982_0B1C0545 
X-CRM114-Status: GOOD (  12.87  )
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

Setup the broken_l1ss_resume flag, so that pci_suspend_retains_context()
returns false on the Rockchip platform allowing PCIe peripheral device
drivers to act upon.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 17530507e41b..47d9cab909bc 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -458,6 +458,21 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
 	return 0;
 }
 
+static void rockchip_pcie_host_post_init(struct dw_pcie_rp *pp)
+{
+	/*
+	 * During system suspend, the Rockchip RC driver effectively powers off
+	 * the controller. If the link is in L1SS and the endpoint asserts
+	 * CLKREQ# to exit L1SS, the time required to wake the system and
+	 * restore the PHY/REFCLK may exceed the L1SS exit timing
+	 * (L10_REFCLK_ON + T_COMMONMODE), resulting in Link Down (LDn) and a
+	 * reset of the endpoint. Set this flag to indicate this limitation to
+	 * client drivers so that they can avoid relying on device state being
+	 * preserved during system suspend.
+	 */
+	pp->bridge->broken_l1ss_resume = true;
+}
+
 static void rockchip_pcie_pme_turn_off(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -497,6 +512,7 @@ static void rockchip_pcie_pme_turn_off(struct dw_pcie_rp *pp)
 
 static const struct dw_pcie_host_ops rockchip_pcie_host_ops = {
 	.init = rockchip_pcie_host_init,
+	.post_init = rockchip_pcie_host_post_init,
 	.pme_turn_off = rockchip_pcie_pme_turn_off,
 };
 

-- 
2.53.0


