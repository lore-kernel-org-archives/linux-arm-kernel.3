Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB6C606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 03:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aJshq4PX;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a7E0t9bo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6gwoAmnbvIGLb369aZhQcsWZKGDZfmCyKvu6i1SBTsw=; b=aJshq4PXlAeiIL
	QmcWq89pEGDT0ZPWqsvEWXSl3nbjCc8D3Ts0zESCGU3le7kyk9gB8Gfpqskr28pC5kCQBhCWU+7+z
	MmU9nbvdgxr4zrpyAWXxF5pLq8dXZZDegg7Xp7vqAsEisitEQTqTU/OzIvBBObP8rz5ptinv5Fq8F
	NkU0fvj8jXMYkndMaJRNwkUWnPlLS+5bRL/McgYO0D1j3VNj7x26fbk2j/xPP80U8e4XAzveFMR6t
	3Ewbo1n+coQBYclg2K6T09LPWf6hFJWMak07mmBQB4btHKtV9gsv/07RbCfWNcCx4blUw2tjU0ws3
	ZNYUSUUxCR9/u0HUGx3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLtw7-0000000685u-0zbZ;
	Wed, 28 Oct 2026 03:02:47 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLtw4-0000000685M-1T1O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 03:02:45 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-8ac4806e210so4283597b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 20:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793156563; cv=none;
        d=google.com; s=arc-20260327;
        b=KBk8R0X37cg6x+kl/+izbc6MexUPsrpt1n+nQq/eSSiudr1K97Ugeu0buLmAzkW3N5
         2YnnicrarVhYV4qzacSKrA/+1AAjnZDX7NCiYdziMfquHZxBBdms1Ug3Y3WGDDFakF82
         AZoNEQCsi3QS7oqTAQVumvd79RzOThEMg9JQs64chiXS7JLeGqvq3RdhF7ZSKJLNQb8F
         49AIVf9empdtkZXkHe4qYhDZIePD3hZ+tKt/OqmXSrG86BaZ7PVfftFuT+gZXEKsUgdz
         O19T2p6TtBBPXNwgPEiMQydPvzFBvausXv4PlJHGWueId8RjUUyD/JFafi9zqJ3l2fly
         kB+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6gwoAmnbvIGLb369aZhQcsWZKGDZfmCyKvu6i1SBTsw=;
        fh=uEKQsqDkWI99c9ugcEH14ZH5EMVP2MLm6hWC94Jcd9E=;
        b=QiBdqkAXIR0brHV+xyM6US66bigygfxANn6zqLswEeZ9MGYTLqIBwKDtYOkLls0R7l
         ROWpyJnCEOsiX0IGfZrGwkUbqDxzE5LtViMxHqu70CJ0/uGgh/NFe9wDU2E4Kl84wLOi
         AY1wG9A2TkfTe7/97SWPyRk5vqdOGdQhJumT7zzJxPPFsVTW5s6dJ0IL/mkImeMefQ1o
         CJCGy+MzRh/MDYfhKLSotmC51ZZkwDuf6F7SAqlngxpCMBkSwuVpAHECq9gII9r8JVgv
         PyMS/HMMvI3Qrbpk35OhtSmxdPwng1FanMQeZfMSTXwpwzo6vq2BnJtFU3+rJkhtirSD
         9TiQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156563; x=1793761363; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6gwoAmnbvIGLb369aZhQcsWZKGDZfmCyKvu6i1SBTsw=;
        b=a7E0t9boWt6AKoO1tGxcFj5uoqvwiZ6txBvpkKYrZogobKnt5KJ4RCgXRFj+tkYCr9
         Px/2aHNpAHAR6vCu4kSqDWaA6NpbwyDqWhfPrzahd0cs9menSCDt6uLmb8Io0MiU561z
         k8AyOeI+WD07XSs2SqdijwBWZNV+w86qvk6c6Wn4+QyqsB3Z8OBlsA1Cpfzx/jraNehC
         08GbzrDrdW/OcLT/pSFbTRannO0uB7getfI7mYOka3e9RISlm0MOIkp+/KmXTv7ANM4l
         4k9x3jqm1c8IbVGSYVHz9gBY+wv1f24pXiY9hIiScfGX1t/HwW9CQ3MGj8THtBdWQ7Y/
         ksOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156563; x=1793761363;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6gwoAmnbvIGLb369aZhQcsWZKGDZfmCyKvu6i1SBTsw=;
        b=gPCIVplhqMnQDIBdiM9O/hicF/R9iVS0Az8yMRXdTuEjileK8XGVvJWr57oYKFMQbn
         LZrxwz0ca+28HlGh06SKT06UtvvWePkO8S25KsNN0Ut+XbFk3NVtFi4OAAP/9c1aI9nz
         jK9tJ1K7yTJz/1ShbJXQWwUTyvtr3MmGhyV1OR/sEdpMyiDXnz0rLu3NwFoq+e0jzp+C
         Mp42vvhIGZbVCJ+LTtRGPLbD8nAb/kaI1SpdfpynLpL6QIRXW3WcmfQfaR+blcWz/nmO
         d5KLoW/fuVcNObHcEIAZLXUYIC9f1Lu82Gd7dwA+n026IiX2GVsOaOGfYogkvVRMQcja
         zfUg==
X-Forwarded-Encrypted: i=1; AKwUvBykxFz7jPExsAc/wdeBu7P5k8Jl1Gt7evX+BZRycCD+z0YJIcw0GJ4FBToUWd+DA22X88ngwQlNdsz8gBE1+Kcw@lists.infradead.org
X-Gm-Message-State: AFq9FYJSJd4R0mb+RSKtj6snM1EgZrYvsc4+Jg7Y4dK44jUozxye0nCW
	KNvVM6RsLTrqimK2trFboJzQ0AR47QCXwVm1tgZ2EYhf7ntOzp7YdYtS9NUChcis9GSlFCEWAfJ
	kgMVIsDL6lLKx7UQbF/1JhuiSQ6firOg=
X-Gm-Gg: AYBFou27TKu9OJApptN1Wb6+8RKzAuxcv5Xn2KV7UrBoIFpHvqPyOex5nBuOzOwr43U
	al8ihhlEBSpymqA1FFQA+P8nRX/bNQJQWs/mkjYCusXt+dC5bEWwLtmTk2P7YlVIq47+e/f4ZhV
	wD/uO/unXyO2IcD4oiiV/3tOJvvOVi3qOcpdTLtyr1BTs5SWG0PZ1XtPvN7tnfOCWz2HkwL+Rdl
	g65udmeOCrtqs7EPWVCgZv1uk9zkZaDtirr8mJxEB696R66X4x+bN5abQLEp5dKqz45BoJtwFFl
	1Sb4Ivz92sRA+sBQ8zMbUjGX6YTuje1qaYAyz8nbzSx0rN5xKjJDF88lrerkK3hP85AZKXqYxzH
	Xr1giCNQwBSO1AeCrXi6BAnpnSiwj2NlzcFKd
X-Received: by 2002:a05:690c:930c:20b0:8b0:893d:ccbd with SMTP id
 00721157ae682-8b1b5c7066bmr6133407b3.12.1793156562747; Tue, 27 Oct 2026
 20:02:42 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
 <20261027034911.99482-2-prasanth.padarthi10@gmail.com> <20261027-savvy-powerful-seahorse-cc1079@quoll>
In-Reply-To: <20261027-savvy-powerful-seahorse-cc1079@quoll>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Wed, 28 Oct 2026 08:32:31 +0530
X-Gm-Features: AclHuK9lp_o8SK5eEXhK6dRTkFSMinl_ZrlydL6PeVvJqMGdIxhaqqqLV4JoCCc
Message-ID: <CAMFFDGhdzegMGoajgjfX8FRTBNF1p5VJ9CCcm9pPEVCA0xibQQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_200244_418642_B3BF962C 
X-CRM114-Status: GOOD (  17.83  )
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

Thank you for reviewing. I omitted the earlier revision history and
discussion links, and placed the compatible incorrectly.

I will reconstruct the changelog, include links to the previous
versions and reviews, and correct the alphabetical ordering in the
next revision.

The intended changes since v8 were enabling both ADC engines and
adding the IIO-to-hwmon bridge. I retained Andrew Lunn's Reviewed-by
tag with its original scope limited to the MAC0 and MDIO nodes.

Regards,
Prasanth

On Tue, Oct 27, 2026 at 3:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Oct 27, 2026 at 09:19:10AM +0530, Prasanth Kumar Padarthi wrote:
> > Document the ASRock Rack B650D4U BMC, which uses an ASPEED AST2600.
> >
> > Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b=
/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > index b7e70868e..3e6133e2b 100644
> > --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> > @@ -79,6 +79,7 @@ properties:
> >            - enum:
> >                - ampere,mtjefferson-bmc
> >                - ampere,mtmitchell-bmc
> > +              - asrock,b650d4u-bmc
>
> That's v9, so where is the changelog? I see in cover letter only v8, no
> links to lore disucssions, either.
>
> What happened here with previous versions and reviews? And why is this
> placed in non-alphabetical order?
>
> >                - aspeed,ast2600-evb
>
> Best regards,
> Krzysztof
>

