Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBBF606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dVGX5I3o;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TKE/9gn8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HWU9fFp652U4xTY6i7RlylLzrPsnJZJWAWqkWZithbQ=; b=dVGX5I3oPzIXr/je6LY+N4xdmi
	mI4yfYPjeJUDlbOiueaP10pHfeDxP7/G8to5kVKGQeGJC9lgEv2F+5J8iYmNkUYkjxNR8/iMIqoSW
	OxOaNMdCS4MPCItPtUmeB+ckRZwuc1dWBlmgKdhBp3mxcPcjUVaxU/VKOm6kYe0f1GfA5Mq8INlrX
	WucBPtiYHZEV71aA5ySG1rLjhXXbZkW7ykUcP9D4DI3gkPogGGYGNF4PM1uS7dbqUkNpl/PTtoPTy
	XpdirisWUnELuCsgzsX9WVa5YT8bakBEWUPKWPnAh3As6pXuWujjsDS53PQJ9eVNx4HIaBQDoUe5B
	v+RF0laQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkaO-0000000BWEj-3g9C;
	Fri, 30 Oct 2026 11:15:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkaN-0000000BWEA-3B8l;
	Fri, 30 Oct 2026 11:15:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 35CC4605C4;
	Fri, 30 Oct 2026 11:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B431F000C1;
	Fri, 30 Oct 2026 11:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793358950;
	bh=HWU9fFp652U4xTY6i7RlylLzrPsnJZJWAWqkWZithbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TKE/9gn8bHSQVea58VLpEheSWIBby85i5/M/Jg8F86ZXLMp4dimxi0Hc9J4Uiw9t4
	 6GVKb2Sa0lSdoSgaPadeHA3Buu8uok/nP+khOeyl2vVe31w/Fdt99FZbXVjsIOeTfz
	 7gVtQnMQ171kq3KhTyjzNMLfXNWlPq7ESNvxspt/L0vv5MZWn+Ptlea82dP63o2ki2
	 Rn4NlJEYoFGcjqxGfi0JKvlklmLdhFqLUmI16NvPfgUdqqW3/zpa9tda5XlDuT0LQb
	 yBn6mAhY1Yx8Wt5hvklTdicXPeDOzQc8hAPFLcOT20tlZWzXCF8x61XZsaGp6FtKbX
	 0gJpNeB+qZxOw==
Date: Fri, 30 Oct 2026 12:15:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 1/2] dt-bindings: firmware: amlogic,meson-gxbb-sm: add
 amlogic,meson-s4-sm
Message-ID: <20261030-tunneling-wyvern-of-plenty-ed4f19@quoll>
References: <20261025192144.208954-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192144.208954-2-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261025192144.208954-2-christian.koever-draxl@student.uibk.ac.at>
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

On Sun, Oct 25, 2026 at 08:21:43PM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>=20
> The S4 secure monitor implements the GXBB interface, but its PSCI
> SYSTEM_OFF needs an extra firmware call first (a shutdown flag), so the
> driver has to tell it apart. Add an S4 compatible with the GXBB one as
> fallback.
>=20
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---
>  .../devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml   | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


