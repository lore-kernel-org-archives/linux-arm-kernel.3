Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81F7D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7mY8kvQBts8cZp9oMch/Hcr5aBxWDa4YBxvb07byJs=; b=ZWNC9qlRK/N7te0eEpMo0NkUUz
	g2x7ndlB8vbbioOg59h7C3b+pCih7/+6fvo8iHivevMcTLeazb5YZOVfzw559fcIIisTPqFDBxaQ7
	736i/Z2BhiqeUzJ2ifJOMn96m5ODq+thzLppmv2Ody/DD+lMGMFUDW+m0x1y+5yInr1H+QoUZdDy5
	JFN+sCfQ2q6J6xCKtLNzlLA5T/ojdhz5lYzXevPWoouSnC1ZmIydjgdiD12WKJNNKbqIeCl27U7nV
	0+ocx2cz6orhaSGDOJvemClOPpUba2vFBX8wxDNON7SVnOAk2liSvviOM8ZdHeUA5VrBvIR6CWz7j
	Dx6lgRWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdse7-00000000503-36Py;
	Thu, 08 Jan 2026 16:13:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdse4-000000004yS-1nf0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:13:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C971C44365;
	Thu,  8 Jan 2026 16:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82124C116C6;
	Thu,  8 Jan 2026 16:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767888835;
	bh=UmQqqGxCtoML0TFTnsyx6uOawh78jvPvwr1IW3fraBg=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=egbNkSitGtEcHBSEwQqD07FdV8haTfnFGpB1/o+ku9arLELZZZw/Jjc4ml1Tib0VI
	 VWq56zmjZQHgLCp+h9vKEtVPpy3sReRUAFlOSMte+eOzN3bfWmQdowrzrPeYTBMGKv
	 LX2kEC65RaiNN21cC8tQahEilgirOs186J0zsLCBLNNP7kEe4jw/n4z67rZegWN9GN
	 9PjB2spPtoWQ1otRtp+PKrvIXSAWaKa2EyKbAmru/1TyMnCO32/GHUl3X2XMgW2nPA
	 wQsRCpcG/3Q/vQR+GrHy97/Rt+CTrwbdyqK19LSn5T+6WntELTePyvQKhAZ+LTHq5P
	 qfI+21uComC2g==
From: Rob Herring <robh@kernel.org>
Date: Thu, 08 Jan 2026 10:13:54 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Cc: linux-amarula@amarulasolutions.com, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Srinivas Kandagatla <srini@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20260107194541.1843999-1-dario.binacchi@amarulasolutions.com>
References: <20260107194541.1843999-1-dario.binacchi@amarulasolutions.com>
Message-Id: <176788870833.376387.4028010130652032446.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: add STM32 TAMP NVRAM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_081357_029486_978FCBF3 
X-CRM114-Status: GOOD (  12.98  )
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


On Wed, 07 Jan 2026 20:45:32 +0100, Dario Binacchi wrote:
> Add devicetree bindings for TAMP backup registers. These 32-bit
> registers are retained in all low-power modes and in VBAT mode. As a
> result, they can also be used to store sensitive data because their
> content is protected by a tamper detection circuit.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  .../bindings/nvmem/st,stm32-tamp-nvram.yaml   | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/st/' for 20260107194541.1843999-1-dario.binacchi@amarulasolutions.com:

arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: tamp@46010000 (st,stm32-tamp): '#address-cells', '#size-cells', 'nvram@46010100', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/stm32/st,stm32-syscon.yaml
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: tamp@46010000 (st,stm32-tamp): '#address-cells', '#size-cells', 'nvram@46010100', 'ranges' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/stm32/st,stm32-syscon.yaml






