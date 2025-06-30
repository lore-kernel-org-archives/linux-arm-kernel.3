Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6AEC83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 11:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPFwbPUWBXDT92ojYtJuOQPO2L8B2j+IEn0/GIzjJBo=; b=eggX8mxX6poeUewCejH3i1JexH
	hknP71ky3VwvLFtTJwMMUXTbMuVK9ynNq2qtmBNuBrHa96nkc+652l/QE2qI55EIUQSo1zNPsjPHz
	I6Bjten3mzxcQEHlpdvnIKXXsjSCkn1vA7pZHYkYFjXuH5i7Asr8f648YnqVb30Vm4HIEu1pPfrQO
	nf3TWk3LMxaw7QSzvMVq5o03HQxJPW2LvE3z/0495XdFfTZ5cLOK19WYoWkr1jZH3QvCz7JHBqdtO
	HbCwxWYapNBOrusKUtJdHSOdZNcKnE2Zy53Ja3wvq+pYii0DR0FnElKEw+rUOX95Qfap9XKCZmMxr
	Lz2qDgFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWD9n-000000027SZ-2Vjh;
	Mon, 30 Jun 2025 11:58:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWCpP-000000023fn-1xDP;
	Mon, 30 Jun 2025 11:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=xPFwbPUWBXDT92ojYtJuOQPO2L8B2j+IEn0/GIzjJBo=; b=Ui75+re1+KHTh458MbR2Bd8mPl
	fOrvQv6wD2E4IGeav9+UmD++98eSS9csdwlsEA1HIomHH3gzWvvVfs41PHmk7llKYSQwgXNKtaOiL
	AOXC7abgKoZk9smIrQjMKrpBQzXk8XxXwt1QTHgadnWPBVsOOLNlExIqBeGdqrsFfWcXcNMsQID88
	RZ8ydWZg0j6zM/5m4DhUwJ+QOgcUx9rKl5qEqME542DtN4XORD/Efywkrz/iKmOMLuOAwc3ehtmM5
	i3haBZVQrj/fCb3bx3+hhOOvLmWU57e00f7fFkB8kKL3kTCkLBh4p1STkCL24tcOgHeYoo7WksAvU
	ONCuxQHQ==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWCpJ-0008LL-Qw; Mon, 30 Jun 2025 13:37:33 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH 1/4] dt-bindings: input: adc-keys: allow linux,input-type property
Date: Mon, 30 Jun 2025 13:37:32 +0200
Message-ID: <5913630.hdfAi7Kttb@diego>
In-Reply-To: <20250630-rock4d-audio-v1-1-0b3c8e8fda9c@collabora.com>
References: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
 <20250630-rock4d-audio-v1-1-0b3c8e8fda9c@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_043739_520710_2110265F 
X-CRM114-Status: GOOD (  15.30  )
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

Am Montag, 30. Juni 2025, 12:19:24 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Nicolas Frattaroli:
> adc-keys, unlike gpio-keys, does not allow linux,input-type as a valid
> property. This makes it impossible to model devices that have ADC inputs
> that should generate switch events.
>=20
> Add the property to the binding with the same default as gpio-keys.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  Documentation/devicetree/bindings/input/adc-keys.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/input/adc-keys.yaml b/Docu=
mentation/devicetree/bindings/input/adc-keys.yaml
> index 7aa078dead37816294732501e1983ab869f38311..e372ebc23d1651d73ef3749a5=
6d54872067037b5 100644
> --- a/Documentation/devicetree/bindings/input/adc-keys.yaml
> +++ b/Documentation/devicetree/bindings/input/adc-keys.yaml
> @@ -42,6 +42,9 @@ patternProperties:
> =20
>        linux,code: true
> =20
> +      linux,input-type:
> +        default: 1  # EV_KEY
> +

having both adc- and gpio-keys behave the same in that regard makes a lot
of sense, and the addition matches gpio-keys.yaml, so

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

>        press-threshold-microvolt:
>          description:
>            Voltage above or equal to which this key is considered pressed=
=2E No
>=20
>=20





