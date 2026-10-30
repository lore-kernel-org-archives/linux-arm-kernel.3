Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6E1606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=blXCe3af;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=koSobmDN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4LuX6viShIi0dZkWLBzFB0AnGUBKUuhfZQE4sOsfOL8=; b=blXCe3afWfnAC1yn8WOHNDQwDg
	Uq1BhfdRRiXnwGjMvsHQFt9qSI6YaFTJJ5q+oxBP5QRCDIFtE2Z0bM3JgKoStrPT7vZjCkffKsv8H
	7PRB/r+lN6FuTwAPGR1SdT6QmC9C9kwEfVGesNlSnvKn8p2/+UelSZhXNb1OYnCT77EaXUGpqKUXW
	MkdqX7YscRpfMBY3rlka+Kfw3WqYpzhhmRAc8LozlkCq/sArP+thBPtx8E//8VoCngufzvYXqhkWW
	tT+noecFGjbKBprDg9qsF5Dzip3p8PS7xe3MBynHhOOSXMa9RvHB8NvBpf6Zir6n/rNoZ2j4LvG3R
	r/74F8WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMka1-0000000BW62-1Llf;
	Fri, 30 Oct 2026 11:15:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkZz-0000000BW5g-0tpm;
	Fri, 30 Oct 2026 11:15:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A3490438F8;
	Fri, 30 Oct 2026 11:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1B21F0093A;
	Fri, 30 Oct 2026 11:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793358926;
	bh=4LuX6viShIi0dZkWLBzFB0AnGUBKUuhfZQE4sOsfOL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=koSobmDNsosyI2zvhAxvlL4srpRmz79RPyy0cykC6V3p6prMwP/y7DC7uMuTszGTv
	 BG3mNdgEf1FC44ikXoPJbiNxlVCiFi9VANl5UdM4qnkOyfhplcZOw5GRd9U1yzgYul
	 uNRd2okYdwVh0oc6CcUD/FA8tmDpo9fzGM1goXjPB7VZiE1sfh49/Q+MZf+ajtP82Z
	 AaPKFoWq3teCVundpmSTf2m8qoyVYWGoXKmjAqm8Rj1c6CQQzvSpx33CBiq+d5GbLP
	 3VCUfX9Eit+2ST8x6xksGoNm/8ySFDGK62SFdvDKW1yVbaJmaV7l5nrQH0fy/Cea8Z
	 ZBCvcFKVk1Gdg==
Date: Fri, 30 Oct 2026 12:15:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com, sboyd@kernel.org, 
	bmasney+clk@redhat.com, khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
	rafael@kernel.org, viresh.kumar@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Christian Stefan =?utf-8?B?S8O2dsOpci1EcmF4bA==?= <ckoever@outlook.de>
Subject: Re: [PATCH 1/4] dt-bindings: clock: amlogic,s4-pll-clkc: add the CPU
 clock
Message-ID: <20261030-rustling-expensive-lyrebird-aeb880@quoll>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-2-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261025192219.209137-2-christian.koever-draxl@student.uibk.ac.at>
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

On Sun, Oct 25, 2026 at 08:22:16PM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>=20
> Add an identifier for the S4 CPU clock so that the CPU nodes can
> reference it for frequency scaling.
>=20
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
> ---
>  include/dt-bindings/clock/amlogic,s4-pll-clkc.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


