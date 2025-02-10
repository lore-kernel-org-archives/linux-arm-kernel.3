Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE2FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GM2uG63mtzY/UCzuoJUN2JH4a7GbgULHzqMzKpHmkFA=; b=L5S03IKPGgF0uQZYy4cQdOISvY
	4KTgUAzi6jIayViAf+zFcLPxewAeWOxdN2lP0yBdqsUYxx6A9h6boBZ1E5E3SHLIqTaUu4Q7ALR+/
	VWLSwP4dd4LeYt79Qa4FSei1sCrB7RCwygRs95tjce3gxmM8CcHl2bzIftMAgi0nBvwtDY612x3aR
	sVnpti73/X4D1zqssF+HQS1Pd/JBpB9pbdHiA71UJwgLH1gqw1+Kz9+4FnPkrLDGYDHRlITOJL7F6
	YCwB4d33Q3vvvwqGN6iYx0K7gXW7tkA4XAIdrPY77XF1ZAW653AzgZY1EnhVjSjoZf3tfXq5Cy1C+
	cw+ypvAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thTDe-0000000HRuk-1DZE;
	Mon, 10 Feb 2025 12:48:58 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thTCF-0000000HRgh-03Ej
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 12:47:32 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1739191639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GM2uG63mtzY/UCzuoJUN2JH4a7GbgULHzqMzKpHmkFA=;
	b=ESbKkdxqz4qk8K/csAw9UPdZJegeZNw5n9IhkjYGhZRnGZZk5YOwmafSD0Rsz3LVQ+JSIn
	UYaGH4TnNr6niTvC5xvFSsXylxE5/LRkLAMz6yLn0TmYI+iGQSoGXbDTddwWcgkLCpVhJS
	z6ELn8kRIkefXSFlxLXQ2po+LeFrxMIqr/5oU9Fy8OVp1EC5EhGwqs/5yvhfc9HEZxQNfu
	inEk11D+cJplnPvgdyhFzmNJqNy2P7BaAV2VpcrNxm6dus8VhmFN4FSGtVXy6ycElgWHDj
	3zh1n6PzgxPVVnUX+DHiEOMfpEGWdplyDvIqn15xW6HinaNxpAEgy7vV1IwIzw==
Content-Type: multipart/signed;
 boundary=b54669e19e5db2e77cc4be97ec813a213b32a02ad4831e170911a19bfd32;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Mon, 10 Feb 2025 13:47:08 +0100
Message-Id: <D7ORZ8AGCPNE.1JTATRGD0MWLQ@cknow.org>
Cc: "Dragan Simic" <dsimic@manjaro.org>, "Maximilian Weigand"
 <mweigand@mweigand.net>, "Marek Kraus" <gamiee@pine64.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: dts: rockchip: add 'chassis-type' property on
 PineNote
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
References: <20250207111157.297276-1-didi.debian@cknow.org>
 <87a29b78-5fab-48eb-9a86-f12c41369dfa@kernel.org>
In-Reply-To: <87a29b78-5fab-48eb-9a86-f12c41369dfa@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_044731_186630_2C71B8D6 
X-CRM114-Status: UNSURE (   7.73  )
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

--b54669e19e5db2e77cc4be97ec813a213b32a02ad4831e170911a19bfd32
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Feb 10, 2025 at 12:06 PM CET, Krzysztof Kozlowski wrote:
> On 07/02/2025 12:11, Diederik de Haas wrote:
>> Add the recommended chassis-type root node property so userspace can
>> request the form factor and adjust their behavior accordingly.
>>=20
>> Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
>> Link: https://github.com/devicetree-org/devicetree-specification/blob/ma=
in/source/chapter3-devicenodes.rst#root-node
>
> Drop link, no need to point to source of every property. You don't do it
> for aliases, compatible, model etc, right?

Thanks for that hint, I'll keep that in mind for next time :-)

Cheers,
  Diederik

--b54669e19e5db2e77cc4be97ec813a213b32a02ad4831e170911a19bfd32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ6n1TwAKCRDXblvOeH7b
bs2AAQDX/PMiD8ZS28oCmS3Xv1dgFP3IfMHvGFu7LHmEpzKiKwEA+8BWW5g6zQbw
lQVv4CZU5jr1q6/TEA7nZm2n0EmYjAg=
=w7P3
-----END PGP SIGNATURE-----

--b54669e19e5db2e77cc4be97ec813a213b32a02ad4831e170911a19bfd32--

