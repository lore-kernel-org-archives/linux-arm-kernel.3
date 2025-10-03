Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F7CCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 17:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pVnrp7WE13kwvvN6B2l11O4oBl8ExmT/hll5Efsm98E=; b=wmMvJyTCC74397uDCM5iI6wfqv
	/PCLHURWJMG/BD2j2nkbbe5O/Q8g26Ga0vAIfDop23D0/pdGdtyPLpPohxCA8cP+8i2YM4H2UsMQR
	57gRENpmv3T5+ZiQwqqczJlXk77Nmss1e9mtNwli5IqTnriZpobq/b1rQSfkAK6zCzmOoOMnFtiAQ
	98yaMw64RgzCs24ioiGPeJdXSXt2ozT5oUPKJmUVPD7PoZrrYdaCRHc18rF4t/6gqx0b55ZNK52Wq
	akTYYfRn8Fh/4Urex/MutwSKzLWxYiGv40YnN5wkJg39kIs7XLh1If7vO+hph6X5uiWCH5OdJogmY
	etfU8RBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4jD4-0000000Cn4P-345R;
	Fri, 03 Oct 2025 17:04:46 +0000
Received: from mail-il1-x161.google.com ([2607:f8b0:4864:20::161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4jD2-0000000Cn2C-0PnU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 17:04:45 +0000
Received: by mail-il1-x161.google.com with SMTP id e9e14a558f8ab-42e758963e4so14383465ab.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 10:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759511082; x=1760115882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVnrp7WE13kwvvN6B2l11O4oBl8ExmT/hll5Efsm98E=;
        b=QswsgNj2DHWZysHYmJDg2MRUQPPh/LarNaGLLRkaASOp9x8ZfXuMPPW4dE2Vmu1r3k
         yNu28aRsABmLDxeYNKqQ67oXzA2CW6zlp0AqrLabZfkyJq5YD5+2cnODm+PoIyWiriXD
         dwRTUjg/yK1C0rN5Epm8QjgyVtAS6q4dKv/Qa3+majIr66L8LgKhHj76wl09l/ryQvSZ
         S7Kl5Be2CQWq8S/1kRBmPxgp4On7Zg/oj0++pu5is1pMuoGx8/0xMMQf8G98BLq7zffv
         cmmxOH0oHM3oDKC0rQKZDZ/Q3z5z2KX6wrqvtLwbkOL7RIcT/jdEjREuxuaEIsVs7kuJ
         Bl7A==
X-Forwarded-Encrypted: i=1; AJvYcCXYojbUp7NlHeHXFwiZrxGK24Ik1JG4dHCfff7yBvQgTjxvhZ/cEjFCvPXfDEI479hwUd0jYrF5+7lPWiPrff72@lists.infradead.org
X-Gm-Message-State: AOJu0YwfZeeevIiTYGZb8khA23CfodPeIFQ+9jQtvnBayx+MG/f5tY8e
	ES+R28JxGCDTwHeRhFPFBVRvn/ToYlHmmkQjMQqy1PN4tQkKuokXZq5kzDmD2FJ1yqKF7XyMB+K
	6rjPo2n78J28cWsFRXysmn/jTNJkUgR+ZemVRwHJ1u2OJxrmwqBaJQPa2e5gxJeOdKGZIS+6+eP
	6nTq+vbgQQtfQM3Aq6g5g/18FW3QjaTk+1QcX1dMamcqoojBbVnXhwfOnnnN/FJbTwin5dGYhO+
	sYtbb7n+dw3lSC+NwXuejPzcHOyT7U=
X-Gm-Gg: ASbGncszaqgfudhqjqU6WZ57I95EK/MmHEIaZnOpA+20uWl1xjH2Hjk7B4geEOLM7U5
	+D8YAsECTLTOCHgkPAh3OEHDrUyskLhKqAz9lMXf5OyYq2a71TE9568++m9jjWQqdOgLfEh4w6j
	upzHpmHqbJKfkQ+b928tSPLcV5oD+1rr3ddAT1Gw/4rEXIJBluy2KE6V8neSJV227VsnHMvIWjw
	uH3OsJ6Yfn/Nf608KwnzlpduZRxwHuEVHOPlkZEfFy/VMVQPOKZqIgP0bO5uyiQBrzUVTG2VuAU
	mKZTE1yXV91aiHQ8ZSKF7TBWdZzC/QNAfZIAp3QgqljlaitZkKpiBEi28hjK+67EhmzDelF8FBt
	2TEqEHDv7fVFDVuNv/WpSftgc4mvB/2V8wjx9qo9w2Obskfitni9dwqi5gHg0sVpiwBi6ztpayh
	JehNq97IM6
X-Google-Smtp-Source: AGHT+IHLmoFWbEJUm1fX+Lz48tnLm6pWBx85F/YeK06q3aV81LMYicwEnhCf8EYxwscSZkNGDsUzdaFY1zeU
X-Received: by 2002:a05:6e02:1a0a:b0:42d:8695:105 with SMTP id e9e14a558f8ab-42e7adb0649mr49557915ab.28.1759511082270;
        Fri, 03 Oct 2025 10:04:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-57b5eb026fesm408748173.16.2025.10.03.10.04.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Oct 2025 10:04:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-828bd08624aso491756285a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 10:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759511081; x=1760115881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pVnrp7WE13kwvvN6B2l11O4oBl8ExmT/hll5Efsm98E=;
        b=YvhQ+SL95DaDYuK/QCeZaDjz7V5pt4QRDVp5LYvxnxbMz3aPnXNgL86x+4Wa9PdpyB
         EAgjKGxDkPaHbtP5AYShsGD4lqJ2B4uXzKe3e5Ol5Xqktai1Bj5IiSW/7yhtwfNIqPHa
         FY2IeaZVESrNSp3eNuJS7SKZpjJ1rKGBFgwfg=
X-Forwarded-Encrypted: i=1; AJvYcCU9gnYl/DWE3yLKHEaGxTdMrWAZUi9sGXsfKnIGItv+f6V0Of5jxoryfXkWOHi8gL4jezaXesG+RnT/aXviHJz0@lists.infradead.org
X-Received: by 2002:a05:620a:414d:b0:84d:26f0:613 with SMTP id af79cd13be357-87a37cb2c5dmr525097985a.33.1759511081262;
        Fri, 03 Oct 2025 10:04:41 -0700 (PDT)
X-Received: by 2002:a05:620a:414d:b0:84d:26f0:613 with SMTP id af79cd13be357-87a37cb2c5dmr525092085a.33.1759511080652;
        Fri, 03 Oct 2025 10:04:40 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55a34b6bfsm46472271cf.7.2025.10.03.10.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 10:04:39 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] PCI: brcmstb: Fix use of incorrect constant
Date: Fri,  3 Oct 2025 13:04:36 -0400
Message-Id: <20251003170436.1446030-1-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_100444_282939_1BF25AB0 
X-CRM114-Status: GOOD (  14.45  )
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

The driver was using the PCIE_LINK_STATE_L1 constant as a field mask for
setting the private PCI_EXP_LNKCAP register, but this constant is
Linux-created and has nothing to do with the PCIe spec.  Serendipitously,
the value of this constant was correct for its usage until after 6.1, when
its value changed from BIT(1) to BIT(2);

In addition, the driver was assuming that the HW is ASPM L1 capable when it
should not be telling the HW what it is capable of.

Fixes: caab002d5069 ("PCI: brcmstb: Disable L0s component of ASPM if requested")
Reported-by: Bjorn Helgaas <bhelgaas@google.com>

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 9afbd02ded35..7e9b2f6a604a 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -48,7 +48,6 @@
 
 #define PCIE_RC_CFG_PRIV1_LINK_CAPABILITY			0x04dc
 #define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_MAX_LINK_WIDTH_MASK	0x1f0
-#define  PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_ASPM_SUPPORT_MASK	0xc00
 
 #define PCIE_RC_CFG_PRIV1_ROOT_CAP			0x4f8
 #define  PCIE_RC_CFG_PRIV1_ROOT_CAP_L1SS_MODE_MASK	0xf8
@@ -1075,7 +1074,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	void __iomem *base = pcie->base;
 	struct pci_host_bridge *bridge;
 	struct resource_entry *entry;
-	u32 tmp, burst, aspm_support, num_lanes, num_lanes_cap;
+	u32 tmp, burst, num_lanes, num_lanes_cap;
 	u8 num_out_wins = 0;
 	int num_inbound_wins = 0;
 	int memc, ret;
@@ -1175,12 +1174,9 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 
 
 	/* Don't advertise L0s capability if 'aspm-no-l0s' */
-	aspm_support = PCIE_LINK_STATE_L1;
-	if (!of_property_read_bool(pcie->np, "aspm-no-l0s"))
-		aspm_support |= PCIE_LINK_STATE_L0S;
 	tmp = readl(base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
-	u32p_replace_bits(&tmp, aspm_support,
-		PCIE_RC_CFG_PRIV1_LINK_CAPABILITY_ASPM_SUPPORT_MASK);
+	if (of_property_read_bool(pcie->np, "aspm-no-l0s"))
+		tmp &= ~PCI_EXP_LNKCAP_ASPM_L0S;
 	writel(tmp, base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
 
 	/* 'tmp' still holds the contents of PRIV1_LINK_CAPABILITY */

base-commit: 4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4
-- 
2.34.1


