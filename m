Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31AD607A3CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 18:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lc6YkSix;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i9ZbVzzU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+gQ5Cuyj8b/949TwI5RgIKdEjddDg3DiMb9qtnYfCaQ=; b=lc6YkSixNcS4Rn
	cXqh/G1aUJbeKmRzYd7KYJSPLupB+cc6zOPE138jGqVh1hcbURvPmO3sO/RlvEKS1jBQVBuFhtGWe
	ZrzIV3LwfxUNkL5VgC0YzEoAvWIDpP9U1+Jr3yJsYNOmVcwafxBxCHP/LfrdcSQ0lKJ4H9Nk18UUV
	MLhu7d9kIaEuU9lUeUiYNRKndqKmjnrjnYzA2X0gacYyOY7QfWksgRenf9cIJ5r9pzcFABg2ZZBYA
	D39HW94VAuo4zMgRSxJdz8FNps0jKT2jaAkN1iDe2v0Al56En7LCgsO5x62Y1SbrqmpPonzUkXDqq
	ysQIZ1skjQ2S14KUwUSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfOv-00000006M3Q-08uy;
	Wed, 04 Nov 2026 18:07:57 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOfOs-00000006M36-0CDA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:07:55 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-5eafb65e204so324245e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 10:07:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793815672; cv=none;
        d=google.com; s=arc-20260327;
        b=sEHtqFH7Gc2XAQmEyNoLKHORvDm5jg7MVaR5yRl/IVn3u6BtkmOQIPS8qd16oRY5Ta
         07x0O98mIWIp6PDKlUlVP9+ttFZj5X+kJLJUH8VCRO0PNIpulzSWg7pUWOgn2mo0nO80
         Xt5vjjGC0pCNHHrsDd7IY6CxNDlYX+P0SrShUJTy3ofboCOyLjg/Kc2ANHxOfUtCqDS+
         u4TrRP596KshENDtYxiJCP3satv4wfsBYhsa46EabFi7jlxgynzQVp0zYc07yLukFuu9
         Mkle7kfwY0yRS4HweiZz4KfenPD2IshIskwqU1WfYwC2G6CUh4aLOT0Pybng6+0jo5iJ
         trjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+gQ5Cuyj8b/949TwI5RgIKdEjddDg3DiMb9qtnYfCaQ=;
        fh=UZsrhjCStC/a8Qtt+H3smeb/x0Bi3FtXiZ20uwS+5kA=;
        b=eCh6AZXSvcYdS1Wnkqm3Y8ayzPp97lPQnBbOEQJHgnR9F49xJ29KdYBl6NpXc34n/4
         u0diMC0hl6wpXAVyEN3KWDJnkjBcxICnZd0Evsvx2fhNOw/LkYEJdqmqb9dsoDWxh6iD
         zB9Ywek44fMwgpIYF6iRtBQ3NBo5n0Ddj6Vihm/KTgWGLFYi9ALy4Cye3tDWeG+47CSo
         7j288nSqsgXcW7DbVd/OCqkXH50Ns8UpTxIHkR+EXhVcQSCatSsUljPdZ8iNNx57IkL9
         SVxkoycWAwovAzZmDus/DUK0Gs5aTPJ9/ndmvcbQt6ywrB73sSenbh2JeUaEOsE0tpdd
         bZhA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793815672; x=1794420472; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+gQ5Cuyj8b/949TwI5RgIKdEjddDg3DiMb9qtnYfCaQ=;
        b=i9ZbVzzU+lx47yAhRVX8wvbwn3ZkH2TnhfyU25PIXYMsHLoQlsUNOVJYv9quLD7qVd
         cRBWHUVV2nRa5z6HP/DmT0QSsl/ieMLssF7lQ0xG09jGXAMDzLnvJEtdOQ6TRy7Trgd8
         VjchouoPZ3tBO1DzPuuBXEgwhKX9TGFha8RwDkiUXeDFQtNkrUh1WoWIXN5TJ8lp4h4N
         XiKtekDIm5YdqZ1JyolpmnjJTPNxImEKiOFun9xoghHFTeobic2pWWcNeApOApBVYiiq
         Idoj8SvJdFpxa/0gngUTv4cqaOgSsN0Cw+4dYZBNKqQ7XLIR1TTuXs/Nqsl3NZBcTgOM
         9R+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815672; x=1794420472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+gQ5Cuyj8b/949TwI5RgIKdEjddDg3DiMb9qtnYfCaQ=;
        b=xicJQA2pk85V9Ijs2L5ZzAfmuU68v/6WPxANc/aVNF5GyF/Pa90KsvAS3ipamDxmCU
         NXSoDsgdGV4JaxZKCLgaOhtcyzNf+YEXw51q9Vh7lSVGFgLFhy8/L5466XjLMFTC/q0T
         t0rkBCjhxJ0saMpq+puGCbbdxOnVtxBj7pLQjBpADSRGPecr9ak36MezMRgBiZdBHnt5
         vfRgQfef84z31f/funMIVVZ7DUGL8ummrD5dnSkAk+xTLj0RnAEkNb3dCuYpsxJIqPnn
         SNlPcxtEYmfueCkSKJ1+BZlG+fYEv4XzZKpUO6g38sUMD9dGKqFzrKNYYb9DrSx8H/eX
         xZrg==
X-Forwarded-Encrypted: i=1; AKwUvBxPC3LpqXpkR12Q0QEvqmdWfOYlRiM2etKBMei1WFnh11gFUQwA+kJpDn3usR8Am47iOgriMLjY+9T+B5NcnrGI@lists.infradead.org
X-Gm-Message-State: APuU4Z9Q6+HFacZIubcU9BJeVnlZnftnnCHU/l6oBXRTrJ69uGyITl2R
	Kx5P9NsrhbVpRnz1msxh4ELNAfZhWvwR+S3FM6TX9cvPogrkXdkJZBdcuX6BmlEeYKRofn+c+Hh
	Nk1isRWUVlUO2OqK1lX5gPT9syuOB1M4=
X-Gm-Gg: AYBFou2miXTtxF0ldzAYFDYeiFrsCpRjzGNgI+KEauSMy4KMrvZV9rZJFh9+QMkXeMq
	sz8ZwAVFSXBetE0YC7O7jsTqxn8esBlXSE0Ya3XeJaUU5UQudF8spjitv4OB4/10grx6yQMvLkm
	ivcUdLoA19e5e5WBJR74HpydjXfrj5pGSJYKTLK2kIatzcK4gJjW8WlT/DMMXNWCY3k3+8GUt6v
	bwgUMfFQ8NGtOw3WnRZA/e2QylMHE/e14x3rQQgSu7wVI+3eimqFmZzWNBpmCuuOzpx339M24Ne
	EL61rjR1ZFwmrvEfx8U5SpKmeFk65sgsED0lzIA17g4VM51Tv/JjOTI1pxEmH+s9PznzzOYyHlf
	DjqvppudRGgjmxq00g7fsW2T7iHCXpDDDa8w0tCSfpe57fvwnIqEMzgrP0//6yLJs0j8+nSYw7K
	RxXiXcnzRYHrKZz2S9B12qDM0vpuppUERwjsHGjccg5wW0g2hjH1BJjlUa/5XzcRKbQU41XDQo1
	2You7JJouYfbxxQ6FMPgttDw+gCOHG9r6pd52g0rU8np0hCNco=
X-Received: by 2002:a05:6122:1794:b0:5c9:a60d:3275 with SMTP id
 71dfb90a1353d-5ec6894bafdmr7258349e0c.9.1793815672343; Wed, 04 Nov 2026
 10:07:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
 <20261103-submit-h616-uart-fifo-v1-v7-6-c9e248d685c1@gmail.com> <32461e0e-2512-451a-8eca-f2df63553379@arm.com>
In-Reply-To: <32461e0e-2512-451a-8eca-f2df63553379@arm.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 4 Nov 2026 11:07:41 -0700
X-Gm-Features: AclHuK8w6f78lagZOCqY3kBXvDEG6Z5rWFvxVoRwnTwu0OTjK9VJe-pup1TnDtw
Message-ID: <CADvTj4qPfWo=w0khBM+vPfT4vxCJVBQsqzAE3C9V+2J7fwq9gQ@mail.gmail.com>
Subject: Re: [PATCH v7 06/12] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_100754_163378_490B2A0E 
X-CRM114-Status: GOOD (  35.36  )
X-Spam-Score: -1.9 (-)
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

On Wed, Nov 4, 2026 at 3:59=E2=80=AFAM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> Hi,
>
> On 11/3/26 22:39, James Hilliard wrote:
> > The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWa=
re
> > component parameter register does not report the FIFO depth. Its option=
al
> > register layout also differs from the generic DesignWare integration.
> >
> > Add a specific compatible to identify this fixed configuration, retaini=
ng
> > snps,dw-apb-uart as a fallback.
>
> I think we should not focus too much on single SoCs here, all the
> Allwinner UARTs need some care. We should have had SoC specific
> compatible strings (plus the fallback) from the beginning, but we
> didn't, mostly for historic reasons and because it just worked (TM).
>
> So just from looking at the Allwinner A10 (the first one really
> supported mainline, since 2012): the manual reports a FIFO size of 64
> bytes, and it has none of the DW config registers.
>
> So I'd suggest:
> - We add compatible strings for *all* Allwinner SoC's UARTs in here,

The current series covers H616 and A523, but the setup is structured to
extend to other integrations. FIFO-depth discovery is separate from the
shared DesignWare RX-trigger calculation, so adding another compatible
does not require duplicating the threshold handling.

> regardless of whether we currently need a quirk for each of them or not.
> This is now regarded best practise for DT anyway, we just catch up on thi=
s.
>
> - The FIFO depth is all over the place for the various SoCs, and most of
> them do not implement the CPR register to announce the size. So we
> should use the already existing generic DT fifo-size property to

v3 actually used fifo-size for H616. Krzysztof requested removing it
because the fixed 256-byte depth is implied by the compatible [0].
That is why subsequent revisions supply the H616 depth through platform
data instead.

The earlier discussion also covered UART instances with different FIFO
depths. The feedback was to introduce the property when an integration
requiring it was added, rather than require it for H616 in anticipation
of those devices [1].

A523 provides a different way to handle that variation: each UART
reports its depth through FCC. The current series reads that value,
rather than putting either a per-instance size table in the driver or
fifo-size properties in DT. H616 does not rely on FCC and retains its
fixed depth.

Linux already reads fifo-size into uart_port.fifosize, but supplying the
capacity alone does not handle the other integration differences. The
H616/A523 setup also avoids generic optional-register probes at offsets
used for Allwinner registers, and installs the FIFO-relative RX-trigger
table instead of using the static 16550A thresholds.

Older integrations with a fixed depth implied by their compatible fit
the same model as H616; they do not need a discovery register.
Compatible-specific data supplies that fixed depth, while FCC supplies
it on integrations that expose it in hardware. Adding fifo-size in
those cases would duplicate information already determined by the
integration. This is why the current approach uses those two sources
for the FIFO depth and shares the remaining setup between them.

[0] https://lore.kernel.org/r/20261027-nifty-reliable-octopus-6cbac5@quoll/
[1] https://lore.kernel.org/r/18f1e637-48de-4962-8a13-65f6597eb2dc@kernel.o=
rg/


> describe the size. This is the simplest, yet most flexible solution, and
> avoids hardcoding implementation specific values in the driver. And it's
> friendly to other users of the DT nodes, be it U-Boot, the BSDs or
> whatever else is out there. IIUC, that should already work out of the
> box with the current Linux driver?
> Since we need to touch the DTs anyway, I think this is the best way forwa=
rd.
>
> Cheers,
> Andre
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >   Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.=
yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > index e2ca126d58ba..fc1289073241 100644
> > --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > @@ -60,6 +60,7 @@ properties:
> >             - const: renesas,rzn1-uart
> >         - items:
> >             - enum:
> > +              - allwinner,sun50i-h616-uart
> >                 - anlogic,dr1v90-uart
> >                 - brcm,bcm11351-dw-apb-uart
> >                 - brcm,bcm21664-dw-apb-uart
> >
>

