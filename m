Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BAAC83033
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 18:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtc4GJjYIzCc3h+Hv3COhOArvofrVT3IhU2L5CEaYbA=; b=wurmRx1rwHs6eGImcc26gNf5ah
	L4AdVDFZ8vLO+8mToSjPBE7/BMdfNedwLUuEzq+r0i/19/a6Xx4pPISSfSAZZCT/Ywz7J6Qr716an
	rE0pWxDOIK1nnU6YT1MhdHsXBYVoca19NSFX3b4ZtM1/+0xrRcojJ9Qh5gHuj4UHyBE3i5vQhe7qS
	8xT0jMXk6Qynnq0+dzIXdSijgFeYTb7F+woo4GCWrkdqyaGnF/NEQ7qobJ/T5CDhekoPlw3LBQ5ob
	Mrr64bjW0MYRZJT5GLGtHaaElWHst+6XlWGwFPELwf+EbdOzolbdsvRmAkxnQwSpZfE3EmbcCPXCT
	VjyeWopA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJOP-00000003DJl-33BR;
	Mon, 30 Jun 2025 18:38:13 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ8b-00000003BhL-2HS4;
	Mon, 30 Jun 2025 18:21:54 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7d3efcb9bd6so472004985a.1;
        Mon, 30 Jun 2025 11:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751307712; x=1751912512; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rtc4GJjYIzCc3h+Hv3COhOArvofrVT3IhU2L5CEaYbA=;
        b=OTAvGpM4AWJt1OLA3md9QVQ4B2Iu7pH/r4F8QtbGGVmTPsk2ivrf2Zg8/zcXbhcG+x
         XJ7CeIzcmVVGU5dCXNCJ2eUzbepBkD/+QkQBpVRxpS3mmLuguvr0NsqiSlvnd9nT+XQF
         2bwb6/2ipzeDZO8hVlZ9qEzzbB0xzYbRRFRus/YX5ljbThOjUcx3DEdygJy6pJ8QAEsT
         h1yWycUAazfMA3XC/UqgyuEChCUXLUn401e7vIGjL0oXIImOqKyPvE7tsSvnDbaBgSKM
         m7itoAzWS8MUhEiHGDm+B2J49jde7MbAHMhu/ATlJ/9F9mT8PvEt9RHRAs9q9JS1hobV
         iO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751307712; x=1751912512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtc4GJjYIzCc3h+Hv3COhOArvofrVT3IhU2L5CEaYbA=;
        b=wnSFHHAq+cmw7sMdgmNiUDqHIcYwSIEUzBLE3/IwwNviPGq0Id0wxTdYIlYvQMpoJg
         dLW7cJXB9PZIVbBTWPGLKQ2/E+BjWSLzaztEssWoY9JuGblZ7lho66771bEmKJwdK2Un
         glwMHjBnZRSANaoqj3f0p9Hqi5Sz2CeYA1Z/3SCWIupaViJdlGgntky1PB7siWqzFIjK
         fVaEZ4jjXO8qsrw6T8q2u9LbLH265LLd9uo6gqnC7aMIGswroufDoTMLRj40pFpFjLLS
         nMi4+ecA8yleVn9Sq/7O7/z7EB61XBcIXxShxp73+sxUoUAuDDgHOvFIXOADegnGBhgS
         vRGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCahl4b+p+Vr0CgPz87EoC/kfuTdq1NFAuSLA7zIQNjHjHEWcKhBgj+XS5oYa1m0ZpQYGiyQxa5s1XbKNzVK/S@lists.infradead.org, AJvYcCXkCENLJE2RUO5HoN+OBx+KKwujgXDZcTIxFoN0cnEm6TYaOPu2oyPFDsI7XsTtPoRj/ajPM58+/O7z@lists.infradead.org
X-Gm-Message-State: AOJu0YwIUF4Rj8xdffUdjOhYcBsaT3cLmMfv2KvB/Q08HUA6Nf7+MQY4
	T+Zhs5KGurd+0XzjAL19qZ2zkqXEnH48txoIcJfSVBaQQtUOO2Kmj6Bq/AHzZN33
X-Gm-Gg: ASbGncs92zvryCCnrajxyFAKoqdIhAYJgcY2FMkx+VFUJmAOc7m5R/KCP2k+Al5JssD
	mJB7HDZxBN6acigdyHPhJCE1gyUlx45mXSdhp9J+Islz78jCUZ0ZulCXN9yjxZJT02GFhm0bo0/
	u9rHHj0kc18qzUJNfS61KSrAk+cTX9JuYMPq9SsDYi8aiKDcT/MgxrsWtPAcJZYLgC1byCX+iVx
	d6Zq4iMnB9PXm2lM4phWEcKUkrb784hgf2PUVy52IAajLYiRu1kdwpUL/bSSWCq26KoC7BMbtNW
	uNmNOmeDbCsDwMMTA54hGVXy+DgZgaOfRU3dULSjHlPug7wYBw==
X-Google-Smtp-Source: AGHT+IGFXYnf/fQlbC+mgz+nw0wr9dI6eGoPSadvUYNWqwtuJXJ0qea9pKfxGAKJwViMNZt8vtKyPQ==
X-Received: by 2002:a05:620a:2910:b0:7d3:8da2:e9e2 with SMTP id af79cd13be357-7d443990ab8mr2006431585a.27.1751307712420;
        Mon, 30 Jun 2025 11:21:52 -0700 (PDT)
Received: from geday ([2804:7f2:800b:4851::dead:c001])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443201824sm635775485a.53.2025.06.30.11.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 11:21:52 -0700 (PDT)
Date: Mon, 30 Jun 2025 15:21:45 -0300
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
Subject: [PATCH v8 2/4] PCI: rockchip: Set Target Link Speed before retraining
Message-ID: <0afa6bc47b7f50e2e81b0b47d51c66feb0fb565f.1751307390.git.geraldogabriel@gmail.com>
References: <cover.1751307390.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751307390.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_112153_584071_7C6448BB 
X-CRM114-Status: UNSURE (   9.90  )
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


