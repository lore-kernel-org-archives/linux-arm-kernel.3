Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EFDC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JsBR+3ZaCX2OHnpXjm2aWoB1xEksOSX5f66Opu4aP6U=; b=aUirWP8ZPdlW89MCS4a6D0Trau
	5imAxK6QFUXfbXD4SjyNE8/kQQTpXB8f5gdzcDA+YJYRFdODdTBpdkW29S8kGbqWJ+f9Cfw2jXgHj
	dkLz5eYefiPcEXuO/cZlbXCuekDkM2Y9HBnF0Oa5TNd0dm0TGtoXTbC4H4tYD0I9ibj1c0A9+172i
	tCMuh00xIcLQVA/89pf9xc5VpxBQ+Z7ZDSNc01AAbJ2swOToJGvLnego7RDsa0vOw3DVSAXLeUQjc
	JOjWl5Fe8n3TuEEeeU1fj1D6VQrCuthImDIAheletQjOzK2oZR4EQ2+m1gG4jS0J5/DZb9/g6c3R6
	5M9f0//Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrOa-00000001aBM-1rbp;
	Sat, 07 Jun 2025 11:07:28 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrIj-00000001ZP4-4C1v;
	Sat, 07 Jun 2025 11:01:27 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-afc857702d1so2298908a12.3;
        Sat, 07 Jun 2025 04:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749294085; x=1749898885; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JsBR+3ZaCX2OHnpXjm2aWoB1xEksOSX5f66Opu4aP6U=;
        b=OZ6cE4IGQUg5Hgtd8fRQBBn+tOuP4uTQDTo6SFSfvK0FKA8dtAvn97uVd9qDfUgpTl
         fRdcnDgiJjIoe8TYrDI6c02OC+RMp26ngk6sME3GgIJ0LP24xSkXfQX/HQUY52cOTdmB
         sNIrdZr7H6igUW4JiBN0z8h3FMAMZJZ3ESxrzm3G9DklwXfzQnCuwa4iEFWTiZ5DdGyj
         7Pjc1nvySi+10zVKV+1jk900CMMSTsZ869D4Wu4q+vqpIEaMXq49/fCERn4dPnjlx2UW
         sXoDc7jaO0DVjrOpkVALHD3H4b/KfzGflapcWQQe7UgBE3kzhGqKpiBuyPuzL5yWuBq8
         7f2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749294085; x=1749898885;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JsBR+3ZaCX2OHnpXjm2aWoB1xEksOSX5f66Opu4aP6U=;
        b=BDw6oJeLnUdsevzZvC8cwVgYiDzpQzTCKdCgmO9qJHdU6ObNTgSohfSMjmi6rSyA1M
         ueaxtts/tI7bU2xYmuzm/wjTA0rIPSYuQojrwzEwMQnh27qVZJTyduas2L4sIbPZsnZ1
         hbTjFZ/xaXzX+5Iuw0ukhzo57LhPzFgedoBpVxVNzeitbOfFXwXEvViurTUIjFMFln7n
         4f84Uq8LafpcAet8b021QmeOUPbTLz6lQJ89YILdIXZ8+LOc/8UjzAL5TtC/0QxjEvMA
         mHVvFGoDfuxw7zyqAuJEzbqnJ1dp0Y+gcPbFpPwtqBhe3q0FzcdNLIq1oNJntwwrxw2k
         jsww==
X-Forwarded-Encrypted: i=1; AJvYcCVeviEI/e61xiTB42Gbpe58mctsmsWBUQsm0Uw1D3HdBaEwGr64Uj6VS50iPKQeve60r9bkNAnQhGmR@lists.infradead.org, AJvYcCXGZUwBBYAoPyhZdjxEKUx/o7UyUi/3VF81SWsAsy35lUkYQ/LM3uVMWTu0w+Wm3PWIt44TxnA1qmh04yWPJ/Pv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/4Y9daV189scgOsiZDNWIbXHGw4JdPoXiqmonsR01QkBE3KHR
	Ejp93WgACphktRCI4cIBVec77JVuTN68aC/qlpfvZWHBLSNcc1CUzutjz/sta1jS
X-Gm-Gg: ASbGncvxiefaI9TsQZuErwi2R8w+IKS3sm85Mc6Uqpf0t3nGfuIAoc8/qE3iCvjkkIP
	zHVxOKXibz7xudbQb9F128kpFc3NbAqr0Td9XpdzyjknBu622uoXHxOoxzSDD1LWvLwWcv2PsWo
	1UYBCuvOhpRkGrGtZ0WdhqWBVTPPXFEJVsazCMzNEDPWZkXwjxt7qjNR/rLTc9WExd96Dx/rOlI
	qVqthpbfdZ8wZSvLuCxuq3joS21S8qCDca1nwqUSqTe9Xf/LqwfU5069YEBQhOwar5R1LbVLvTV
	LCcVnWavRqObCRxpx1ZrnsdNb51mHLWQjhBqkvOacU4aEFLsCA==
X-Google-Smtp-Source: AGHT+IHNpZUdZlSIJX40FGVrU5jxa9k7R1/SXc2BmovlQlqrVQqzsarwJuqHOBXzdPDbIs0BFD5RsA==
X-Received: by 2002:a05:6a21:68a:b0:21a:ede2:2ea3 with SMTP id adf61e73a8af0-21ee250ce0dmr8734059637.17.1749294085231;
        Sat, 07 Jun 2025 04:01:25 -0700 (PDT)
Received: from geday ([2804:7f2:800b:2bc9::dead:c001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748391f7391sm959612b3a.45.2025.06.07.04.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 04:01:24 -0700 (PDT)
Date: Sat, 7 Jun 2025 08:01:19 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/4] PCI: rockchip-host: Set Target Link Speed before
 retraining
Message-ID: <aEQb_xUwC0gk97y1@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_040126_037376_DE5D6BEE 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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

Current code may fail Gen2 retraining if Target Link Speed
is set to 2.5 GT/s in Link Control and Status Register 2.
Set it accordingly.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 6a46be17aa91..55b3289fb70f 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -341,6 +341,10 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 		 * Enable retrain for gen2. This should be configured only after
 		 * gen1 finished.
 		 */
+		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS_2);
+		status &= ~PCIE_RC_CONFIG_LCS_2_TLS_25;
+		status |= PCIE_RC_CONFIG_LCS_2_TLS_50;
+		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS_2);
 		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
 		status |= PCI_EXP_LNKCTL_RL;
 		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
-- 
2.49.0


