Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E40A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w0xlQSo1;
	dkim=temperror header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TASrUzj4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DVVe3FzAnvs93NbepeyFk6hW49mA+Pu2o1a39rMbIEc=; b=w0xlQSo1MaaAQm
	FK1R+LOh8QTSILmzUVwz1nXgx8M6X5V+B6V/ygvxM9Yl/c4KhvJxZtZkYtXUhK9yyYDXhFgpPFAYD
	h0m1zJg3oHCmq+xRRjii7LEevkn88vLQGFEpOpDBPFM0BkvhMGR50O9w8gMRo/uCVkyWaSVZe0ZeX
	eA56SIp7sOata0/BCXJQ+wgKF30m7XT0jt2AWqn0GuJ3q8EPtOQC01mZ/I1L4YWJEIzi0xkq6SxDq
	iLqPhmbH13QiPyvRO3BQGp+BcO+wdYWTOiAYVdyM0jz8xHvRGYz83+73h0zJd0Hq99XGplYah/+UT
	/QZmU77ktsGA64sNa9ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtF2-00000008DA6-2EUv;
	Thu, 05 Nov 2026 08:54:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtF0-00000008D9a-3sxl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:54:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6806342E62
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 08:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D02D1F0093A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 08:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868878;
	bh=DVVe3FzAnvs93NbepeyFk6hW49mA+Pu2o1a39rMbIEc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TASrUzj4saXMLMH3nA6tcJnUOlbZZJFqYGciiTf9bpRy/Z8YwmoSGwyJsWiJ/Uu1H
	 0bJeg2GvyXujibHLzoc/2aWl+Rws4Z+DVHdb4gnhF7BtcTjpHkw1iKFBFEto78YouH
	 fVNnKUmRct2mnG6iaW4cDnjzPdn3KLSt2uzmYVTgHxOLl9IhcgAMqZlc+X7TJwnNVG
	 rwSvzBYhQbnmUQPeoGXg+O365RVuBuY1x+pi0+cwahgptK6ArEawRk0EeLh7PTaNSy
	 abCUyhko73xR2xy3Ppokh2XvSCDfvsPsOS8i8A63dalLdvILxmfEQYga+YIswAGBII
	 poKP/X22aaiFg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso1537766e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 00:54:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw+4AvmdvH/KMJ8TvfbjEWujQ3pf98pk6YUzfnBjlUH/Rx+eWZFvPxJYDxS0soiGoSMidcS6I30c37URbsk/7KS@lists.infradead.org
X-Gm-Message-State: APuU4Z9sekUwLZT7LGBynQwyDVWx3UuzSxRv1Oe6u2/nfjiNzqfT62pO
	j3MeRxjRzmHVgnwm2PVFn/AVHAFtY19Y5PiFp1G5CtiLNX2YKjRtyUpOqllN2pZHYjaV5DwUyep
	wlzRvtbB4zOiX6KqNt7r0eB13juI28A0=
X-Received: by 2002:a05:6512:3089:b0:5b8:bc5e:b58b with SMTP id
 2adb3069b0e04-5bfd95a4b02mr5739173e87.67.1793868877100; Thu, 05 Nov 2026
 00:54:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261031081804.218566-1-pocj8ur4in@gmail.com>
In-Reply-To: <20261031081804.218566-1-pocj8ur4in@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:54:24 +0100
X-Gmail-Original-Message-ID: <CAD++jL=s=8myyXaA_bzpgdCXSTFuV6N9E7jSTugEpHLz6sCiow@mail.gmail.com>
X-Gm-Features: AclHuK9jzhrMR_GIOjckLsaRqpnIyiPrY4hPuPPG5HhQ-Fm9HL5f6KY7FDGM-wg
Message-ID: <CAD++jL=s=8myyXaA_bzpgdCXSTFuV6N9E7jSTugEpHLz6sCiow@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: realtek: Write the encoded slew rate value
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: Yu-Chun Lin <eleanor.lin@realtek.com>, James Tai <james.tai@realtek.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.com>, 
	linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 31, 2026 at 9:18=E2=80=AFAM Baek Kyu, Kim <pocj8ur4in@gmail.com=
> wrote:

> rtd_pconf_parse_conf() maps slew-rate arguments 1, 10, 20 and 30 to the
> two-bit field values 0, 1, 2 and 3. However, it shifts the original
> argument into the register value instead of using the computed encoding.
> After masking, these arguments write 1, 2, 0 and 2 respectively. In
> particular, the distinct 10 and 30 settings write the same field value.
>
> Use set_val when constructing the register value so that both individual
> pin and group configuration apply the existing conversion. Leave argument
> validation, field offsets, masks and regmap error handling unchanged.
>
> Fixes: dcc9334435b0 ("pinctrl: realtek: add support for slew rate, input =
voltage and high VIL")
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

Good find, patch applied!

Yours,
Linus Walleij

