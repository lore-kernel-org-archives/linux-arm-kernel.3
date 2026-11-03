Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AB5606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 06:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ho+v1n0S;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O7s1P95g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+LNCQwzF5/rRaERSiZo9WaoUzbx5YYQQRcOrcscm3h0=; b=Ho+v1n0SOjIA3vEoY9Xmem8RsY
	OgV/tDiF22pGb02/qTTX+BFHjoz6Uq+dOHLtGcaHPsu0DYX8ojWB/Sd83l1r2ZZX/ymQwWlKL4p93
	CBXErXk9MHkLNUvOTRJdHzkBUBdAfvTDSo2zLC+nStSWSMeoLkr7KfsQrfRuhS2c7AyM+jMWdW9fr
	jFqhClsZI4DcJZNa/SWXWQ5zqdRGL9l8rsX0vGY30N1uLP/B5tE7zq8ZcXLNgW9YRPxl1fu5GC+fZ
	+DOPxAJfdZh9SUtrZJpIXzqaBe70Skkhjmt7GvGZE9IdyYbtg7iUnkCcs2n+NdK6QkYFQj9tDlCcV
	Hlpo6HoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO7gL-00000001BeP-1bWE;
	Tue, 03 Nov 2026 06:07:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO7gI-00000001BdL-0T00;
	Tue, 03 Nov 2026 06:07:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 34B85600CB;
	Tue,  3 Nov 2026 06:07:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793686056;
	b=bemL/9DUmWApBh8KWvWUmB8v6Bd5uNtR50i/WChyZSMj8Nn/oYU2gPrjNN7I4NlNFV6b
	 pdoAOmyvQJOfjsrWzOUGNmUhfjFvMS4UIfQ/sdi/XqTi+ejohkpevV85ul5ae12rkfyfs
	 q7FaaKj+eGRjkEubYEqBB4slCqCjSG9Q4rstpJBpx2Vw1F3upnnKKn7Eh4tHvyqIWoPJA
	 ZUUiPJ8371W8RHjPhoBxR0PfGNvvnanbKw1gGJva3ig6Pf4vP4f6PslRMAVAhz5pCpvg5
	 2tNGd048ZNxGkCIK3qlH8mFuEEuV8d0ltnXa08DBP7cY6zG5gd2/jWTkY3Hig57hPbg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793686056;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=+LNCQwzF5/rRaERSiZo9WaoUzbx5YYQQRcOrcscm3h0=;
	b=nh+y0r8r/TbTyeQ+76C9/zNon7klXqS4WOgAFAxi525PukS3bhQK5XC8QZwT5SNzMJXJ
	 5XAUa5I6zyPzhutT7WQpz33se86R4m4mUliWBQsni0Wgpj74tfCrYwU+J1i4cxV2x70va
	 o63f1RIFRXaTCNWKZq1uVCvwjKYopL6WciCbNy+Ni2mPCyBXjCYEvMrvWF/xJLT8sKytS
	 ItJGqT9Xda4pihwyYEJsX4M+Aaffejm1JBjPS2jqotJQaYVE4TAVRMwdpjYkcQbg6yzaA
	 dd8eq5txrx8AlXcodp8dXfT7jKatjYgsjBNwwWP1lWJtG2g0QBjhvRhawcinuNR6fKg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 730891F000C1;
	Tue,  3 Nov 2026 06:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793686056;
	bh=+LNCQwzF5/rRaERSiZo9WaoUzbx5YYQQRcOrcscm3h0=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=O7s1P95g7AlAS6fGetJYjjgeNRWAFa3r9xSMaEQSDOg+oEFw2EnOs5nnnhJMxqSnl
	 DqbQPusu1eHVQOgWKhQnGKj2+nyQ5hBeK1XyywNrc8tc5RC31bfiQAIT5ayYddwuio
	 e4ZWqAd0dYZInTKdC9cFKcB/gK9gaCVU5ajbLVcZ4OV13OVfJ5xYaGMVtyNKe9aVgL
	 2Jt/yhy+kmySUGV3B7TLiO0idrzKCVRZBPRGdD192LyH5zy0EyuYY6/YffM0AbK4eN
	 YoCpdF8kC0tgBc2Oizy02F9tGJdqaB++WXBpEzl8roIMEA0NeVEPprHRYV0xm9k31c
	 GpbC076Q2eemA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 03606467C4;
	Tue,  3 Nov 2026 06:07:36 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Tue, 03 Nov 2026 06:07:35 +0000
Subject: [PATCH] PCI: rockchip-host: Enable async probe by default
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261103-rockchip-pcie-async-v1-1-4dcadb94af64@iav.lv>
X-B4-Tracking: v=1; b=H4sIACZ66WoC/x3MMQqAMAxA0atIZgOmlSpeRRwkRg1CLS2IIr27x
 fEN/7+QJKokGKoXolya9PQFVFfA++w3QV2KwTTGETUW48kH7xowsArO6fGMrWFi2zvrqINShii
 r3v91nHL+AHfeqAhlAAAA
To: Shawn Lin <shawn.lin@rock-chips.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=ZRf73Oh50c+9BYq7xVYrqoGA7KZ7hc21cjbuWcPTIPw=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkvq9Q33dNaILT/C3cxu8LL4tufGK5wVXIbLE/R5cpfP
 Pfm9ft5HaUsDGJcDLJiiiwTDmncylhy9a+/h/kDmDmsTCBDGLg4BWAixo6MDG3aCrO1rvx1qGjM
 eiz3foPj60OBV5WOG39zNSifdVgg+g/D/7LIaF+1uw6CruuWzXr/+8X969VN935HTem6ILzj/b+
 OdD4A
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

The probe waits for the link to come up, and with an empty slot it
holds the deferred-probe worker for about 0.7 s. On ROCK Pi 4 with
UHS-I enabled for the SD card, the I/O-domain driver then binds only
after the card has switched to 1.8 V, and tuning fails ("All phases
bad!").

Probe asynchronously, as commit c0e1eb441b1d ("PCI: qcom: Enable async
probe by default") does for the Qualcomm host driver. This does not
order the I/O domain before dw_mmc in general; an explicit dependency
was proposed in [1] and not merged.

Link: https://lore.kernel.org/all/20230904115816.1237684-1-s.hauer@pengutronix.de/ [1]
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested on v7.3.1 with the Armbian rockchip64 config (PCIE_ROCKCHIP_HOST=y):
- ROCK Pi 4A, empty slot, UHS-I DT change posted separately: SDR104 on
  3 of 3 cold boots; without this patch tuning fails.
- Kobol Helios64, JMB585 in the slot: link, SATA and disk reads OK
  over 3 cold boots and a reboot.
---
 drivers/pci/controller/pcie-rockchip-host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 5b071bdc4f90..1e1556e436b8 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -1027,6 +1027,7 @@ static struct platform_driver rockchip_pcie_driver = {
 		.name = "rockchip-pcie",
 		.of_match_table = rockchip_pcie_of_match,
 		.pm = &rockchip_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = rockchip_pcie_probe,
 	.remove = rockchip_pcie_remove,

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-rockchip-pcie-async-42c1c3863617

Best regards,
-- 
Igor Velkov <iav@iav.lv>



