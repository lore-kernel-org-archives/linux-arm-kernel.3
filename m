Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB8C606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 02:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MCiv+WGr;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lIVzvVf7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/WcSLowB0b2pojOqzb24H45+MS/MsdePMGuj0DzePaw=; b=MCiv+WGrxSFsph
	hk1l5XfjnxD9m3IuhrjnUQbj6lJZwqfnKgjETLFpxEHZemp0p47K6fAJ/DdyHmK6UQ3KlxnQYd2Zx
	CU0LCaA+LrFfCbnEec+pERCKCFg7fDs5+PkL2SJstnSNk8KPOazOwoP6G98nSUjBAbZbfod8pHs6D
	EB9cBuVdWRxKcMPvSFoGqOraW1vPehGadJJiM+0LBRUEArZkLGQjrUiE2UPSW5LhNCEGEzfw1tbSW
	ZXBMEQomHgMyfUV0oAimEukjPsfWE91tS49qWWC+EqFVKuauFNoG+Y0TQTnItnC4iWMphLV2miZ3j
	Amiy0rF11PTXbi/TRqQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLWv8-00000003dl4-3hRF;
	Tue, 27 Oct 2026 02:28:14 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLWv5-00000003dk7-1Vye
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 02:28:13 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3ab3f899c8aso637620a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 19:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793068090; x=1793672890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/WcSLowB0b2pojOqzb24H45+MS/MsdePMGuj0DzePaw=;
        b=lIVzvVf7SRtMsKuL9rwlpOTUD5gBPdpmb58UkvyoPjVzx9wcEFDQIY/4MjS+k/NY0J
         SEyu5lp2JYg3D3ar41D8Ev8LOIA/ZhT0BGI9HWxOt5WfD3MzCvoH2eDscWN80y9Y6RwF
         5MV3H1s1VcAQqYZfhyUOI1dPSGgQEckj3Z0FLP7i4m+dY5HMVddjUiNeaAwcyOIHQHe/
         WqN4kTzNfTBh805G805V03ifZ+PUYuvuca57PC7/XrosoI6wTwRRa18xkydx9rYP8yXa
         bL5Ty/QG5VPsp7n8HzI2gzpV+KELWjJ5euX2oNfq9tnws/5AyCIVfacwbzK40ABvqxh0
         hpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793068090; x=1793672890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/WcSLowB0b2pojOqzb24H45+MS/MsdePMGuj0DzePaw=;
        b=ES4XRjuwQiqgDpgtln2uvH+6MmqVG81BiSljliKvDQqPwI8QNEKYgUr5HIaaomHFHc
         fAz1QfoTbRvyje39TwQbd6qWkcO1lpjHnrA4rYibWHtzeacdkgFPTEzb7IciloM//Xmm
         vSmG7pX/Ka3psvRbyNCiB4FPGvE3WGaddBNP7LbEPZBr3Um6yPTgAefRZTzvmLZD0oCN
         JEWcGO49ni/j8YujkveuEQJpQ1yXH46xgxStWNikBlV/U9OKtGRHmWW+Qy8gkKWogKQF
         mHYKa9rajQTdrwyNBoww6uHBJQ6njk4nob/CFY7/4igjKuLUslpRQ4ScSdgBwQjVjz0d
         P4dQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZJgos/P7i5W3rUARLdm4rov5XFbvL886Yj2/WIYzLvNfSr9nsu9egAmjw4bOypMYN9HWrBMsKoO3rXAbs9gNW@lists.infradead.org
X-Gm-Message-State: AFq9FYIwHGlnkmCwfgvTd68ZXwsJa6Zd8NkoQqEwnq/SDjUdth3sY2QH
	TvogTl2NWIBR2D6/t++PS7PV9y3EhWYxe6E0wrLOHVmbtnsDpbG25h85
X-Gm-Gg: AYBFou2XI/wXZBFX8XzgiEp0b36jNaXfQnZqYo0TL1BFCOwGvBowHEjNQ1oQ4T2mhNY
	WeifLFhK54A/VT4bzwgIzQmYPJF6AB2UAP4U1IQ7YrTa3yobqmB/ZuzYNMPvtxBN294+Dm4HPhJ
	8cZ1/J7YkuJDlPW0/74RbGJjgJPjudKU2X5nX0XVj+5UJlYX70FCdJ1EUkVDzF7mQaLIwHGbewd
	pmFL3h8asDRn1va00N85IH0xnGl04uWe51Nq1qY/HjPXpxduImC44YO78SEmkN/Ekfa845jMcsQ
	uKFehexxAkCkppmzoP62RDilE7LDQQQt4zmbKc2U4n5oFj3Hnq3XKwAVPHkH4uKel36ZiW/SsMi
	WHJtKTmeVndb60Ew2WLs+cd8X4dd/9vcKNSp1JJgDNd22UZwIFbjlY5zs3Ttug+d+/gwL0XC+Ry
	PReo2DFKkHxLt2ibpuVroLrs13nGs0keOLWg7twiACs1qUSWKr3KTqTGX7QGEaulF66i9sBN9qV
	/Hq93dX8b2vRofluTpofEYIwCHUpbbRNzTjznyWmMXVI83hmCZEKVL7czLNsjnnth532iORdtTo
	tkqEwcLihHxzqw3cqt6jXyG9Wgr/zbn9
X-Received: by 2002:a17:90b:3dd0:b0:3ad:a84b:df1e with SMTP id 98e67ed59e1d1-3adea1af8bfmr12128791a91.1.1793068090331;
        Mon, 26 Oct 2026 19:28:10 -0700 (PDT)
Received: from localhost.localdomain ([240e:36d:b08:2bc0::a60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba38910sm6823109a91.1.2026.10.26.19.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:28:09 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: heiko@sntech.de
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hrushirajg23@gmail.com,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	macromorgan@hotmail.com,
	michael.opdenacker@rootcommit.com,
	naoki@radxa.com,
	robh@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
Date: Tue, 27 Oct 2026 10:28:01 +0800
Message-ID: <20261027022801.377819-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <5520293.6fTUFtlzNn@phil>
References: <5520293.6fTUFtlzNn@phil>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_192811_406393_D291E2DA 
X-CRM114-Status: GOOD (  15.12  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Heiko,

On 2026-10-26 11:43 UTC, Heiko Stuebner wrote:
>> I confirmed this with ArmSoM. They purchased the original CoolPi 4B
>> hardware design from CoolPi and confirmed that no hardware design
>> modifications were made for the Sige7s.
>> 
>> So the Sige7s uses the same hardware design as the CoolPi 4B, rather
>> than being independently designed.
>
>if it's the completely same board, just with a different print on
>the board, why does it need an empty devicetree. When it's completely
>unchanged, what's speaking against just re-using the original one?

The existing CoolPi 4B DTB does work on the Sige7s, and I agree that there
is no hardware difference requiring a separate device tree.

My main reason for adding a separate DTS is to preserve the Sige7s board
identity for long-term upstream support.

The CoolPi 4B appears to be discontinued and is no longer readily available
through the purchase channels listed on its official website
(https://www.cool-pi.com/buy/). In contrast, ArmSoM is actively selling the
Sige7s and has committed to producing it until at least January 2034.

I'm also planning to add mainline U-Boot support for the Sige7s and
integrate it with Stubble-based UEFI booting.

While U-Boot could update the model and compatible properties before
booting Linux, Stubble may replace the firmware-provided DTB with one
bundled with the kernel. Having a Sige7s-specific DTB would preserve the
correct board identity throughout this process without requiring additional
distribution-specific modifications.

This would also avoid confusing users who purchase a Sige7s but find their
system identified as a CoolPi 4B.

The shared dtsi ensures that we do not duplicate the hardware description,
with the two board DTS files differing only in model and compatible.

Would this be a reasonable justification for keeping a separate board DTS?

Best regards,
Jianfeng

