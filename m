Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D235606D815
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ynB9R1LD;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=IZivf0kC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/+vkM/8rbP5nhhINkxwcOr6UP8DzcWI1HFHKtdW0wX0=; b=ynB9R1LDC0Xpy5
	F0xAQSzm9tRE3VOjmj1LNr+8Uq8psDHa2sd1aWMmm0+pLjXnHYpr0lAu8p+7rL8GP1aTGKTWVjJhT
	lRuJMCtO8q+bkvduf16LX44N6ELtmBF2xV1sXhbhEo6TB9dwUqJ5MHUbGIPgPWEcOwyS9TH6eSbeU
	yBwRRoBlaTfX6xgNKAMPqk7bHZCNiFTjNQWAUBtvDdyBxa4syIkUTszufbJRKu5gGziL2tGYUBaS0
	xrAqGz3dMykArZ5LmP/75ZL8fDVhx3DRkC0PiG52qTSYua9Ze2QFIZlP+/XnHq9f1wpYSS1JAMyiP
	A04saPfHiSlE4rkaes7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDe-00000001qAQ-19Gh;
	Tue, 03 Nov 2026 09:54:18 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBDW-00000001q0e-38Fi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:54:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso32002925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 01:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699649; x=1794304449; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+vkM/8rbP5nhhINkxwcOr6UP8DzcWI1HFHKtdW0wX0=;
        b=IZivf0kCbZsT9bY8tQcsiCCBcAoTGGf/UlI8c3iU+0a/JJuGTvQAduX7FRDIFOE9CO
         ebXMC0MpqJSShPiayi4ZHTUxtf6DEuyqwemZ48v57q35F9kVJrqYy/ylKpX3ww8FqwT4
         HTv2a4P+79JrCb7RM6nldDhswMqcRECR/EmfO8G0M202Zl4ymabCiDE4qScj5k1rSyj9
         rvTisEY6yXIeMQDYgFTFyrv3U99EhI5faw91wGtF1xutQcc10L4mZXDhURZPCu6MPu1h
         u8VnDOWlL++kiEn05cfmYRK4Wh5a9GZmwT4hDx3yTykHvHyKXIQKMzyXTA0FtiMdlbl0
         DBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699649; x=1794304449;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+vkM/8rbP5nhhINkxwcOr6UP8DzcWI1HFHKtdW0wX0=;
        b=rs0VZYoVrKfiNvQGHUIfHqZ5u/oO3zrGJlFYOZ0/7fqiTsAOSljXteGtBQf+SMqEh8
         CDeMLrk4h2vx8CmYRgHP9W337/A/FjougK7wCC5mZ/8mHKROYR/OvsD2e32dSwEwLE5N
         kLwosyXn7vVVb9dDk88M8Jk1ZvyCttQ2qX6oB26uLbUmZDSKho8Zt2yvnEYh49wLzuI0
         G5SNLO+5b5I5l2n0hO1HvLkRyEzH4XiHvcI/7bX9cMSVhmfWGLoVEofTqHwrX9IDDoKM
         6Vmp7iX18wEuBHXsFL9A3jCXMg5Hmzhz3L4otbSPbe0ZPo3W+u9owpof4kXupn57uenR
         97kA==
X-Forwarded-Encrypted: i=1; AKwUvByLce7tuXUR8haJ1q42+OPZ1VNJN6/7P5eYtQ9OuIUhTHXskG+1dJPjtr0mwBR4B48WZLXkpusIQZDJDB7UoYZj@lists.infradead.org
X-Gm-Message-State: APuU4Z/eRYluljfdYMBey42Jf5ZAM6LcvhRKrA6221EDUFGMu6CYzHPc
	IudKvUOQfgL1rxLaEro1ZaThm94CErRmgUiRtjroJgrh1WgYvE/1eQaeJFuLLnIma/M=
X-Gm-Gg: AYBFou1HHLDHOYWRwwNVCG7yPdXnCKbenKKnVfXH2l2M8j8QBJOZj0R7o8IsYM/AgCj
	xLB9v9SODXgVMZtAlVlPx0ajxUDhnKswxIqGdX1vcQRECK379D/d9hNWw6RjQCRtX7vQePZHAKr
	eP0I0Vclkw7ya+V0PObNep+coW0upCl3wz9ax5aBo328uKhDHOXTyDUJVPxshOTX1IyVLq+svyC
	rAiB5Iw6aOmtz08O/wPT3FH6pUfMh3/P2pA86bjZRqtgDyfKTbBhOTKWIlmyotazuFhN5Hn+ZeY
	boajeTYV1Mlbfu1z52454AiCj6CcEreAGzDSk5yCPCWzGYog1N7Yzqk7qENKK7ESSZ/uaQNM981
	wx3QSnS2DIxd+vlXCt/qkDdb4U40YQOpytHXq5MKVx7Vy61s2w4yznqxDsVeKdGvHFW6gCYVwIT
	5HcjJWWard+Cvq82+xZPqUetegNzcRiMzCeX2JpIaiHcHpBJNFe1NLQ5Ia1qV6KiTCdD11wfR2X
	VwHrGzlJtI48M9eoeC3Re1SferTaTo84/r36rUsSmimqUv0/hr8QW0ITlHGnIk24XRQN8YULAxQ
	usUqM/FUyo2X6gAl3j+2ctmo5xbgm8CbDwe2N0jEVgqMrYr5gy4=
X-Received: by 2002:a05:600c:4e11:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4ac185bc7d0mr276506235e9.28.1793699648696;
        Tue, 03 Nov 2026 01:54:08 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aaa4b85fsm43219155e9.10.2026.11.03.01.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:08 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Igor Velkov <iav@iav.lv>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
References: <20261006-hc4-fan-tach-v2-1-e27ad96e92a2@iav.lv>
Subject: Re: [PATCH v2] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the
 fan tachometer
Message-Id: <179369964799.2330120.9043967618143448654.b4-ty@b4>
Date: Tue, 03 Nov 2026 10:54:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_015410_805977_7A77D9A2 
X-CRM114-Status: GOOD (  12.64  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Tue, 06 Oct 2026 19:36:17 +0300, Igor Velkov wrote:
> The fan connector routes the fan's tachometer output to GPIOX_7, but
> the fan node does not describe it. pwm-fan therefore registers no
> fan1_input, and the fan speed cannot be read.
> 
> Describe the line as the fan's interrupt, and mux the pin as a GPIO
> input without bias: R109 on the board pulls the line up to VDDAO_3V3
> (schematic rev1.0, sheet 31).
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.5/arm64-dt)

[1/1] arm64: dts: amlogic: meson-sm1-odroid-hc4: add the fan tachometer
      https://git.kernel.org/amlogic/c/81e55899e134541583a4e611ff750e1868671c67

These changes has been applied on the intermediate git tree [1].

The v7.5/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


