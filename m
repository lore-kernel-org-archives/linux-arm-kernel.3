Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF22606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 22:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zIdrGrCV;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XevHxYNE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=foMtuJXLdxu7UI1j+IPfbjutuzhkAxYfoH1ISosJmU8=; b=zIdrGrCVrk+nGa
	GBouPPPxfA5CQV/zv4end3nnHtciAN0US00ftHFDnoq4Zbq6bnHGcBTDyA9ZXsnlHRQI2deCXlTcf
	K8Xv/J/vmE4C9m9GXaXm5zyU72WmkPMF1VG13g5/mO4pF5eVlcZny3F9esGjCM6EDB3VoDkRkZE0a
	885xdGvzUgWFKTwt3D5uOu0Mw+uOprBjB5PbhajNSCiuCaQAnx+G/qYPT1vDCqEZt4RDdeqTplW5b
	80O+3YeCWLkH6UWHygdFYAZS7EWi6V01UDw2oGCqHtrRywEJdxezIa2o7LWh9YMICZXcE+pShA90m
	4JoM1QtIF/GNltbUeTfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLpcJ-00000005qRF-3bhL;
	Tue, 27 Oct 2026 22:26:03 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLpcG-00000005qQs-3ec5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 22:26:02 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-5eac01ff101so160726e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 15:26:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793139959; cv=none;
        d=google.com; s=arc-20260327;
        b=HA7vrXjsfp6xP3NVA3NW8k96rATY8RNYG3kmPqHI6kWbciSa14b9Ihjf5iztlI2vU7
         noK1iDQb+AaOG5eUwlhWwt29XOTTaisLD2e866poGvNxJPWUZDaNWkPRAfgjmshgUPSj
         5FPHUFjo2CGQ9Xldg/KZldRrr+/BhAkzfX4yzKyo9dXwSLIxnxfJHMeMYBuKUmmO4j6p
         3HNU7P5q/4sA+EuGSzRIyYaeRodoLFZZufDSfKPRispikDkaKhLZBjwcx589cnYerbSy
         /f2q1hwSNILg9u8lKZfaJMR3tKsZvRh9yOtuKDMw6Cez+iPDW7WKnAA5SUhgn+kypYlx
         mI2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=foMtuJXLdxu7UI1j+IPfbjutuzhkAxYfoH1ISosJmU8=;
        fh=1zpgrEElDixL9gRCL1XcE8VFwEvTdEapSnl1FqVTSHQ=;
        b=m56LkYjZSKlq7hgm9DouBQSJFDLbZXXR09/RQR9f5v40pmDzoArcNgoG06aI27wQkm
         6Fe9G1HL9TxY/6EYx76W1+uaWpNM2UjuG0RE2DEssYAFnqNs4IKEh9uTScmjPYvbo1o1
         FILLBxS9MnEmqaqG70WMvxq5ZCjkX7X+TOaF9oGGyZHNLQoWIx1yn3Z9qbWF2ouzl7eg
         aBOaY1NxVYqnqmpCKsVG6/xAKkrB4Nd2O1V555i3D+VgtxqIcVcby/ppoPGdjaF5I0Y+
         VtWbuBx6aU1Q+JUQ1zDySVFjZxDa1urOoP7OK4kWWBgcLwjsynHH+UO1usWRMfnahgTd
         AyhA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793139959; x=1793744759; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=foMtuJXLdxu7UI1j+IPfbjutuzhkAxYfoH1ISosJmU8=;
        b=XevHxYNEvylbTN8NlM4u3nbvu89NS10qVaUJBCttkfHNl0xGV/OVB3POFcZABbkZ/+
         PXuVGToFrSF7lXwIgs4QN6MktN0lbjkd/6dU00LEa0181R89GXMLcNnMD3ojiut3NfZu
         JuXRyKCN28QGofGbXz86QIJIu3z98UapjSGfhZs/qYe11wiVQ/DXO4HytDGkCiGZE32o
         enTFH46kWCYa05tfSoYj+kebe7pyq3fTj1HgG+2j4UZdWInBEavokJ6f6fYSXWjHjg9e
         NJb7IWsQfPgCcRHZT2jxQRdj21GwHgOxd+mnRpqDFJM3vBD8U8YQzFAQw2rTv/kLnR1o
         XYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139959; x=1793744759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=foMtuJXLdxu7UI1j+IPfbjutuzhkAxYfoH1ISosJmU8=;
        b=iaW1sMHqIFqGykNHgULnkuf96JwH4O9h6qKx2bLWt7eezJ4/LPakDZYBlLNpz7HZj8
         9WouVgiN4NGTo85U4ZiEl4/mKTygagyN9FAu+6rTzWfixmCOsp1q1ucXmUoJxThy+65t
         ozdAHbfyQwiHPf3pxo+9qGZg3kc1RKj/kbY4XXVUCq6/rvAd26S0Grd94EzwrBCUP7lF
         kiifG6QCqEYFQ+cQuWaDB9DYrO5V1DMD9S+2r3xJD7s+FJeR1rFGsNvNl33H4MfGw1vO
         cJ9tholgzuqI1/fk+r+LieM8M9QR8UJRry6tnhO/jwOx32S/I6bbTgMdiui0V+C4rdT1
         pMtw==
X-Forwarded-Encrypted: i=1; AKwUvBwgzzWzpS+h6oaWI80aGIfH0ncyOAAkZgKQ8YyuWCAPOXO0Mwy9GHYGoIrn5x8IqsAfETlCyYbVU/JNYUOYnoB8@lists.infradead.org
X-Gm-Message-State: AFq9FYLRXxxUpUvEs08VA+d2eIIcinkKPDWI7wi4yVhC8m3hQiuKvzSG
	kOtYKj4hxzACkMeHwXTC8JqaHRtDEoMUvYdfQbGf4C+BkWfLo9kk/YYVEj+CqHBr8uaIsKJqQ/C
	g+m0DDkEGiSXiCqwvEOgBVI/ndZ5SRJo=
X-Gm-Gg: AYBFou3CMz6F920XSJ3Q4lziXalOdmESlxbb8lFYuOkNv7uJBfYhHnWgaFvgWbDpnWW
	sK4uvvXSnfkP3ibwhEnlp9d0wBWfBknk2P47JORRSXXe8w3MAd0ANEn/gnA5FXHH7joPKIJpkGc
	MLn6wvYCeB+ZBA9A/8vslhKRVLw6zTIOPdML+1QP9/ME+x4k+B0YRtS4VneIQyuZh0s8mOCJBq+
	nstlKX7hS+3VZHNvGQJll5wRYV4CDVeeeNnKfMfqe1GNBJ51uUevhan5LJ3JXE/lP7AVI+/4nee
	MNYkrDKnbPWLzBG8WxvFAqX3L7x8ztc5EunmV8ldYSNCirpjEbcTc8DSanaOCie1jwcOLQYgyfr
	Jx7aTkY1tzQr071wAMxHUTbUvDFo6M3i8Ddiex4W8U+3t8AmPZV3rNmYKykpY/SQwQt2v2vfY5/
	soCkoDa/DqdCtSJdrO9T/ezn8LiD14gzetOEA1QY1OiewDLOfRpfasW3qNb1wM5vVK1l1dijl6O
	66YJz3Ua+ghNqnAfxhPCMFhVUqFZg==
X-Received: by 2002:a05:6122:6602:b0:5ea:c727:11fa with SMTP id
 71dfb90a1353d-5ec4c932ademr347091e0c.0.1793139959098; Tue, 27 Oct 2026
 15:25:59 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
 <20261024-submit-h616-uart-fifo-v1-v3-2-286fc1b8c3c1@gmail.com>
 <20261027-nifty-reliable-octopus-6cbac5@quoll> <CADvTj4qrBYSyT39=xK3_oGgHdFoSH=oyDvTtLCSzW=F9KAgi3Q@mail.gmail.com>
 <3287a7db-fbab-4b23-9ee0-d40c52fe855a@kernel.org> <CAGb2v64Qr-XCRdgi+RNS2XkKUn=F8zW+8WUKaauM2PjzL2XgWg@mail.gmail.com>
 <18f1e637-48de-4962-8a13-65f6597eb2dc@kernel.org>
In-Reply-To: <18f1e637-48de-4962-8a13-65f6597eb2dc@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 16:25:48 -0600
X-Gm-Features: AclHuK8HgBo8KQle8selMQ5AGJ_mUpjdczBdxOIx6OfVD5T9FzVHNBxWX4VKWiM
Message-ID: <CADvTj4qqwC=HjPmsdHoZdNNWY8GN8TqXnQG9PqKD-GpRZo11Kg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wens@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_152600_944846_1641C167 
X-CRM114-Status: GOOD (  19.49  )
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 4:05=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/10/2026 11:02, Chen-Yu Tsai wrote:
> >>>>> +  - if:
> >>>>> +      properties:
> >>>>> +        compatible:
> >>>>> +          contains:
> >>>>> +            const: allwinner,sun50i-h616-uart
> >>>>> +    then:
> >>>>> +      properties:
> >>>>> +        fifo-size:
> >>>>> +          const: 256
> >>>>> +      required:
> >>>>> +        - fifo-size
> >>>>
> >>>> Why do you require fifo-size if is const? It is implied by the
> >>>> compatible.
> >>>
> >>> H616 has a fixed depth, but other sunxi integrations have different
> >>> depths between UART instances. For example, D1 has 64-byte FIFOs on
> >>> UART0 and 256-byte FIFOs on UART1=E2=80=935.
> >>>
> >>> Should I keep this explicit for consistency for all sunxi uarts?
> >>
> >> I am confused, there are no other instances here.
> >
> > I think the point is that it is going to be needed in the future when
> > we add the compatibles for the SoCs that do have UARTs with different
> > FIFO sizes.
>
> Then we add it. We don't create code which is not used.

On further investigation it appears the sunxi boards with UARTS with
different FIFO sizes might all have a register for reading the FIFO size
at runtime via FCC capacity bits so I guess we might not even need
a fifo-size device tree property for any sunxi boards if that is the case,
not entirely sure if all mixed FIFO size boards support this however but
I have yet to come across one that doesn't.

>
> Best regards,
> Krzysztof

