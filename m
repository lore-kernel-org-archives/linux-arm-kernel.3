Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CE8C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 15:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gMaFKEYDqxU0ukF9d1/iE8OtHkD7HAfzgFtwGGFzkrY=; b=ugcJYXu5xBFUyM+ljGx8S1noaQ
	G+Xb9S6vq6mfR7OTqVkv/3m6NHECvJ3aqcnY71aEj9/V17OCFi58PXru3UI84d8qetXBBlz/9jCPx
	yQnRhczV9B86mVrAhcXCZNyt+LsppgIXrWuFI7jos6vOKcHJIvTeohr4RszfUIIEtK2GPZkQY+ltA
	y/HwYVhtBaiT0TiTtf6TFjT6S93KseaiPkrWGXh7MxPLBMIc7i8Ms1thTT4qifFBwqiDuLMjWUFIy
	xjfJGGkLX0AlFPUl5Y6KVK19CEEjy2mGZH4xNoHzstP5FB29o3ED5tIRJ98dFV+P/TZvWMf4n3lHb
	Lhs5aDig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx64i-00000006JkJ-12GH;
	Tue, 25 Mar 2025 15:20:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5wy-00000006Iiq-2raE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 15:12:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB81E5C53CF;
	Tue, 25 Mar 2025 15:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D7DC4CEE4;
	Tue, 25 Mar 2025 15:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742915539;
	bh=gMaFKEYDqxU0ukF9d1/iE8OtHkD7HAfzgFtwGGFzkrY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Buz5aBcwYHUVeK4wL2EJ74DjZNr85CzIFffbsLD+EgAWTdh8P/mz2RCh7Bz6Pl+6P
	 Yl5nUlD30r7TW8eKXg6EtaSbc45/mTTUziNe88wPfYeSWHkSgrP1UMtgjARkwa6hmu
	 +doIC01SYRuNsmkt2h6l6pBnc1XfWFqgecNObnT2aaEVrkmOOGJXDKSVVEMXO8eIoQ
	 vza1IOFkqp/dv2PWyo3VKZHvXPS9YxAS3iEJDoS5lRsaxmJL7XHjSMQB+G/Z0cSsig
	 gAq6qtxDmU/NFjLs2dWdH2JwHzPG9BCOtw0lzhf0DnOH5wVLjiMOVLigf4bRo/Jity
	 ps9nZj/7zweAg==
Message-ID: <f72d5f25b58dbbd8571f1895968847bd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250323-s2mpg10-v1-2-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org> <20250323-s2mpg10-v1-2-d08943702707@linaro.org>
Subject: Re: [PATCH 02/34] dt-bindings: clock: samsung,s2mps11: add s2mpg10
From: Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, =?utf-8?q?Andr=C3=A9?= Draszik <andre.draszik@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>
Date: Tue, 25 Mar 2025 08:12:17 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_081220_761562_AE273913 
X-CRM114-Status: UNSURE (   7.67  )
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

Quoting Andr=C3=A9 Draszik (2025-03-23 15:39:18)
> The Samsung S2MPG10 clock controller is similar to the existing clock
> controllers supported by this binding. Register offsets / layout are
> slightly different, so it needs its own compatible.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

