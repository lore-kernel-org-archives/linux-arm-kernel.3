Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7C1CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 18:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1tQc9fKxPXjOAXomvZMDR+OXXQMQ2u54M9yxOwFvaQ=; b=qtGCyY9tDuWe8bId4xHgccir1h
	SjJhQX3CcGKWFLZabip0bC/fFhMD+x02A1t+5X8lUGQQgypT76F4o+tWctKkcD88YT4ywNcuHSGvU
	FZegvHuuAupAQAjRvXGPmAKghEMs3j4HmugM64PnJDaEAuu2deUDNNGfKUvG90c/DrhZTIlcDdD4e
	CljXcEGh3vAmH7uggqnnH69IojEqbE5QdCjb8CjtUQtPTA6j2pRa0bUa+ch14ExsC5D7KnOtCnwLa
	u8OoI71wQlTC3CuZYkxQ8gp3PEAPhtYuQb7Hm0thZhGnpb7cEqsmakkakevrido4NDihwYqa5531L
	HOPHnbsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsgA-00000007Zgv-0AFu;
	Tue, 11 Nov 2025 18:01:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsg9-00000007ZgV-0xVK;
	Tue, 11 Nov 2025 18:01:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 82A554012E;
	Tue, 11 Nov 2025 18:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609F8C113D0;
	Tue, 11 Nov 2025 18:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762884076;
	bh=f1tQc9fKxPXjOAXomvZMDR+OXXQMQ2u54M9yxOwFvaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fMnkboKgujlmFzn+1F12YPG0LrNsL91vnvn/TUaHmyNFFWL5O9ua8Vt0+9og4W4SD
	 BBCkFndVJY/FAdIdXHQXE6w8eGcsHc2LUrZ4bFj3ascztlgJN7KftPO0B3TxD/R0mJ
	 IYimW6mPvZwjTg+oxfVYA9OERnqCnrI6nVwyu8IibLiP6fX9/el1eW4d6S5qXDwDzK
	 b7vto81dT3Fu1sK1LpH9Rdpxm91E2mhmKIbXEwmrhIgLPSmwkM2pxG9JMtrEql9Q11
	 IdfxuLPKBWCFZiovJcrbeDfko2anZvHPKTe9vsZFm1ZF/YCTBHL+CZmEL55qjbdTei
	 FY+9eoDAR1lZQ==
Date: Tue, 11 Nov 2025 18:01:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Jack Hsu <jh.hsu@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, srini@kernel.org,
	ukleinek@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
	chunfeng.yun@mediatek.com, wim@linux-watchdog.org,
	linux@roeck-us.net, sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com, andrew-ct.chen@mediatek.com,
	lala.lin@mediatek.com, jitao.shi@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v7 5/9] dt-bindings: usb: Support MediaTek MT8189 xhci
Message-ID: <20251111-ocelot-ipod-4d5f902b640b@spud>
References: <20251111070031.305281-1-jh.hsu@mediatek.com>
 <20251111070031.305281-6-jh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mkp7Vm+0xTxl2wgI"
Content-Disposition: inline
In-Reply-To: <20251111070031.305281-6-jh.hsu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_100117_290486_AC5E875E 
X-CRM114-Status: UNSURE (   7.89  )
X-CRM114-Notice: Please train this message.
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


--mkp7Vm+0xTxl2wgI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 02:59:19PM +0800, Jack Hsu wrote:
> modify dt-binding for support mt8189 dts node of xhci
>=20
> Signed-off-by: Jack Hsu <jh.hsu@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--mkp7Vm+0xTxl2wgI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRN55AAKCRB4tDGHoIJi
0nZ6AP46To/9lZ7sJV4I2ivoFKzECzpBwHjBzWlqIKPxNe0XpwEAoe7F6s2tr9ca
hGvlAGOJEUCvxWDv5C09Q2U7m+8MuwI=
=k5Lj
-----END PGP SIGNATURE-----

--mkp7Vm+0xTxl2wgI--

