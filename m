Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74024C02196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 17:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wAX7PNJtWVKYZDJ8A6Vtwdu0ZwlwN4Kc8QcVWARzBUk=; b=kKIhFagc1vT14hGGUjGeteQxYY
	9gimQ7vz/554PNohAp8/8yiLq2aIyABBKmguEaa9/leYytPKgzFlcxRmeERuyyyl7I1FMNbiBHMX8
	h7r69eHxufQFrI1jVMp0TV4+Z5Mrr7vNA6KmXv+qPPOViKdk7j4O9hj4EPAv/fTvFVeSnxu29gsxQ
	AQtEurKtGVm45+gqNQv/6Wv92Km7Kj4pZDzkNoqrtSGrnN14+h+cPElf4Vtm9PZkNsajNJcgglnea
	1l3Da2YF6din59rsFKNUVTxzI7vSl6IfQveMqp2xUJN8hD35k9r1OsAWx3q7Ug0ce+WMCfcpQBb6H
	zJxM4YQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0aW-0000000GB1s-3Qfl;
	Mon, 03 Feb 2025 17:50:24 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0ZC-0000000GAn1-0FIz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 17:49:03 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738604936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wAX7PNJtWVKYZDJ8A6Vtwdu0ZwlwN4Kc8QcVWARzBUk=;
	b=Dl4Nh2+xLRGqNzL1rYOZED8vMwiHr3x2pPvpB52PjVCFvthQUL2ZFzLnRp5fN//2W2d2u7
	U2ipKgQH0DL8xQ2vG5oWTH+F48OzGdbA12TG2ESWG1QJuPqi/qHB6iWNKnIlvLtDcR8elo
	EDS39mOHTj3E13IaEDFJP1OaV8HjHghPYTEDVIc+0rX1pQEfBdFL2e/Gqn7ESeQYkO5QVI
	v3sFQOAuz/T1+tOqKeowoRDk/aXO6TxtaEWSkLkjf/gUqAroOxkY2/R1gjt4K3zVDuSQ7t
	bNFwL/xoYZPYTpPAFQPjjV6juO2nhN0H1u1b8Ads7t7qNMkTw0H8TcGsAnqnxA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Feb 2025 17:48:08 +0000
Message-Id: <D7IZZVD446TD.EPLWERDL77DJ@postmarketos.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: amlogic: add support for
 xiaomi-aquaman/Mi TV Stick
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ferass El Hafidi" <funderscore@postmarketos.org>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 "Artur Weber" <aweber.kernel@gmail.com>, "Karl Chan"
 <exxxxkc@getgoogleoff.me>, "Christian Hewitt" <christianshewitt@gmail.com>
To: "Ferass El Hafidi" <funderscore@postmarketos.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Kevin Hilman" <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-amlogic@lists.infradead.org>
References: <20250203091453.15751-1-funderscore@postmarketos.org>
 <20250203091453.15751-3-funderscore@postmarketos.org>
In-Reply-To: <20250203091453.15751-3-funderscore@postmarketos.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_094902_233011_36E6F10A 
X-CRM114-Status: UNSURE (   6.60  )
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

On Mon Feb 3, 2025 at 9:14 AM UTC, Ferass El Hafidi wrote:
<...>
> +&uart_AO {
> +	status =3D "okay";
> +	pinctrl-0 =3D <&uart_ao_a_pins>;
> +	pinctrl-names =3D "default";
> +};
> +
> +&usb {
> +	status =3D "okay";
> +	dr_mode =3D "otg";
> +};
> +
> +&usb2_phy0 {
> +	vbus-supply =3D <&vcc_5v>;
> +};

I just noticed a typo.  This part should've been:

	&usb {
		status =3D "okay";
		dr_mode =3D "otg";
		vbus-supply =3D <&vcc_5v>;
	}

Sent a v4 to fix it:
https://lore.kernel.org/linux-amlogic/20250203174346.13737-1-funderscore@po=
stmarketos.org/

Cheers.

