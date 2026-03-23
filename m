Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F026CEC01A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 08:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZrg3073YvRn5Dp2yAL/QnRBIbaZV1wKQhSYGwFdg0w=; b=a7Kfu9UJEAoGfcuawnjvDlqe8U
	CA0XvvgmJlV2jW7WYLg1/aTcCCH5e8igrCmD9SBGb0AQ3BOc+EaUwxpoXR3d85Twqsvmj3KFnYgvb
	E0bV4RgWIp1SZnakDjo+pSvpvPHDBBowm74Q+1zLGgUKZweaLPSw/zoT93nAbpSCix9byP9MI3T+O
	zazfxVJeXhl2cJLMbGoY7Bw+EWeNcoqnaA1YBFbrKQQl+mozcobsxtXcnlFxV84/f34unXWBSfpT2
	zIJUSX5xUDWV0qOzzlsp+He3DOb3cTMLk7oWSaANk9T7HexJtnkXqjKpkelphdUCxWhbLD4slKbfT
	omBuUTPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4av1-0000000GIdS-421V;
	Mon, 23 Mar 2026 08:45:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4auz-0000000GIbx-2Xq8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 08:45:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6197D43BCB;
	Mon, 23 Mar 2026 08:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE996C4CEF7;
	Mon, 23 Mar 2026 08:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774255548;
	bh=IZrg3073YvRn5Dp2yAL/QnRBIbaZV1wKQhSYGwFdg0w=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=MqZJJ+jEXv66rnW751yqXlW9hMqAGiXOgu5FRwFFx4ERxXcucMsrpn0wmuKJyfre/
	 z0b2cJa57c4a6Pzy04GpXyRidWJ14kWnKCMRi3eeULZh/K087FrQ0KiP/6lcPknEGs
	 bjtsxeanA+J5BKE+ZiRQf+wqwO+vFnjITVtnOxoRUQjMDf3IUln1PWB+DJ2vtIiPFc
	 9VcUX83Ma/9wRdW0/nn2KvTkgW4sQrC6fQR3RDYbnpG9qXCIPoI7NgcxKtqyxs9KqJ
	 njgU6s/2VapcsTCeQmQ/TjhQZDWpDW+ks0UZn01j5x3HfuNems7N6rLOvemIejM8D6
	 ur2+jgFfIaHLg==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=bd4a73f9dd4d15328054ccc0b5312fbbd2fc1c943838d1efe8c042901083;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 23 Mar 2026 09:45:37 +0100
Message-Id: <DHA13HM1GIJW.1E7XCMY349JX7@kernel.org>
Subject: Re: [PATCH v2 6/7] dt-bindings: watchdog: Drop SMARC-sAM67 support
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Conor
 Dooley" <conor.dooley@microchip.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Guenter Roeck" <linux@roeck-us.net>, "Nishanth Menon" <nm@ti.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Srinivas
 Kandagatla" <srini@kernel.org>, "Wim Van Sebroeck"
 <wim@linux-watchdog.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260302122540.1377444-1-mwalle@kernel.org>
 <20260302122540.1377444-7-mwalle@kernel.org>
 <f124b200-09e3-4e73-a100-f47007732e8f@roeck-us.net>
In-Reply-To: <f124b200-09e3-4e73-a100-f47007732e8f@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_014549_670566_9192C0CF 
X-CRM114-Status: UNSURE (   9.51  )
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

--bd4a73f9dd4d15328054ccc0b5312fbbd2fc1c943838d1efe8c042901083
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Mar 2, 2026 at 4:01 PM CET, Guenter Roeck wrote:
> On 3/2/26 04:24, Michael Walle wrote:
>> I was just informed that this product is discontinued (without being
>> ever released to the market). Pull the plug and let's not waste any more
>> maintainers time and revert commit 354f31e9d2a3 ("dt-bindings: watchdog:
>> Add SMARC-sAM67 support").
>>=20
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Everything expect this patch was picked up. Guenter, do you want to
take it, or should it go through the TI SoC queue?

Thanks,
-michael

--bd4a73f9dd4d15328054ccc0b5312fbbd2fc1c943838d1efe8c042901083
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCacD9sxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/j8xgF/YE8auGYf7y4fj5Wh1h3SKh5Yl6dpVBAG
OKsJlsNtaEhDxOMkeG3zYURQ/NqDSjQ+AYCRn1+pOiDB/8sAFVZx1L9i4pZWq3cQ
Eidq3hJvghVNoQcTlcufj4jMfOPRjSUh4QU=
=P+gh
-----END PGP SIGNATURE-----

--bd4a73f9dd4d15328054ccc0b5312fbbd2fc1c943838d1efe8c042901083--

