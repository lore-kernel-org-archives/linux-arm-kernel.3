Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E0CC83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 22:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtc4GJjYIzCc3h+Hv3COhOArvofrVT3IhU2L5CEaYbA=; b=0+QkTKmpn7lrW02mCaOEm6tmzK
	dv6vnF6UC/SF2Fl490nRIOX2BtT9wwGi3Z3HMFcyXq24Ps4YtqpFioOTelYzL9Ats/DZXOy2B0nGb
	zp0a3fjOGs+epPQdbvotE1GppDqFbZuIzKbAbe7jAdL1p4gMNXUQiReqHEMIMjf5BhGF3Pro9JFfH
	oPK/APVzwENqsOs01ZjYfn71eE3MSYAN8tKTef7igXPNkrRbyPX7UMNhw/ecUOEg1m9LkYQRFXb8X
	NPZZ11TkM16vP4Q/aZYU8zJqFT/vtoI7xHqxfKFxjUbDrkgHSaLb08NaoT2WrFre8GMXpgIiLIAWi
	hAq3yGGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWN3o-00000003cXN-0zv0;
	Mon, 30 Jun 2025 22:33:12 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWMvx-00000003aeF-3kXP;
	Mon, 30 Jun 2025 22:25:07 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4a43afb04a7so18519351cf.0;
        Mon, 30 Jun 2025 15:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751322305; x=1751927105; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rtc4GJjYIzCc3h+Hv3COhOArvofrVT3IhU2L5CEaYbA=;
        b=H/d8DW2XdbX5WlMLbQHFgG/aRvPkcSzeTwNEI2yU26H7cg2ziIxrqqbny7KsSuv5g/
         6r4oUS/EuqIdJIUw9lpHGo3F7XH9XW0ErisooutNL7dg+wuqh1U/RXVsz/t1DlaiAfax
         EKL9CdgrPw1OWl4GRHw1LvKo0mtKaKAApktnGY01GbDN3m73sDPtEQltIMNxUaOAYL0P
         SijmW4Gv7OQwt/BrI4rMPiDM340dXT8oQgfGqHirWgNRHKm3J60FZtWFZuPptHSAK7if
         3FODMVD84cTAFVmkTOaEVzRE09PDrSJgPIx42s6zRjsTHioYqBbnoUnsHuidBqhxqTxy
         i7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751322305; x=1751927105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtc4GJjYIzCc3h+Hv3COhOArvofrVT3IhU2L5CEaYbA=;
        b=qcKHBCyHaiqXmCoWo3uaqAZTps/vknKpHPHSKGSGMYqZ4E7DzvoC36cx1P1gCAJtPy
         ghMZtJMm5zoQOX61vps8wLOfyVaFyPzHAtqoJ9K5AJmoNELakVrgdruJ6PVleL+iO3kB
         V/S2ExJsc6TjL/l4AZK2CsevIMcN7QOvzTfgezCmJiZILhSTOHdJPex7S4rlJiIErmRu
         DPytDkhJyczOuw1rx6Q89tsIWrHYtzGph431hnsOgACF+owy7BiUMPgf866OcUiA4pVi
         kvFO+lpmAgcVnnzL7i4Rq35d0jElozFX4GBC1Jl/bL5nOEdgRo8PfLPDpjNpN0eSbU9d
         /zrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcbj5nEDzc8tdDMLIKic8FvzYP00zVFPWmB0f4yaGV0pkKg6/1fJTADndf7CJWoFqJgl0ps9NtcTTETSzL1woU@lists.infradead.org, AJvYcCWFiekauJtI9vszEB5sEwrlJNvPugmBzWWtepyhpxOHZLGH/wCrcIDB5vYr2Ty4qoNMiVeAAbv7mO9y@lists.infradead.org
X-Gm-Message-State: AOJu0YxMxtYr2pDj5J/T3wVGRCY991zCZA/nX3lk+qAxs4MaIZ9qCu5L
	QdlAqLhKVGharLiDW9LPMhuiqvi3kMV4wcVch+fQ1m1BxIOrDORe/HxpZ4VlTIeL
X-Gm-Gg: ASbGnct/VGwzr3ywKgrQquvuad0XHnanU3UQYak8x5SHzRVo2SvqkAGR8YGGguswVzN
	c8S+0p4mmXF0j+AZz5PSmGtpTLDOg5oJW5s5wLmHmcL1L9MueU8enV/iZuyYw7G4KCzcX+ZLGcr
	0vnaXMDV3KmXGXnc3S+cZDkWz/D+3wZ2v5UqL5zL39QOS/UXbI79vBZaXiT0Kr05d7h9DcU/BoQ
	Vn/f8vKF2QWtpKSWYgqjH2IO0g/nY/fZbEAD4wLX+6WYRfbCmU2M8+S+lN3cZA0EKPORjCIlFux
	1aIX/lEH3mGGml+JawQ1V+TbuRE5X508lD+7MCvPSYMJoZVZQgwcjnHr5cY0
X-Google-Smtp-Source: AGHT+IG9h1D4l6+m606c2ZMkubhW0PPh4r8jC2GsVBPvZvgF1tRRF5vtygFfuvF9SKUIZpKpOhqztw==
X-Received: by 2002:a05:622a:144b:b0:4a1:630b:e12b with SMTP id d75a77b69052e-4a7fc939ddfmr221177041cf.0.1751322304620;
        Mon, 30 Jun 2025 15:25:04 -0700 (PDT)
Received: from geday ([2804:7f2:800b:4851::dead:c001])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc138d7esm67054191cf.21.2025.06.30.15.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 15:25:04 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:24:57 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Valmantas Paliksa <walmis@gmail.com>, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v9 2/4] PCI: rockchip: Set Target Link Speed before
 retraining
Message-ID: <0afa6bc47b7f50e2e81b0b47d51c66feb0fb565f.1751322015.git.geraldogabriel@gmail.com>
References: <cover.1751322015.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751322015.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_152505_927546_133E5550 
X-CRM114-Status: UNSURE (   9.78  )
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

Current code may fail 5.0GT/s retraining if Target Link Speed is set to
2.5 GT/s in Link Control and Status Register 2. Set it to 5.0 GT/s
accordingly.

Tested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 65653218b9ab..25890f6c0e17 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -341,6 +341,10 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 		 * Enable retrain for gen2. This should be configured only after
 		 * gen1 finished.
 		 */
+		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);
+		status &= ~PCI_EXP_LNKCTL2_TLS;
+		status |= PCI_EXP_LNKCTL2_TLS_5_0GT;
+		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2);	
 		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 		status |= PCI_EXP_LNKCTL_RL;
 		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
-- 
2.49.0


