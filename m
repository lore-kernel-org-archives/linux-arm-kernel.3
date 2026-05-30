Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526FACD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 10:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xf9P0EPvQn1LFSFweDG7oOWEJuepHmczDyWefeBtRGM=; b=yenOnyHbuQfDPpjd3vQj3VyoZg
	E0xMdDKkEXcEp2cl4JmtWwNn14mEuLSYvqgisM8mz6p0rEQUIaG9RCFOiTSQfuRiEO1m+YX9p7Od3
	qF5MVgDAgu88GRTMix2cTS77fE1gqbPVNDk9B62i4aI6pVFqeRCaxdk7jJ521YTiqGq/KdOOjAjW5
	6wGO4JFarhjgaBOhXJnfcb+TNA0F0U+H226MsL6ZaJToVAVyRqgmiOuMSzywi8WUsXwCCTyJebOu8
	asDePayMpvqHgGQstdL/8QskGsgirgK2baRbPPl2WTOYlR4ohmbiFfj5JZ4zc3URIbWMxoqNE8tap
	eM1fDMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGv7-00000008dGQ-1u8d;
	Sat, 30 May 2026 10:27:57 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGv4-00000008dFv-3FbR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 10:27:56 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:382:6f:8c15:9eec:bfe9])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D74B7CA;
	Sat, 30 May 2026 12:27:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780136851;
	bh=xIGVJHDXpcmxVhUELeooaud4zDPbQF75EH7ok2C0qKU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oAmTDck9dwCihc7pzbDIKdz8iRU2fvIkyf5klsPbJbEo2bQoWutWjOqAbvjx11EMO
	 kzmpWVxdLzDD3jwk3Z8O3JU65RsXYRw0sOrMeWxR32/u/p4+P9cgIfLRZjRGl/7EWX
	 QB+ARSCp1VoEbTZG6g9aalF/LxOzNZX88nFBXm38=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260529144917.wp46oj6z3clarvft@blabber>
References: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com> <20260515-beagley-cameras-v2-3-f6acb66c9995@ideasonboard.com> <20260529144917.wp46oj6z3clarvft@blabber>
Subject: Re: [PATCH v2 3/4] arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI0
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, Devarsh Thakkar <devarsht@ti.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Date: Sat, 30 May 2026 15:57:47 +0530
Message-ID: <178013686712.933414.13519886286669092495@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_032754_976672_8FA15FA6 
X-CRM114-Status: UNSURE (   6.14  )
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

Quoting Nishanth Menon (2026-05-29 20:19:17)
> On 06:46-20260515, Jai Luthra wrote:
> [...]
>=20
> > +&main_i2c2 {
> > +     status =3D "okay";
> Comes last.. please follow:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/devicetree/bindings/dts-coding-style.rst#n117
>=20

Oops. Will fix everywhere in v3*

* just realized I was calling it v2 in other replies

Thanks,
    Jai

> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&main_i2c2_pins_default>;
> > +     clock-frequency =3D <400000>;
> > +
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +
> --=20
> Regards,
> Nishanth Menon
> Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DD=
B5 849D 1736 249D
> https://ti.com/opensource

