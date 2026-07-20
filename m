Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67696C44529
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 20:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VbpAem1WedJc3O7Kq+6yk924WUUTh67h1vQt+9QesvA=; b=AW/Gq7/LLRKErcBOlOpXpyHzSE
	byAN8fv15f1mjscSSzoSPavFSJ60SOXAK+pnSzgGxZf+beosboaadHDR5ynYpTHyxTFbLwzcXGvKY
	/DEQIQQ3+xqcFNjYFn7P6pYKUxUwYl6OH+TdCCAqgicIeSfQ1bNf33JUvR24eIjyqgeNAl4wKNmpl
	dxfpMB87B2E8m+jKo61Yesc8UiSy59Ly3IhwHwgM0DPzjk1bqUh/yQ9Ihb5jttgYZeue8PaaWYyLe
	4pg2WuWw9XMvkgcPgZlfyLCmOH7oQzenL2cG03ncyQBtl8osrq3b0T1rB7o6IYNCCViqo/FUPrzQH
	zDzRe3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluaz-00000007s5E-2PQf;
	Mon, 20 Jul 2026 20:28:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wluaw-00000007s4k-06Nj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 20:28:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 506A1143D;
	Mon, 20 Jul 2026 13:28:04 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 573FB3F86F;
	Mon, 20 Jul 2026 13:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784579288; bh=nQJLmuZAjlXCvBDXMohcZ1j/B2+X5Z8O3RPYfkvXlB8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FaCaGQddWXnChyga+RlhKYyLo8XEy4ewC/EDTFcDq5vXLzxixfQMBSTMF8zwQnRqL
	 +1NBWJuZasrxbqVyEL3NC+PBLd2yrjmYBZBFYAhwijAtPkMtZWv9c1/fKrvX043IFr
	 L+nKIgPQSzVdpSSODZxxWWXKRhcbX97KiFMtz4XM=
Date: Mon, 20 Jul 2026 22:24:20 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Per Larsson <per@palvencia.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS), linux-arm-kernel@lists.infradead.org (moderated
 list:ARM/Allwinner sunXi SoC support), linux-sunxi@lists.linux.dev (open
 list:ARM/Allwinner sunXi SoC support), linux-kernel@vger.kernel.org (open
 list)
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: a523: Add missing SPDIF pin
Message-ID: <20260720222420.0c063b18@ryzen.lan>
In-Reply-To: <20260720174253.7686-1-per@palvencia.se>
References: <20260720174253.7686-1-per@palvencia.se>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_132810_195213_41E34E50 
X-CRM114-Status: GOOD (  18.32  )
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

On Mon, 20 Jul 2026 19:42:42 +0200
Per Larsson <per@palvencia.se> wrote:

Hi,

thanks for takign the time to send a patch!

> When spdif support was added for the Allwinner A523 family of SoCs, only
> two of the three possible pins were added to the dtsi, since the third
> would clash with the first ethernet port (emac0)
> However, some devices don't use emac0 and instead use emac1 for the only
> available ethernet port, leaving the pin free to use for spdif.

Not sure we need such an elaborate excuse to add a pinmux that is
used on one device - you could just say *that* instead.
But that's not a big issue, as the patch itself is correct.


> Add the missing pin to the dtsi so such devices can (later) use it
> 
> Signed-off-by: Per Larsson <per@palvencia.se>

Checked the details against the user manual: they match:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index ca6a16807049..7370e8ed24ec 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -216,6 +216,13 @@ spdif_out_pb_pin: spdif-pb-pin {
>  				allwinner,pinmux = <2>;
>  			};
>  
> +			/omit-if-no-ref/
> +			spdif_out_ph_pin: spdif-ph-pin {
> +				pins = "PH7";
> +				function = "spdif";
> +				allwinner,pinmux = <4>;
> +			};
> +
>  			/omit-if-no-ref/
>  			spdif_out_pi_pin: spdif-pi-pin {
>  				pins = "PI10";


