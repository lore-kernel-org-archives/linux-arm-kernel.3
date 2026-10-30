Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9EA606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JLkWtpi+;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=cfFPdl+g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DMSB0S9yiCeOUcAaz9FS5qB4n2z+ffGpdh/P4EfWTmw=; b=JLkWtpi+e5eJbJ
	P3ORsrU/PAdZfq2ZyuR1uxv289e22GlwI6pQ5JKKoqJxNaqrN7+MhOnQGAQaA7cMQxmy6+4tY64nu
	nqJ8UupNq1V31AwzP/BCmX7DD9JbHX0/W4a4zI79m7c+1EzPdbfI4tlBY7EwFHAjLI2tQLG8+9DK4
	87FWmdCe6eApQvfdLgFsgW50mzXpatrlH2bJ3omZORR9REFmkjdyZTLXhKj9v214bV1mFdT82rMQ7
	hpTdLcuYqOF2wndZ6vAeWG3ySWRkXYoAbByuqwzwoTsqnUFmyoS4P55SeEk1rEyU5havpu6vPkz+C
	dYnf/7FMUt67P3U19oqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjso-0000000BOxu-1R79;
	Fri, 30 Oct 2026 10:30:50 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjsl-0000000BOwh-3jXe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=DMSB0S9yiCeOUcAaz9FS5qB4n2z+ffGpdh/P4EfWTmw=; t=1793356247; x=1794565847; 
	b=cfFPdl+gBxfIk+1lUIE+gfa+Ls4rAkATsOAkoTb+BMQB0yk68ipLLD7ULDrAweYFDM0Mc2aGuy1
	/cgZE21OeO7+bsuNQrIrjYPBWqyXkBgrbloYu37D3fKe8YxVWAA+YPFwvpKTYwstw41HFb5l/7yH6
	N3ua8bc/UWZspUy10IQjy4wvhcOC/e4XBN91xx6581+wgG2COQiW57hf8CM1y+62VoxX8WGzKLgSG
	aCpNim8FEtI9mNVTn0cpdt1g1hjzzW+3ng0kbvQR0hfVjO0W9YtYlQpddHKNhE/wHxzFBmK2v0X+F
	ZQ3dNMORvillA58rua1+tLBABQxVL09Y+zKw==;
Date: Fri, 30 Oct 2026 11:30:32 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Christopher
 Obbard <chris.obbard@oss.qualcomm.com>, Andrew Goodbody
 <andrew.goodbody@linaro.org>, Paul Walmsley <paul@pwsan.com>, Russell King
 <linux@armlinux.org.uk>, Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/9] ARM: dts: omap: dm816x: refactor and align MMC
 node
Message-ID: <20261030113032.51b92b19@kemnade.info>
In-Reply-To: <20261028-patch-ektor5-dm8168-dts-v2-4-4544429251e2@linaro.org>
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
	<20261028-patch-ektor5-dm8168-dts-v2-4-4544429251e2@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_033047_934359_0EC59054 
X-CRM114-Status: GOOD (  16.55  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 17:06:05 +0100
Ettore Chimenti <ettore.chimenti@linaro.org> wrote:

> From: Andrew Goodbody <andrew.goodbody@linaro.org>
> 
> Update the MMC node in the TI Sitara DM816x device tree to align with
> the structure used in other similar SoCs. The changes include
> refactoring the node to better describe the target module and its
> sub-nodes.
> 
> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
> ---
>  arch/arm/boot/dts/ti/omap/dm816x.dtsi | 33 +++++++++++++++++++++++++++------
>  1 file changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> index fc124f9ecfa1..e3d49651b44e 100644
> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> @@ -423,13 +423,34 @@ &edma 20 0 &edma 21 0
>  				    "tx2", "rx2", "tx3", "rx3";
>  		};
>  
> -		mmc1: mmc@48060000 {
> -			compatible = "ti,omap4-hsmmc";
> -			reg = <0x48060000 0x11000>;
> +		mmc1_target: target-module@48060000 {
> +			compatible = "ti,sysc-omap2", "ti,sysc";
>  			ti,hwmods = "mmc1";

do we still need this?

Regards,
Andreas

