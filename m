Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197E1CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 18:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEXyXBBaXpCS7J1Z4/qWotkSCrY52rSuaqy/4kQ0zPU=; b=huJsq3wEsMVtL5J8MCjVESwd/V
	Q3xaS5FcZ24SxXOWFQ6dwcx/OlpNsLXPFtpKJSKd1WwuLdHwLrieRKSZczXdGJUfPfrqExzRvQReC
	H/t99ORkUvXU1eTVEbsddUrQQtBRq4OiKBAB/aV3Osb8pCUUew3hppINw5slLbNLjG8mRjlUY97mn
	86OY8MTZqPyhmg+VtYO8j7/+Iazmz+JCw86mEEN1sQJmFy4WIv8vgSB21AXoE9sViUp7v39nIlOMF
	m2Pm8Dcvf0BOQ5neEaZdDr7RfEd0iwm3gSUZqoClM85RYF4pmKs+Io+Ll60NkGnOm5wrFdMdc9lAx
	fYOKWOqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jQV-0000000H97j-0fLM;
	Tue, 14 Oct 2025 18:07:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jQN-0000000H8y4-0r5d;
	Tue, 14 Oct 2025 18:07:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CEXyXBBaXpCS7J1Z4/qWotkSCrY52rSuaqy/4kQ0zPU=; b=eNcuQ3dVnxDdMObV2J40Meg4ab
	mGbHUApTr1jA8BqJ+l8IjAO38gVMNivRQIk+2C6VEngc2ARy1TQqt0EPkooPdlW0m8OvO1+DXok4J
	15LUBGpr0e2f8QxgnOZHnGDGDh3VEC+WT49mAV9xYTfvL2Koo4WwWaPoP2y1FrsgjMFK4BJ5FJNFB
	Xalc3BHSeN579v4lpDADus2RJXMo8YMgQEGnNeg2ouN5YQlg35PGrLNrPX8I0o7AGo9bjQ0Ejmksb
	5eZd8e10jaar3zYoyuoczDX975n4XOwor//rNKzCGrb7Y371ZWXE3tmuSboNrx3Fae7Ew6NWF1bT2
	C3rFjz2Q==;
Received: from i53875b75.versanet.de ([83.135.91.117] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v8jQA-0001Gj-E2; Tue, 14 Oct 2025 20:06:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>,
	Tianling Shen <cnsztl@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R76S
Date: Tue, 14 Oct 2025 20:06:34 +0200
Message-ID: <176046473176.1662867.13956713040601600613.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250927092311.789946-1-cnsztl@gmail.com>
References: <20250927092311.789946-1-cnsztl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_110703_274961_6CF31032 
X-CRM114-Status: GOOD (  10.31  )
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


On Sat, 27 Sep 2025 17:23:09 +0800, Tianling Shen wrote:
> The NanoPi R76S (as "R76S") is an open-sourced mini IoT gateway
> device with two 2.5G, designed and developed by FriendlyElec.
> 
> Add devicetree binding documentation for the FriendlyElec NanoPi R76S
> board.
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R76S
      commit: 75e700fa357876bc4f501f585c2cc335acc8c237
[2/2] arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R76S
      commit: 7fee88882704a5ed7657f467ecb44e39b20f42aa

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

