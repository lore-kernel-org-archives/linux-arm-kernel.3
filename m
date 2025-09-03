Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E401CA100B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 05:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnGCK1lahw6eKRr1X7LuKjE36AI6nTTs35DYpWRjgPc=; b=nxPIfmMDxVXR1GlmR8ZRBkz/1c
	CrIgxmA5vGg0RF+/mNDFCEkoESmXcxpKNgQ0QWtcZBhAoqE6OzVYZQJQmt7G2sQiNvQ1TuhD29361
	tQyLZB71cEfUr0ksYj6Xj5r5e5/HioYhOle1aNllwazbj/8Seh5rjwYUHOhTZ6HrmFwiqZ4Yi639t
	wAfmBg6qNWDkrJHpuiq1hkqPcKmeSi+O4hHDJ49JHG//y81pSSGReLsKGdzUiYmDeuafP9lu3fbBS
	wWGWbYAvN10OWQFMZkiubxf4owpKIGPWfMK+7psklnW1GcZTXffB7uiowqd/ZKK7BK+IQrLstyEfG
	yeQAt2TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utgAV-00000004Gs7-1HPX;
	Wed, 03 Sep 2025 05:36:27 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utg5b-00000004Eof-1JfB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 05:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756877481;
	bh=JnGCK1lahw6eKRr1X7LuKjE36AI6nTTs35DYpWRjgPc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fACK4iWCaKo+xngoM6xHxCzq0XPdutG9X6hPIigvvWVSmK74s7mhro+frrRzWJf8X
	 OOYOjzr4AOdyVtWojQJJE9cQfqj7xvXWFZpR3a+PY+wIfKrOKt55gO4N+8L09S8Tof
	 nA+VmVkuO2mOzgy7lo0knxxgHC7hsYG92ijBNNs2CMCqkTVcQk9KEMdD0UFul/dnju
	 ISXtX1w929DiSsKtz9ZKAGunLxnoeB4VbtTHYubhHvG677FF4F4W32PwzSXte0UPDK
	 KHrFXLX0JS5qVR35s/NXnjkWfUMyz/fjnuHj+h68ZgA6PWkdyMzMCOoyfOD4CGbljF
	 9jSktTJKjFDYg==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D93F56E02C;
	Wed,  3 Sep 2025 13:31:20 +0800 (AWST)
Message-ID: <307fa87eb552ac4a1f6dd6139450786195e3892a.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Fix/add I2C device vendor prefixes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Date: Wed, 03 Sep 2025 15:01:20 +0930
In-Reply-To: <20250815230841.3487764-1-robh@kernel.org>
References: <20250815230841.3487764-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_223123_543593_50B066E1 
X-CRM114-Status: GOOD (  12.19  )
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

Hi Rob,

On Fri, 2025-08-15 at 18:08 -0500, Rob Herring (Arm) wrote:
> The ASpeed DTS files have various I2C devices with missing or incorrect
> vendor prefixes in their compatible strings. This hasn't really mattered
> and doesn't impact ABI compatibility as I2C devices get matched with thei=
r
> vendor prefix stripped.
>=20
> With this, the "maxim,max31790" nodes now validate and have some
> warnings. Remove the spurious "#address-cells" and "#size-cells"
> properties to fix the warnings.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> =C2=A0.../aspeed-bmc-arm-stardragon4800-rep2.dts=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> =C2=A0.../dts/aspeed/aspeed-bmc-facebook-harma.dts=C2=A0 |=C2=A0 8 ++----=
-
> =C2=A0.../aspeed/aspeed-bmc-facebook-minerva.dts=C2=A0=C2=A0=C2=A0 | 24 +=
++++--------------
> =C2=A0.../aspeed/aspeed-bmc-facebook-tiogapass.dts=C2=A0 |=C2=A0 2 +-
> =C2=A0.../dts/aspeed/aspeed-bmc-lenovo-hr855xg2.dts |=C2=A0 2 +-
> =C2=A0.../dts/aspeed/aspeed-bmc-opp-palmetto.dts=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 +-
> =C2=A0.../boot/dts/aspeed/aspeed-bmc-quanta-s6q.dts |=C2=A0 4 ++--
> =C2=A07 files changed, 14 insertions(+), 30 deletions(-)
>=20

I see you've applied this to your tree. Sorry for being slow on the up-
take, I've been focusing on other things recently. Happy to take it
though, if you're happy to drop it?

Andrew

