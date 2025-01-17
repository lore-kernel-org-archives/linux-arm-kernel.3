Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B573CC02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 10:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOkFfGETp7aXwgGIRqEI1nE6UWx4S8l/gTkA4DYUEEE=; b=DshcYgCvhKm1sUuG+Hf+90UmBD
	S0CYMo+Tdf9E527w2qHTXKTQFGBeygb2ZF3c+2IALc5DxfSPmtBbqHl52Esuw0ZN9ncwkG7QcI4Nr
	xgkPZpSt+55Hrd6WUsOUdC9kIhafdHddkux9qYyz1mmE98W74bIpAIHX20L9nAuam4deVa3X+unM4
	UZUCcLE0ns8qemL6bn4Sku9O6Rzrg6ZI3ewmWthb1A8SEh7cUqgidqpegoqEa2FD639Mxdb/iJN/k
	h06m9KR7dPADysBlm5cLyRCvXwYP0wktPRDzfc0kUk1l4lSs/9I55MrCXpFFOuGoDpLZy+Ytxf7cd
	NfBL38jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYk1V-000000005Ew-3EzB;
	Fri, 17 Jan 2025 10:56:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYk0E-0000000054u-16Oe;
	Fri, 17 Jan 2025 10:55:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BACEBA42BD3;
	Fri, 17 Jan 2025 10:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02B4C4CEDD;
	Fri, 17 Jan 2025 10:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737111300;
	bh=mznmnvbqPaNzOEOTQeMYHdZ/QQ4aIM9FNbZ5f0Sk/jk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5fqfWtxk8NkHmnMlthkMG2gItGoTJd1zSdDoLCz6IjQlg9MWwugXDPLcBEp6TNm4
	 RoyYb8f+1q5cpUrQv2TD4NA3fSe4yd3Le3I5l6DxcNNUcQcTNcAo4QRiosznafyMoL
	 kqsOZjfigRXJZOuuDAmh9m0FirH6Ip7s7GIOhQKDNFLeY9vCmqDsZgvMKzNNARsn9v
	 RW1W5+mweyjo9dCgIeM16TlByze+uh6PjkR4B9Sj7XTlWEeeZi2EGMGQBNEmMsR/HN
	 GixNdIA+yH0BxwdVmB8I6bTEPIhaCCQST8TXMFptU6x1gszoiGpknoovd568WFUpoX
	 kgWYQKiSkoDpw==
Date: Fri, 17 Jan 2025 11:54:55 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Jagan Teki <jagan@edgeble.ai>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: add overlay tests for Rock
 5B PCIe overlays
Message-ID: <Z4o2_0yX-hq-DfCs@ryzen>
References: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
 <20250116-pre-ict-jaguar-v2-2-157d319004fc@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-pre-ict-jaguar-v2-2-157d319004fc@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_025502_442356_1C034AA8 
X-CRM114-Status: GOOD (  17.85  )
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

On Thu, Jan 16, 2025 at 03:47:11PM +0100, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> According to commit 40658534756f ("arm64: dts: rockchip: Add rock5b
> overlays for PCIe endpoint mode"), Rock 5B can operate in PCIe endpoint
> mode. For that to work, the rk3588-rock-5b-pcie-ep.dtbo overlay needs to
> be applied on Rock 5B base Device Tree. If that Rock 5B is connected to
> another Rock 5B, the latter needs to apply the
> rk3588-rock-5b-pcie-srns.dtbo overlay.
> 
> In order to make sure the overlays are still valid in the future, let's
> add a validation test by applying the overlays on top of the main base
> at build time.
> 
> Fixes: 40658534756f ("arm64: dts: rockchip: Add rock5b overlays for PCIe endpoint mode")

Not sure if I agree with the Fixes-tag.
I don't think there is anything broken with that commit, but I definitely
think that it is a good idea make sure that they don't break in the future.


> @@ -145,8 +145,6 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-orangepi-5-plus.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-quartzpro64.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5-itx.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
> -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtbo
> -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-toybrick-x0.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-turing-rk1.dtb
> @@ -165,5 +163,9 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-rock-5c.dtb
>  
>  # Overlays
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtb

You moved these lines further down, but you changed the suffix from
.dtbo to .dtb, why? It seems a little confusing, is that really needed?


Kind regards,
Niklas

>  
>  rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb rk3588-edgeble-neu6a-wifi.dtbo
> +rk3588-rock-5b-pcie-ep-dtbs := rk3588-rock-5b.dtb rk3588-rock-5b-pcie-ep.dtbo
> +rk3588-rock-5b-pcie-srns-dtbs := rk3588-rock-5b.dtb rk3588-rock-5b-pcie-srns.dtbo
> 
> -- 
> 2.48.0
> 

