Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D16606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c8YjgOph;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=T38zjBX5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hBV+nz9NxiWTPP78jPpMIYI0V58VBFwRxWz2e7M7Hh8=; b=c8YjgOphmgvRS+fkxRzJ7c/Zsi
	nf3SXDJhOosqty84AvWcjMvNpavjL6CBC6Z/kp6NH1JEaNCxLb2JDXrs4Bj3oaOQiHRb3tLoP0nN0
	eGsQVLBTlvB2gZ+3xvF7nAh/N7QU+w7Y9XUW30znoR+bezqnNDA5KCgWHt+rtG0kkFawByEM31zQU
	2MYe5CPcdQzI4LluPkLgK4lkypFwh7+woPacGKGwgt6QudSH462p+49HVlcGU8CqeyC8WOLGNmGLE
	MNM/+Z14Lak0vsAI5jDfyxhBPxQPdo+FWtK9XnopJvWy8vxVWjPEj3OA6ygH0jWHkyE8ucH7cTxmf
	NKZywZQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwWc-0000000Ea5T-2Jy5;
	Thu, 22 Oct 2026 17:24:22 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwWZ-0000000Ea58-34PS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 17:24:21 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso41191a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 10:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792689859; x=1793294659; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBV+nz9NxiWTPP78jPpMIYI0V58VBFwRxWz2e7M7Hh8=;
        b=T38zjBX5VQwkAAP1fPchh1fUyntYvrQgqyhWYE6JcoWy/AXyoaZ4kOesZ+Ea3ZiwOU
         jeUw/iid2LWdP7nd/+OWe8HpP9/kitGZO4udkzt7+XZSp4Fh6A9+1QIth6ijULJIB7nB
         9YcNXWDt+ZHinEdDC5imW3/LXRBEdTBhCKPJ+5ungAMleTMYtOiCbgEjiKFAXkTYDqYt
         5+UY+xVV4eqg4vq4T8wQH4F3EaLogCM/Kus4rbgNWnFdtLtObhvxnf13yet+N2fe3vLo
         4j5vcX1xEPDji9KsqHxFG816zg3rJiycV/XyFR14wHhsTSgeYBlRRCkCmXVaLfCyOXZT
         QUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689859; x=1793294659;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBV+nz9NxiWTPP78jPpMIYI0V58VBFwRxWz2e7M7Hh8=;
        b=TonbU+YH2mzv1PP4zguU63f0WmUm5WX/hBOq9bRCKyZcPUV3EMMK2G673oVea2GwEk
         ig0HSaH/WQJU5wWa4qYRdUPNaHqZdYpq3KwDV5ozAMP/QLh3vOocsV6Hy6Ei5eULenGL
         jHf5QksoB9BIoWOZHpAkzH/uC7MTpQBCsDRQOc1HV/LHf1MnFAWGKqiSU5eLG+YSWi5r
         BNBtbJCXF8If2rw0Tg8C/YEkjnKVdp/qbRWUfMVGa5yzR1c2DhN7QXNOIPhR7267i0KB
         ZwJJWvjhP5RC8iDoBgSqqdQlNn/M0rs5nNsGFMR4rnRA0TDazT5J5dHT1NAB8yA6xclc
         Rnvw==
X-Forwarded-Encrypted: i=1; AKwUvBxaGkmbdHdoUUENdtxobMEKLE93DoX4fZ+HIlWaNKdjdqwOkS4qWgKotiTWJgJCX6wz+Nzm438E1n6fg1I50rnX@lists.infradead.org
X-Gm-Message-State: AFq9FYLFcWry8gxBi48bdGk5ugHpVqMGcsS6uPDi11E8NTE/2rk4K9Wp
	o3sCmnNXE/Xl8eAyRys319YtBwfGFhI7xI3ohyrpp3x7v2v9qTRN1Xazumirbu3OJ7U=
X-Gm-Gg: AYBFou0/b5GTrxPaRPWoT6b0Vuv7fiToy9A2asxchkok+Fa/yqTyUjxNni8E/cT7fjM
	TltNmNSofqM5qxQNFvV1SRh0BZulEFAN7rivrcDZVVTt/6/A7ENkGC4YBDa4solMtYMdInFkhq9
	vHmgu2l6KeRl9dWKGd0pSo5wax2F8Pg3D+Mwm1I+wzYK2rEDL+L7yMvhEuc2UNH7KZVO0uiwxLy
	7Arnw8SMZqRwI7MNyzrZTTwxEOD+jUVN1cH5ijNb8ZtE7JR5EoAdwVxI2m3jjqnjvGw0hW0qxt3
	AZU9KEyF5LrNU6Ge2PwINP9ood5cfm5Orp6qQ4qrnylWYUNYfsRDebr4jdG69o6hcUapE5nckWg
	bSbO2xT9e5eMPEBYTiygZIsGZmmmhcfT016Ll3ANb+z6KFKdCdKPaZOs5mXMDChPEvygEiDo/ox
	B4Zr7p7RhYcPeFFWfz9o4sW1kaXFsYfaeRtAo72u2ESt0OiSXE6mK2aKMKw3rtn/67giVE8MmbP
	1jGfENdUObMRiRjkrJnpyGyj13oQydC+BjOOmr3++fsotRxNk45aGWYmts=
X-Received: by 2002:a17:90b:580c:b0:3ac:8ee5:e00f with SMTP id 98e67ed59e1d1-3ad86cc1a23mr4599427a91.57.1792689858509;
        Thu, 22 Oct 2026 10:24:18 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9e85:9169:41c7:bc2d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490e5f8sm5060365a91.9.2026.10.22.10.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:24:18 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:24:15 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v7 3/3] arm64: dts: freescale: add DT overlay for
 MX95-15x15-FRDM RPMSG usage
Message-ID: <atpGv_FiRlgPh4-4@p14s>
References: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
 <20261020-memory-region-name-v7-3-1413d5928340@nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-memory-region-name-v7-3-1413d5928340@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_102419_864170_6C30FAF8 
X-CRM114-Status: GOOD (  21.73  )
X-Spam-Score: -2.1 (--)
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

On Tue, Oct 20, 2026 at 12:50:23PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Move related memory region to overlay files.
> 
> Add RPMSG DT overlay for the MX95-15x15-FRDM board. This overlay is meant
> to be used with the mx95evkrpmsg system manager configuration for
> remoteproc and audio over rpmsg-usecases.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |  3 +
>  .../boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 81 ++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 31 ---------

I will need an R-b from Sascha to merge the above files, otherwise they will
have to be resent separately.

Thanks,
Mathieu

>  3 files changed, 84 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index a80cccf34eb56..f3b19f3b1488e 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -960,6 +960,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-mqs.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
> @@ -984,6 +985,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
>  
> +imx95-15x15-frdm-rpmsg-dtbs = imx95-15x15-frdm.dtb imx95-15x15-frdm-rpmsg.dtbo
> +
>  imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
>  
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> new file mode 100644
> index 0000000000000..c3deb277edabf
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + *
> + * This DT overlay is meant to be used alongside the mx95evkrpmsg SM
> + * configuration for remoteproc and audio over rpmsg.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	remoteproc-cm7 {
> +		compatible = "fsl,imx95-cm7";
> +		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
> +		mbox-names = "tx", "rx", "rxdb";
> +		memory-region = <&vdev0buffer>,
> +				<&vdev0vring0>, <&vdev0vring1>,
> +				<&vdev1vring0>, <&vdev1vring1>,
> +				<&rsc_table>;
> +		memory-region-names = "vdev0buffer",
> +				      "vdev0vring0", "vdev0vring1",
> +				      "vdev1vring0", "vdev1vring1",
> +				      "rsc-table";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		vdev0vring0: memory@88000000 {
> +			reg = <0 0x88000000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: memory@88008000 {
> +			reg = <0 0x88008000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring0: memory@88010000 {
> +			reg = <0 0x88010000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev1vring1: memory@88018000 {
> +			reg = <0 0x88018000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0buffer: memory@88020000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x88020000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		rsc_table: memory@88220000 {
> +			reg = <0 0x88220000 0 0x1000>;
> +			no-map;
> +		};
> +	};
> +
> +	sound-micfil {
> +		status = "disabled";
> +	};
> +};
> +
> +&edma1 {
> +	/* reserved for M7 */
> +	dma-channel-mask = <0x40>;
> +};
> +
> +&edma2 {
> +	/* reserved for M7 and V2X */
> +	dma-channel-mask = <0xf>;
> +};
> +
> +&micfil {
> +	/* reserved for M7 */
> +	status = "reserved";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> index f82e149323d34..3ab679e5a4740 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> @@ -189,37 +189,6 @@ linux_cma: linux,cma {
>  			linux,cma-default;
>  		};
>  
> -		vdev0vring0: vdev0vring0@88000000 {
> -			reg = <0 0x88000000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev0vring1: vdev0vring1@88008000 {
> -			reg = <0 0x88008000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev1vring0: vdev1vring0@88010000 {
> -			reg = <0 0x88010000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev1vring1: vdev1vring1@88018000 {
> -			reg = <0 0x88018000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev0buffer: vdev0buffer@88020000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0 0x88020000 0 0x100000>;
> -			no-map;
> -		};
> -
> -		rsc_table: rsc-table@88220000 {
> -			reg = <0 0x88220000 0 0x1000>;
> -			no-map;
> -		};
> -
>  		vpu_boot: memory@a0000000 {
>  			reg = <0 0xa0000000 0 0x100000>;
>  			no-map;
> 
> -- 
> 2.43.0
> 

