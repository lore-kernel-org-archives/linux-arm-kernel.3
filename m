Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4CD606D809
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 13:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=33dRiYYt;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jI6RFciy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FYpkozZQqv5x8iGDJjbaY+F1srftlQoPOW5hP9D9X1Y=; b=33dRiYYtjkAde0pONzNAHkANbv
	nXzVq9lNz5IswLJZOTcx4+PnJdXQsHJxt0BU4Zq0/oP2c6Rw13asLEnF338oSpb90vwaQGpr80tdS
	6bSVuhsTeeHs65v7BfoR3RB+cK5EmxuuynXkaPDQ8C7qhlBp88QbI9EDWN21N8dfHTgnaA6qGl89k
	SOXMyJvPDi+j83z/RSCMAXL2EoJB4j7MjEOyGshqYc9jljUTjC8X7vR5693kRGfyYA1JSe25h498V
	0YZo8Tw4lOT2MOne8oQmkepfZEq7HxsykwCx35IU3lI4U5Z8pK9HgnyuBXqnGPde4PsR0D/puvK5U
	K/GYfx1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaps-00000005SMR-0yzd;
	Wed, 04 Nov 2026 13:15:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOapq-00000005SLY-1u2d;
	Wed, 04 Nov 2026 13:15:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B1E6C60ABF;
	Wed,  4 Nov 2026 13:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C1C1F000C1;
	Wed,  4 Nov 2026 13:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798125;
	bh=FYpkozZQqv5x8iGDJjbaY+F1srftlQoPOW5hP9D9X1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jI6RFciyCCWXNetAAeL6LGKusLjRvuvWTJ8+RHwmtT/2IiFX5IfOAy8MSAtkWPUip
	 GSZqGcD3pCUTusSIts9E5lgJQohwbGovx7ec86EX1qsk5uYKPOtGZcB9NyhLPUdP/a
	 VBlGa2wJ+JnjogABNC42/9mj93Jp2xqiZKfWakmfQOM8h8vbBqnEGo4t+/nY9beYQ3
	 5vj8SdWcZo9H+qJEApj2vqBTzm+jl+27bC/LZFAgZhDo1/RDj00IYPrsm0RI0E7EkG
	 fKa5g4uSBAWXh+8hffpU75CNxhRlQmVN/0+DtNrAQjExQbyQuX+5EsuYDdY52vApuJ
	 n+EKyQLHrrG8g==
Date: Wed, 4 Nov 2026 14:15:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, sean@mess.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 1/2] dt-bindings: media: amlogic,meson6-ir: allow
 wakeup-source
Message-ID: <20261104-taupe-eagle-of-experience-d3b6ea@quoll>
References: <20261025192320.209446-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192320.209446-2-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261025192320.209446-2-christian.koever-draxl@student.uibk.ac.at>
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

On Sun, Oct 25, 2026 at 08:23:18PM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>=20
> The receiver can stay powered across suspend and wake the system when
> a remote control key is pressed. Allow boards to mark it as a wakeup
> source.
>=20
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---
>  Documentation/devicetree/bindings/media/amlogic,meson6-ir.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


