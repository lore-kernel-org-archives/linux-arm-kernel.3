Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0447B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 01:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PK99+lmx;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GJ93YXdH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=omGL6LcMhGREa1S5q4pFujxAG/NXDja8zf9xS2NZp5Y=; b=PK99+lmxFL5GfxkU/rls1f1Ifp
	IKbBP8jtVSDN+adNtcyy0UmDvxrj28ZAUk2/yMerNc282Mq/nB51Imb+B67xJuKcLRGWs6WWWKAuA
	Rqdz0LY+bbsLKV04q8BYLo6jnAFZJf6odmXqbgzdAmWfTjLTL7KvP8VbuVLe9Ktr9ke/TdZ3m47uQ
	7UFtC1i/z//13RR6FLgWq4Dt11ZuD2vr7M8FhQGfo2BjESVkYMmKaL+I8QSNM5HzvAEBCa6TafhZA
	lypx/tByf7MJJSWYRg8jhhDIE3nyXNvIzX3noHivSsthFnqK0yjaKwx4Ze0/1mszVYBK0pmsKNxNf
	WXh8773g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKQ9v-0000000HJ0k-22Ui;
	Sat, 24 Oct 2026 01:02:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKQ9o-0000000HIxg-2RR1;
	Sat, 24 Oct 2026 01:02:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F6BD601DE;
	Sat, 24 Oct 2026 01:02:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792803767;
	b=zIZQSDVPrkbMX6ntSfQ0jG9XCG5cj01b0obgEVr1qyEfPIsFhXFQgyV5cEO47FqQQfif
	 c7Ors3Yxji4E5HHlq5oNKQ5OhT4G5PDoY8BBH/G1yQxDtiFx+TURpM5Yr6aytg3kd+Pwc
	 Vxx0vTewKG9su85y6uvNgEqANeHVxUXgyxx2KyztDlkHdRVsOZGpBiAqQnBn0sEHh4Kxb
	 8se5F9vFFUUml4e/FPdpqApwBojJdEpH/P5HHYnSygLfVRQJ1Ol7P/Ok5GG632Amb3nBj
	 tKfNQfdwGm/QV7ms/vWJP8d7frnPLZjhAPhG4Bku1Ox9oA1ROtLVH52PVePBZ72ytZQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792803767;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=omGL6LcMhGREa1S5q4pFujxAG/NXDja8zf9xS2NZp5Y=;
	b=CjP2C/GOZZntud2HWUMkdnw0oM9cPssnhX4BAYh57j30jC/AuL7aoACW7RcyhxWbCPhq
	 ZKduBVLbbdGI48KinhGMEXSq0SaEZC7u40AIjuLr+ZLo6XqGxwRP8kUw8mtmO/Jgjg2GJ
	 Ur4eljNdRhBA2ZElegZpuAfB2GRfJPNuCIeyriqOo1BuLyA+6u8vm2YsR3CxU+2gXg8QD
	 MPWKwa78oXpFQrmbfcbGRvQsFuNl3gw0mqKlzFQyQrZQKDy5u0qEV/87+IWQkDtojtHsj
	 lUjhJ9FYCD6sPaumGdz8GUM0Qk4vgBqxZPpJqtjR05qWUSE/8HkIunMg8z1sRY44H2g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C89C71F01825;
	Sat, 24 Oct 2026 01:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792803767;
	bh=omGL6LcMhGREa1S5q4pFujxAG/NXDja8zf9xS2NZp5Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GJ93YXdHwFqu6Lsy9cSI74DVafUS1RrKGVdU1MenjUVoc9cP00PVsMQdvPsSGYpKl
	 jWrmZSzD2j2+WBLOAkM4PyLKsdsLerBcmKGIn3fnI/TVUKz5cE8z+mGzTReNlwr7Xh
	 pb49StYa19LzNU/M4QS80afgh/yvFWtKSkeUnlDgNnWDDk/say7UqtNuM7GCMBC1q3
	 1E7tCWJPVxnytN7olYLlA4qFzhrfdFy71cHwW6eZe3LzRwbHxJR62kV8GOdbs3dwcw
	 6Wn5ZxFY87jB+RQLEc4g1Wy7dUOo9NMDXEjawS+JbP/jW86c009nrE5teNBqdOwlrk
	 rX3w5Vhw+6mjg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 493C944691;
	Sat, 24 Oct 2026 01:02:46 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sat, 24 Oct 2026 04:02:43 +0300
Subject: [PATCH RFC 1/2] PCI: rockchip-host: Retry link training that times
 out
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261024-rockchip-pcie-resume-v1-1-58e54a5cf5f1@iav.lv>
References: <20261024-rockchip-pcie-resume-v1-0-58e54a5cf5f1@iav.lv>
In-Reply-To: <20261024-rockchip-pcie-resume-v1-0-58e54a5cf5f1@iav.lv>
To: Shawn Lin <shawn.lin@rock-chips.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2899; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=XyiyrHT+pm4QSQTgMimlGl6CYo9QtiIPmsWqK8gJ4SM=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFl3mLfkvz242aLCc9kGMaUY60fpTxlnm+nuqd7PImudz
 zGF7556RykLgxgXg6yYIsuEQxq3MpZc/evvYf4AZg4rE8gQBi5OAZiI4CRGhjvf9A4u3tt4JNBi
 2qysDcdeC+u/XX/soP6jr8vXf/hZ6nuNkWFtyEdT+bgjFXO5zrGdSjbXjDS2Y66bwXex9P81rY/
 md1gB
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

On a Kobol Helios64 the JMB585 SATA controller sometimes does not train
the link on resume from s2idle. The 500 ms poll times out and
resume_noirq() returns -ETIMEDOUT. On v7.3-rc7 with the mainline DT
this happened in the 14th of 14 cycles, and the system did not resume.

When training times out, bring the port up again, at most twice. Each
attempt initializes the PHYs again and, where PERST# is wired, holds it
low for at least 100 ms. Without an endpoint, probe now gives up after
three attempts, in about 2.1 s instead of 0.7 s.

Print the LTSSM state with the timeout message.

With the patch, one such timeout showed LTSSM 0x10, and the first retry
trained the link.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 drivers/pci/controller/pcie-rockchip-host.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 5b071bdc4f90..b4499fc3f90b 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -325,7 +325,10 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 				 status, PCIE_LINK_UP(status), 20,
 				 500 * USEC_PER_MSEC);
 	if (err) {
-		dev_err(dev, "PCIe link training gen1 timeout!\n");
+		status = rockchip_pcie_read(rockchip, PCIE_CLIENT_DEBUG_OUT_0) &
+			 PCIE_CLIENT_DEBUG_LTSSM_MASK;
+		dev_err(dev, "PCIe link training gen1 timeout! (LTSSM %#x)\n",
+			status);
 		goto err_power_off_phy;
 	}
 
@@ -377,6 +380,26 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 	return err;
 }
 
+#define ROCKCHIP_PCIE_INIT_RETRIES	2
+
+/* Pulse PERST# and train again when the link does not come up */
+static int rockchip_pcie_init_port_retry(struct rockchip_pcie *rockchip)
+{
+	struct device *dev = rockchip->dev;
+	int i, err;
+
+	for (i = 0; ; i++) {
+		err = rockchip_pcie_host_init_port(rockchip);
+		if (err != -ETIMEDOUT || i == ROCKCHIP_PCIE_INIT_RETRIES)
+			break;
+		dev_info(dev, "link training retry %d\n", i + 1);
+	}
+
+	if (!err && i)
+		dev_info(dev, "link up after %d retries\n", i);
+	return err;
+}
+
 static irqreturn_t rockchip_pcie_subsys_irq_handler(int irq, void *arg)
 {
 	struct rockchip_pcie *rockchip = arg;
@@ -881,7 +904,7 @@ static int rockchip_pcie_resume_noirq(struct device *dev)
 	if (err)
 		goto err_disable_0v9;
 
-	err = rockchip_pcie_host_init_port(rockchip);
+	err = rockchip_pcie_init_port_retry(rockchip);
 	if (err)
 		goto err_pcie_resume;
 
@@ -938,7 +961,7 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 		goto err_set_vpcie;
 	}
 
-	err = rockchip_pcie_host_init_port(rockchip);
+	err = rockchip_pcie_init_port_retry(rockchip);
 	if (err)
 		goto err_vpcie;
 

-- 
2.43.0



