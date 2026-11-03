Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D91606B6FB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sJRUoM6l;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Kck2UP0Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ldn8Uwg6bIM1pXx42AqleDz0qwEhH4Gry8sXUgnKs6o=; b=sJRUoM6liHVXHFYOASD1F1s0Dl
	2lG5hKaHGE+kUlKGdMstCM5jHyJcL0me/lkicahPlPjdqyw95uXzrg4fsANxdfe4XZSwxG9k+e5zo
	iV+bessbtvbcmzSkapWCebqBWnMl18XTdGnSh0GSOoq2neTyI0wtqBLOM/BAt/JJibc/Ji7H9/CYZ
	JlcyK9ABLkNUeRf+LImGq7DF56mJpZwT5P6OVeFDdAnLH311+oNH9PHI3xpLGJlRd2hO9GMMyBK21
	s88JspikyviTDbUzTbFA37iUMnn/j7Fw7yHy9U6EGzX6X1PLrto+f97gkctji153Z8EJgJyZDnSEf
	DWE1XzdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA6y-00000001cCm-1Sk6;
	Tue, 03 Nov 2026 08:43:20 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOA6s-00000001cBC-2FiJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:43:19 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 55CC12008B9;
	Tue, 03 Nov 2026 09:43:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793695389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ldn8Uwg6bIM1pXx42AqleDz0qwEhH4Gry8sXUgnKs6o=;
	b=Kck2UP0QjPeBD+dXF2Jmn193MsuLvVO7FP7b/g5B1P/ObxtBifpJ1sSRm/iCx7CWCcTWSa
	Chj0vkDcub1MJUasXIOKI8WxN6XHQxizt+E7EYVY/prE07p4ssus50V66Shkso25DXjbhh
	oRv5YG7DHRLO6SxI89M1HuTLIqv1ettxLwOPgWVErl0+tUNN1EZNrb0zwHaeqU+6aKLMTk
	BHfKkWVUKYymQmAzNnKEVQ96xgOynrHWMFpjr1UFG/Emj1yjqJHlG8NJCV7CIQUyi3TCR1
	quzEqgEM6PZzo914SEptmqvDvbdArVUBVSbdxjAB+pWaucQJH2eE34z9oshutA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793695389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ldn8Uwg6bIM1pXx42AqleDz0qwEhH4Gry8sXUgnKs6o=;
	b=I1cGpfUEClaIOygpZTETCF7+eSpVpI0odhnZdCCMV7ICqkMFP3EwolT8HNfF3vJgaxqdrO
	RU2+uJnrwDZhXqlwkDDWQWQ2CsA6EDO+QGb1SnJ1kP9pD9+LRBHzREa871JjdpfPwCXujz
	wkP4S1j+3TaOmpUp551r9pQQnC4s6ieuDO22dwGX4L1sEpQjBNC1QAr1nVZdJR36PgnTLO
	z4roXxOUBWv2gkwV0kBtyy5ip26ypAr6yWHIxke/GKQvemVeIc0WmyaidTEqmiXjqL3ftk
	yqr/xmdK/vtTjUwNerI7bilfphluj+9hhdUguq59f4uu0C+8PmCKVbXpjlfTmA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793695389; a=rsa-sha256;
	cv=none;
	b=Qd5lw6fGwGDLiZqtNAFsg+uAqFjyk16IKa0DeuAXRInKqEou/lGpsk3vz2dNlCscxLhaBv
	1LXADaF9n98nvDDqLdG5BplF5gwozT+iVMXOuKnKXsCI1HJSdNL5BCOp+MX2ll04+FY9mV
	tIiipahdAl7LmJTxmxQK9bXbnXonQ0pNjw2/o16hZzatjFPRE+l5acUnEWgT1EVua8K/mr
	Yo3y41cBycH3mHA1DB7FHxOE2VYh+u1TlxhjsZK6OZKgp/A8uDOuBaepAmonTmd3uFmUv5
	wRUssR/6V7EutLYmQ9SO/XmgIINcGFAUuCxAp/K4DDCkwnOFyl0JmZF44AMdMg==
Message-ID: <81dcaef70174ea7746bbc5a31777770717c14357.camel@pengutronix.de>
Subject: Re: [PATCH v5 2/3] usb: cdns3: Add CIX Sky1 glue driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Hongliang Yang =?UTF-8?Q?=28=E6=9D=A8=E5=AE=8F=E4=BA=AE=29?=	
 <hongliang.yang@cixtech.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Peter Chen <peter.chen@kernel.org>, Pawel
 Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>,  Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>,  Gary Yang
 =?UTF-8?Q?=28=E6=9D=A8=E6=96=B0=E4=BC=9F=29?=	 <Gary.Yang@cixtech.com>,
 Fugang Duan =?UTF-8?Q?=28=E6=AE=B5=E5=AF=8C=E5=88=9A=29?=	
 <fugang.duan@cixtech.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, cix-kernel-upstream
	 <cix-kernel-upstream@cixtech.com>
Date: Tue, 03 Nov 2026 09:43:09 +0100
In-Reply-To: <20261103074929.1971195-3-hongliang.yang@cixtech.com>
References: <20261103074929.1971195-1-hongliang.yang@cixtech.com>
	 <20261103074929.1971195-3-hongliang.yang@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_004314_725305_1587E272 
X-CRM114-Status: GOOD (  14.93  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Di, 2026-11-03 at 07:49 +0000, Hongliang Yang (=E6=9D=A8=E5=AE=8F=E4=BA=
=AE) wrote:
> Add a glue layer driver for the Cadence USBSSP controller integrated
> in the CIX Sky1 SoC. The driver manages the controller clocks,
> resets, and the mode strap controls located in the Sky1 S5 system
> controller. The per-controller glue registers, the AXI bus attribute
> configuration register and the controller status register, are mapped
> directly through the reg property of the glue node.
>=20
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>
> ---
> v4 -> v5:
> - No changes.
>  drivers/usb/cdns3/Kconfig      |  13 +
>  drivers/usb/cdns3/Makefile     |   1 +
>  drivers/usb/cdns3/cdnsp-sky1.c | 716 +++++++++++++++++++++++++++++++++
>  drivers/usb/cdns3/cdnsp-sky1.h | 128 ++++++
>  4 files changed, 858 insertions(+)
>  create mode 100644 drivers/usb/cdns3/cdnsp-sky1.c
>  create mode 100644 drivers/usb/cdns3/cdnsp-sky1.h
>=20
[...]
> diff --git a/drivers/usb/cdns3/cdnsp-sky1.c b/drivers/usb/cdns3/cdnsp-sky=
1.c
> new file mode 100644
> index 000000000000..1f7870289a35
> --- /dev/null
> +++ b/drivers/usb/cdns3/cdnsp-sky1.c
> @@ -0,0 +1,716 @@
[...]
> +static int cdnsp_sky1_probe(struct platform_device *pdev)
> +{
[...]
> +       data->reset =3D devm_reset_control_get_exclusive(&pdev->dev, "cor=
e");
> +       if (IS_ERR(data->reset)) {
> +               ret =3D PTR_ERR(data->reset);
> +               dev_err(dev, "get reset error:%d\n", ret);
> +               return ret;

		return dev_err_probe(dev, PTR_ERR(data->reset),
"...");

> +       }
> +       data->preset =3D devm_reset_control_get_exclusive(&pdev->dev, "ap=
b");
> +       if (IS_ERR(data->preset)) {
> +               ret =3D PTR_ERR(data->preset);
> +               dev_err(dev, "get reset error:%d\n", ret);
> +               return ret;

Same as above.

regards
Philipp

