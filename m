Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD7460A260F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 09:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FkVsRSa7;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Fh+l4PZ4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4X+P1B6aE29va33Y1nOTBGckjA6+hBF4dxDZ8irecEY=; b=FkVsRSa7+quT4F
	Qcaf9dGa6jyMihQ2X0va4mp9dfdq4I0AFTVIofp/a2LbhfNozJjvfZMGwaRhFDdkjDgS3Sj9samn1
	J0Goya1GmunTyQ4wpyJY0M8gLAn20j73LMaBeNGEXMkcJ0r3blabfe1xaPcZDnrpOQgl8ZXIP8aNq
	Cmc7Uq505u+bpMXkgH0hd64rh0Okq9sbOxM5T5P1P4NgFTUHcXMtY8y/plgGDwwT7wyfj215e1DkU
	QNLsyLyctbHQS7D0n4WKCMyh0EyQ2q2jWxcUFG2ZYFrItjMjNwzPjG1c+SoJapoDDr536KLfmUBO3
	oMuvg/oOs5JUwCcQ4rlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdez-00000004Ba8-0gWi;
	Tue, 27 Oct 2026 09:40:01 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdex-00000004BZJ-0MiO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 09:40:00 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-7c3b75caad1so2447531137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 02:39:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793093997; cv=none;
        d=google.com; s=arc-20260327;
        b=qzCYGnZ+9u/wHuWkUi72N+HhuLpChqbabbAN8JtUoBu7blWMkr0yPOjAR2QLhZ5wxL
         KtQJQdv9cn4zDrY52fTbKGsx+lSlWS9WFZX78X0qmNeuS52TDEWn+GBS4/SQg3QvDkqP
         EQRFQBukD7CxJpjHW+9vefqFx17yBUm/DtrGaZcUzD8lJcFf2LgjuFMGB4f+o42N6b9i
         orpT+HOjASIqZVY5n/3G0R1kiedbZNeJ9l/soNxpWPjdha1wip5/k5Jo1L20SssNaHks
         +QpkUxeHL47A+lxbzTttitYXDTnvYmIiWpUKMILu2Hz+YE9K/383rz4Jivfmw63MXvFa
         Driw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4X+P1B6aE29va33Y1nOTBGckjA6+hBF4dxDZ8irecEY=;
        fh=lv5yAS+Is2Gc3SuRXZUJnnWeVaiOfBSDHsPY2LhaClA=;
        b=ejr2VArdK1bPevoUyn667sUpGyi6UrXt7dKHEYkYmH3NMTzhMRVYYJKwjf60aqz3MR
         mS4FNl00ym0VwJ/yk3GjBir7nAp3Iqx0X3+Fxua7tbv9FIhoJ0XGCx6ZMLAZXtk5oOPq
         f0jDicwOlr4k/oMJzRp+9Q0hiAx+nXnbdBVqvhMVleuOUQ3l7pHTHm54KXSUQRKd2dNl
         8s/B4mEGVpwheX3lnHhOr0nL81bcwo05tiCFGAHQi8aaoWtjDkS9Ah7zLGiXPK/+8gLM
         /3BCZoVbZUTQUdziySrH0+AzloCJ2Z/HrzX/Kjkjf6ByByz4aMlhPNOzb/ljhEicPUH7
         8DAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793093997; x=1793698797; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4X+P1B6aE29va33Y1nOTBGckjA6+hBF4dxDZ8irecEY=;
        b=Fh+l4PZ4IqY0VZzudaxuRIMHTtLUjuFFyXeTvYWWY4IsnUJnXiCyxbfeZk8C/RgnFr
         0EE952P9LzzSfgc/zxHZrAhSQ3UxmsMdi9+/mpFQW0XotolBUwYEQ2uvjiuWsr81JEf6
         0IjCbms1+9p52Bz1EYAvdq6NLAsLlvLWQFyiN1wtaP/CtXL26IRa63W5sG95orpdIzZi
         Gx4TAxYI0anS4QFUnop9dIBjkgqj+xLkiNErKDmHvH2/J5CYP1qya4cCscgV6eGXLnHx
         KguWn2pdbqH8svdFcWkeQd+18DBteCiIy6tQjAVBcX+QyD5vMKj18BPba7QvOsk2fyl2
         9b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093997; x=1793698797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4X+P1B6aE29va33Y1nOTBGckjA6+hBF4dxDZ8irecEY=;
        b=l8yFmRTAMGIeSeRP51eML91SSfzuAbSQnuxwRReeB2TiTekyrHi99Ho8QBMTHUqR46
         UpcLs0Zbrnp1ooF9fqYVyazNz1Ory09mUtejldDtswPmOSsk4u9+OaWtjSyUzIlMetfn
         Peb4Vx3kbgpc8y0uMCxkY+rZDsJnFQW5HV2Bq0e6hSY5l6yh5mRJWox9yvORNQCuPBbm
         uhFhW/A8Exkc8P1txDsYVMPBfZPqktIahBU8lxLCB92SAV3UUqMhP4rUh3ETopMo69x8
         RVJW1dvjBFGlvpA3eCyLVnumiWuJks+Rh/gMwZaje5hvj1qLFEYHJbBwlxWtlaMjsqPK
         OoIg==
X-Forwarded-Encrypted: i=1; AKwUvByN6le4mnUWhi71eNxpPfNS+sjqt+WY8VNL2OS/bpDloVaH13pqhsD2tt3zgY0w3SCnUJf5JT4aNtWlY7dgdTbx@lists.infradead.org
X-Gm-Message-State: AFq9FYLNpgVJZDylwGl3YgXDqUW9DSPnJs/OPN+0WNG0C3anuQ6g4l11
	wP9NF3xVDUamzu/0rGTDY5FP21/T2eK3Bg9+b/a6BzokPEDnmOkuN0d/qWKklnj79Qum0lViiDf
	aZST/aJfo/lRkVcCsX1xE8Qv92ZFTO5w=
X-Gm-Gg: AYBFou0nsQJwj7IgeAMiEWPohWFhfeUSgDyjsu5Y9nIAsT/9y/qz+f3l4Fhf7kePCIW
	iE4rsr7sBFFEOso/GZmLL3zn2gQqBCO5Hd5EXXkkxlXu6pag/8Jrx4zgNkpcprXiYTwfLdjVXaz
	VPFw7gl5sJRrneBEpMBWcUqIsLoW4Zq1qmQnn3NCldwZy2YLuvOuDPT4DR/FUzWqWTeo6vplncD
	rCY6MTQIfu1DXXk5o/mP9mpjLJQlrfBykDNI2zCBZMDT8z5a3fpzCUU8xW/o1DVp0i3XH0Q7Xym
	T92xs2fdYbrFulBj1fM10WkFjeq5sRTEUP8gxXwPi4mmIGaHOvKuP2fAL+nHSFv2E2NdeIzaYx2
	btFW2WpGJGHT6eeOgMtlfkt1lkVcbF0qJpHeZ2IBN8vEsW+kgkVYp6pV5fuvaeWnqJ3+g21QIZ3
	EfZa4DCXtZSd7XdPA9EmNLqLwvp4NBMnVBWvMPS2YzxbNwDiT96sVGQhm/BYnh3CbEsIucvWGQn
	VwKnCJL+NKnnkqwxFE36KORFu6HBQ==
X-Received: by 2002:a05:6102:c8f:b0:7c0:4d52:8cc9 with SMTP id
 ada2fe7eead31-7ce5cc8d55dmr2986698137.14.1793093997186; Tue, 27 Oct 2026
 02:39:57 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
 <20261024-submit-h616-uart-fifo-v1-v3-2-286fc1b8c3c1@gmail.com> <20261027-nifty-reliable-octopus-6cbac5@quoll>
In-Reply-To: <20261027-nifty-reliable-octopus-6cbac5@quoll>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 03:39:45 -0600
X-Gm-Features: AclHuK-P2vZ9SIQ1kD5xtHOmSa1lugBkFh7TQdGZgeHlLBc3Sp6mnxkEd0joV1c
Message-ID: <CADvTj4qrBYSyT39=xK3_oGgHdFoSH=oyDvTtLCSzW=F9KAgi3Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_023959_176063_AC5BFE7B 
X-CRM114-Status: GOOD (  22.23  )
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

On Tue, Oct 27, 2026 at 2:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Sat, Oct 24, 2026 at 02:22:24PM -0600, James Hilliard wrote:
> > The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWa=
re
> > component parameter register does not report the FIFO depth. Its option=
al
> > register layout also differs from the generic DesignWare integration.
> >
> > Add a specific compatible for the integration and allow the standard
> > fifo-size property to describe the capacity. Require the documented
> > 256-byte size for H616, retaining snps,dw-apb-uart as a fallback.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml    | 17 +++++++++=
++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.=
yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > index e2ca126d58ba..0f8fd0485879 100644
> > --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> > @@ -13,6 +13,18 @@ allOf:
> >    - $ref: serial.yaml#
> >    - $ref: rs485.yaml#
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: allwinner,sun50i-h616-uart
> > +    then:
> > +      properties:
> > +        fifo-size:
> > +          const: 256
> > +      required:
> > +        - fifo-size
>
> Why do you require fifo-size if is const? It is implied by the
> compatible.

H616 has a fixed depth, but other sunxi integrations have different
depths between UART instances. For example, D1 has 64-byte FIFOs on
UART0 and 256-byte FIFOs on UART1=E2=80=935.

Should I keep this explicit for consistency for all sunxi uarts?

>
> > +
> >    - if:
> >        properties:
> >          compatible:
> > @@ -60,6 +72,7 @@ properties:
> >            - const: renesas,rzn1-uart
> >        - items:
> >            - enum:
> > +              - allwinner,sun50i-h616-uart
> >                - anlogic,dr1v90-uart
> >                - brcm,bcm11351-dw-apb-uart
> >                - brcm,bcm21664-dw-apb-uart
> > @@ -120,6 +133,10 @@ properties:
> >        - const: tx
> >        - const: rx
> >
> > +  fifo-size:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Transmit and receive FIFO capacity in bytes.
>
> Drop property, not used by any of the devices here.
>
> Best regards,
> Krzysztof
>

