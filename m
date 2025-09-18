Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EDCCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 16:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+F4TaAJ1+I3lApf7Zbx5vaj8m+LuxzrlFuwgun2z2qg=; b=RLXR+/I4jXuoFmBv71izEF7Ag7
	fMz2FCXnSy336FYn+TP231kGUDUKCbpBZpOSaZu6FwksITok/Zp6hmJcDIWXtWIQU0JY9+qij+AC7
	Ow0Ab3v9ho92iOk7nphxf1E457T8yEm/pgfwPJeMmmqnM7F2qpa0lAuySezQ/jW5mP1bDdNXcv/Fd
	D4cKK9y54Bc1y+8UwnWHglIfudXilN8RD5pF7hd8iX3kCSwK1om1s754E8hZuVdCzgE3ptT49hqoI
	ceFW95nuuxsSPnTuhEYzWkQf87lH73QIB4X8GlXCUzyve/Fa2WZhxBjU5r4uiBjnk1AJ9JOCXeFkP
	ksrZkWHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzH9o-00000000Yfd-0qwL;
	Thu, 18 Sep 2025 16:06:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzH9l-00000000YeA-1J3Y;
	Thu, 18 Sep 2025 16:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=+F4TaAJ1+I3lApf7Zbx5vaj8m+LuxzrlFuwgun2z2qg=; b=VoslzeLwepJmNzjMIsPuSVmsXt
	V++kPbTcSCQW75otpc1HAvdiq4J1Rniab/l5JMYEG72uAk147fN/5Fs7Rb5PX1v6jASWgOMrVNXCu
	tWl2TLPi4OuJlXdtmN95amPcIDonK64CvmXTX3KKasnbO2Ttt7WYAneSc9pTTaI1PvAUUzJfTvx0V
	wyVrrQfpv4T25Mq/TTedTcN34tBQsXndl0u81m/lrpE6Z6PbTJsk1ZcIH9Hs1XzeHRO8PPgA3pp22
	PyAjQZF8g1LIWPt6zhfgpWY4FWVovVItYSU4uB3vF7rxy+xT/mYuDv9LEdsvvDXkVNh6NvanSL72i
	52jE1RoQ==;
Received: from i53875b0a.versanet.de ([83.135.91.10] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uzH9T-0001tG-MC; Thu, 18 Sep 2025 18:06:31 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Lin <shawn.lin@rock-chips.com>, Simon Xue <xxm@rock-chips.com>,
 Yao Zi <ziyao@disroot.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Chukun Pan <amadeus@jmu.edu.cn>, Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: PCI: dwc: rockchip: Add RK3528 variant
Date: Thu, 18 Sep 2025 18:06:30 +0200
Message-ID: <2042643.CrzyxZ31qj@diego>
In-Reply-To: <20250918153057.56023-2-ziyao@disroot.org>
References: <20250918153057.56023-1-ziyao@disroot.org>
 <20250918153057.56023-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_090649_371281_5CD0876A 
X-CRM114-Status: GOOD (  11.97  )
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

Am Donnerstag, 18. September 2025, 17:30:55 Mitteleurop=C3=A4ische Sommerze=
it schrieb Yao Zi:
> RK3528 ships a PCIe Gen2x1 controller that operates in RC mode only.
> Since the SoC has no separate MSI controller, the one integrated in the
> DWC PCIe IP must be used, and thus its interrupt scheme is similar to
> variants found in RK3562 and RK3576.
>=20
> Older BSP code claimed its integrated MSI controller supports only 8
> MSIs[1], but this has been changed in newer BSP[2] and testing proves
> the controller works correctly with more than 8 MSIs allocated,
> suggesting the controller should be compatible with the RK3568 variant.
> Let's document its compatible string.
>=20
> Link: https://github.com/rockchip-linux/kernel/blob/792a7d4273a5/drivers/=
pci/controller/dwc/pcie-dw-rockchip.c#L1610-L1613 # [1]
> Link: https://github.com/rockchip-linux/kernel/blob/1ba51b059f25/drivers/=
pci/controller/dwc/pcie-dw-rockchip.c#L904-L906 # [2]
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Heiko Stuebner <heiko@sntech.de>

This likely should to go through the PCI tree.
(or needs an Ack from PCI maintainers, for me to pick it up)

Heiko




