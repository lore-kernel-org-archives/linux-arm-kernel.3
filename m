Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18316CF887F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 22:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYW7+E3+ZRYpb0k1MxjDaTsNzXpLgps73MqJR9tSzS8=; b=GbNiaj39i+XZ+MfEzCwQRgvkLZ
	Bf8ddieRj4IoPnkBT4402VB30eBLhUGB681iq56fey+/OIU1473EnX/1UJ2gIKP3E5iVDKijYJQlW
	JKUeoOt/2JwxrrL2X5zuuJxza1oNZv49SZxAKHgwRtMnb+7SYMwAB+PlJ7Ghnj8R1EgotjBTuAYdJ
	5v/9KI+QEbx6alIqxezg5pBUrljY0QAnazj5aUCPSpulofH8BARaOWyF0XGL1sIG2kWsqwQoIFxRS
	9zuggSooPol889O0t+Oxr2VMJBzzVHLuCFAqLdBw8gkQdHdyUjCrjQlAnv2WvYVnwJhEMXVbZQu27
	IKJqz8sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMD3j-00000007WAd-1jw8;
	Thu, 20 Nov 2025 22:23:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMD3e-00000007W8e-0Yx6;
	Thu, 20 Nov 2025 22:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=DYW7+E3+ZRYpb0k1MxjDaTsNzXpLgps73MqJR9tSzS8=; b=czdiC1AKwdqmGufkwNpW4A0Sfu
	BNNNTAeV9zqozraTg/kbe/5RfJaR13BJVm+mB8qU0Au9LnDbHIkrVrk0geh2mFdP8Kry1+MgcSZvl
	dgjT/B/d+zwKTCwjGBV2WjiVaoFZ5ZWcIkHT5LJYUVMUgC2g1Oi5t4G1AkmIDlpH9m4toT+Z26cXi
	OQnklGIBVzIaRudPTYTXHxJMcJ/0e16Axs5YktuBT/eXRl2PXlOGrr0PNR4x98NTl9/SKMLfXrg0j
	e+dJwDXc1/U4qtCw9mu/E+t99Ii6IiiFlHlF7MPwA0aVcuyp9E9CUveruex2LyqXNwgQY10w1mRe+
	Z2SFLWIA==;
Received: from [213.192.12.196] (helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vMD3Z-0007Je-5r; Thu, 20 Nov 2025 23:23:13 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 0/2] arm64: dts: rockchip: add Tinker Board 3 and 3S device tree
Date: Thu, 20 Nov 2025 23:23:03 +0100
Message-ID: <176367711163.9778.16671960189532919719.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251118-tinker3-v3-0-2903693f2ebb@rootcommit.com>
References: <20251118-tinker3-v3-0-2903693f2ebb@rootcommit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_142320_053010_ED3EE70B 
X-CRM114-Status: GOOD (  12.28  )
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


On Tue, 18 Nov 2025 15:56:41 +0000, Michael Opdenacker wrote:
> Add initial device tree support for Asus Tinker Board 3 [1] and 3S [2],
> which are SBCs based on the Rockchip 3566 SoC.
> 
> The "3S" version ("S" for "storage") is just a regular Tinker Board 3
> fitted with a 16 GB eMMC and a "mask ROM" DIP switch
> (to mask the eMMC and enter "Mask ROM" mode for recovery).
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add Asus Tinker Board 3/3S
      commit: f4e81d0b95f3257a2fcfdbfaa2d8ed41015c621b
[2/2] arm64: dts: rockchip: Add Asus Tinker Board 3 and 3S device tree
      commit: 9f80b3952318d7ef18573a5010f06118602f992e

Changed the property sorting of the RTC and also migrated all the
pinctrl names to match the schematics.

When creating pinctrl entries, please always _try_ to use the names
found in the device schematics. This makes it way easier in the future
to find one from the other :-)


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

