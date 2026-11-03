Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5B8606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 17:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cchxIegO;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=R7gxNzfl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E1AIQqXxMElr9XYHIFcSfJejuF++6x4Nf+fj72eanNY=; b=cchxIegO1XcwCG
	jJlYoRgmeunWKWPiQrKdvqVpJKP2eBvVoe3sjdkUWfnAbTJptcQeRQ1TlZs/c1VUM5BcVt+c0FtbU
	AkBnWBKJaHNMd8WHSA/1qua5UjYT2rwnMfZkker+gnEXTGZZ4NgCRBlYdRzJd+g+KpFxeyzxpgEay
	znTMXCwcZ3cys8jh6hYZ9Ga5k3K7SPJHmeHnrOlWnz6OtidScFZ76B/w54Y5mZCx2KIsPxgOaX1ZZ
	t9NkKE7afPDJSt5OR0QsrHjqPBeP6VI7Sh4mZDHhqQPbL3kovHnvse4zsLWe2oaXr8EOipEqvbND5
	WpMjLtJEsTQeiiQ1msBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIAM-00000003Ht0-1PEN;
	Tue, 03 Nov 2026 17:19:22 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOIAJ-00000003HsG-0WXI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 17:19:20 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48b042c0728so1105635f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 09:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793726356; x=1794331156; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E1AIQqXxMElr9XYHIFcSfJejuF++6x4Nf+fj72eanNY=;
        b=R7gxNzflDz/JDKDD0wg+309703nKeNT8ua1yLpAiOYsJppacGj9kcMv2K6hSCeq6+w
         p6eqBtjnWhsaSSY9gimnWN7M6yDiLf8mR9krl47NA3LtvDL7peh1+Ggs4VaI2QdUGOIg
         CUxsrO0QY4BrMcPgUkng2sZzyFCpeQDoSuEw5DK5GK+aqQ+22cn97dQd5IUJUMXU2QW9
         UPz5+OiluX1i7M9qYYrp0b+f9FEea9UK5kSqNmYCkHQSiNO9P1U7s0Lk4TAMWCm44me6
         yHhAAroeR2pAj8ADdQ+U4nd631bWPh/bSDsXVnfgMj5y2bRPapvgWQNR8uKsgrrzxR0g
         eCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793726356; x=1794331156;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1AIQqXxMElr9XYHIFcSfJejuF++6x4Nf+fj72eanNY=;
        b=OyIn4r1BiYytp13EBNm9yykrhJGgs/Jhpp0JGlQx0bldjYwp17NJme6JKIK+DOJ0VP
         PxQVCz/R2oJLwtc9bEl68oWcfyFzToajNw8f9zCq537adXRGIgFB83MNTAiHuut3yOLU
         tliFnmqXGwWC2Ni/xpgZLczYXS5Hl8t6VtcW/z/iiYg2obiRKmSCCG+QNuOmsDsGqtJO
         v8W8YBtUjkGcV/RFiS0EUgNdcunE4X6Vs/8JX2rXJiBL2JJl+rDAqqll1cM0Sk8ZaA4T
         IzMDNK4+H1eyvR4MiF1EyEGuuP3ZEZDaQsBWpPBKDSRgNwvXcx4bYHJFlS3CIUvHNb0b
         rP/g==
X-Forwarded-Encrypted: i=1; AKwUvBz8qRizyjmIOo3NtDXpt4SbR3Z5cLxEfD6mQ0JBwjSyKCAzfQJXGB+ML99EO0hBO91i0ondN23tDOKxTXCUKYdn@lists.infradead.org
X-Gm-Message-State: APuU4Z/VPHn4kI8XDrxnw6/kFbtxb5JbhJJ2cgMaR1TZ0q0D92eiML5E
	1lX4e+1dYM2LHFSgvM6qSGc26THTJd7swoHElk2trpPNrR7GfuRGH09yjg5GD0eUNSs=
X-Gm-Gg: AYBFou2lFNoXUM7LboTluZY+pfbUkNQN1E2t/TOc7Wr9zbIE0LHeCSgTwN9CxM94ByX
	1iEo7SHYA1/Z8O82CM6wWjmx5//ZFVWCSima3jFyc9B8vdhemv0jPc4hIGa4Y0V7x0gD5pQiSqg
	MBkPsvdJWsz1snD6UydLGB0/NblJPJZ133EQP3cAoIsjuaNyU7jdaG80oK4l+tGXDL6q8ahZRcp
	SlQM4Oo7Tj9yG3h+mqjUs6RlGULMm8FCrUiPt3RUynk7ujPMnLEDLBx/11V1DkxgZk+J35I9VfD
	JMjVvFQBuE7T852Mz5qugGFEVplgfbIeHPxqsK3i4Ul0xA2Bk55KjrK3+GDkfGA3VOKakZuQJWy
	E4N9XElqslpWQqxP2aQhG0Vo4GovYOimv2Bwc0vjIVJNI7nuzTK2S2Xka5TRALD+XcoiLHYsoxr
	NC6SCcAE1aCv19Zzjxj8MDp22ARRsukDXo615xY3tFyB9cocmjbNxICLff1pk2rYtx+OJ8uxAYp
	BvUj48BMUAobTfckETqY2GVgFM0MV0O46Jmc62A7YpNlAmspBSrgVrDMNRwWyPbKwzmaLhcf+cu
	4a4LgCU+Pufampzu+3GRFKhGjSoIjrasM38vKXyXbYD3T7St
X-Received: by 2002:a05:6000:4711:b0:48e:2371:3835 with SMTP id ffacd0b85a97d-48e6e309f7amr31462901f8f.51.1793726356301;
        Tue, 03 Nov 2026 09:19:16 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm27856601f8f.34.2026.11.03.09.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:19:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 5/9] clk: google: Add CPM clock driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Peter Griffin <peter.griffin@linaro.org>, devicetree@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
 linux-arm-kernel@lists.infradead.org, 
 Mariano Marciello <mmarciello@google.com>, 
 Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
 =?utf-8?q?Jakub_G=C5=82owacki?= <jglow@google.com>
In-Reply-To: <20261026144346.5.I82dc05365979021379fe730d6d52792a87ff15ed@changeid>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.5.I82dc05365979021379fe730d6d52792a87ff15ed@changeid>
Date: Tue, 03 Nov 2026 18:19:04 +0100
Message-Id: <179372634472.2573818.17532943286609086157.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2561; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=fqTcKnieuf7JekGsRwrFzLg18sNZNXRDB3ktfvrRuF8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmvxLvWxKwtTKye09bOcqL677Xz98LyWeKzJO0s975wd
 7Ja9XReRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACbSsICR4VV9nuzFk3pBi2Zr
 S330mea5O3JtmtSmJXnzDHZHnFB9YMPIcPdp827jZbrejwUizdSOlxd4HP60etnkLR9Dtthb55w
 N4wMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_091919_194861_95776F06 
X-CRM114-Status: GOOD (  19.42  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Google Tensor SoCs (used on Pixel phones) manage many resources
> (including most clocks) using a Central Power Manager (CPM)
> co-processor. We communicate with CPM using mailboxes, abstracted in the
> cpm_request_client(), etc., API.
> 
> The clock tree is largely not represented fully by this driver, because
> CPM hides most of the divider, mux, and parent details, instead
> maintaining its own internal table of mappings for divider and mux
> values. The one exception is for some of the DPU clocks, where several
> clocks and dividers are exposed directly, and the firmware API works on
> divider values instead of clock rates. I attempt to represent this
> properly with dividers and parents, although I don't have the full
> display stack running to verify everything yet.
>

As you say, the clock tree is not fully represented here. Beyond that, CPM
owns the clocks themselves, as the driver acknowledges by setting
CLK_GET_RATE_NOCACHE.

The driver keeps a partial copy of CPM's state in the kernel:

- Rate tables below hard-code what the FW has (or should have) instead
  of rounding the rate, even though there seems to be a ROUND_RATE_OP_ID.

- kernel handles PLL parenting and divider math for the DP clocks, while the
  firmware can also switch them to what looks like the oscillator, out of
  the kernel's view. So the math is likely duplicated as well

This middle ground cannot be kept consistent. CCF assumes it knows the
topology and computes rates from it, but the firmware makes the actual
decisions. The DP clocks already show it: the tree can report a parent the
hardware does not use, and .recalc_rate()/.determine_rate() can disagree
with what CPM programmed.

I would advise to follow a model closer SCMI. What you are doing here looks
a lot like it.
(see drivers/firmware/arm_scmi/clock.c and drivers/clk/clk-scmi.c)

 - Put the LPCM service protocol (request word layout, dst_id, timeout,
   error translation) in the CPM firmware/soc driver, behind a small API
   shared by clk and reset. Philipp asked for the error helper on 6/9; the
   whole request encoding is common, not just the errors.

 - Make the clock driver a thin CCF adapter: each CPM clock is an opaque
   endpoint, and gate/rate requests go to the firmware. Get rates from the
   firmware (round-rate op) instead of local tables. Model no topology the
   kernel does not own. If parents must be exposed, the firmware should
   describe them, as SCMI does, rather than the kernel hard-coding them.

-- 
Jerome


