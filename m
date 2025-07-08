Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670A6C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 21:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpFx4EDwa3phzXuh74HAhkNvfcJPoIkI8DFY5/D8SBo=; b=S6aOuQLdcQD487sgKSZntQFPbw
	T9c6iRGuR5bi4oWh++pLwbHTZBFaOww9a/8GQ72R8L8eOwBMXjwEPa+GhANpBU1rjLbE+8XGW3RFe
	HXBtJtVTTitYNe4kT+2F+HDaQYmpB7NTcp1WWOHbVQifhSFFQ9BamIkC6SUFDqV9CukEnuwRja6EQ
	FNtQV8HrZ4U7E2FqucB7kL2wAqXRnBI8dtU9XZj1TOD0crbTDc6B01jvynpENwtAyyW06aD0o7hwL
	nGtp8zQGY/vVVQIacl9DwWf93FHguMgwFtzh86ew4dIz+/bnMDwfmrtrHGaU+id0puIm0BHUyfmHX
	clax26Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFRE-00000006acF-2tG2;
	Tue, 08 Jul 2025 21:01:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEqF-00000006V7i-1FjL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 20:23:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 74D5BA53508;
	Tue,  8 Jul 2025 20:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A828CC4CEED;
	Tue,  8 Jul 2025 20:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752006182;
	bh=I2VRzsXmZPYGTLrr+78RCRNRi3ChbnEGC8YNwbiCV1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=phQhR2+rN3jJSw6/t3qvVnB+m8wEVCacr/x7z9MWz0eialAWhnwTTJRifg3FZTmg4
	 s1EtyUdNX+IpxNr5AURU50vYdLsd3LOQDU8J0+FV1F+YHzsRFG2wP1mjvtP2p8IFYy
	 JzusohcspLPahKDUSDkl8Y4vm/dpIjcvbPkpyaijgculqpKppRdcs8LJxRG9qNIj4z
	 Kzgy8i5icVz3Wu7YhGmzZARtj002HNqiJ7A9qv/RsonbCjOzHnY4q5WpslnsHfQbSE
	 FJCjklhwuqxOBO/KyhfsyAjuelxSUO5oZ4b3EgmiY3dQIPftyEPlP1d8Ss+TB9o6Wt
	 rvJSl9qx/uYTA==
Date: Tue, 8 Jul 2025 15:22:59 -0500
From: Rob Herring <robh@kernel.org>
To: Paresh Bhagat <p-bhagat@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, praneeth@ti.com, kristo@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, khasim@ti.com, v-singh1@ti.com,
	afd@ti.com, bb@ti.com, devarsht@ti.com, s-vadapalli@ti.com,
	andrew@lunn.ch
Subject: Re: [PATCH v7 3/4] arm64: dts: ti: Add pinctrl entries for AM62D2
 family of SoCs
Message-ID: <20250708202259.GA904737-robh@kernel.org>
References: <20250708085839.1498505-1-p-bhagat@ti.com>
 <20250708085839.1498505-4-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708085839.1498505-4-p-bhagat@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_132303_406747_12FF974F 
X-CRM114-Status: GOOD (  13.55  )
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

On Tue, Jul 08, 2025 at 02:28:38PM +0530, Paresh Bhagat wrote:
> Update k3-pinctrl file to include pin definitions for AM62D2 family of
> SoCs.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-pinctrl.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> index cac7cccc1112..0cf57179c974 100644
> --- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
> +++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
> @@ -63,6 +63,9 @@
>  #define AM62AX_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
>  #define AM62AX_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
>  
> +#define AM62DX_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
> +#define AM62DX_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
> +
>  #define AM62PX_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
>  #define AM62PX_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))

Why is the same expression just repeated over and over? Looks like this 
needs some refactoring.


