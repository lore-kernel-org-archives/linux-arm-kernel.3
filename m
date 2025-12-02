Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17F2CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 14:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P35uIC8+DPfTCMfHgmdtX7Glr2h/6n9nJWKZMAhyHf0=; b=mC5SIIBBai5/HETlUxj5AuGkvM
	G6UOt/wpck4GVKNatnP50jLMa+xp9cc3Gj8qttm9Q//HQODSRBwfZO9bA/bPA6HkH5Gmqf8XMAzf2
	o8r7v1PlhKTcPkjX7rXPNmz85In6qER70MZJ92jXnIZrKmEcxok1x5J1M3OfpuA8hrLcdlYjN+gAR
	r4+z22zJu5u5+MWXudKyIXcrmaMqiT+Z6z+x9mL6L5bK3VhoMDlq9bbafeKTDdmaprLZmHuspKhNV
	2uzqPXd1WitXo6gJIr9+UakPsZSYOy1S/5TirupJzX61xPLK7FJXewhzKSLkpMGDohvuXQets+Byj
	mdnvkWTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQR7l-00000005UL8-2tP1;
	Tue, 02 Dec 2025 14:13:01 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQR7i-00000005UKc-2cdZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 14:12:59 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7c701097a75so2617498a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 06:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764684777; x=1765289577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P35uIC8+DPfTCMfHgmdtX7Glr2h/6n9nJWKZMAhyHf0=;
        b=vFN+dhrZRCW8sSCkh+XI8E2w326mtW81mniTJ/ZADV0YeWYDL9ReynNo7alZV3Rkdi
         NLrna8bl9GCHNEokBIPxtCwxx6AFVDTfWG9xSNxm5zxcEjLjdu2xn3p9Rf7OEgiNVebN
         CDf94zzxC8p6PdqBxYSN5gCh6zfYECepUZ6P/XMUArn8A/++bISzcfaxHFq3dydHsbRj
         8MNbFg69JzocTA+hTKnCv8T2oQjBsrrPW5nVnTtTH4h2/i/75D9mE1XgmVCWlWS0oD/k
         90uE5GVCLDD4sXIYWA+D3WjJKN/ScNqlRo1uOt2ESwaWe/VrCFBSnCFoImqudB23TbYc
         A8Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXO1fkZ2MfPoQIBuZcwTBEQVRfOgziqurcA7mS9OX2CR79pWa4D/qd3R6nNLATDyJHEPzgkSxKwPErGg4GFe1Qr@lists.infradead.org
X-Gm-Message-State: AOJu0YyXF2Ajih2ubyugkUV6vC4u/SqQDdTRVceTma0wjrrcTn/Yw8dm
	ouDw6k1ErZS/NddBV116vkcqx6bLmx2/iCKUufBYBNDoKS1wAslSboWDmriILZqp
X-Gm-Gg: ASbGncvUfppEbZd5t5M2k8LXAClSGOp2CjCLEt5aa90bkKpzkseEeIPDNvXDfwsBw0T
	/p+Y/lqAGMFP0R7f7NUV436yRbgAC+EFbvcSQ0NyTXlx74gh2MCal6R5WVSazgN9130DfC28235
	6xtyAFTOVoXgyCF2ycf1HulbZNlCGGJb8yK5hs2EmkFaFvRLpRCS1APIYP75iUoEDBDoNI8j/5f
	Do30gVqfG4tlK2RXkKKEXt/227pzNiPihEhPBt5i9oddNVj7TSwUGhoGQDy4yTQ5F+k6Ow31vPn
	vM4y9uLoc8A9r33fRBFdejAAafPQZTkO4gj2JX8ZLXkKHXYz++wvExq0syX2mSWpJFOQq5IlIaS
	DSh/sINkM+cUhIICdgpqEskD1yxgvwNSMBYwOxBWA0+wypCqjU2YyR7VaVyde3t5gbUd5oSblln
	OS7U7aA05KZIclQ8jttfi1LXqD+thQtG3I8fgHjiIj3vmYm6ks
X-Google-Smtp-Source: AGHT+IEDGPS63DJH3+4VdyCuZBhWoZoKZQEy2Xfncm1g0hBkXs0eoPBh4OLqc2ZVH6LPxUPQa1FPfw==
X-Received: by 2002:a05:6830:b8b:b0:7c7:82b9:471a with SMTP id 46e09a7af769-7c798d632eamr23828103a34.37.1764684776816;
        Tue, 02 Dec 2025 06:12:56 -0800 (PST)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c910025e06sm6573909a34.28.2025.12.02.06.12.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 06:12:55 -0800 (PST)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7c6d1ebb0c4so3539109a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 06:12:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqFm+rTtaeKunur7JAH/iRR8znlEggOHm9VYL6POBwJ2b7ocjkvTn3a46n9uM8b1xr+B5Vm0o0YovO4s6TF0/B@lists.infradead.org
X-Received: by 2002:a53:dd48:0:b0:63e:17d8:d977 with SMTP id
 956f58d0204a3-64302abbb9cmr22209916d50.41.1764684434875; Tue, 02 Dec 2025
 06:07:14 -0800 (PST)
MIME-Version: 1.0
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org> <20251112-b4-of-match-matchine-data-v2-1-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-1-d46b72003fd6@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Dec 2025 15:07:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVAZpp7M+pp27+kHZwoet2Q8Rm-Y4ePu7=W_1oXhebLmQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnQtK_C28o8ts-DX6QMHSfgR5FWBqGmuyp3cjxdu41cx4XkoPs5W_lQhYE
Message-ID: <CAMuHMdVAZpp7M+pp27+kHZwoet2Q8Rm-Y4ePu7=W_1oXhebLmQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] of: Add wrappers to match root node with OF
 device ID tables
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_061258_677892_2ABE3F48 
X-CRM114-Status: GOOD (  32.51  )
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

Hi Krzysztof,

Thanks for your patch, which is now commit 4a93adcbd201aad5
("of: Add wrappers to match root node with OF device ID tables")
in dt-rh/for-next.

On Wed, 12 Nov 2025 at 11:30, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Several drivers duplicate same code for getting reference to the root
> node, matching it against 'struct of_device_id' table and getting out
> the match data from the table entry.
>
> There is a of_machine_compatible_match() wrapper but it takes array of
> strings, which is not suitable for many drivers since they want the
> driver data associated with each compatible.
>
> Add two wrappers, similar to existing of_device_get_match_data():
> 1. of_machine_device_match() doing only matching against 'struct
>    of_device_id' and returning bool.
> 2. of_machine_get_match_data() doing the matching and returning
>    associated driver data for found compatible.

Shouldn't the first function be called of_match_machine(), and return
a const struct of_device_id *, cfr. of_match_device()?

>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -434,6 +434,53 @@ bool of_machine_compatible_match(const char *const *compats)
>  }
>  EXPORT_SYMBOL(of_machine_compatible_match);
>
> +/**
> + * of_machine_device_match - Test root of device tree against a of_device_id array
> + * @matches:   NULL terminated array of of_device_id match structures to search in
> + *
> + * Returns true if the root node has any of the given compatible values in its
> + * compatible property.
> + */
> +bool of_machine_device_match(const struct of_device_id *matches)
> +{
> +       struct device_node *root;
> +       const struct of_device_id *match = NULL;
> +
> +       root = of_find_node_by_path("/");
> +       if (root) {
> +               match = of_match_node(matches, root);
> +               of_node_put(root);
> +       }
> +
> +       return match != NULL;
> +}
> +EXPORT_SYMBOL(of_machine_device_match);
> +
> +/**
> + * of_machine_get_match_data - Tell if root of device tree has a matching of_match structure
> + * @matches:   NULL terminated array of of_device_id match structures to search in
> + *
> + * Returns data associated with matched entry or NULL
> + */
> +const void *of_machine_get_match_data(const struct of_device_id *matches)
> +{
> +       const struct of_device_id *match;
> +       struct device_node *root;
> +
> +       root = of_find_node_by_path("/");
> +       if (!root)
> +               return NULL;
> +
> +       match = of_match_node(matches, root);
> +       of_node_put(root);
> +
> +       if (!match)
> +               return NULL;
> +
> +       return match->data;
> +}
> +EXPORT_SYMBOL(of_machine_get_match_data);

These two functions are very similar, but look different.  If the
former would return a pointer instead of a bool, the latter could be
built on top.

Even if you still prefer returning a bool, they could share a common
private helper returning a pointer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

