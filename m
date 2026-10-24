Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AF5606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 08:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OefDektd;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ikDCCYOv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=; b=OefDektdpY5cxrjrN33mIv+ZP8
	c45pbS6PaW/SlY7XkvflNsQ/cefq3wl9vyrfgdhnhbJyHh9xe8gaWC70MFihGE1l6xE8TMiGc5J1u
	OQm4xJTmlongfPiP+yzwC5ZAGhHrVBanuc7raRsdlwJWgWfdOVJwX3oG02FkvusBVJnMkfn1PfT6M
	d8bln8c0iLXRItaUvItAgork3Id42sgA37le6Et+WcIgxmmOQ/7Oj7x7pZ6XskRQvRkJ2TyKchAiH
	0+T09IWGocHzUBQ2fNzM5tQCOy05HX5CQfv5fRVNIt1LO1iaWP+dJ9rLHk/UckHBFYgeGe0/V7kDo
	BQrLQhvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKWwm-0000000HafT-2lGe;
	Sat, 24 Oct 2026 08:17:48 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKWwQ-0000000HaSG-0ig3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 08:17:27 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso904439a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 01:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829845; cv=none;
        d=google.com; s=arc-20260327;
        b=kJ8yd6kF7PTafkaxZvJeBUKby7JW2d+t855nF2htlu9UDmuyx12ZIrQeIwQmq/1yXC
         1pkF3iIpjAUzTjtyr73NFYT8EoNouJkSqFh2Kgu9nkLhgz1Wfyu1HlhMTABXGT+HODAu
         ZPHYJXb2EgsNlMk7MBYnv+YdbL2f91alLHb6P3WWzrJOWG1ICtXqA0KndqYp+WbS2HCq
         zY3Zo0BPUGC1Cq8da3VoQExgl5goaH3KxhdgiXniWRFQXjnkSDgeusuoMQkyZRRPLQPQ
         5CcPPqN7/mtm8Ffais6sAYsCUqdrxVn+FdH5jLZnxEw7xfugnfgorfKeb6yxnMiLqFoW
         okLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        fh=orjnPEvPgOBjwproqdgA865ZzU5u6xJ8ixDQeqKZVTk=;
        b=j4+LAAR9ZlPnGdevuWAx2GpAoUeG9cKy740lk2sQHaLMyy6HE+SgI9Dge02SEVNYhw
         skkb2tA14M9BxYyCz93P1tLQ5YMjwxCQfXcY5ys3kmXIjXEroynrn+EaaLSLJGISuqqa
         KhdqQn2uFQXyVXIHk00bKWQj8JtD+6PYmvMP23Uc+/6l5VYoA8rJPbRl4PqJ6Pfb5/aQ
         C3oZ5o7omtKCkpAfEarvYo9WOMdEhMNi0zngrpSZGaZG/7VlvjQUtyvQNYhOfuInctf0
         JOpRzrchboqSWxxpdswW0TzEmQP73j+g+eGrXPR4BMrQT4sC2U+s+inc4MZbfTUMwPTx
         OHSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829845; x=1793434645; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        b=ikDCCYOvcz0R312zSi+tiAhW+4McsYQ6dmeipI/DJoq2mDYgur9EaYmRITLxB1rGbi
         2nLl06PzTeO0mCWXsWui/WIbYd4ifp4pyhz/b8YnSPoMmvFl3FMnoiXI6vjktqHWBDEU
         RIGEuOq4Leb3iBxs8k/v/K8Z3LPC4NDMg58fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829845; x=1793434645;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cyqk+XMSMcVf9vVXU4rdRbRmiDkDjXgnwovnotWECc4=;
        b=SZhtst3MYjHs8yndq5S79tHJeQkAtuzprOhgecWLzNd/UgWR5+TUWGbQI26rDNPJW6
         4fpgl6ys6RNEz1jxm3LkUY9Axh9ZvgWNU3mmmaV1rWyjnaRRACvX+oWFf7Re342Q6p35
         7XrEwSjb2rY07iF3XkKZtihfo9LlayiEM+x1Qd//VGLN85OiWGAvhi0GWohmUkbycMwX
         BEdGSvOVMP8nVQo6xGDTrpj7yfTRBU9XO/6EwNcsrn9qsT/3mVWzzJaGH0RTSqP1G6Oh
         75X9WTGp2EOagtubDMzFl/FaR8/4FuujruhDqoCcVPb58EgzQqPohrJJA4bTQ6mIrurP
         DXDg==
X-Forwarded-Encrypted: i=1; AKwUvBzuzGRHzYjpqEnra6PnDm7kRz43fiiIwvfOvJC2kRojs7KLroG+ffIuXbPgyziEXRpysgVq+wtkEXjbg+tr7rS8@lists.infradead.org
X-Gm-Message-State: AFq9FYLpcJ8kk+PW5vNR3ioMmdjZWwPgCW6Kvg+9JqaB2SiWrflvxEfE
	+GyhJL5O6Vb/LDexcd2KzM6YUrLReoiLB7L7savbkrl13bjL8ISPaPaqN6l0geTOH5vq3corhl8
	4wWK+v74plCvhwEWBooa/gicmgwtCYbbwYLGIA1SV
X-Gm-Gg: AYBFou39RBIs7yEMMhktDJ9KriC8ydkvN+ymztMITfi9hpLFOJ9Tt7/LV3HBRJS8YoE
	pmEqL4/kX1U4G+qcZNbmqZ4oibZ5Zc1jNlujllcCuRNwGAZcvR63wCPu8bSCHAUVERiV0wpvBne
	E7pfnabYkHFiuZzsDUD4RvLhEhYl1+xF6UC/fG7EVLcF9OB1eP2Vj/BCEsaqa+3NkZimEBzf738
	gQLLcWuIp5evRsB1cg4eegH1R1FHCmnYqW5a+Y9mY8AMf3oBhhCHGfrJdDZTHhpn4NB3NxXDLh/
	Oli/PfzSw/QtGzGE08TrUTRQYbsRWeeJNs5QBuuv/2GMntL+lsLBbEpO0G380g1XNKyOCuw21ta
	e91UH4h4B4DNzypZ0wwLoAfR97Tntzd46fXs=
X-Received: by 2002:a17:90b:4d09:b0:3ab:31e6:12fc with SMTP id
 98e67ed59e1d1-3ade9475f03mr1281929a91.0.1792829845190; Sat, 24 Oct 2026
 01:17:25 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:19 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:14:33 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.6.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.6.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:19 -0700
X-Gm-Features: AclHuK9OzNbsUxoUq8dndEPiTUrFf9OR8thbHVNZoTYdjjGKeFC-1VE0qwrhJ4E
Message-ID: <CAFLszThr=rPCTxQxst2_Br6MWwaRFe_rHamzLXY=ua4Qr8mAeA@mail.gmail.com>
Subject: Re: [RFC PATCH 6/7] arm64: dts: google: lga: Add lga.its FIT image script
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_011726_225925_2C0AF68E 
X-CRM114-Status: GOOD (  24.10  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> arm64: dts: google: lga: Add lga.its FIT image script
>
> Add an Image Tree Source (`lga.its`) describing the FIT image for Google
> Tensor G5 (LGA) Pixel 10 family boards (`lga-blazer.dtb`,
> `lga-frankel.dtb`, and `lga-mustang.dtb`) with board and SoC ID/revision
> metadata in the configuration descriptions, allowing the LGA FIT image
> to be built with:
>
>   make \
>     FIT_ITS=google/lga.its \
>     FIT_FACTOR_DTBS=1 \
>     FDTFACTOR_ARGS="--strip-local-fixups --single-base-dtb" \
>     image.fit
>
> NOTE: At the moment, Pixel 10 doesn't directly boot from a FIT
> image. However, packaging scripts will be able to take an image as
> built above and convert it into a format that the bootloader can
> handle.
>
> It should also be noted that the "description" of the various
> [...]
>
>  arch/arm64/boot/dts/google/lga.its | 68 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)

> diff --git a/arch/arm64/boot/dts/google/lga.its b/arch/arm64/boot/dts/google/lga.its
> @@ -0,0 +1,68 @@
> +		fdt-1 {
> +			description = "lga-blazer.dtb";
> +			data = /incbin/("arch/arm64/boot/dts/google/lga-blazer.dtb");
> +			type = "flat_dt";
> +			arch = "arm64";
> +			compression = "none";
> +			hash-1 {
> +				algo = "sha1";
> +			};
> +		};

Just to check, does fdtfactor recalculate hash-1 when it rewrites the
fdt-N data? With FIT_FACTOR_DTBS=1 (as used in the commit message),
mkimage computes the sha1 over the full lga-blazer.dtb and then the
data is replaced by the base or overlay. If the hash is not updated,
anything that verifies it will reject the image. I'm also not sure why
the FDTs get a hash but kernel-1 does not. If the hashes are only
there because the trogdor script has them, it might be simpler to drop
them here, since the packaging scripts repack everything anyway.

> diff --git a/arch/arm64/boot/dts/google/lga.its b/arch/arm64/boot/dts/google/lga.its
> @@ -0,0 +1,68 @@
> +		conf-1 {
> +			description = "Blazer (board_id=0x070406,board_rev=0x010000,soc_id=0x0005,soc_rev=0x010000)";

Since tools are expected to parse this string, please can you add a
comment at the top of the file describing the format? For example: are
the keys required or optional, can they come in any order, are the
numbers always hex, and does the width matter (6 digits for board_id
but 4 for soc_id)? Otherwise the format is whatever the first
packaging script happens to accept, and anyone adding a board or
revision has to copy the existing lines and hope. But I think we
should get this into the FIT spec - will mention that on the cover
letter.

Regards,
Simon

