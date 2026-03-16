Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CAAF53D73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 16:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWa+RXyopymTRjjpFJkMzMT8GIqPd4802R8XJ+/wxvI=; b=zHN1V9yhRcGjhIOIPVVx6Y64iG
	uWjDnZV+Po3zHjs/8eamYIlhvZqHXgdzX75YzXQvsZLotscYeDAL1o1rjAmKrrn7lUgRlB1zPr6HU
	sitRI1er63TyB3dTaRSjPRbZ7TpkRIiDQBdcUmEIc72SVEf76Mn5hBRpV1wv4qedEnnXCoK2urAL4
	6YDgnbctqoIeECxYTv7YpichJD659ZRRp1s3xWfvkWnlZAxXGVOaBoAamFyJdhOZ93O/HGQaskZs2
	LKFgFa4exExdTjgls/OmvlYEMb3nHXLBnoXWhRhqnyDX7n5HQUf9KpxUbnZv3/NazDnqM8TGWmerr
	rsh2Xa5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2B6V-00000004UEp-1deD;
	Mon, 16 Mar 2026 16:47:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2B6T-00000004UEc-1FmB
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 16:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KWa+RXyopymTRjjpFJkMzMT8GIqPd4802R8XJ+/wxvI=; b=SKf6wTs/4eo35xaVEOrABp4CXV
	+GGJaeQnW22u0sjeDnxcFBs4gFxAU5hX9jzzhZJsVmapsxIRBHmj8NcEXvm/mJJSbbY0CUgswDI8w
	Jv7Ke1MxIGxP1rR1ff4zmhjJh0nTnevG+D5ylG7X5EtR0X/xqo3geWFhQEh0QJDXgyAhCeznggqHM
	bGC/GXQUSQ99aPXnD+oISd8ue52Al5zbKzULJQQZFz6Su35u7sLrr/54uwtSpzrYPT7N3NGPM2/yN
	NFPs1zykUVFsjSWXvy850cOpeLjADT6UDg1OR/dDe1h9Tgb1L/5ym7JG+zJE3CMxwDnTdvGMnY19i
	Dw66pOvg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2B6P-00000007FHE-47C7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 16:47:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6653A43440
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 16:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47074C2BCB0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 16:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773679656;
	bh=+rAbjFpJLF5ELTGsyzXHo5dgEzatb5tWHpqXy6BTmYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cGtekfTqFvVrF7VJ1xDN/03QTDPDcdo5LNi8MIeHSIezK4Gd2z+GQ94TdThe3wfdg
	 6+jwBMmOqzF85kgS9jF7LvwgP5JGWXJpkAzraz3vFcajQZUHBvO0WRYzQJE7J0Ytmi
	 Gwi/li0g/v/vcXP34ZAq++FsOnJ7YYiJJNUFiQULiaw3n4kJ58eE6KrMSVjMGnsO4u
	 IMN7zeBsIcQrt2UTsOQo2nDc2fI+SGolMG21oQW9QYbqop+gZh52CvuNSngMbBymF3
	 pYqZPEns6Yy1LnHWMLVS9x1ZnrWuY6XLupN9bxQWg7FscMFBB3zIghh1qubhnfJmuf
	 WBpxVo36e6R+A==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b976e181895so519692466b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 09:47:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxwelGsnYKF9cyfR8ErxorQKGHtsQiWVZvJQHKkYI3/LsmpH0GONnzXcFq8Fkc46Slymo2YRF6WEXGFTOUPwGd@lists.infradead.org
X-Gm-Message-State: AOJu0YypkImhJfzOZk91DPKf17VvM/NHAzeP1QtrVgyG19+lR0J23aVu
	fGy+ZYvMm64X7UKyp85qibp8sUhlQnkAIo5wC3EDPlVsCtlXszWOT6GjWusgnHmhtbaHzb7Hvgo
	6lHUk9VmbvnV/Z/lGOnw6/rvj6sWotg==
X-Received: by 2002:a17:907:708:b0:b8a:f2cb:8088 with SMTP id
 a640c23a62f3a-b9765392113mr794224266b.33.1773679654788; Mon, 16 Mar 2026
 09:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260309-upstream_i2c-v26-0-5fedcff8ffe8@aspeedtech.com>
 <20260309-upstream_i2c-v26-2-5fedcff8ffe8@aspeedtech.com> <20260313232125.GA3618633-robh@kernel.org>
 <TY2PPF5CB9A1BE6A19D439C675AF5028C13F242A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
 <7ae8222bf6abd83a3c2ac976f54a2edbe4e9727a.camel@codeconstruct.com.au>
In-Reply-To: <7ae8222bf6abd83a3c2ac976f54a2edbe4e9727a.camel@codeconstruct.com.au>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Mar 2026 11:47:21 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKQp=HyA90rQ2Hzu148k63k5-qrGLH6sEHXNcjAu3QSwg@mail.gmail.com>
X-Gm-Features: AaiRm51ex9uUeaeovsj_EfQkcC7S4igdlkgu0QdNDXmYleGKXTFGbzYmU6uj8IQ
Message-ID: <CAL_JsqKQp=HyA90rQ2Hzu148k63k5-qrGLH6sEHXNcjAu3QSwg@mail.gmail.com>
Subject: Re: [PATCH v26 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_164738_389529_CDAB1525 
X-CRM114-Status: GOOD (  28.77  )
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

On Sun, Mar 15, 2026 at 8:50=E2=80=AFPM Jeremy Kerr <jk@codeconstruct.com.a=
u> wrote:
>
> Hi Ryan & Rob,
>
> > > > +  aspeed,transfer-mode:
> > > > +    description: |
> > > > +      ASPEED ast2600 platform equipped with 16 I2C controllers eac=
h i2c controller
> > > > +      have 1 byte transfer buffer(byte mode), 32 bytes buffer(buff=
er mode), and
> > > > +      share a DMA engine.
> > > > +      Select I2C transfer mode for this controller. Supported valu=
es are:
> > > > +        - "byte": Use 1 byte for i2c transmit (1-byte buffer).
> > > > +        - "buffer": Use buffer (32-byte buffer) for i2c transmit. =
(default)
> > > > +                    Better performance then byte mode.
> > >
> > > Good, I like worse performance so I can use byte mode.
> > Thanks your review.
> > Will remove performance statement.
>
> I don't think that really addresses Rob's point there.
>
> The selection of mode is somewhat a driver implementation decision (and
> so would not belong in a DT binding) - *except* that there are
> considerations around the use of hardware DMA channels, as covered in
> earlier review.

Am I supposed to go read the prior 25 versions?

> [My understanding is that the mode needs to be defined here to select
> which i2c devices have a DMA channel allocated to them. I also
> think that byte mode may be useful in some scenarios, but that
> consideration certainly does not belong in the DT binding spec]

But this is selecting DMA for the bus, not specific devices. I would
think the decision would be dynamic based on some xfer size. Certainly
if the xfer is less than the buffer size (32bytes), then there is no
advantage of DMA.

Or do you mean some instances of the I2C controllers have DMA and some
do not? If so, then ...

> So, how about we refine this to *just* the hardware-specific component:
> whether a DMA channel is allocated. A driver implementation can then
> select the appropriate mode (dma, byte or buffer), depending on
> implementation-specific details.
>
> In that case, we would just have a boolean property, like:
>
>     aspeed,i2c-dma-enabled;

... yes, this is fine.

>
> - to signify that this controller may use a DMA channel. The choice of
> actual mode is left up to the driver implementation.
>
> Rob, would that suit better?
>
> This way, we don't have ambiguity on "buffer" default vs. absent
> property, and we're no longer specifying actual driver behaviour in the
> DT.
>
> Cheers,
>
>
> Jeremy

