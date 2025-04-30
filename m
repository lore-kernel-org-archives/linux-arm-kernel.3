Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70819C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 14:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpqoweO0Dm3xCP+4rCT6qXsUoxJMijFpRFp9AyRx7+A=; b=Frt4DXd8KeScYv1yXxvGSBzHwW
	ihd5u4SZorWtEvKG28gxEQlt0BuXqq9x+dQO5fe/8iCsDcjf2v4cX6H+6gEuT1VY9civg1Js6oHff
	WknY1LqiJFl8oZgSVkbYxT5MZxFb23VHjB+bNk0beg/L26iVEyg7sCPD4DzjrnYl7xXRtz3FImHDs
	ulG/RYvESREepwmNQavJL0/D0fWuTLRU97hDJBTZPy/guq7JC6HAUS3iVW6ozwoq47mORccD+voJD
	denBvEFlGTxOk6Ft2OfHtA64ZlYCjnROQZlObZAOcWKDtFAMlW6HFl4aUVxUUEodgTca3h5FUI0sN
	xZbHreyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA8N0-0000000D6kr-2ufh;
	Wed, 30 Apr 2025 14:25:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA8L4-0000000D6VV-2CdA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 14:23:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1A2D0A4ACD5;
	Wed, 30 Apr 2025 14:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBEAC4CEE7;
	Wed, 30 Apr 2025 14:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746022983;
	bh=EHmJoyT1t1HTWr93T5cTrjOvhbK6j7Z+nBdrivtN+KM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i1Q7eU9v9c9LhftrfG98JhwjvdtIX79CBeve9Lm9W0p/zaxBB/CR370V7cwfPUGci
	 25KfK/1vS7TQX5ECZxwu+KE077rM4bgeBY+Q/Vtv8oUdIKqvqUPWg+zIQoDpln+Tlb
	 /TmX2lawn/mb7tU5xdarnbQtwswtW2SXMG7yWVd7b11VeE5I/sEmxz3OBrWqOvf1hF
	 pPAbH8QqUv3ecrfsUEyv/l2zqHdiapP/8qWa2Scgq1L/bPXKK460WXhOCZTtnrkGG9
	 K0OYKkZNdYznUBJ/H2RS9SuWz723aSULxpMKAJ2v7Tqkm9OG9KQUJiCsJwpLHNFFI/
	 dK5uXZw+L4CHQ==
Message-ID: <06268dcb-4a49-468e-8ebd-d9366a2cf0c2@kernel.org>
Date: Wed, 30 Apr 2025 17:22:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/4] dt-bindings: net: ti: k3-am654-cpsw-nuss:
 update phy-mode in example
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Whitcroft <apw@canonical.com>,
 "mike .." <wingman205@gmx.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>,
 Jonathan Corbet <corbet@lwn.net>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Tero Kristo <kristo@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <4216050f7b33ce4e5ce54f32023ec6ce093bd83c.1744710099.git.matthias.schiffer@ew.tq-group.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <4216050f7b33ce4e5ce54f32023ec6ce093bd83c.1744710099.git.matthias.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_072306_698391_EC496829 
X-CRM114-Status: GOOD (  16.16  )
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

Hi Matthias,

On 15/04/2025 13:18, Matthias Schiffer wrote:
> k3-am65-cpsw-nuss controllers have a fixed internal TX delay, so RXID
> mode is not actually possible and will result in a warning from the
> driver going forward.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  .../devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
> index b11894fbaec47..c8128b8ca74fb 100644
> --- a/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
> +++ b/Documentation/devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml
> @@ -282,7 +282,7 @@ examples:
>                      ti,syscon-efuse = <&mcu_conf 0x200>;
>                      phys = <&phy_gmii_sel 1>;
>  
> -                    phy-mode = "rgmii-rxid";
> +                    phy-mode = "rgmii-id";
>                      phy-handle = <&phy0>;
>                  };
>              };

FYI the following TI boards using this driver are using "rgmii-rxid".
Will you be sending fixes to the device trees files?

arch/arm64/boot/dts/ti
k3-am625-beagleplay.dts:	phy-mode = "rgmii-rxid";
k3-am625-sk.dts:	phy-mode = "rgmii-rxid";
k3-am625-sk.dts.orig:	phy-mode = "rgmii-rxid";
k3-am62a7-sk.dts:	phy-mode = "rgmii-rxid";
k3-am62a-phycore-som.dtsi:	phy-mode = "rgmii-rxid";
k3-am62p5-sk.dts:	phy-mode = "rgmii-rxid";
k3-am62p5-sk.dts:	phy-mode = "rgmii-rxid";
k3-am62-phycore-som.dtsi:	phy-mode = "rgmii-rxid";
k3-am62-verdin-dev.dtsi:	phy-mode = "rgmii-rxid";
k3-am62-verdin.dtsi:	phy-mode = "rgmii-rxid";
k3-am62-verdin-ivy.dtsi:	phy-mode = "rgmii-rxid";
k3-am62x-phyboard-lyra.dtsi:	phy-mode = "rgmii-rxid";
k3-am62x-sk-common.dtsi:	phy-mode = "rgmii-rxid";
k3-am642-evm.dts:	phy-mode = "rgmii-rxid";
k3-am642-evm.dts:	phy-mode = "rgmii-rxid";
k3-am642-sk.dts:	phy-mode = "rgmii-rxid";
k3-am642-sk.dts:	phy-mode = "rgmii-rxid";
k3-am642-tqma64xxl-mbax4xxl.dts:	phy-mode = "rgmii-rxid";
k3-am642-tqma64xxl-mbax4xxl.dts:	/* phy-mode is fixed up to rgmii-rxid by prueth driver to account for
k3-am64-phycore-som.dtsi:	phy-mode = "rgmii-rxid";
k3-am654-base-board.dts:	phy-mode = "rgmii-rxid";
k3-am67a-beagley-ai.dts:	phy-mode = "rgmii-rxid";
k3-am68-sk-base-board.dts:	phy-mode = "rgmii-rxid";
k3-am69-sk.dts:	phy-mode = "rgmii-rxid";
k3-j7200-common-proc-board.dts:	phy-mode = "rgmii-rxid";
k3-j721e-beagleboneai64.dts:	phy-mode = "rgmii-rxid";
k3-j721e-common-proc-board.dts:	phy-mode = "rgmii-rxid";
k3-j721e-evm-gesi-exp-board.dtso:	phy-mode = "rgmii-rxid";
k3-j721e-evm-gesi-exp-board.dtso:	phy-mode = "rgmii-rxid";
k3-j721e-evm-gesi-exp-board.dtso:	phy-mode = "rgmii-rxid";
k3-j721e-evm-gesi-exp-board.dtso:	phy-mode = "rgmii-rxid";
k3-j721e-sk.dts:	phy-mode = "rgmii-rxid";
k3-j721s2-common-proc-board.dts:	phy-mode = "rgmii-rxid";
k3-j721s2-evm-gesi-exp-board.dtso:	phy-mode = "rgmii-rxid";
k3-j722s-evm.dts:	phy-mode = "rgmii-rxid";
k3-j784s4-j742s2-evm-common.dtsi:	phy-mode = "rgmii-rxid";
k3-j784s4-j742s2-evm-common.dtsi:	phy-mode = "rgmii-rxid";

-- 
cheers,
-roger


