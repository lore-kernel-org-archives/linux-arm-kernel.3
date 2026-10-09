Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F797CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 07:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/8J9ffRImKtNVgXRfCWQ7IuyliYAcjl+4vVSs1mp0o=; b=Bc4GWT4gNvowV0jHMYBiXfQXkg
	rCgsjCJfHzJrerCssvNebZ691WNllJEtokksuY+eL1hy+1/QZBa53litKF5KKq450yt5ZVXGRuDOQ
	ituBYyLulSCD7uc5gDD0q2ba/O5YXa6UnDRjgdT7A5FNkr4ZvrLwyvqoyvVKBVLUV6qz6mqBsBkgf
	pj3i7Airj/enuPUHR2sLlHb6rIi5OAaGDElbWNwtFcl3eCCzYNwhI5HwsjYiW518sQUenLOL0xZ+Y
	QexBZ3bJOg3iYHy/D+4rL56bdY5RarHWKE6fY1IWv4uyWGLYwwJCGPGi7Nm5XRQCt/hjji1enPCwY
	hmJB33SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4tF-00000005i46-3nHB;
	Fri, 09 Oct 2026 07:19:37 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4tC-00000005i3V-0J2a;
	Fri, 09 Oct 2026 07:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=a/8J9ffRImKtNVgXRfCWQ7IuyliYAcjl+4vVSs1mp0o=; b=dasyinXg5c5YC9V8raqDWPImHP
	ZLaFAtOqeK/6eFGh99ixvboc5TRLL4LqbmI83EQEC7yFDUW7RbfmU8fWQ0h5F3wzWB/ocDRdNs7aU
	Mx25M1ZiXFRP1B6KsiQmYb88Yti+hdeSgb1L7I8v113gqBReOZBgVKmBp2EALwVl4oLP/4ALmSojt
	wdeRs8PbtPMCKyKtrLMTm8ifBggbc33keCoyCkodt+ugxhgxlLjIceV1drs09ZBSrlrY0X1rxJDQQ
	/MO/n3RG9Eqp8/LNKzwfQDYdUR21ZO8UCSiwjXYwbucVhOS5frUaE7RK4OTyXFa/GhNdiofR7KSzX
	9kiqAF+Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liang Chen <cl@rock-chips.com>,
 Jun Yan <jerrysteve1101@gmail.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add dma-names to RK356x UART nodes
Date: Fri, 09 Oct 2026 09:19:25 +0200
Message-ID: <3055334.SvYEEZNnvj@phil>
In-Reply-To: <20261009020103.364498-1-jerrysteve1101@gmail.com>
References: <20261009020103.364498-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_001934_196751_5A4F919C 
X-CRM114-Status: GOOD (  11.27  )
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

Am Freitag, 9. Oktober 2026, 04:01:02 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Jun Yan:
> The RK356x UART nodes define a dmas property but omit the matching
> dma-names property, so the 8250 driver fails to request a DMA channel
> and falls back to PIO, logging:
>=20
>   of_dma_request_slave_channel: dma-names property of node
>   '/serial@fe650000' missing or empty
>=20
> Add the missing dma-names =3D "tx", "rx" to uart0 through uart9,
> matching other Rockchip SoCs such as the RK3588.
>=20
> Fixes: a3adc0b9071d ("arm64: dts: rockchip: add core dtsi for RK3568 SoC")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>

Please don't do that. Uart dma can cause problems on uarts that don't
use flow-control, see [0]. So the solution of choice is to only enable
it for uarts connected to bluetooth on at least RK356x.


Heiko



[0] https://lore.kernel.org/linux-rockchip/CAMdYzYpXtMocCtCpZLU_xuWmOp2Ja_v=
0Aj0e6YFNRA-yV7u14g@mail.gmail.com/



