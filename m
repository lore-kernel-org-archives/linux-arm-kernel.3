Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6D6FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qc984VXNHHvC32RbVpZciAuAa/2I+jDJaKhXFjRVIoM=; b=ICV/D9kCjPYniLy8MjHEna8LAq
	UgjY+J2uwlvEMw92MlzMiBAP6ECwgbR2cCn9uOAGsn9N9b6yvSl27lu8Oz5BBniOzwWEYzM8c74tL
	g1KHD4G4x+w1tiqozvWnsKtQ2Y8ZXNTDq1LaQzNVW4RCznmXP+PfyzLXB1aLCz8tZuzaTj3FxXFR1
	GIQ1t8H7fzWmjXdXB3FzTz/qOksSxizTbNxiQh5Ye3V3pn5bw8RUNo4Ut9fDvHneo/C6k9Xokh8Hj
	FUtoZAo7CsOQJHwmuCHBtFYG1C3lTUK5WSBK1YppcnMzSRLBdP8RvyzLUmtNOs5whRFucl9gK5eTn
	PcxoGpqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIjR-0000000GuJV-2F2a;
	Tue, 05 May 2026 16:34:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIjP-0000000GuIj-28qN;
	Tue, 05 May 2026 16:34:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24E4D4421C;
	Tue,  5 May 2026 16:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8365CC2BCB4;
	Tue,  5 May 2026 16:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777998887;
	bh=qc984VXNHHvC32RbVpZciAuAa/2I+jDJaKhXFjRVIoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G4XvgNZBsgCRfI+PCO7pm1+0tcFxLJEShRVaxqaEwJ4YewLMTdPdfJInXjgq17mkn
	 DGFKbFuvmgSbp9BVVGMKssOjtjrguhyK5wEE3BKT+QNr7QZNqMdy8ueFYRv/x5/ZW/
	 fV6iWw7Njq9sFtKat6sQ87zbHdE/iqX+eAxWEcV4wZ+/HkIQR3ZI9X54xK9hIjOkdL
	 d1WGnjkVMXMdxwJtI+Lcq+y+KB4JsCXg2l7V6fRL6LZgDoMuU/p/+4bunjW6wnJYLN
	 YmCA+FPdAS9O/xJEtox8NHcaNYMaDk88A84BaP+wwg1685BzErBCXwqMRTf+M0ee/P
	 R3lpwodI/gGsw==
Date: Tue, 5 May 2026 17:34:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hui Liu <hui.liu@mediatek.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: mediatek: mt8188: allow gpio
 hogs
Message-ID: <20260505-entrap-overlabor-15836ee436fc@spud>
References: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DIsZuHi93grM9P+H"
Content-Disposition: inline
In-Reply-To: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_093447_567373_FB01256C 
X-CRM114-Status: UNSURE (   8.87  )
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


--DIsZuHi93grM9P+H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2026 at 03:27:47PM +0800, Icenowy Zheng wrote:
> Add gpio hogs subnode rules to the MT8188 pinctrl binding.
>=20
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--DIsZuHi93grM9P+H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafocIgAKCRB4tDGHoIJi
0oWrAP9ygttj0OCwT6Kkpp4slmIox190glu7Na3GGLYJU7155gEAnwtli15+pvtJ
d2IHidMAeYSwm4RxD/ajJKUli4W65Q4=
=iZ4S
-----END PGP SIGNATURE-----

--DIsZuHi93grM9P+H--

