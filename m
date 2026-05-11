Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFECCD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 19:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40FcUeclOziHitS8Rrs46kzSacjGC1Q1LFgJkjIfljU=; b=0uezGqAz9k4DUPiGAz+LHbuMjP
	EX1hc+VH1lnN0+oLt9eJMIChmpLwW3f1XoZDYrddsmK3FG/o3YdbluwrayMmTVoXfqunofC0tC2je
	jmR/LEPHWUNCt+6Kl8OuBvxl0vKuJpTyGYA0MUvuU0Y0E1TmOeyViKzAKfOemh1f6YKEJvPC+GL7W
	vN7sWEUjulfaHPGX2J5UPBy4xIzttDKGfBvjTWJVvDMXDquJ0Hv3H+htrYuA/ovSRgAOyBm4X4ONe
	W2NjFG+69JYPJfHswxeCGD3a9mt3l4KbymHHsNTFt5Hslh4zFf9aJ2nG+5WBE9QpJZivt1H/bE2s1
	aUAsLMCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVrv-0000000EYiZ-44V9;
	Mon, 11 May 2026 19:00:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVrs-0000000EYgy-0QQC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 19:00:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E2A3443B2;
	Mon, 11 May 2026 19:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E278C2BCB0;
	Mon, 11 May 2026 19:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778526039;
	bh=axJJaOXDyfhWhcz3462ZN7vmIIKn0/jAYo7vvDBHFNE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W5GH1ahlB0Txx8EAJdui3DTUxbkjRBgm+7FdXguMamCfXin36Bv9UTyFjHdJRmloz
	 Tn5B0NftCv/CutmnCIBgWrsPO9rEK4YbfLG8xIaQeG83+JchMot5ppHo3xgYowAwGP
	 5s97tm4vzvChqPgp5YP+e/j86lyViXQN9ERzmiosxhIkW9EA5F6I3DkaDdXhVAQywt
	 RlQpFEC1/hls5aqOvyEIRllOBUTlLwo3uepmWnlwGLcfQb+pPAHAvSU+hfIOIt2VAZ
	 5qrNALkAeZHc0G8fSSNVfi71WipR4DM4HeSXeodI/xmI+LUlOESacvbMH8Epcvu/lz
	 o0B/rO1Sm+b7w==
Message-ID: <7ca609dd-8983-48a8-b485-5eb80e340cf6@kernel.org>
Date: Mon, 11 May 2026 14:00:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/16] arm64: dts: intel: Add EL2 virtual timer interrupt
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ge Gordon <gordon.ge@bst.ai>,
 BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, Heiko Stuebner <heiko@sntech.de>,
 Shawn Lin <shawn.lin@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Michal Simek <michal.simek@amd.com>
References: <20260507125544.2903406-1-maz@kernel.org>
 <20260507125544.2903406-10-maz@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260507125544.2903406-10-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_120040_183086_D1F29878 
X-CRM114-Status: GOOD (  13.54  )
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



On 5/7/26 07:55, Marc Zyngier wrote:
> The ARMv8.2 based CPUs used in the agilex5 SoC are missing the EL2 virtual
> timer interrupt. Add it.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>   arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> index 02e62d954e949..6db2d48b9bad3 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
> @@ -155,7 +155,8 @@ timer {
>   		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
>   			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
>   			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> -			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   
>   	usbphy0: usbphy {

Acked-by: Dinh Nguyen <dinguyen@kernel.org>



