Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C687606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mPNi1e9A;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ln31vRMh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lbu6CYbZmlg9LDpHvg31OE0O9sdelylvCrdhRi2mD7M=; b=mPNi1e9AaxX88H
	Nvj/fN9uin5d5JgZUMHmLjd9jxYzryG250QYWizi0LaU+HBzl1E85vtTkgHyzX4ludqXitUpCo6zZ
	7286cnghmeU+Whz8U7hEXxtKRyIbo+pEHzbl0pkwjK6yy6g/f1vXt9CBH0M3MxF5YQfwCaBjkQH7s
	tJS1QdlbbqkL0UoGQC1Zzdnt0LNrFb8LJRTHqFNLA4kQjnGPfQN4kUnDS3LJ1S8Q4KD/ECbLhp4lH
	+XdvkmjG7fDaVOVotxSIegwLiy0eOwm08KZM6lWWbXNcBeJ32dJJZzF3l2Yt7NZz1uWxwXiex4CVh
	xptoTgPZJNgFaBIhkDVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOz36-00000009MXf-1iep;
	Thu, 05 Nov 2026 15:06:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOz34-00000009MXF-0CPV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 15:06:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 33D4B60621
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 15:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4311F00A1B
	for <linux-arm-kernel@lists.infradead.org>; Thu,  5 Nov 2026 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793891200;
	bh=lbu6CYbZmlg9LDpHvg31OE0O9sdelylvCrdhRi2mD7M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ln31vRMhbFvxkAtvzVW75Y4HBOLjjrZC0SmEKIotyieRcq6ES6mnQJRuRutgvH4na
	 2ntrXnFKWKITMWAZDTiek9ZeFMQEUUB4NGEi2Eu0bNaA7hZoFrl3esKlIeoxQpstlP
	 KePk/w8r8S8D/uxBr+FuQ5L8SwZ+izhxnROeVnAgjSXp1NqLSl9MqJocmALEoO6rNX
	 zrIqZEf7SHMIsj1kXWMvhq75PgcbWCWYYrY3OtcMtIQuqevvJt3ppSSdrpSe26Cxli
	 WwCbuMef7RBXF2M9c5Qo5l8pNwwemhlpMcyMXahWz3nvCEa4pFLdfNv4nlc9T1WEB6
	 zv2yO2mIsvHyw==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b58cb69927so498140a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 07:06:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx71jedH5XwAVBYgZTmqpBu0PJ2MPOv9e3ZKzA+nzAOoMZ0T8aoi1rlwdBAINyFLzweqh4mhe8yo32LjBuASQsf@lists.infradead.org
X-Gm-Message-State: APuU4Z/FM0dzcyOYx0AhAopaMUQL2aB/2MnIkaduCEI5daViqV79vAnW
	c5XwlvAjdqZTnVPfqOaLXxpo+NeOm0F6apC5cSA/35CXR4XwVskV86pTW+731JgPs2ourzUM1zP
	l38Plr4pP+kLUzJW9asV7aWnnYSK14w==
X-Received: by 2002:a17:906:c102:b0:c46:d493:47be with SMTP id
 a640c23a62f3a-c4d206aede3mr244770366b.19.1793891199414; Thu, 05 Nov 2026
 07:06:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105144920.2796623-2-robh@kernel.org> <krvg6bwsueypasvt6fqszh7itqr3gu3qsqbji2ernqqy6g3t4c@b7hqenmaugik>
In-Reply-To: <krvg6bwsueypasvt6fqszh7itqr3gu3qsqbji2ernqqy6g3t4c@b7hqenmaugik>
From: Rob Herring <robh@kernel.org>
Date: Thu, 5 Nov 2026 09:06:27 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLETyrx7ew0zirS9r6+3=GEFaRE0g96OZHYwqjxMCZKcQ@mail.gmail.com>
X-Gm-Features: AclHuK9D1vVYdU6bP9ipfCUqtMD7cNI9yWkFwUZwsKz1kc9xgefpf4aNgPCbR6A
Message-ID: <CAL_JsqLETyrx7ew0zirS9r6+3=GEFaRE0g96OZHYwqjxMCZKcQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: nxp/imx6: Drop unused .dtsi
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Thu, Nov 5, 2026 at 9:00=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.d=
e> wrote:
>
> On 26-11-05 08:49, Rob Herring (Arm) wrote:
> > These .dtsi files are not included anywhere in the tree and can't be
> > tested.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > v2:
> >  - Rebased
> >
> > It's been nearly a year and these are still orphans. There was a promis=
e
> > to upstream something for the kontron ones, but that hasn't happened.
>
> That's unfortunate, but these includes are used at least by the barebox
> bootloader [1,2], dropping these would cause a DT regresssion.
>
> Would it help to upstream [1,2]?

You said you were going to do that on v1:

>> I will add the som.dts, please don't remove the kontron dtsi files yet.

