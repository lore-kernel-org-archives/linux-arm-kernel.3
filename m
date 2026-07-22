Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7422CC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1NzpZYboYqwtcorigMNOh+ZrLCk05rqyklCNHkKXB8=; b=hTBKGNTY8SGbB0CrtPyRXjpWx2
	it7VzcGekbvUvH4iWIv80rKUoYy7bXE5MYV0FCA9vkKhpn5AIaSreRjleIW94buVflHOsYNRw//pK
	exsDyvv1Qr8LP8T4EEnw+QDQbZp5/DGfksVKbq8mwRXcKQo70rStPaIfS3ScHo8Wdd9tpNY9Ev6KY
	DAIaBYLmeck+J1FtqR9rFXBl6tQIeu3tH824dXf2kEehLlJziVroTttFc/I7Ad1XfZNx6yw7RntBW
	kTagAS0t4ApmE/MPKEh4HSAtP/HyJQEdPw/8xkrW6HUYrCb+SVXED4LYAEtKi4EAXcqN0Nb7AQTyD
	OiEWJxmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRMb-0000000B3zV-1r7Y;
	Wed, 22 Jul 2026 07:27:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRMZ-0000000B3zO-49RW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:27:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 479E642D93;
	Wed, 22 Jul 2026 07:27:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15191F000E9;
	Wed, 22 Jul 2026 07:27:27 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: linux-pci@vger.kernel.org, Takuma Fujiwara <t-fujiwara1@ti.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
 mani@kernel.org, vigneshr@ti.com, s-vadapalli@ti.com, 
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260721155743.3347659-1-t-fujiwara1@ti.com>
References: <20260721155743.3347659-1-t-fujiwara1@ti.com>
Subject: Re: [PATCH] PCI: j721e: Fix incorrect max_lanes for J7200
Message-Id: <178470524754.131560.2267100744380104820.b4-ty@b4>
Date: Wed, 22 Jul 2026 09:27:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Tue, 21 Jul 2026 10:57:43 -0500, Takuma Fujiwara wrote:
> The PCIe Controller in the J7200 SoC supports a 4-lane configuration.
> However, j7200_pcie_rc_data and j7200_pcie_ep_data incorrectly set
> .max_lanes = 2, limiting operation to fewer lanes than the hardware
> supports.
> 
> Set .max_lanes = 4 for both j7200_pcie_rc_data and j7200_pcie_ep_data to
> match the hardware capability.
> 
> [...]

Applied, thanks!

[1/1] PCI: j721e: Fix incorrect max_lanes for J7200
      commit: 7147a7bfce47acd48c3738130bf0bd692bfd80de

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



