Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F48EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 17:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjXeeeCYeiUa7yMAifq5hXz1HtFrjFiorCgExnyzF2g=; b=lN7ZPT1shBYLVEVuaV/LZChjp6
	qZtY4W6GMRcBu9eyZ0RZ31N919f3Y8JERb4I/8rd1bVi7zVrU8PIMdaBbeREws6OCu1d+m7qSTumZ
	kCdMotlEzEtZ6XRCHdqLAai/Bzt9/N3P2O42cTUFc3zwTcYPYxByZ8itqSDDWlnbVCZ6uJAD8l3Ak
	gbl0yMF6ko+ob8AvVMvQb2lnA8KpZZbETW46lo5vhqhEeL1pbImZSrlvbVQvXoMoIEehSCmEeBzK4
	HJaGgJinepc3XDsUaXIqeAm2uokIHk0QHiU+LDFtJYrfURTG0/9OxSLeI2zcYAFF9DVRzYd3oQXy5
	UuzuuklA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webxE-0000000HXvE-1Ddp;
	Tue, 30 Jun 2026 17:09:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webx7-0000000HXv7-3iav
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 17:08:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 551E9600FC;
	Tue, 30 Jun 2026 17:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426B01F000E9;
	Tue, 30 Jun 2026 17:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782839333;
	bh=vjXeeeCYeiUa7yMAifq5hXz1HtFrjFiorCgExnyzF2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ElepC66Pcuk267CvYmyn28I9bk3zHpHX2THxl8aq57IkCJXnUQBuLeA6ND3uVCtTf
	 UlsYWTk73uWhMnNjlC3jg7P7lrIeReoQ2Tkh/ciYapoig73EeiF8QJBmoO7qrOOLS3
	 NKLlS35VZ6hjxu9MmJNkIekPkp1KqgYq//PM5WhXMYWKriEt/31sSkCCmD40/pAOlS
	 05zkuCb6z+w5gIIVSvIxQpXSk0BXKpIC3Mta5W+PTFsDc39nkgqsqy74x5osEmFFHO
	 zubBFB+x5qzDhL5Hq2AETvLb/xv8yiWruG5/H0jWez/ZtOhekY1W/5OOmtBTziILS2
	 C4Pl3MgFtpIbg==
Date: Tue, 30 Jun 2026 18:08:47 +0100
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
Subject: Re: [PATCH 04/10] dt-bindings: input: apple: Add DockChannel HID
 transport
Message-ID: <20260630-halves-magnesium-856f9c7d60b2@spud>
References: <20260630-apple-mtp-keyboard-final-v1-0-506d936a1707@gmail.com>
 <20260630-apple-mtp-keyboard-final-v1-4-506d936a1707@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IFgQppRoGRqlg1/V"
Content-Disposition: inline
In-Reply-To: <20260630-apple-mtp-keyboard-final-v1-4-506d936a1707@gmail.com>
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

--IFgQppRoGRqlg1/V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 10:54:32PM +1000, Michael Reeves via B4 Relay wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>=20
> Apple internal keyboards and trackpads behind MTP are exposed through a
> DockChannel HID transport.
>=20
> Add the client binding tying together the RTKit ASC mailbox,
> DockChannel mailbox, and MTP DART. The keyboard child can provide the
> HID country code used by hid-apple to distinguish layout variants.
>=20
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../bindings/input/apple,dockchannel-hid.yaml      | 91 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 92 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/input/apple,dockchannel-hi=
d.yaml b/Documentation/devicetree/bindings/input/apple,dockchannel-hid.yaml
> new file mode 100644
> index 000000000000..dbba4fc38971
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/apple,dockchannel-hid.yaml

Same thing here about the filename. Looks good otherwise, so please
change that.
pw-bot: changes-requested
=02
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--IFgQppRoGRqlg1/V
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakP4HwAKCRB4tDGHoIJi
0rC1AP9CivYKeIXifyJKmjFVsB20Z3JWxax7appciOgjNqympgEAs/E2+BjCEf/S
gRxK6PCZN+rd05T+GWJvwgvz+22GFQg=
=VmHn
-----END PGP SIGNATURE-----

--IFgQppRoGRqlg1/V--

