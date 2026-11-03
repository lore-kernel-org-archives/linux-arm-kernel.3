Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB851606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ifOgtj04
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/NZvArZdYg853Maan0dEAeuUTGOiHnQbpO25gEe5B+E=; b=ifOgtj041iVqWHzK9eqcmQKGR7
	he/ns0MLXqqqaT/2FPxYnrLLpa6CUMpj9Hh/0YXWrpUexY2JWg8fpMbLWcEpx8l1mXPIYddBQIQgh
	icEDK4Ls7GzZZg1Xwsq9Sgs1DgE8d+Gt2uu8mj/3pWKj9QcMjYVP2bh07P7n376sStTr2jM7FJZPW
	Y5E3zs+W3rXa1Bnvic3N3vKSX959YJ8OQRI5hQMBpIRDCdKE2L2tUMnlkmVvP9UU2j8DF/TetICnm
	ao29T+F2JFfhetfn2qDhkUYayCuH77moVwBzAUaT3lcAH8pZAAjyZfgstIf+feZZ3R1NKySV6xWPI
	wpuQYXVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHYL-00000003BVr-0Zab;
	Tue, 03 Nov 2026 16:40:05 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHYH-00000003BTr-2LPu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:40:04 +0000
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8490a7d6696so2728885a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793724000; x=1794328800;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NZvArZdYg853Maan0dEAeuUTGOiHnQbpO25gEe5B+E=;
        b=ldrblsIvlKh9j5Rx1oGnuYPqEb5tkJirAEbAyvKdBFgbURcxhZ+1cnezHFhHodPNJG
         +h8E1yUJ1XMJwPcXtdCl225WdNH1jb8DDgh8EZNpVx6PZ9P60/7iSmxoYY0ilKB4QB5C
         LjlNuOQzuqTrlaiFN5pt2T+a6AAwkfD+Cy/SnQZ6w1dCiuktLwk8kB6mudkZXnnsWy4+
         eZkfba+i/GpmjG0e6Q742aOGtSuWOdjb/jRDro4OZlF0uJM2l62mzeKnJtkag2tdmU2x
         stD8H11sF1ujkSCJGFpiY+leA72WHLSaqeYm88FbClbd25lqVvXpekykopLgagIde1XJ
         PI4w==
X-Forwarded-Encrypted: i=1; AKwUvBwGM+/QmVN8wXqPoZo9g0QRbswMBzvli2ep1xRmKBcSvIgzznE8Q3g/bdbXQKxCbzj/4U+0610xflFnkISG9i3d@lists.infradead.org
X-Gm-Message-State: APuU4Z+SaKY9Nf/YPCntUGKW4qtTCylVy3T8wY5kgWw+dS9Daz7CchRT
	PiseVcgGb7hzW6S/q6tmp5aX8TDerJUqCkdNJRx6GtP2uixsbSVYO5o4nB/78DODvp8=
X-Gm-Gg: AYBFou3Y2xc1wOJ7mZJnclxLQTG5AqH4AiI32XG4UXjtWYAXmekECgzwBR+4flOUYpI
	NwhhVXL39pm1qW+PU7aUWM6jarf90Z/gYzFt9jUVxHbpoqW4NVSd/0vkTArK0ZSC3LglLXvYkk4
	dk6l8C662XUDfT1HdogWvKjUJQPJtzkrElJFyDe2jWg2xe38t7nreamqZPUr4sKcp/dH8uxY85k
	vrTVmZoSxbpOnVo9XXhPaoPokCwBMSzx3Ql7BG6R0QwZjfWpmVbK5ni6sJeEgEe2DxxNcXQfWDc
	whhYAp39BTdI8fFOZZgHj9vQa0d6rEKyOwU+bXv+jgMN91KDLah671AGD/UPyeFPQp0a7knDLE6
	7meaKMK52tQh/nzYOIQuHbRjdiwKOtbyj1LHJQhZFSVYCn12zo25AS2mC2Bq8RQsuFxADgxaX9W
	suQjDF7gp8U5KGEPc6qIFkIQzxnNIBlfeXOAnlMGMZlzMgZesGtROwPEONO2fDRVlPc+C7PiRsE
	YIyokhczhLICaty3JI8s8fnCNf6aFStnmusO3lf4aieeG87JYNX6lcBBEhB3xvRNf1LDND7qzk6
	m9zgaMZrL9u/IgNxvakN5nGx5Foo/TFkDg9wLhAoOcOWzpix/T2chTi8Pmh4Mm0tGxmg0pVVzor
	mFt1/fKU4SMa1S2uo4PLjTCJrw70GkZJrQX7uOYrZ8R6I48eMduh4
X-Received: by 2002:a05:6808:3c48:b0:4d6:90d3:e18c with SMTP id 5614622812f47-5640ddcaf4emr8196348b6e.53.1793724000292;
        Tue, 03 Nov 2026 08:40:00 -0800 (PST)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com. [209.85.210.46])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fc49923sm10439823b6e.1.2026.11.03.08.39.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:40:00 -0800 (PST)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8446af403b5so2918930a34.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 08:39:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxI/+Qvk0eMn+RyReVZnv+7pqK7lqGdIhlBhpMtWA8A/vGpVpCJih6aVT9vdn6NweTFbsEduCB/yLQ8E9GPFQ13@lists.infradead.org
X-Received: by 2002:a05:690c:e3e1:b0:8b1:3606:65f6 with SMTP id
 00721157ae682-8b2b674a182mr76399327b3.64.1793723531633; Tue, 03 Nov 2026
 08:32:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-5-tanure@linux.com>
 <CAFBinCCtfPCsqN5yG7LWDFG=tyJ+aHix6x3yiXfaTAPP_A-hAA@mail.gmail.com>
In-Reply-To: <CAFBinCCtfPCsqN5yG7LWDFG=tyJ+aHix6x3yiXfaTAPP_A-hAA@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:31:58 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+2D8wKuMEgKWdJn4NA0wwuK5e1TuUtbhZbRZmFbVXmdUw@mail.gmail.com>
X-Gm-Features: AclHuK_uB_FU_COonRuR52ADQLZgO7wR8X01b0NCoWbrjac2-TTSlybmTTN1Brw
Message-ID: <CAJX_Q+2D8wKuMEgKWdJn4NA0wwuK5e1TuUtbhZbRZmFbVXmdUw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_084001_606941_C7FF575C 
X-CRM114-Status: GOOD (  13.66  )
X-Spam-Score: -0.7 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: tanure@linux.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 1, 2026 at 10:58=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Thu, Oct 22, 2026 at 10:06=E2=80=AFPM Lucas Tanure <tanure@linux.com> =
wrote:
> [...]
> > +       if (!dwmac->data->init_delays)
> > +               return dev_err_probe(dwmac->dev, -EINVAL,
> > +                                    "missing init_delays callback\n");
> I'd rather let this crash hard to make it obvious to someone adding a
> new SoC that they forgot something.

OK, the NULL check is gone in v5.

> Other than that this looks good.
> It would be great if the netdev maintainers could comment on whether
> this now matches the approach they had in mind.

