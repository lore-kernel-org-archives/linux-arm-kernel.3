Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0CB606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 07:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CiMcg4Nx;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hIaaFuO7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wrYyDNg3E6ceVKYkD4AhtLlI1IklZP6+JsR2AFJMEr8=; b=CiMcg4NxPr6TrmcmHgMQaqFsWs
	d/r89WigGk6RbK6Nq6zYg3dI38Ta+kohfcBm7fMUcdcvtRXHG6liEYmR53rVLNF9HRJwjhO9JzOqW
	GraMJWSNrez/iaP23FQJqO6JjtOoCkJIF99f6umI/+w9IOt0OV03QNW+2soyyNi1wOjCgJrck3ige
	O+PHwb4qrawSrZlTs7nRMgRlLLtVf7ah6zbFl4U/PIoROENknAK614UcwIrbTCDtZKV+Aj7AB4jH0
	CC6fpQB3ZrQ8VgdkZGDSDYlBcMYX85rcklkXMYYMvXkM+VOWPrnShlnCgg5FvsA8WayCj70Qud6r+
	4Ncjt9AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmTo-0000000FkZc-2S4x;
	Mon, 02 Nov 2026 07:29:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmTn-0000000FkZ4-3DkR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 07:29:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E7702609A2;
	Mon,  2 Nov 2026 07:29:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4ACF1F000C1;
	Mon,  2 Nov 2026 07:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793604558;
	bh=wrYyDNg3E6ceVKYkD4AhtLlI1IklZP6+JsR2AFJMEr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hIaaFuO7adR0AWoNO71qfdzfsgx90ShkTX/sGRTZvh+YTn8vu/bKl9BHEcCfZT0l4
	 Rw/1iHKB9XZcAyHvA+xdRLCGcYADQ4CkxW5iK3W9tgvawMCDaMp6Sq3k0ZVGGdSS8H
	 x9mttXzfVVEkY4nZJooZ/ndae42RrMgwURdraKuVSPDQ4tqhwtvuExJ/AMXIAl6GK3
	 5DPXQtk738sGqZZynqkBN+3FQ/PwCwbD19w422aNAFhweajqiu633a/3gpGoLTcb/q
	 rVpQxpEF6nFl5hC3Dd+10zVnljGsDxYO8N8+JBLghZdzDIcH0vqdMphpQLBiz7XM5u
	 +yf6mTbtluYVw==
Date: Mon, 2 Nov 2026 08:29:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, 
	Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: imx91_93_common: Enable BBNSM NVMEM
Message-ID: <20261102-nimble-amber-rat-4f8cff@quoll>
References: <20261101200140.141642-1-wahrenst@gmx.net>
 <20261101200140.141642-4-wahrenst@gmx.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261101200140.141642-4-wahrenst@gmx.net>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 09:01:40PM +0100, Stefan Wahren wrote:
> Enable the BBNSM NVMEM for all i.MX91/93 boards.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> index a68ffd04ee08..c8bbf6f1bcf9 100644
> --- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
> @@ -363,6 +363,12 @@ bbnsm: bbnsm@44440000 {
>  				compatible = "nxp,imx93-bbnsm", "syscon", "simple-mfd";
>  				reg = <0x44440000 0x10000>;
>  
> +				bbnsm_nvmem: nvmem {
> +					compatible = "nxp,imx93-bbnsm-nvmem";
> +					#address-cells = <1>;
> +					#size-cells = <1>;

Pointless/redunadnt address/size cells. You have here DTC warnings.

Best regards,
Krzysztof


