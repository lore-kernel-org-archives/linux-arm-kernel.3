Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059B0606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4k+P5v44;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i/Ilhiu8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u/eDtZS4wjn/U8MG+7DwL0ZWK1x555IP9HVQv9HwObk=; b=4k+P5v442iaVjGmntQY4+eeh+p
	BCVwdo//rRCDSMOv7aSxvPO2QpwHylF2rV6HBDJ5zubWb4jjwVc37m+hPh6uq1mwwpHLjKRgV4msU
	dqztybhahkAkpIoea+VBLHd6aaaKqXYWEOCtf1tGtaSKWZgNwTmlA1PF0y2ykF4u9mlWWA1LwpITo
	k/UOlyQNl6icNdmnsPbq2k4qezHSWyz9asuqaw1Ntshm3luHF/jAQji+SLyNfE4I1ObpNRT1cpkWi
	AhwhHr364UGzx/Nc18trODr4yhmCekYb0WbHqvJMaIXrb0LXVBczVqQpv36qoKsVtF95mCZwPFvys
	zw1AsKvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYIx-000000050cR-00KU;
	Wed, 04 Nov 2026 10:33:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYIv-000000050cD-3VWX;
	Wed, 04 Nov 2026 10:33:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D4C1403B0;
	Wed,  4 Nov 2026 10:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FB41F000C1;
	Wed,  4 Nov 2026 10:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793788397;
	bh=u/eDtZS4wjn/U8MG+7DwL0ZWK1x555IP9HVQv9HwObk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i/Ilhiu8gSErW8FsASyqWzyY0c3ig2W+mB2luw9OtSy5tq+qToMpYsWzLxP4f7IsD
	 HolPhDqS/pwnVDrQAeSfwbJ1bzZ+thF15O+7uP3exotVOTQ523IacKlx6zwxvtBcJc
	 pDKaIGByIbr8IN1x9Xw03+euuyAvLJWrqrSkOOdvdiUTwVx9xfNhgpAvmNcqRcxLMK
	 o7GO4HqYbErZg6infRCme3H4ZteFZUAcqkCAM4ZBs5WDWmUTOfxTJDpzvFhKLL7uZT
	 vzbIP3AHJVj0o005andcJU+1uHHMEcVrRL80WKUL6WUvYN1cXhbm6r3m8kVofes/bC
	 IGkSfYE8qKQEg==
Date: Wed, 4 Nov 2026 11:33:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongliang Yang =?utf-8?B?KOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Gary Yang =?utf-8?B?KOadqOaWsOS8nyk=?= <Gary.Yang@cixtech.com>, 
	Fugang Duan =?utf-8?B?KOauteWvjOWImik=?= <fugang.duan@cixtech.com>, "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Message-ID: <20261104-grateful-chivalrous-cougar-ebe4ff@quoll>
References: <20261103074913.1971025-1-hongliang.yang@cixtech.com>
 <20261103074913.1971025-2-hongliang.yang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261103074913.1971025-2-hongliang.yang@cixtech.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 07:49:20AM +0000, Hongliang Yang (=E6=9D=A8=E5=AE=
=8F=E4=BA=AE) wrote:
> +patternProperties:
> +  "^usb-port@[0-9a-f]+$":
> +    type: object
> +    description:
> +      A single USB3 PHY port/lane.
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      "#phy-cells":
> +        const: 0
> +
> +    required:
> +      - reg
> +      - "#phy-cells"

Why do you need this node in the first place? Parent is the phy provider, n=
o?

> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - "#address-cells"
> +  - "#size-cells"

Best regards,
Krzysztof


