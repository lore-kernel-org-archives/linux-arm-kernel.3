Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5A6CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 02:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lcFSOzja5E1OdUdSgtdwJamxmrIxOqXabOscv2yoRU=; b=LZDRkfETRRuJYLE6N5yKJ6ckU6
	j+rCwOBODPUDyRr8KLFA8vYLsMJEBeiul+9D8wbFtboknM9RtoTOJQNTgBGWVi/wAsJkiC6CqVQT0
	RMpAKbytSSWObN8ZPu1AHC9MYK3lW3c3IEfSKvuQL1Abt4if5eysm0x0EG5ThEb0j1eJHXnHMUSRk
	T5J97iN8XCpVMOAIKy/30tmBEp5B0z2KjWSEwDhFUKvTcpYz/yr53JrOZlvA3vi/6vHkzG9m17lw+
	P8IQSvi/G2/3H0aKkZS/Z+mgfEpE1JJTpTk/2gbQKOD2pT+jQrC8JOerIpTT3hmcP7/o9KkKDXnbk
	7A2eannw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0WaI-00000008diQ-2asz;
	Mon, 22 Sep 2025 02:47:22 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0WaC-00000008dhd-40rl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 02:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1758509234;
	bh=8lcFSOzja5E1OdUdSgtdwJamxmrIxOqXabOscv2yoRU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kZW7zB/6EL0FgFn6rLaJ6D2Bl9DGzdY3hWfhg93pcG5VaIa5HGLi1t0AijUmBFVFU
	 GkfqvqEqHM7/BejQe+nvSXxYvVhttNV33t6W5iz4ox1xyAauEHCytqMjQ6y0HsZy+D
	 9D12OQB/X8MZo2FILB5BB824OnU6mImg3jy493UxhkO6w8goh4BkCXp+N44fSU+wUx
	 tP81ueKkSUbA8m2w7e/W4Kzjn6TNr6tQSMJD39Db8KCsxLnLqwWB/4koT8o8IIeZhd
	 xRynaMBpOxEc8iocDzgIl25QQSQdelgZFDeEXhNHqu6bKEdTvsEZL74pMlHNqoUAUr
	 R1INSLBUj+INQ==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DEEE964755;
	Mon, 22 Sep 2025 10:47:12 +0800 (AWST)
Message-ID: <7e6f568da28d7a63738b6ed22b33db3df4c478c9.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>,  Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date: Mon, 22 Sep 2025 12:17:12 +0930
In-Reply-To: <CABh9gBew1=hbJvg1Mhg5dE7Lr_Z442_kbBX6zTs_6_C2NRyLbw@mail.gmail.com>
References: <20250917074812.4042797-1-kevin.tung.openbmc@gmail.com>
	 <9bb9929a-8130-48da-983e-2901a7c3da36@lunn.ch>
	 <CABh9gBew1=hbJvg1Mhg5dE7Lr_Z442_kbBX6zTs_6_C2NRyLbw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_194717_194899_9227C976 
X-CRM114-Status: GOOD (  16.12  )
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

On Thu, 2025-09-18 at 10:21 +0800, Kevin Tung wrote:
> On Wed, Sep 17, 2025 at 11:12=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wro=
te:
> >=20
> > On Wed, Sep 17, 2025 at 03:48:08PM +0800, Kevin Tung wrote:
> > > Summary:
> > > Add device tree for the Meta (Facebook) Yosemite5 compute node,
> > > based on the AST2600 BMC.
> > >=20
> > > The Yosemite5 platform provides monitoring of voltages, power,
> > > temperatures, and other critical parameters across the motherboard,
> > > CXL board, E1.S expansion board, and NIC components. The BMC also
> > > logs relevant events and performs appropriate system actions in
> > > response to abnormal conditions.
> > >=20
> > > Kevin Tung (2):
> > > =C2=A0 dt-bindings: arm: aspeed: add Meta Yosemite5 board
> > > =C2=A0 ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC
> >=20
> > The threading between your patches are broken? How did you send them?
> > git send-email? b4 send?
>=20
> Yes, the threading is broken. I initially used git send-email, but for
> some reason, only the cover letter was sent. I then sent the remaining
> dt-bindings and DTS patches separately as a follow-up.

I recommend using b4, it helps blunt some of the sharp edges of git-
send-email.

https://b4.docs.kernel.org/en/latest/

Can you please send v2 of the series so that it's properly threaded,
after applying tags you've collected for the involved patches, and
checking your work with `make CHECK_DTBS=3Dy aspeed/aspeed-bmc-facebook-
yosemite5.dtb`?

Andrew

