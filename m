Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC78CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 14:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fd/ArEYxAAEUYhnoA0Oh/vNlB/6p6wwqYSN+YEbBwcA=; b=gqfSjyNma6DQlxOW1vW5TMC5rP
	mGD/pLaugoMuetwfAZT4wpgj91onRLSEKmbk6mb4PU67N4sUqEglC8s/5ZOeMd/1sWkOq8PeVytVC
	K3wjmsQ1GeUik3uRC7DSN05bZRrliKJNCuNnUfFnFm853nPQ8IaGWJ8ETxs49ljhIMA6NvgYY0Qnv
	zeuPWmJzd0FhFxdL3hZH7A6byAgqBTdcsN8WRaaTTVoxhJkH7wjnH14PlMyqhiFFzzHtj6A9QeIYV
	/DV4gcAPXMW74OiHQhLIlgYlAIsIBzTQ7vEfPNlWfC6YxrcE25kWGsMDhE+Rhc4zwXLrLzCIHbTMi
	uW5d1dZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7d8-00000001hAX-1M2Z;
	Wed, 29 Oct 2025 14:58:30 +0000
Received: from mail-ua1-f41.google.com ([209.85.222.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7d5-00000001h92-3A8d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 14:58:29 +0000
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-934ad40c2c2so2820014241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749905; x=1762354705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fd/ArEYxAAEUYhnoA0Oh/vNlB/6p6wwqYSN+YEbBwcA=;
        b=uWVlAgujTqxPUZCjldyFibkwPmuIYXNMKaGAwCkvD5aNb5zzw6T/R0vOZ9ghr54IkF
         Mj+Ibg+OLLxGw1eMMGzMGbvCaG/1iR5ulZdokPoDh/0NUSLBA+7H5DFPrxVyhEQ0wO14
         4rWAUiRRZ4Hm8N59r5HDZLKWgrBZTRuslVDC735nEc2Q+P2fG1x2l4CCe8qS3gRRbTau
         sHRyN8KEblMksFDsu2guCeiUcMFcV50VeL5/V2HSBXpy1LpBiTrBqdkvFCn/RNEXUnQS
         N6Bj7ORicJZ362jhCYX0eDk/ne6lsEfFaAeWmDCQdItbB0UEl1sx6xCtWglLSkJSqrMz
         eihQ==
X-Gm-Message-State: AOJu0Yw4YaYEYUH2qw+ZRMApuabrsixzESLo7bXL6eKlVH0Na8WHa3qt
	+HrZVACAh1fWosxz39WvBMmufAMoMQDqcFNfLE27XIooYNPHLlTQlUJw6tdD1f3X
X-Gm-Gg: ASbGncu664Y6JJwEea0hI+as4LE6hq+LyJardaVBIbdhqPWqk8hX9EyQMmyRqIouo7K
	3YlaQ1gQ3tyhR9aVHKJIUF7+UsvsDRMELIRdSf0Jvrc7pQ0XLA7g7S7g7qDu6DqgR62HLd9Q3fk
	6NLHb2ETbQYEvwS/21hYXXMDVgnMOS0/x+5zP/Utbg8h3w478CUKLyCiY/HQcYQQFojCEcBOZLp
	d6ud/PliFi34KFt0eVSVSVzKGXuMW9mJud07NByUYGt9i5kHKJPEhVvX7HA+P8sZaRKqP7/HmSC
	UZanrMnyGWY3ZQU4tz4Q3zbgjP3GKYIw8EwQCZ8YUX9RjHr3V61LldC7SKZGGAHkIy3w5T4O3HE
	NRuMLsM3k+FLeMQ1uvdJF/D3sveH8LVwHVy9WWQnwGCHao8dOdGY7WwdM+BPzOLBqf4wfihnAUb
	+6GYEKauQfegTOAjLY7RQIbNx8QxbMUQ2v5YH3NZMEs7DVAbth5FNj
X-Google-Smtp-Source: AGHT+IGUXNCwo6nzbe5QYIX9Tu0bnZG8HMaV9+2Y8Fwt/Ch6SIxldiLzM0dtWWjWki7aT1pBnqCkjQ==
X-Received: by 2002:a05:6122:45a7:b0:54b:d7b6:2eee with SMTP id 71dfb90a1353d-55814244be0mr958624e0c.11.1761749905175;
        Wed, 29 Oct 2025 07:58:25 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddac18dbsm5533616e0c.2.2025.10.29.07.58.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:58:24 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5d6266f1a33so4638936137.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 07:58:24 -0700 (PDT)
X-Received: by 2002:a05:6102:290d:b0:4f7:d553:3cfa with SMTP id
 ada2fe7eead31-5db90606601mr813077137.12.1761749904411; Wed, 29 Oct 2025
 07:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
 <20251027211249.95826-2-marek.vasut+renesas@mailbox.org> <CAMuHMdV2Kr4WcYRERHCYR1zGAh0n2N3D=LYbRSYLJnRTYDB4+w@mail.gmail.com>
In-Reply-To: <CAMuHMdV2Kr4WcYRERHCYR1zGAh0n2N3D=LYbRSYLJnRTYDB4+w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:58:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWyKeQq31GEK+-y4BoaZFcCxJNac63S7NoocMj1cYKniw@mail.gmail.com>
X-Gm-Features: AWmQ_bkK_riw2DJ8GdGhH8UFTwbp-0GBHO60gLWdbse1YNVgueoQrpv6rrq65Pk
Message-ID: <CAMuHMdWyKeQq31GEK+-y4BoaZFcCxJNac63S7NoocMj1cYKniw@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: renesas: r8a77960-salvator-x: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_075827_938048_4A1621C8 
X-CRM114-Status: GOOD (  22.21  )
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

On Wed, 29 Oct 2025 at 15:52, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 27 Oct 2025 at 22:13, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
> > Enable GPU on Salvator-X with R-Car M3-W.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

(no cover letter, so just replying here)

I am a bit reluctant to queue this, as apparently there is a bug/race
condition in the PowerVR driver: if the firmware is not available,
the kernel may crash during boot due to a NULL pointer dereference.
I could trigger this on Salvator-X with R-Car M3-W after applying your
series to renesas-drivers-2025-10-28, and adding two debug prints:

--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -256,12 +256,14 @@ struct device *dev_to_genpd_dev(struct device *dev)
 static int genpd_stop_dev(const struct generic_pm_domain *genpd,
                          struct device *dev)
 {
+pr_info("==== %s/%s: stop\n", genpd->name, dev_name(dev));
        return GENPD_DEV_CALLBACK(genpd, int, stop, dev);
 }

 static int genpd_start_dev(const struct generic_pm_domain *genpd,
                           struct device *dev)
 {
+pr_info("==== %s/%s: start\n", genpd->name, dev_name(dev));
        return GENPD_DEV_CALLBACK(genpd, int, start, dev);
 }

See also my original report "drm/imagination: genpd_runtime_suspend()
crash"[1] on Gray Hawk Single.

[1] https://lore.kernel.org/all/CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

