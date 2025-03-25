Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997D9C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 10:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsZVGJR87ZINAxzO9Kq7hDU1Y4+ms8ikl5Jf7+AJEgY=; b=KbN8u638OZ/Y4ZPmCy/BGt3Szy
	Hee0LaUPm6KeOQ+E2ksZ4GFj+i6hIeS9f9n3nmiFd/48y2XRLxfRCrcSsx2JXhbBY7qvw/fDFQ84G
	ue4nE/SwvYWy0Q7n7HPZ8YDpzZGTMsKOWupx8LZck5OEpIxbrJiLfo1D7GeuVjzVw8LzjDF5+8uve
	/3oHTEzT8NC18iREBAdEYMnQWU3fk0XKlX++oJLvzzLZ6jUnhitgSIdxqNMrKK3t1/vc4T+FD/s2r
	T1siNfAPnpHxxizEa7nNSafwxbOmhty+738yUx8VjUX8/XTE1Mn/+NAayEYroreoZbz5N+8GxZm7I
	CaNv8pEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1sI-00000005Uri-3CBR;
	Tue, 25 Mar 2025 10:51:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1Ua-00000005QuS-2vJp
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 10:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FsZVGJR87ZINAxzO9Kq7hDU1Y4+ms8ikl5Jf7+AJEgY=; b=LjbDsiHcd0eeI0eN5pDnALas4E
	hEsRSM5JKO2ab813Cfdy3alKGBnQz/VYnA5UoacQ6cdoINBDvj9GDVC1t7JBKdZecJQ1ZF8nWmgZ6
	5h5cpvePxTI01yH4+7yGfwtkpGRV6Xv9gRKIbu2Y47rkuVbU2/OdzIkcbbY8l8UthtLIpks+IdySM
	+66lJbjRnlwozSisUlPHdzSa2jZ9mKFNRtlRYtG+oK2Wfb4aQU7eZZxvznu4YhCN5PoJINdYf4Hdw
	ZITdum4mobmTh9424xCQruXJZRo9WbZYdLxCeVd1Yk+PpamBm+3SjOKel7inmDYHgeQ20p0O6cOjw
	w2nKM3pw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx1UV-00000005Oj6-3bqB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 10:26:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B430E43D08;
	Tue, 25 Mar 2025 10:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBEAC4AF0B;
	Tue, 25 Mar 2025 10:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742898395;
	bh=Oh9hzrub7V3yA6gRUAWaXuxAVYkgTAMlh3xgo9/9ols=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SkyeH/HTmIBNAjo7Dx7nqIpBRB79DCVMvI1u2Su7let3jQAlYRaI68+tDB4KPdA6l
	 mz2Wv/ydl61gRRiKN5/MEOLl7ckni3Lcs8nOTYeUOW8IEnGRcwTB9nSVd1+7tZyca6
	 C1II+sfocYNKda4dr1+JC4lwYhRNLZPakozchoBPKivqOQTgWZhkgOIDv5Zkk2/kFb
	 7E+LCI6r7E5mjD+zu5o2nS/d3CTr3GMa/vQCBEvZB1iaBjeLCtpM198N0tqnm+j8qp
	 FFxyx3iuq2nm3JhGnXPl7vDgACZIP5DziqXBrRd5KmZoi1jNt17ix68m40ETZuzeaa
	 E0296fJI8B9sg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tx1UQ-00GsRS-0l;
	Tue, 25 Mar 2025 10:26:34 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 08/13] PCI: apple: Set only available ports up
Date: Tue, 25 Mar 2025 10:26:05 +0000
Message-Id: <20250325102610.2073863-9-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250325102610.2073863-1-maz@kernel.org>
References: <20250325102610.2073863-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_102640_245695_8AE30AA9 
X-CRM114-Status: GOOD (  13.25  )
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

From: Janne Grunau <j@jannau.net>

Iterating over disabled ports results in of_irq_parse_raw() parsing
the wrong "interrupt-map" entries, as it takes the status of the node
into account.

Switching from for_each_child_of_node() to for_each_available_child_of_node()
solves this issue.

This became apparent after disabling unused PCIe ports in the Apple
Silicon device trees instead of deleting them.

Link: https://lore.kernel.org/asahi/20230214-apple_dts_pcie_disable_unused-v1-0-5ea0d3ddcde3@jannau.net/
Link: https://lore.kernel.org/asahi/1ea2107a-bb86-8c22-0bbc-82c453ab08ce@linaro.org/
Fixes: 1e33888fbe44 ("PCI: apple: Add initial hardware bring-up")
Cc: stable@vger.kernel.org
Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pcie-apple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 6271533f1b042..23d9f62bd2ad4 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -747,7 +747,7 @@ static int apple_pcie_init(struct pci_config_window *cfg)
 	struct device_node *of_port;
 	int ret;
 
-	for_each_child_of_node(dev->of_node, of_port) {
+	for_each_available_child_of_node(dev->of_node, of_port) {
 		ret = apple_pcie_setup_port(pcie, of_port);
 		if (ret) {
 			dev_err(dev, "Port %pOF setup fail: %d\n", of_port, ret);
-- 
2.39.2


