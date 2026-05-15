Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E8CCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 21:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rBKfu/n6TaE4ORb/ekTINMqGjQC+tBNeO+kLcISMlw=; b=MgbnEPeFkR5h/l1WA2XkGvQhSP
	jLhDmj7qHrbSTqfrkouMByxnWRWrxHoa+C72wigZGMnHrK3tf5qLok8TFNM6OaIJWtssm32t0Dqgj
	LMZbsEzXax8gARYEqUdbTR7qf6joJRPPWInXcJD5W2r1o/yFlMFDKd1bmcdAldpy2NO+azzR2dQam
	Cot6uJg4khM+T2oYHPepMwPJkjNfv9zCubYZ9c6xbgwTYuMlG+trVKnd/idzOIxXgiqWPbIKH7PnZ
	qXgXPI+0tV7kn3AG3wfhOMNmWekdD5mt3D3WiXuhOksx95cPzSeR2jInPV7ZXmveq7Z4Sgr8zlWTT
	Af3pkadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO0UY-00000009Zkd-2i2M;
	Fri, 15 May 2026 21:54:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO0UW-00000009Zk3-1mxK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 21:54:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2328543BD0;
	Fri, 15 May 2026 21:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F238C2BCB0;
	Fri, 15 May 2026 21:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778882083;
	bh=z8IkZDkb9rYC7txK+tLrs+vGOwLssrMK0Sf54P06p8U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jAMTApsYrZp+mXnWD8PSIcMznkdECU4xg7uTVi3WUZyq1YoSmk7BHL6AtjsIeD/Wv
	 gKClyrunnWTJwDhyowWPq7PdfyIAkz1RUduzf/oXq7pYWqhw0rdYwoG1qZn4SUTPOc
	 MjfxmXhwJL9burW4aXYg/rl5COEL3nx88Faf3egE8FQ7ox4F30SJ/930+Be2ypuOuW
	 o4ljdOQHZvA2kToKrY5IFCko0D3XDhL1Sk4DxcI87yAGqQQ34Ze9YEmBBOSpXwUsIp
	 Ieye6x2rxfV8UuT6uJitJcbi5/8RF8DECXNn3ACfz//aGNHvI0re8IejF06Rl2ZOZp
	 bOcw7iwqpa3gw==
Message-ID: <13bf6323-b5af-494d-ad1f-1bb7eac2d8ab@kernel.org>
Date: Fri, 15 May 2026 16:54:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: socfpga: arria10: Increase JFFS2 rootfs
 partition size
To: muhammad.nazim.amirul.nazle.asmade@altera.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260511081520.20247-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20260511081520.20247-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_145444_489160_28576D28 
X-CRM114-Status: GOOD (  13.80  )
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



On 5/11/26 03:15, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Niravkumar L Rabara <niravkumar.l.rabara@altera.com>
> 
> Increase the JFFS2 partition size to support larger root filesystem.
> Also fix the partition label to match the actual start address.
> 
> Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@altera.com>
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
>   .../arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dts
> index a662df319a84..5f9b98b0b393 100644
> --- a/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dts
> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_arria10_socdk_nand.dts
> @@ -18,9 +18,9 @@ partition@0 {
>   			label = "Boot and fpga data";
>   			reg = <0x0 0x02500000>;
>   		};
> -		partition@1c00000 {
> +		partition@2500000 {
>   			label = "Root Filesystem - JFFS2";
> -			reg = <0x02500000 0x05500000>;
> +			reg = <0x02500000 0x3db00000>;
>   		};
>   	};
>   };

Applied!

Thanks,
Dinh


