Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A49BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 17:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUt9xvrobGC1g8ep6yGQsb6675NZBAP2ejFkWc8jgUQ=; b=T/Gz0O+uL9xwK3vqhbjkV/BQtn
	llRFGmgZF+MPprTH/QyoNhVrWZ9TpP0vWZUsPwZpE/vO2ZlBSqDR4pEFxXGWrXS1XikC2Y/AO1Dyq
	QZB1ZNblGmKl5oxB0hJzl9+52wNHEh8+X2wfcYXo/4mIrJu16FkkjtRY4ePPP59lcdW6q5WxTFoIo
	onRUnsz144Cuidw32GIEt4yLpieFjr2AtyL5wQbHeJezhoqDQDo0osuS0WlAZNjm5qM3wt+xVdcxZ
	dMnZhtubOThJW3viFIaEKBqtO4NLBgVx97YvUVra+n9KjMXfOgjW+6pB6VGfhEG4zkDvBS39hoESA
	UvHvfmwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webvT-0000000HXfU-3HHd;
	Tue, 30 Jun 2026 17:07:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webvP-0000000HXeu-2QGV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 17:07:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 92340600FC;
	Tue, 30 Jun 2026 17:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F9621F000E9;
	Tue, 30 Jun 2026 17:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782839226;
	bh=KUt9xvrobGC1g8ep6yGQsb6675NZBAP2ejFkWc8jgUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SubIErM6OY/nb2I7a7mQa5SIcfQTpE4YTLOyvIpyeIB6PeUG3Lv4jF54i2MGGmdCh
	 wgl9ejCIKKFHKzm3brvHXwKMxMAyx+Hm+ohaq8CLBP4BuBp7+RssCBNkLGNDNFrh1s
	 Xp8obx4mdhNWPOSpPO+e6vcGDC2FHX0eqoolO6JD+NQ29QBbmU+8EfMqs0B/awPTZi
	 zgHwv9uiKZRWH2/c+3GCb7oAdOiyS2TAJC2XRKQ4QXErxmmREKGcUsADIZTUzmc5+Y
	 EnJGY7PSkzy/M2X09lRHaWizlACWC0UghIHGpS1r1UkHFCGslJibnLf1bkH6RcLjZz
	 fzNjBevOQDa6w==
Date: Tue, 30 Jun 2026 18:07:00 +0100
From: Conor Dooley <conor@kernel.org>
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, iommu@lists.linux.dev,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 02/10] dt-bindings: mailbox: apple: Add DockChannel
 mailbox
Message-ID: <20260630-tattling-pacify-3b990261b8b5@spud>
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-2-506d936a1707@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0g22oMjV9TukVVJO"
Content-Disposition: inline
In-Reply-To: <20260630-apple-mtp-keyboard-final-v1-2-506d936a1707@gmail.com>
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

--0g22oMjV9TukVVJO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 10:54:30PM +1000, Michael Reeves via B4 Relay wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>=20
> DockChannel is a FIFO and interrupt block used by Apple coprocessors
> to exchange byte-stream traffic with the AP.
>=20
> Describe it as a mailbox provider so HID and future serial clients can
> use the common mailbox API.
>=20
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../bindings/mailbox/apple,dockchannel.yaml        | 75 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 76 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/apple,dockchannel.=
yaml b/Documentation/devicetree/bindings/mailbox/apple,dockchannel.yaml
> new file mode 100644
> index 000000000000..4f326d8f3d5a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/apple,dockchannel.yaml

Please name this file matching the t8112 compatible (since that's your
fallback).
Otherwise, this looks good.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

pw-bot: changes-requested

--0g22oMjV9TukVVJO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakP3tAAKCRB4tDGHoIJi
0tpsAP9yh09xpXCe3hdbIXOFLGIAYGngvFJx/GaejeLl6sq6dwEAl0uB3079qxBT
RmiRaPZl5o6Er07zy4XhqIYj9j9MBQE=
=XGKy
-----END PGP SIGNATURE-----

--0g22oMjV9TukVVJO--

