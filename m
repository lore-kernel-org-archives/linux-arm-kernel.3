Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CBBC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 13:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjpIa2XgFmm6zQMA4pXnY2mees84ECC2FENB0WxODPI=; b=YTamujr0Y/usls2lFeaCLtcMAQ
	0rBvqt8MnMSVA/FZtaM+m5QbSOVyqnvxC93niVZZXvPlD8TAE08yYUD0AdQyShOwSvyTMRB2ax95d
	1SVPf26b/v/nPyy9HGK+e9PilhJsXtppx2wekETPZf7ttLdKdxy0fxiP9DvBbKycmEePULO/d5KMc
	mB/swSHr1y4UXs8NF/CJFcZBB6Caf5X84wUVueDHPtYm1R5k82IcN3bCecepSSZid+2x59+shBkc3
	jjTmIvV8mmtDli4LOmTYrD/d/siJSfBp9aZ3jzSFoXJgPzdFdZRrnptj6ztK+W5hUnsnHcDugurFw
	ZewRPcaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqT9-00000003ytx-2Vn1;
	Tue, 11 Feb 2025 13:38:31 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thqKT-00000003x48-3zvj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 13:29:36 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1739280569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mjpIa2XgFmm6zQMA4pXnY2mees84ECC2FENB0WxODPI=;
	b=F76PrS/Srf+TRRk4IpALolWISlQCHaKg2b1va2BOB6rNkQcsP1j2VWNnabRLhH+dz3q0gJ
	CXcMXeItjojp36cU3MVppUnZPhrnenfB5ABnwjugZZpa4xAaYr7Bs/mtM+bMyeUOAArSzg
	kT0mBGGTr4yHcAPRvb7sTImS2xszkZvUCqRIe33uc8lqBh2Nxa+AaftUYu89Ez4ZSFsNR1
	4q2Qy2Rq5po7/cY6G68tPzhOanFUwjAyqdHBamjx0VayA75QmjMBNMctRAW4AvznsidD2Q
	OW1uRE1SbELrVvXINRCoO+wlPKP+YBQ71S0s28xgjC0Mh7nsBkVRqcFdAlSQGw==
Content-Type: multipart/signed;
 boundary=7740a347bdd2a901409a1a992506960e6d5f504e0ca01f0028a982de32c2;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Tue, 11 Feb 2025 14:29:14 +0100
Message-Id: <D7PNI0953LQN.2PZC72166IWZI@cknow.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <kernel-team@android.com>, <willmcvicker@google.com>,
 <peter.griffin@linaro.org>, <daniel.lezcano@linaro.org>,
 <vincent.guittot@linaro.org>, <ulf.hansson@linaro.org>, <arnd@arndb.de>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v8 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Jassi Brar" <jassisinghbrar@gmail.com>
References: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
 <20250211-gs101-acpm-v8-1-01d01f522da6@linaro.org>
 <D7PJTD3PSP78.27N2S94J2CNZG@cknow.org>
 <bad87f30-0483-48c1-b263-02cc752c77e6@linaro.org>
 <a740a0211c82aaaa55940e2f07e1d1b53c23ddd8.camel@linaro.org>
 <e2bdc9aa-2cbb-4fcc-8c73-5fcdad6e18a7@kernel.org>
In-Reply-To: <e2bdc9aa-2cbb-4fcc-8c73-5fcdad6e18a7@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_052934_407067_BE296A9C 
X-CRM114-Status: UNSURE (   9.56  )
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

--7740a347bdd2a901409a1a992506960e6d5f504e0ca01f0028a982de32c2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Feb 11, 2025 at 1:05 PM CET, Krzysztof Kozlowski wrote:
> On 11/02/2025 13:02, Andr=C3=A9 Draszik wrote:
>> On Tue, 2025-02-11 at 11:57 +0000, Tudor Ambarus wrote:
>>> And then I shall s/MODULE_LICENSE("GPL");/MODULE_LICENSE("GPL v2");/
>>> everywhere as "GPL" indicates [GNU Public License v2 or later].
>>=20
>> No, please don't, see Documentation/process/license-rules.rst.
> For the rest of suggestions here I also recommend rereading docs. I
> don't get why we need to change "GPL-2.0 OR BSD-2-Clause", but maybe I
> miss some docs. Whatever SPDX recommends is irrelevant if kernel
> recommends for example something else, so be sure you make it aligned
> with actual kernel preference.

Unfortunately, ``Documentation/process/license-rules.rst`` and
``LICENSES/preferred/GPL-2.0`` are not in 'sync', but I guess that's
(potentially) a discussion for another ML.

TL;DR: ``license-rules.rst`` says "GPL-2.0" while the license file
allows both.

References:
9376ff9ba298 ("LICENSES/GPL2.0: Add GPL-2.0-only/or-later as valid identifi=
ers")

https://lore.kernel.org/all/20180422220833.078058446@linutronix.de/
(which mentions specifying the SPDX version, but that didn't get
implemented)

*sigh*

--7740a347bdd2a901409a1a992506960e6d5f504e0ca01f0028a982de32c2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ6tQsgAKCRDXblvOeH7b
bkINAP4+7weuoA3/bh9F/SLY1BknW+ahnGc5zXCYKj9qsFSqnwD/cZ/OQbjuOQv2
9Mh1NVnF7KOLhSoOL6Rt+VNblLWmiwE=
=N8XC
-----END PGP SIGNATURE-----

--7740a347bdd2a901409a1a992506960e6d5f504e0ca01f0028a982de32c2--

