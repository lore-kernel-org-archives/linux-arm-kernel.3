Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967E21048926
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 00:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vjfco02/smFUClEsqTheeyjpW86+y48auZFweZaaMU4=; b=X3DfYYtpQXPYMZEytu297OHdUz
	80zxdIlbo3/PHP42d3CUGakLmX3MGlM0w40ZPpiD3x+ih46apLQzEGcDgg4BbDNarXvHt/4r0DQOL
	QgyuGmiBaklKXr1y2371lD89pFNAbyuv8DgK/mxt66+WiaDMg60aemuAjVkZbVhGh6pZ87Wu+COG0
	zeV8GduTqfWj2opHy0nBpkTZic6WARnju6I68IiZHnTagb5TlnWrtNBs2WYA478SPwORIjC66z8rc
	crtWIIds7HtEtM3DpZzIBnZUSuNq4UC/QOMU153+tU6bPrWijwx1aAZ1m0toI8XoxqB4B02DndYGl
	7KCk5ZDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8ck-00000009MBb-1N3r;
	Sat, 28 Feb 2026 00:56:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8ci-00000009M9K-0Fzu
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 28 Feb 2026 00:56:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Vjfco02/smFUClEsqTheeyjpW86+y48auZFweZaaMU4=; b=lncIZBRJf8PEcgP2UCbMJI9PRr
	zU7scc5G+EbvT7U9qEXSmLFp0iDMYoAz75eCSCoC9SxheA9N5qoasZ6f/NqL+aOymeleTeKgHQfWD
	nvKYPKD9qRoTAdLOvTXtNQs5rFqcDmtMMnRPgF/BP57x//shQqe7HObfj6hPXxc6V/R9JhRWe6qdd
	DCQvSqTpf/94NheCRvmLJa55ppuOcVG+wN50fDVScbzZjZiixv+oqxNhK+/J49lethH2M7X13MHYm
	ECkpr+icWlpg9ci68w1XAz99OnsOltvLnGnmrDHcyYU1jNXb4Uxs1tp0YcmddDTlynlkpAR8XM/4e
	RcqzPQnQ==;
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw8ce-0000000E8Wj-3NbY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 00:55:59 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-5688b9e4e80so2651327e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 16:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772240154; x=1772844954; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vjfco02/smFUClEsqTheeyjpW86+y48auZFweZaaMU4=;
        b=QqyO2Bsqa7vdVuyUReQZARmT/vqjiFKP5AO0APEtfzlsoBx1j8C2zvJF8vCF3nlqlI
         m/Je6I0l51SaoYIVjT/70oaCK4TS2CUHuyYRrcdvKZOy5U0U02pj7ymKhyvgB0hFM01x
         sP5jUKcjTMaedNKpR4Ip2bgDbW183X9f1l15tZdRIF5m55PeUct5ICsXwWePocLA5tGX
         FwciZB1HWQQz4AwB0vYB/HNIW2ZqzMaxT58PTZuOyYIXnfKyqIYj6Of9CvEgvGdT10h/
         Iv4QI35W3lrjzyuSTZFIkz+l9N6rku73lVKzW06CDrMQhNjCAi0gwP7DAHgw3BBY4/NE
         DC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772240154; x=1772844954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vjfco02/smFUClEsqTheeyjpW86+y48auZFweZaaMU4=;
        b=TpxcYTSQNtNnHVkZp8e2Jtx59xXl8bd75NxLBnaYsAkRbfbwxrTmaIFpSNLHWBmRtu
         maE+fE+lViVk/2CEBccM0Z3owo4aI/SojG+WSxLunvYFXUbaowmEzjtEvxf+dEeSXXYQ
         K5vEE/jOpXqkLyhdYkcgWQ3wnnZ07C65kowkSWyT6EA58x/lRh1DpAbKsgeEKDbmmN6s
         E8T0w6ZJEqr3IvG6ed2Zt/kMkgiIIIpcwaNbRKK0yjJvYO9OYU1z46CYf2UWvupE68E6
         wMQT64hXAA0velWLq2sPXjoVNTyfQ5eas/m3PN8AfjzMvwG/KPDfGrj+4e4OC1Ikf3A4
         QVEA==
X-Forwarded-Encrypted: i=1; AJvYcCUgWGfc6f6glEe3tXCzM/1s+JRpHQEXuptZSmYn8C09N0CokZCHSyCFapA/UnjeouftlYdfORj9kNcoQXdkpw6U@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr4LbJ7kwAEyh4WglwrfEb1WO5hMtoNq18xh1UVJaZMaEZOuHm
	NVLL9KwvHe1mv2H85rUQoh1nqCNi7mCPs+2wnsjgE/d+pkSYk4x5hs5F
X-Gm-Gg: ATEYQzxCsJygwPiuHhkWtBFFl43wbA0ampU+rAFD87xLSilKBrDNL1qqHOLWc44U+qc
	+OypDAFNFFMhciAal20S5noe3a2WNT2EPhMnn4JLCxpkAi91JOlSafVySB2eadXUKLjVHX0OuAa
	zaMXKEwf2xrd0G5oxOQtT0FeKFZksWJtMyd3P5pVPwHNxpKzRr0ffGcCKrCbq5xyNgrLAygbMAH
	BbXB7EJQ8L0kuSNhOm9krCPrz3Ygjll38zNJ/kda9s68Q9TnzVuQ9pKiIu4MukOBZFeQsXosV1w
	ORvMoxmyIDfi7T11ZxiFLstpRz+3qifgMduEcqqo8AkGOCtOCjUu8VrhGgzOFZW+PIyEZFtjf3h
	80VpKy3dpb3LVRvqVb5uzgsR2vADye1/PNqMiILyAxiqqUmQGdD9MwKh9uqlLjADdm7kTZwuPBc
	DCRE0jKBCVPA==
X-Received: by 2002:a05:6122:1da0:b0:567:4838:8e4c with SMTP id 71dfb90a1353d-56aa10046d4mr2709747e0c.8.1772240154391;
        Fri, 27 Feb 2026 16:55:54 -0800 (PST)
Received: from geday ([2804:7f2:800b:feb1::dead:c001])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91bb4fbesm8368019e0c.5.2026.02.27.16.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 16:55:54 -0800 (PST)
Date: Fri, 27 Feb 2026 21:55:47 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Geraldo Nascimento <geraldogabriel@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/4] PCI: rockchip: drop 5.0 GT/s defines
Message-ID: <d0ccf2b80715e956f15720ebe45880705272ba43.1772239598.git.geraldogabriel@gmail.com>
References: <cover.1772239598.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1772239598.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_005556_985395_CEDEEAE5 
X-CRM114-Status: GOOD (  11.74  )
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

Drop the 5.0 GT/s Link Speed defines from Rockchip PCIe header.
The reason is that Shawn Lin from Rockchip has reiterated that there
may be danger of "catastrophic failure" in using their PCIe with
5.0 GT/s speeds.

While Rockchip has done so informally without issuing a proper errata,
and the particulars are thus unknown, this may cause data loss or
worse.

This change is corroborated by RK3399 official datasheet [1], which
states maximum link speed for this platform is 2.5 GT/s.

[1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf

Fixes: 956cd99b35a8 ("PCI: rockchip: Separate common code from RC driver")
Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
Cc: stable@vger.kernel.org
Reported-by: Dragan Simic <dsimic@manjaro.org>
Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index 3e82a69b9c00..b5da15601b58 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -42,7 +42,6 @@
 #define   PCIE_CLIENT_MODE_RC			HWORD_SET_BIT(0x0040)
 #define   PCIE_CLIENT_MODE_EP			HWORD_CLR_BIT(0x0040)
 #define   PCIE_CLIENT_GEN_SEL_1			HWORD_CLR_BIT(0x0080)
-#define   PCIE_CLIENT_GEN_SEL_2			HWORD_SET_BIT(0x0080)
 #define PCIE_CLIENT_LEGACY_INT_CTRL	(PCIE_CLIENT_BASE + 0x0c)
 #define   PCIE_CLIENT_INT_IN_ASSERT		HWORD_SET_BIT(0x0002)
 #define   PCIE_CLIENT_INT_IN_DEASSERT		HWORD_CLR_BIT(0x0002)
@@ -197,8 +196,6 @@
 	(((x) & PCIE_CORE_PL_CONF_LS_MASK) == PCIE_CORE_PL_CONF_LS_READY)
 #define PCIE_LINK_UP(x) \
 	(((x) & PCIE_CLIENT_LINK_STATUS_MASK) == PCIE_CLIENT_LINK_STATUS_UP)
-#define PCIE_LINK_IS_GEN2(x) \
-	(((x) & PCIE_CORE_PL_CONF_SPEED_MASK) == PCIE_CORE_PL_CONF_SPEED_5G)
 
 #define RC_REGION_0_ADDR_TRANS_H		0x00000000
 #define RC_REGION_0_ADDR_TRANS_L		0x00000000
-- 
2.52.0


