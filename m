Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9972BD116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 13:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcG/XQXLp9HYcvharszf8uW0YuqvJnIwjKHOdBnLhz4=; b=3dVqh7YGiUmTvSc/WCuelS2muZ
	XPtjIwpWgmEgyaOcA41TsI5cqmbhatR5hAkDhPgqyV8M1J3/gxVXfym+AS1R+/intcxyTydrfYtGK
	VY2M4zhLHvWSbMbXKjlCmWWEXFhQ9K/qJleGU+GjFuR9DTB3JhB/Kt1bZFnbU3aFvaoS0mgO2mIAn
	rC2tZF/K0T1vkmEGbYCvM8rL8pSec9lP5zkTL7+v4RFAeYlERikF72mDaJz0qhZukDd9J2D87oAvV
	D943St71Uw6dEBpN+PWDTzARgfmoqjYQl26T1ggEj6NhgYNhma5beOhPcdm/i7YraBsRqDAQUmT4i
	u1rlXPbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQsP-00000005TPw-1noE;
	Tue, 02 Dec 2025 13:57:09 +0000
Received: from mail-ua1-f46.google.com ([209.85.222.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQsN-00000005TPY-0EtL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 13:57:08 +0000
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9372310418bso1373940241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 05:57:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764683825; x=1765288625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcG/XQXLp9HYcvharszf8uW0YuqvJnIwjKHOdBnLhz4=;
        b=mpxAuAIfY8V2rlcY3w3fQhb+dL5Wm+M0EzPnE9h3ZE7l34Nf02cGwIh3ucSpBmK9ls
         xrQS4dxhkMVDuj2kD8YTdqy3/hpUV/htlmhwltesb/4lyADYAYJiD54/BRpF31/9YTl5
         W6mfXDj8FoQA5SoB16B8Ci4nqVlyW/E7jAXPQwW8zKWOxOcpKz66xrEq9LeLKA9bPoHZ
         Ji131O/P5uwUATJA506p92PEBF4eyQPJHeA6RbiVp8aoz0JrSaGQeIE4JIGXpq0ONj3U
         tIFoqEEmtzSiS8aYSYGtmP+7Vg80B4cmCt1H8KwHDVwwrbSSbVVMnj/EgqReLPgWdHP3
         NatA==
X-Forwarded-Encrypted: i=1; AJvYcCXyhemn9c1uqimjST72G8ha5rN5lKkVk/MR/g6ne2ygfouuSp0k7tU+HnEj5Hz0SYcb17MsyJaNrjwKktB5QhQF@lists.infradead.org
X-Gm-Message-State: AOJu0YxABSxfVOLNFqs7Zaw3M1kTF4CkidIWOJaAh6AkQlTW5jbL4nXc
	fZXVjKOiLhrzKsZUUom5BKe0NZszkBwI76AaZUTysYlMJnXJrjSpqaxhKv+4Uidt
X-Gm-Gg: ASbGncshXwzeuUw68pB/O48Az0Ak4TCmH8Cuz/CKcUdaFoMCYsi0FjGsTMPlOtRpEjs
	AQN/+KXp6YKvbGOL9a1+85yQ5wk/g3MbcAift2Ii7j0Rxve5RDympiEKOZi+nHNsj1BgmhsbKri
	yXfc+ruWx77yHuvHv4NVLD9dkZPreNsmHY86oXSJCOX5UMY1gea30iVL3opSbNW+ZMdKr8nTPWj
	b70KKEaG44GErJPsNujPSyNnpMrMeXWmazLGxVAdvLUqrsxIKdV3kqPFv3+Ds4jAa0Usaa00zKL
	/7VMBC2CUHjyh3x5PiC0h4IE8tMxQ3fnCuFI4FETufGbnO4WNtJ+7QurprYHwDxVeY1tjINJ+Fn
	78ce4xMLvzt0iTPcqzdKWXf5H6mDJuswHjimLz1QaH1jcXqSTE9FngXw2ZHsYJ2SqpEpGAMGKkj
	38/F33f1+JBGNr1Xls6MkFm1IRRkn2jt1NDeh58uLNZseky0gk
X-Google-Smtp-Source: AGHT+IHxwbFSdBtyzMEEF551NgLLN4De2g8qUbaOKypgc03IA9+7F1xYRVwYrgLlSk4cThuTpA0ICA==
X-Received: by 2002:a05:6102:5a8f:b0:521:b9f2:a5ca with SMTP id ada2fe7eead31-5e1de15d330mr14457525137.13.1764683825162;
        Tue, 02 Dec 2025 05:57:05 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93cd6ce20e2sm6467137241.4.2025.12.02.05.57.03
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 05:57:04 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9372634aca2so1436198241.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 05:57:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX2SBycVLquMa0Aka0zCQxahqU++uZ7PZQc12euEBvD8ADXyXSOsDqXAuX1WC5yLW1iQsUD9/k1dXlaUzDwv7up@lists.infradead.org
X-Received: by 2002:a05:6102:26c9:b0:5dd:89c1:eb77 with SMTP id
 ada2fe7eead31-5e1de39d9cemr17004298137.29.1764683823416; Tue, 02 Dec 2025
 05:57:03 -0800 (PST)
MIME-Version: 1.0
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org> <20251112-b4-of-match-matchine-data-v2-2-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-2-d46b72003fd6@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Dec 2025 14:56:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJD4+J9QpUUs-sX0feKfuPD72CO0dcqN7shvF_UYpZ3Q@mail.gmail.com>
X-Gm-Features: AWmQ_bnP_BfEGwKLqJN8UevZeVXg10-IsXC-lVqCY3H9e2HFkqZ11liOD_Kw768
Message-ID: <CAMuHMdVJD4+J9QpUUs-sX0feKfuPD72CO0dcqN7shvF_UYpZ3Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] cpufreq: dt-platdev: Simplify with of_machine_get_match_data()
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
X-CRM114-CacheID: sfid-20251202_055707_132261_6651650C 
X-CRM114-Status: GOOD (  26.84  )
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

Hi Krzystof,

On Wed, 12 Nov 2025 at 11:37, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with two new helpers: of_machine_get_match_data() and
> of_machine_device_match().
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your patch, which is now commit 6ea891a6dd370ab2
("cpufreq: dt-platdev: Simplify with of_machine_get_match_data()")
in dt-rh/for-next.

> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -219,20 +219,13 @@ static bool __init cpu0_node_has_opp_v2_prop(void)
>
>  static int __init cpufreq_dt_platdev_init(void)
>  {
> -       struct device_node *np __free(device_node) = of_find_node_by_path("/");
> -       const struct of_device_id *match;
> -       const void *data = NULL;
> +       const void *data;
>
> -       if (!np)
> -               return -ENODEV;
> -
> -       match = of_match_node(allowlist, np);
> -       if (match) {
> -               data = match->data;
> +       data = of_machine_get_match_data(allowlist);
> +       if (data)
>                 goto create_pdev;
> -       }

I think this is a change in behavior:
Before, the pdev was created immediately if the node's compatible
value is found in allowlist, regardless of the value of data (which
is always NULL, except on RK3399),
After, the pdev is created immediately if the node's compatible value
is found in allowlist, AND data is non-NULL.

>
> -       if (cpu0_node_has_opp_v2_prop() && !of_match_node(blocklist, np))
> +       if (cpu0_node_has_opp_v2_prop() && !of_machine_device_match(blocklist))
>                 goto create_pdev;
>
>         return -ENODEV;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

