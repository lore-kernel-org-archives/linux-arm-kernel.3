Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F818106B532
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 13:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ckxAXUDke0h5tovTl8PH/LMAmEb34wiiT3UqWY7x06M=; b=ms1XGw4TKJ8GAAXy9Je0J4Ayqe
	vaMG0yYIN34tRwErNaSocP3gMNO8jItAjMtKT5iIlpere06vx4Sjok+Henqk93TdRHcQmoMseJ+GW
	jy74rfBrV5uL3lQiyI5bnceO+x9OCa8Og0h6DMPkRSCH29KhCieuycKeVZZtSYA8lSDUCo1sd99pX
	IMikeU5FuyCeBIidzGjf3wbPx6B6awOIGutswdWAsT5DjI1yl9FGYXOTe0gbod7+HNVmiyJSuiM7P
	vcgDgwHO3ZdVb+WLk81iiwWoZIpkbAfR37JqTl3c+UvnmVrK1uQRurdwNjhjXHvIkkY0AkAOWBZm9
	qzMHxzAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Nz5-00000003QmE-1J6D;
	Wed, 25 Mar 2026 13:09:19 +0000
Received: from mail-ej1-f51.google.com ([209.85.218.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Nz3-00000003Qlo-3RCn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 13:09:18 +0000
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b97c44417ffso558719266b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 06:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444155; x=1775048955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckxAXUDke0h5tovTl8PH/LMAmEb34wiiT3UqWY7x06M=;
        b=gedaKD69wVI4bnswExdxRDHW0fPDf7dIx5q6npUkJ4pawJ/PEu1FAgViAowsimDfUl
         95ktrS6jBT8HyWXpKC6Nc7qxwBU38CIy9h8C6m4Kcpbp1u/oYyAanEjZCm0tA0jOCavF
         Nou/g/f8GDXc+hBte2ET11Q/HfxurTx+qVMALKTn06hsc5CMxqeXD/eTUohQPHLnC+LD
         8oBQnGbnIK721DMm4ZK586WhkeQrcla1PXFqTlg7XAvgc+9275EJQq4CFFu/Il64vqIh
         jCFwWmOR+RBmqJ5BGbPIsiBXpjoViDl2wzUxlr7DRz0XhjtSQv8cklqKs/A1znF7Bnxm
         sEqQ==
X-Gm-Message-State: AOJu0YzAKs7COt+NjebnAhHmwyAXfgHrJodYSMU4Vo93LFrYaB1ITtOp
	d1qYOrcyAYDMATBZOt/kKeb0d9wcZ3QGNzDFy5p0aZZmKC/L2E6AWSAGZudGYDJbrj8=
X-Gm-Gg: ATEYQzxblvHclB9Jxim9/6UIYAdhnz8L7AMs3+RqN7I6/DyVke11YqtF9P0E9lOfzFT
	Zs5vpi9PoEH1ZXu0xxj1rFSkGTNDRlJSYnsjMTWzMapAVaY8XOlhbcxrz7YiB3J0x7IVunSJzgn
	9oZgS14YRRUQG+Zy/+NpYQ9ZV6mfaQc/S2kRjmZZj+gwhCm31PRR/y6rgPOXZ+LrgPCQ1222Yyj
	cN+o0J6FGZJh1o9ImnY+9Xo/gIdRKoC1Aboazry2G+Siy8Pxd/kmzmv5QH13S6vDhRlYMc8Gfe2
	PNiGun+3kFxbqWknpgdrJQpkpqBn7b5ewQViarRUS93124a1xRAGiI1KA58xX7lGGAU/VTwaN8M
	Gni7diuhPWI2foq2+9yeCg2CI7x5VVim2/qnpTQNfsYfR0U5uM94fa9ek4Rageto+PQeSltY0Yd
	S0pVMSUhVKuNlKkfL+WjFwusPSYousSc+YlsxxjxxGPu8/0PFgMMcNJF8EeKH6
X-Received: by 2002:a17:907:bd16:b0:b98:9da:4d94 with SMTP id a640c23a62f3a-b9a542a8dfbmr208332966b.48.1774444155397;
        Wed, 25 Mar 2026 06:09:15 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f440e7sm782228966b.3.2026.03.25.06.09.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 06:09:14 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-668e55bd36bso5627208a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 06:09:12 -0700 (PDT)
X-Received: by 2002:a05:6402:458d:b0:66a:3390:30bc with SMTP id
 4fb4d7f45d1cf-66a826728a0mr2218507a12.15.1774444152446; Wed, 25 Mar 2026
 06:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260324143342.17872-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260324143342.17872-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 14:08:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVv5KUma8=2T+ibnXyH+45xvqVrQaPho0CSzP1_r+j_hQ@mail.gmail.com>
X-Gm-Features: AQROBzDnZXf3SxdSqv07tNfP3QRyp5IV9cnubTU8PQao0RladIsBN2aCe5n6Z3Y
Message-ID: <CAMuHMdVv5KUma8=2T+ibnXyH+45xvqVrQaPho0CSzP1_r+j_hQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Reserve first 128 MiB
 of DRAM
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_060917_900231_D4A84629 
X-CRM114-Status: GOOD (  38.87  )
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

Hi Marek,

On Tue, 24 Mar 2026 at 15:33, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Mark the first 128 MiB of DRAM as reserved. The first 128 MiB of DRAM
> may optionally be used by TFA and other firmware for its own purposes,
> and in such case, Linux must not use this memory.
>
> On this platform, U-Boot runs in EL3 and starts TFA BL31 and Linux from
> a single combined fitImage. U-Boot has full access to all memory in the
> 0x40000000..0xbfffffff range, as well memory in the memory banks in the
> 64-bit address ranges, and therefore U-Boot patches this full complete
> view of platform memory layout into the DT that is passed to the next
> stage.
>
> The next stage is TFA BL31 and then the Linux kernel. The TFA BL31 does
> not modify the DT passed from U-Boot to TFA BL31 and then to Linux with
> any new reserved-memory {} node to reserve memory areas used by the TFA
> BL31 to prevent the next stage from using those areas, which lets Linux
> to use all of the available DRAM as described in the DT that was passed
> in by U-Boot, including the areas that are newly utilized by TFA BL31.
>
> In case of high DRAM utilization, for example in case of four instances
> of "memtester 3900M" running in parallel, unless the memory used by TFA
> BL31 is properly reserved, Linux may use and corrupt the memory used by
> TFA BL31, which would often lead to system becoming unresponsive.
>
> Until TFA BL31 can properly fill its own reserved-memory node into the
> DT, and to assure older versions of TFA BL31 do not cause problems, add
> explicitly reserved-memory {} node which prevents Linux from using the
> first 128 MiB of DRAM.
>
> Note that TFA BL31 can be adjusted to use different memory areas, this
> newly added reserved-memory {} node follows longer-term practice on the
> R-Car SoCs where the first 128 MiB of DRAM is reserved for firmware use.
> In case user does modify TFA BL31 to use different memory ranges, they
> must either use a future version of TFA BL31 which properly patches a
> reserved-memory {} node into the DT, or they must adjust the address
> ranges of this reserved-memory {} node accordingly.
>
> Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> @@ -118,6 +118,17 @@ memory@600000000 {
>                 reg = <0x6 0x00000000 0x1 0x00000000>;
>         };
>
> +       reserved-memory {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               tfa@40000000 {
> +                       reg = <0x0 0x40000000 0x0 0x8000000>;
> +                       no-map;
> +               };
> +       };

Obviously I don't like this very much, but I agree there is not much
else we can do at this point.  Shall I add a

    /* Temporary workaround for broken TFA BL31 */

comment while applying?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-fixes for v7.0.

> +
>         /* Page 27 / DSI to Display */
>         dp-con {
>                 compatible = "dp-connector";

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

