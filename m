Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A0A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jvXkSI6j;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cXSB3RCx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ldEQiD3yYw9PYXG3yEuMCLLnL2/Mwr5f7MvpqEQVi2o=; b=jvXkSI6jdS7BiE
	pJKKAZ+VkGRvotAY0l2IdNaXKl4NxN5qggloWRifn+eTUzf7b2O3nqBitAk4lRKS7GcddrppMXj99
	4kDyt3d0itKqGx4VlPsdvcpVtK4KwYkG9N/c0QWNrrvSdBkBrh+WnEYnEOZ5a6wPApgkDPZLT81nT
	Jl7RnycmC3cEHva7l0BhJMw3EPYsM7TC+Ana8q8Iazp8HvW2C+Dh1+W0GITwmr9o5mEE75gmTNbLx
	wtmxaZ/Hg7laC9dcBxO6JkjLtE6q54wPky9Tj7gtcVTIta7w+QH9Xb6Le+ZGjdvzz+kVJEpQZmANV
	QPoTZg9OfszidzRBR/HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnsZ-0000000Bsly-0E51;
	Fri, 30 Oct 2026 14:46:51 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnsX-0000000Bskv-0p23
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 14:46:50 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-679e86015e2so2102519d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 07:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793371607; cv=none;
        d=google.com; s=arc-20260327;
        b=YhVoZXbuh6wdG2BH/eVman6fIPTO41qVmVkv3NBgWVfRsahM6BUKkTz3nGqN/UVJVX
         7SkY9ACTGRhneqX/vgWKNPqo7J6hAMauPO0B9r/8ov2XF095xNGTG0DyTDQmG0bPE0+d
         8HEhaVBex+RbRk4aMu3sQ7FuVa6xgTRBXRg1h+6jUpDx4kT2xWsmgdTR6iiopnpNCdL4
         Yz93JU0mlVFF6+vMh/WgepjDKBoUoCRkBk3VQpIJW1dnLIM/dafNjQGimBB4x5tM4lPa
         ETqsOcfOY1sKP0zXjKTTNwg0nlG6p36Z5/Wk+oeRSiigodFiUcAQNK8aGu2xzO+6vjXg
         POXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ldEQiD3yYw9PYXG3yEuMCLLnL2/Mwr5f7MvpqEQVi2o=;
        fh=CFgV/UIYWSPs6mocS5xeDc3uX3LXnvrAcBveOXyoCv4=;
        b=Fg9l+LnXWeVfd00cvxs2LnPuNEZmAMfyyOn5ophtIn+hXuq0DNWQWan4Uv6Z1Mx+mL
         WUbtSDkaDopxSCjEoe5A0DdSLLnm4f06bQxPC9vb29sPbyq4cOzyome8q7NP8eksYAyb
         Xan+FcZCVwuIzSPIQwMUngyEH+1wD2EirzyuKK5G+pRXpw49k4F6e8WsmJx3pSgHVHnr
         ow58taj/q9gNnBWHD7xI89O7wSbN49Pi/vjTHasx024VxJFUW/KPTXcmKhtIirrpKevh
         aFEUnzXO9MzEDqcHxDa3SKe+wIAMG02ECbb7r7ji1PWOWRLvD1WG7uewq7gqX88wf2pE
         zObw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793371607; x=1793976407; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ldEQiD3yYw9PYXG3yEuMCLLnL2/Mwr5f7MvpqEQVi2o=;
        b=cXSB3RCxbhDUFiCj1Q8B1/jhaOsuaHU6D0s4/9bN9dEgUAIyStDkCNRnaKJ7bDb+ht
         w/+VcyULVA+FgrnSi6J6ZzSzJ14kuMlJ4vup6shNwFxlUZwQbpsWMXl5YnNH5a4pChYL
         8DET/SqWOu/N3eBzBYAGQXEmJgKZZZGW8/2nYIutsRkH5FzdpWmuxUke4YSfG5e58TjY
         4wNdQ8vSYTX9n6d6dcN5HP4xfgv/JEZSW5kt1bvWoaU5vxKVMzDNXPME8QjHColrwNOO
         aOdISVATfbeKZsSuaP/yPM/+CosNmbNWEWS9Xmy7Pyi9a0gaqpMqiWNgoZL7JYipUCME
         PQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371607; x=1793976407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ldEQiD3yYw9PYXG3yEuMCLLnL2/Mwr5f7MvpqEQVi2o=;
        b=TnpSdgw5wkTY3KqDr4Zeemr/wB1Q/0zgP2SaXG9V2mn5HUy+TlC4+JbCobD1ZfRmFh
         fmijEYrkRO2oTMCwUpIPoWmdxmyo1YKnLtqE42xgCkRtdr2TbFWpV90fZ0QPZy66qt+p
         WCP+MB69Buz1am+5F859rKAEfg6oRWYAOIY/9QjekbcV0bbue5U/Qy/uVTg4U6KqVEdK
         Yq+LHNm+YEzGPNriYW0mYLFyOlyNj3k5HKKnFGYDZqKCuqhIr+kWcNb0buqDtnH848tf
         usTjJ8IzKTfmt9zkEgfSR59aOsksfUmEHiWiHxHudg2vqvbBsAFty5ghFGAaVcWRU79J
         oG9g==
X-Forwarded-Encrypted: i=1; AKwUvBxyhekEUMpAsCLwGrB0FvlV1piEUdETi44jCMqMghMR8SRAx6pq8ShQqVRNLGV/OIHjsa0nyhT+jKFImDSfBSLN@lists.infradead.org
X-Gm-Message-State: AFq9FYI9uwlRybWp8qTw7K+r0sJfcG7RbA0lQfXxD3uZTAHTMbyauMcB
	McROtC05v8SnuXORbgATVoi9hVhIrOovBPQvZxUdDPgaSTd9j7oFK70MH1pOhk2XSAg59iPNu8m
	i8b99b5OhYu6a4yzPMk1u6df9/cvZdKU=
X-Gm-Gg: AYBFou2eZ/0W0UJ0mM5eTsIEWlClk64pzjC1fiiho/30ORFSRYOdQZ2B6rKSiOdWuvf
	PtSiofENygmrHvWrBDTtezqinOGA1QFcwAIvfIt8Vuo3UycxwH9ZlsoDRAlYhf28i6ROsqmkXTh
	6gPp/m9bvD+QvNnDYuwsJMjpv1m6usObasC7qpbDhHyFLQcNPcdnBJbxTtqBIkzpjpA/Ke2kSw2
	O/+FqjqpH5p+LKf6FBVeOH/2Nz+SWz9G+EB22SwXt0RpBvbUjCAGDYxURnaGbc+ZTmnaElol39o
	+YyZfTuWUUFeCQyvTa8ut6hUY6cY2TTpUawCId822DwnIfrOcCbZupmfqb58vs3uAR1l3N1Hqk9
	eZSkLgw82vkDXx0JrtqtkkIMk7lNve/i3vKat
X-Received: by 2002:a05:690e:11c6:b0:675:6c29:c985 with SMTP id
 956f58d0204a3-67a8d3dda68mr4094771d50.22.1793371606158; Fri, 30 Oct 2026
 07:46:46 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016125229.1798791-1-thi.zirnstein@gmail.com> <20261016125229.1798791-3-thi.zirnstein@gmail.com>
In-Reply-To: <20261016125229.1798791-3-thi.zirnstein@gmail.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Fri, 30 Oct 2026 20:16:34 +0530
X-Gm-Features: AclHuK-GWiL1q4_WovgWSO5m2eQecD3gBL39B7xCULqbPJrTNpg-6D-hsXEdOeo
Message-ID: <CAKfKVtEOOGsJSV0_im=-0u=N=fxkDuCMnAzt=1ZfBs4A4rg_0g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: i2c-xiic: fix waiting/clearing while atomic
To: Thilo Zirnstein <thi.zirnstein@gmail.com>
Cc: michal.simek@amd.com, andi.shyti@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_074649_245438_ECBC5401 
X-CRM114-Status: GOOD (  17.20  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 16, 2026 at 6:24=E2=80=AFPM Thilo Zirnstein <thi.zirnstein@gmai=
l.com> wrote:
>
> Use non jiffies based waiting functions,
> if in atomic context.
>
> Suggested-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
> ---
>  drivers/i2c/busses/i2c-xiic.c | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.=
c
> index e68e17bdf0ba..fc9a0628cb67 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -359,16 +359,28 @@ static inline void xiic_irq_clr_en(struct xiic_i2c =
*i2c, u32 mask)
>         xiic_irq_en(i2c, mask);
>  }
>
> +static int xiic_poll_rx_empty(struct xiic_i2c *i2c)
> +{
> +       if (xiic_getreg8(i2c, XIIC_SR_REG_OFFSET) &
> +           XIIC_SR_RX_FIFO_EMPTY_MASK)
> +               return 1;
> +
> +       xiic_getreg8(i2c, XIIC_DRR_REG_OFFSET);
> +       return 0;
> +}
> +
>  static int xiic_clear_rx_fifo(struct xiic_i2c *i2c)
>  {
> -       u8 sr;
> +       int rx_empty;
>         unsigned long timeout;
>
> +       if (i2c->atomic)
> +               return read_poll_timeout_atomic(xiic_poll_rx_empty,
> +                               rx_empty, rx_empty, 10, XIIC_I2C_TIMEOUT,
> +                               0, i2c);
> +
read_poll_timeout_atomic() expects its timeout argument in
microseconds  the current one is jiffies. Can you check it.

