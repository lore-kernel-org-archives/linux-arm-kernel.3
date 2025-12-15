Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85352D5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 13:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7XorD3nH/q0HpxkWe78PdYMmjm7wEoACkmCPuGt4gac=; b=Thq/ZQT2/NGdex0xty2E/FkM+u
	YAACH2Slk+eaNMSzU8ViO8Z33hZ2XS69qG/8PoqRNrEVIA72uCZDu7etLT/+cCEMDIsB1wsltlsJF
	eHe9TCMNdOHN6vPrQuXZxYOdqqezyHz0/fpVu+x+a9Sy1LVzm9ZMSNR4Y8GKsfOLUDtVv0rADb5Jm
	NBfHTLg3URB/j9QopPEgubCb41NEsO3HbzDaQsH6msREpncq1fxTQEcvvekPaEwD1y3F6vtYBBz8b
	GP6UBU2P4FhYUpzvDFzozGk5WLWuzzxDHEAfzCoh0/siYkA4YCuN5V2e0t6oZ66VEO3YBS9ntrFfC
	vuXJfZ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8yn-00000003i9U-22ft;
	Mon, 15 Dec 2025 13:51:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8yl-00000003i90-0VHH;
	Mon, 15 Dec 2025 13:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=7XorD3nH/q0HpxkWe78PdYMmjm7wEoACkmCPuGt4gac=; b=QME2266OSmEsEGF//oyeFLpVIf
	fO2WXs1H2GaSFIyygPuXbzwleO8Z+VthmWfmeqTd7hqZFz2l2mlQU/s7qbPSMCTGYSer7YsLtgKXS
	923jMrmEg4P8WGjyt2e0V6X9xh4u+FN9cngL4kSul96Il97tg9adG1CuPGrguLW/KwFxcmf6Wi4e+
	l1IhdvdLKzPNl46nB6rOPE+X16XI1S37cDC8tMkg6iQlEqyibmaLLDtH42mapyQiR5sRqqP8uDoZk
	trbOiQbdugbdFt3XsT1DrezFtKhDKUHYwUmNqM9NlM96AKAbqfisEoRZzB3GXniJcPXDEmbiGdkDr
	vUnMnLLg==;
Received: from [192.76.154.229] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vV8yf-0001VT-3m; Mon, 15 Dec 2025 14:51:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: =?UTF-8?q?Martin=20Holovsk=C3=BD=20=28Probably=20Nothing=20s=2Er=2Eo=2E=20=29?= <mh@probably.group>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: enable dual 2.5GbE on Rock 5T
Date: Mon, 15 Dec 2025 14:51:03 +0100
Message-ID: <176580661874.1441131.12947657582985645446.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <96516D1F-9787-47FE-A67E-4745D11D9207@probably.group>
References: <96516D1F-9787-47FE-A67E-4745D11D9207@probably.group>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_055111_311228_C8E3FCA8 
X-CRM114-Status: GOOD (  12.02  )
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


On Fri, 12 Dec 2025 17:23:35 +0100, "Martin Holovský (Probably Nothing s.r.o. )" wrote:
> The Radxa Rock 5T board features two RTL8125B 2.5GbE Ethernet controllers
> connected via PCIe lanes pcie2x1l0 (fe170000) and pcie2x1l2 (fe190000).
> Currently only one interface is functional because the PCIe controller
> nodes lack the necessary reset GPIO configuration.
> 
> Without the reset-gpios property, the RTL8125B PHYs remain in reset state
> and are not enumerated by the PCIe bus. This results in only one Ethernet
> interface being detected, or none at all depending on U-Boot initialization.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: enable dual 2.5GbE on Rock 5T
      commit: 96029ffeccf677b1e4baa98f30909a83a485b6d7

I've resorted both the pcie phandles as well as the pinctrl entries
pcie2-0 comes before pcie2-1 etc :-) .

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

