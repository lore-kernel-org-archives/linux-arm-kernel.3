Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED818C021A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 10:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcTbLEBt8Y8NL7Kz0HYgBsKXaJfzSyxWtZz03umu0us=; b=kviYjjGaKlfmp3ofwg1ArAck50
	nvs5vMj8SOVYLR4dUv28jHNszoQ03rEjyGq+UzZma6Jn73Ai29mP/KOiPSgmHKTcajOASQP4H1jOJ
	fn+PSEfPFY1d3cS+oAW9JFDfUIFvasU6UXFErcaPfnjjzAQmiLi1G4V3KjKT+kDeKXHZINMva846Q
	+yxYgWEIyvkGwaH8MXvjAyRyUDL5Gy7R/PplOev3uXwSjjdBjRjhBw+Wt1ftEbBkbboNEiPsbjuXt
	46WiBT8MiN34HWf2kziI04BwqK8xSoXf/dWMcoE+mS3Z2qfHM30/gX3ESlHZe54ANEy1RAhS+43/Q
	vLnl5FYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnht-00000003ON2-2FrH;
	Tue, 11 Feb 2025 10:41:33 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thncj-00000003Mzh-0LJX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 10:36:15 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1739270170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CcTbLEBt8Y8NL7Kz0HYgBsKXaJfzSyxWtZz03umu0us=;
	b=C59jdT1Rz5cXS3dKHVt50NdxmADlu7Jr7oR5TXqWBvD9eotDotwsX6qx5acCpRaKspa4Kl
	Wu/B42fkg6rZ2ksFucijVxaK3HJiAx8WPt1czeqIvpkMHEVxT4tT4TTvxI0TclXsg9i1ux
	E7Qhli9KsHW9z3ImUGE5HaoW7CpnLsWDZ26wvTdIBYZpLWJ6JaLGk7CpSATbMTn4/klTKC
	5QF92Es4Sr05iaT36VoIJyKMnd3RjZTJkhnEP5yxTP7PvWqeExfP966m5A6CtNi876j6Jj
	IHw1mwLE2EdhFGvNsj48OynBuHxVEcvTwBcYlGWZYxPdLOKEXfleySraBMVNAA==
Content-Type: multipart/signed;
 boundary=5ee4ceb31c3782666c51f1eeeb5c1812fd7b0e7a1f16d9d041a97c2c76ff;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Tue, 11 Feb 2025 11:36:00 +0100
Message-Id: <D7PJTD3PSP78.27N2S94J2CNZG@cknow.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <andre.draszik@linaro.org>, <kernel-team@android.com>,
 <willmcvicker@google.com>, <peter.griffin@linaro.org>,
 <daniel.lezcano@linaro.org>, <vincent.guittot@linaro.org>,
 <ulf.hansson@linaro.org>, <arnd@arndb.de>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v8 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Jassi Brar"
 <jassisinghbrar@gmail.com>
References: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
 <20250211-gs101-acpm-v8-1-01d01f522da6@linaro.org>
In-Reply-To: <20250211-gs101-acpm-v8-1-01d01f522da6@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_023613_765030_B68BCB79 
X-CRM114-Status: GOOD (  10.56  )
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

--5ee4ceb31c3782666c51f1eeeb5c1812fd7b0e7a1f16d9d041a97c2c76ff
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Feb 11, 2025 at 9:52 AM CET, Tudor Ambarus wrote:
> Add bindings for the Samsung Exynos ACPM mailbox protocol.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 50 ++++++++++++++++=
++++++
>  1 file changed, 50 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm=
-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ip=
c.yaml
> new file mode 100644
> index 000000000000..982cb8d62011
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)

Shouldn't this be ``(GPL-2.0-only OR BSD-2-Clause)`` ?

AFAIK it's the recommended form since SPDX 3.0:
https://spdx.dev/license-list-3-0-released/

Cheers,
  Diederik

--5ee4ceb31c3782666c51f1eeeb5c1812fd7b0e7a1f16d9d041a97c2c76ff
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ6soEwAKCRDXblvOeH7b
bv7bAP96aaDz5VKPTEX57iUB5lisLvy1Dhsnq/V3RPglNv0N+gEAhyLe6ZIqyYQk
/7mKqroOKZdEWb4BTUOWoix6bNhI5w0=
=Mg55
-----END PGP SIGNATURE-----

--5ee4ceb31c3782666c51f1eeeb5c1812fd7b0e7a1f16d9d041a97c2c76ff--

