Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12152C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 11:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z4rJwaiGUcVMasYaoYfW1m6j68aKnL343YiExodW7Dg=; b=bultBA2k8ru6DHT9cf/ZPLGFPw
	X/x0vlHlASRHNeVkoRqcxocQNCSP5YyeP1oOSGewAdqnNu9yOnbXERnx4xG+3W7/+dPsnvXPVErM5
	7T9fVcg8JAPPR393xLXhWQQnAbtKKCd30czqeIdPmnFA4gSIdXxvY2wcmPcH+UAIWlxcNLq6HXlih
	szBRECIYyk9GndomAysxVx/oMFGsAcm18UVd9oAgqgjzOwA6h9MK7JiWlO/lV0BAo3E6dGPknV49N
	MV2i6aOEqygUYbcXcixH2R4uLhkEm28ll8XcX0xy+WkZxUWLl02w15OzcmaZzTqNfd+5Neb13PfDh
	8sKoPh1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrMM-00000001ZqQ-478E;
	Sat, 07 Jun 2025 11:05:10 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNrIL-00000001ZLL-3BJc;
	Sat, 07 Jun 2025 11:01:02 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7426c44e014so2516675b3a.3;
        Sat, 07 Jun 2025 04:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749294061; x=1749898861; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z4rJwaiGUcVMasYaoYfW1m6j68aKnL343YiExodW7Dg=;
        b=CiBEg/81T51gscNrNtveaKQZY5d97s8uUHT3i7Up5nnm1sVpOHpPEES36mtrfERxh6
         5d4QpkteRz0mW5uyDF+FIJ4mnDl4pYfALm5ktDBnoGbHkM31ZiLe8iNupfwuWpDrvmc2
         9ONPWie0ITyInFDDaQ4KaEbdB0i2pBVQ/dqCLCSXTb1wvLQHyVOmZRH2Z0FxjUk+Mvun
         bcFaVinBZyfrjPn85Xdjg14kaje4Pi2IAw26cwPg7nD9iUrZGkZrLkOMlj6Iu4Lef3DN
         tP3ecaCq1WxucibpRWGWI07sJUTXXCBQXK/PUU0CyfYOIAzJRAe4cFOIUY2Tn0j4Avwx
         kjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749294061; x=1749898861;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z4rJwaiGUcVMasYaoYfW1m6j68aKnL343YiExodW7Dg=;
        b=NPdaCRFXF3jT2H7DnwOnrdoLg780ZQgVPj7Y+Vfb6J4HzPAYbAuMX9Uk6FiIHPK1bV
         nU7zy9CQcFhRyy6i+nYrvaSLM6OmWEyZIy0jW5axBQIsKqRt9Nku3ccc49wbeEUxHnOK
         NznwkUD3sIhc2kUBokx1ZZR1rO3EPTrD6JDKAtLYCUE0Ls9DEBChTgPdmaXGpvvt64sn
         0NgIVTWo3FbD/WS0uO5drfl1U2tc4dvyZSk7djADGp3yjqPpNy/AZAIrfj2KEjiEcUoM
         7sXgUVW3r9LO7Rde4ixfwBZcw1tE4HIdWtq7s/4W9M1VcmRKzfpn/fh3RSRiFYcMy+tj
         BA4w==
X-Forwarded-Encrypted: i=1; AJvYcCVCJfCWsu51IoXdBIWi59vnfSs/miUDeRAz2vJ2LEoJuprXcH/x+icFIG2cAfe/V9JUoquOsrBVqCsf8n91MlrS@lists.infradead.org, AJvYcCWP2q/jO97ucvjXrkiCFakzPuSBT5UOpLS0ADaewm2lD5Brurh+Ewm3qh72yHakbcjzZid+2Vs3o1/i@lists.infradead.org
X-Gm-Message-State: AOJu0YytADWIEa5KUiRZWbroH+VDxz0xlfwp8RLrvNZghX617pwYaFrU
	fCU8NCltPHoPflg0u8OIyZEzu9rQigz7/SVtPzsAEPphC3XKgBWIjzE/ZjdckW/S
X-Gm-Gg: ASbGnct0GFKISQ5yBX2dN+M7yBw5mpRq18nabB/RpMGD9+ZY/7Wuyz754ByqY6AF2mm
	fVEUlhAlsXDm7l3WdgJ8viScB38zzfEXI7vFMnP6l6wTFVHrI/BFyZqpwRwIlQu761MwSjA4Dpm
	Fd3ZoevbhiueiHGYNxvCfXqM55uiXmlIlX5TjkjytMs8XEmYc9OsVbRCaYbQfmEQ5FoHOLpSgIX
	H6zPV6ktsoRct/x71o/LSTrEYhvZNHihnHpNeShAKXwhS1HS7AY4ky8rA1tybZnQpcOquNEix9p
	yi51X4TRDvRBEoRDsxzwYvu562m4TfA/UD0TnzM=
X-Google-Smtp-Source: AGHT+IGt/YtuqJHdC6xAWVKyDpr0OqW7Qptp05bE0lEWtmw3T24yD4J1hIcvX2JIFS7jqrEZ4rgBXw==
X-Received: by 2002:a05:6a00:4b51:b0:740:41e4:e761 with SMTP id d2e1a72fcca58-74827f3ba85mr8768000b3a.22.1749294061062;
        Sat, 07 Jun 2025 04:01:01 -0700 (PDT)
Received: from geday ([2804:7f2:800b:2bc9::dead:c001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af382c5sm2534219b3a.1.2025.06.07.04.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 04:01:00 -0700 (PDT)
Date: Sat, 7 Jun 2025 08:00:54 -0300
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
Subject: [RFC PATCH 1/4] PCI: pcie-rockchip: add bits for Target Link Speed
 in LCS_2
Message-ID: <aEQb5kEOCJNQJMin@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_040101_798784_A9483BA6 
X-CRM114-Status: UNSURE (   9.63  )
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

Link Control and Status Register 2 is not present in current
pcie-rockchip.h definitions. Add it in preparation for
setting it before Gen2 retraining.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index 14954f43e5e9..7a84899d3812 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -166,6 +166,9 @@
 #define   PCIE_RC_CONFIG_LINK_CAP_L0S		BIT(10)
 #define PCIE_RC_CONFIG_LCS		(PCIE_RC_CONFIG_BASE + 0xd0)
 #define PCIE_EP_CONFIG_LCS		(PCIE_EP_CONFIG_BASE + 0xd0)
+#define PCIE_RC_CONFIG_LCS_2		(PCIE_RC_CONFIG_BASE + 0xf0)
+#define   PCIE_RC_CONFIG_LCS_2_TLS_25	BIT(0)
+#define   PCIE_RC_CONFIG_LCS_2_TLS_50	BIT(1)
 #define PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2 (PCIE_RC_CONFIG_BASE + 0x90c)
 #define PCIE_RC_CONFIG_THP_CAP		(PCIE_RC_CONFIG_BASE + 0x274)
 #define   PCIE_RC_CONFIG_THP_CAP_NEXT_MASK	GENMASK(31, 20)
-- 
2.49.0


