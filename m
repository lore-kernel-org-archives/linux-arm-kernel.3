Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555E1606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 10:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3/Y9Ts3o;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iD962t4O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VbkC5PiXkuQEdYLYK/YUR9pdO4ULkJikWXO9Pu6awtg=; b=3/Y9Ts3oxVrcs0tbuyWlN7ttkD
	phFQ6FSAQPpf8O9G6tVMaaMaUHcPRvIynHMI0izahvcQFsMw/trXjQAtR661E3WsZeUVcuzLdYQzz
	896IzZ/fxAc2ifslg/dI8o0dVxCNIyvv/ToymLqzle/bshwowF5VYumeNZHy/pv/f0rmx38bE/vBg
	HzzDSzG2xPphEhfpuSCDYWRtKNnc1QKmf+YPr11oDraRZ0kRoRQtSYA3XjAsLLsNMQl+vh9bSPAvN
	Uxaw9f9Ex7Ptk+KG8UDXNV+dPJZXTPnbwjsd+Ttk1jOMKFOmKKoBTgzbqVpRvlPxpVCWLmhRl5TkY
	m3pTkr3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLe0u-00000004F3a-17DP;
	Tue, 27 Oct 2026 10:02:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLe0s-00000004F3M-2opP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 10:02:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 312DD437E1
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 10:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E581F01829
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793095358;
	bh=VbkC5PiXkuQEdYLYK/YUR9pdO4ULkJikWXO9Pu6awtg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=iD962t4OeYl8fq9bTKX9Iflx2I8f4Vh717mX7u9d7sgpo3vSQSuZKwQe07yLRktiO
	 gFdNC4bR0scWTeYeG9TlkR7+3xN4DJoKt17dRAPIvmpfuk9X3NLIT+RijO1qwXbOh1
	 mR5OHKL7wb/iz9+5aMbhW+2FAfECvIlTyr5QtUWw5O926DvgT+4ibSkwaFOcbxHQkP
	 W5Io98xLEQYQN5altOp6mwTly7u+9RMwt5X1lVQLP5ehGoFuIWthAYn+3X7P52B4qp
	 /mgz5VjRAGHHSfDNtJam+ZWFb7e1U5bYIQaVa8VphujDC4wpURh4MQSpqcHAzm6Non
	 0VXVfNNsi8ZsQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab27e45e7cso29712221fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 03:02:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBya42PG1uPqXnVeBX/hQHUipAecBjjudYmagdIYAOkw6GRLOElp5R7gDioTB0gYijC5F7W8P0bakTVlSMokwkzs@lists.infradead.org
X-Gm-Message-State: AFq9FYLwD0gRwzUE2cQSOKeWa4V60b+dhwulwCImzFmyP/zv1+FS7Zkv
	UpUspOaaSaTXnujJdgl6H92UnAgBSWcw24I9NGTyKDfpWyqc7oHLrPkiNlvqq6yDK2NUozVFuUF
	a55hmYQG0RA+KLm1p0CeFb2H5QydDov8=
X-Received: by 2002:a2e:a99d:0:b0:3ab:48e6:6785 with SMTP id
 38308e7fff4ca-3ac6fde8009mr25044611fa.27.1793095356530; Tue, 27 Oct 2026
 03:02:36 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
 <20261024-submit-h616-uart-fifo-v1-v3-2-286fc1b8c3c1@gmail.com>
 <20261027-nifty-reliable-octopus-6cbac5@quoll> <CADvTj4qrBYSyT39=xK3_oGgHdFoSH=oyDvTtLCSzW=F9KAgi3Q@mail.gmail.com>
 <3287a7db-fbab-4b23-9ee0-d40c52fe855a@kernel.org>
In-Reply-To: <3287a7db-fbab-4b23-9ee0-d40c52fe855a@kernel.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 27 Oct 2026 18:02:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Qr-XCRdgi+RNS2XkKUn=F8zW+8WUKaauM2PjzL2XgWg@mail.gmail.com>
X-Gm-Features: AclHuK-r-0qVcGxijtfK3XLHMgbsvhgpkiCG_8sJWoMVAePUb1PQB2bHv8-O4VU
Message-ID: <CAGb2v64Qr-XCRdgi+RNS2XkKUn=F8zW+8WUKaauM2PjzL2XgWg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 5:56=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/10/2026 10:39, James Hilliard wrote:
> > On Tue, Oct 27, 2026 at 2:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Sat, Oct 24, 2026 at 02:22:24PM -0600, James Hilliard wrote:
> >>> The H616 UART has 256-byte transmit and receive FIFOs, but its Design=
Ware
> >>> component parameter register does not report the FIFO depth. Its opti=
onal
> >>> register layout also differs from the generic DesignWare integration.
> >>>
> >>> Add a specific compatible for the integration and allow the standard
> >>> fifo-size property to describe the capacity. Require the documented
> >>> 256-byte size for H616, retaining snps,dw-apb-uart as a fallback.
> >>>
> >>> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >>> ---
> >>>  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml    | 17 +++++++=
++++++++++
> >>>  1 file changed, 17 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uar=
t.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> >>> index e2ca126d58ba..0f8fd0485879 100644
> >>> --- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> >>> +++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> >>> @@ -13,6 +13,18 @@ allOf:
> >>>    - $ref: serial.yaml#
> >>>    - $ref: rs485.yaml#
> >>>
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            const: allwinner,sun50i-h616-uart
> >>> +    then:
> >>> +      properties:
> >>> +        fifo-size:
> >>> +          const: 256
> >>> +      required:
> >>> +        - fifo-size
> >>
> >> Why do you require fifo-size if is const? It is implied by the
> >> compatible.
> >
> > H616 has a fixed depth, but other sunxi integrations have different
> > depths between UART instances. For example, D1 has 64-byte FIFOs on
> > UART0 and 256-byte FIFOs on UART1=E2=80=935.
> >
> > Should I keep this explicit for consistency for all sunxi uarts?
>
> I am confused, there are no other instances here.

I think the point is that it is going to be needed in the future when
we add the compatibles for the SoCs that do have UARTs with different
FIFO sizes.

