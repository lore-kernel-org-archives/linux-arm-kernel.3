Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC3DCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 07:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2FuciPnJNj5AwtRdMcxDTBtjQGaobaVWkr7dCuNdv28=; b=NlOyMiHtkwQTRleoJPavKwts8H
	Js6UMyCOJBRf/YdSDbqZpCVOf0mPdBZZ5eKKITwDAQBvPgy0lQSvGDRcvOlXbVDbtfinGCwgGrmRE
	WJmq/qqejgSKnJIG9dLDopI9Zm9UeNmmht10OVYXCJW1QVDtTBbZUCp3+hLZerSldB64WKRMtjjKF
	p9amxx7iRKWuR7mq3sfN1DV1YNDmPHMKA1twNWcyJ3reuNN1kZ3Vxk8s3Ac+Ck2sQqESOCa4ZPOQe
	zY9TkXxKGNQDHwH+oX5lWEo8yNs8mmKc99oZLwHx6eA4NTzh2fGM8mzx3/WPwnVB5lRo1KOCsjmLw
	putBZ9mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhDD-0000000Frx4-399G;
	Tue, 12 May 2026 07:07:27 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhDC-0000000FrwH-01io
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 07:07:27 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56f6afbd205so2844895e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 00:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569644; x=1779174444;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FuciPnJNj5AwtRdMcxDTBtjQGaobaVWkr7dCuNdv28=;
        b=a4yYxdr1m6Y3o8Tc2l+KmxCwLp0eaFGocjsoW6r84IllcZ8QC1CGibKjXAVzgkmhMf
         qIYxZup/tBwn7MEgLdFmEXzw+q+m1TV/lN8By9VYE518FURmNu2Iy1f5y9OhTiwLPTny
         4cwkDCeMkuz2z/BIkigdj8OWujvQNsPgac0YhOddktrghQxq6CXW5dHfwxb6E+AQt61T
         /1oNCWdsBrtLLDiXXwO462Xvja1Gggai/FIVNcTUPFvT0X8RC1RUPWvJIozr0+KmA+RQ
         KU05u8B3+bcU8OQrS5OGzl0vxVBw55FsFzKECNGqwSXwuxh5HnFYU2UT5IaPxwVnReku
         6FKQ==
X-Forwarded-Encrypted: i=1; AFNElJ87Cm9PJPxthgSpEiqgXYxTbMLzERr0PJc+zaGl/uU6hQEmihRqufGA7cmZ9fTD2i/jpVN+PPbPkW1W/wckqC0Y@lists.infradead.org
X-Gm-Message-State: AOJu0YyfKeXrcmmwOMkNJXleKJwiyWaH530cMXyaZo9UkMxTkYYPPZWf
	2wGMGIJqjM9o49mNF0nlOPFiaOqHgp7fLjpcfQLhrT9f9PuATLkY4wZ1FgvR8MDt
X-Gm-Gg: Acq92OGrNTPnHs8yU6bbvgFuSrvw5bUalOcOuzY6X1mbwtoqrgLKmX42MDvod/Xoo13
	sOp99PfBU8rrUsMcRi0uK1XKEfCHQoO9zuCYLn9rMYegJ/WDe3tAIUsrfH9kxABOXSC7XT4BNh1
	Ml1uALeNysbu30rf6xXASYigSgjgsSOnpDGCWCR+qF6reWENXMxYfUEI3WIV7kOvgeMVAVaYDt8
	Xd4hHc8YC8JQxHeGR1GEOiqvnFDZvZ9d/iXoi0YUeXrXB/5Culuh9HgPsomhGlY5O02ORlmwqRi
	NzyPB5PQBkRIf5wUhRw9DONLJCeqEIM9k2VQlZn/3lvdJxjoWLMxwGGJaxCpzGsCBgVddCbw9Hz
	Zlra3seOqZEgnJt/n5QGQLqiWXolCsRBDnGNMENahOi+V6EGEyj46n/lZjcjeTpVUEcWz8h1lkS
	Y4CyCYBQrs1rw3X3pyJj/FK2P/zIPXgS+ixjl7ZiqkFMhhDmOZ/5QsXOd9C+CZ
X-Received: by 2002:a05:6122:d15:b0:575:2ec0:2000 with SMTP id 71dfb90a1353d-575cfe9bfa3mr1010124e0c.9.1778569644342;
        Tue, 12 May 2026 00:07:24 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-575dcef092dsm72708e0c.13.2026.05.12.00.07.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 00:07:23 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-95ce0cf2d4bso3014647241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 00:07:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9M0z3gFIZN24pImE3TMcgs/cF2otojdwzWXNQ3aarpA+hm9rUgjPa8ZKHKa9VaupHGQ/xsNuT/qrWauSUaNlCK@lists.infradead.org
X-Received: by 2002:a05:6102:41a7:b0:631:5717:5248 with SMTP id
 ada2fe7eead31-635d27ded2cmr1082007137.21.1778569642797; Tue, 12 May 2026
 00:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260511211841.284809-1-ben.levinsky@amd.com> <20260511211841.284809-5-ben.levinsky@amd.com>
In-Reply-To: <20260511211841.284809-5-ben.levinsky@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 May 2026 09:07:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5UjAB35nPA9ghNm3J9oFavuEv3NHxkxxW3nOU5ZsMwQ@mail.gmail.com>
X-Gm-Features: AVHnY4IHIx-N6TjHjhDj_v4IyNJlawKxUXPhLNy1xplrNwtoo77SAjjbsdZbWCo
Message-ID: <CAMuHMdV5UjAB35nPA9ghNm3J9oFavuEv3NHxkxxW3nOU5ZsMwQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] remoteproc: switch drivers to optional resource-table helper
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-remoteproc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	tanmay.shah@amd.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_000726_051919_2F4326E2 
X-CRM114-Status: GOOD (  17.91  )
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

On Mon, 11 May 2026 at 23:18, Ben Levinsky <ben.levinsky@amd.com> wrote:
> Use the shared optional resource-table helper in the remoteproc
> drivers that currently ignore a missing table. This keeps the missing
> resource-table case non-fatal while letting other parsing failures
> propagate to the caller.
>
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>

>  drivers/remoteproc/rcar_rproc.c         | 13 +----------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

