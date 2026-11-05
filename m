Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AF9606D804
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZWXt6sJ9;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oPQrvn/H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VgauoPLiP0v5M8oyKkXnXeYyHv/1syF6LIptNT4Sfz0=; b=ZWXt6sJ9wRTXr2mefZRAlY1JdB
	hBaeNCi8oHPEYDwA8G4OYnu0FOkNQzTEaw2m6JnyHBMIoPobdaotNmaMSshTR92Hx91lpeQZFId9z
	iresWsMnkRb6s5DBqVsO2vFZHRYLnp5k4r3G294ElRmrdz5fTTQb08Ylsy3Qs/0AFBbC8k0BRTKOF
	JwhCrTC3WsfWVUKdEXXoBjluXMtbFAq0haTKPCEy1gWAPwPj5PJdPipyVgvoPN58WRp6SyE9JWPiD
	V/X5qYsflRbS5qsRUQT3uM8ECSsQlD153bah7/SeEFvPlPYueZP5HsH3aok9Ea2m9sPjixmsg+/3B
	ARU9jHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOymD-00000009Kab-1h4K;
	Thu, 05 Nov 2026 14:49:17 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOymB-00000009KaC-1VZf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 14:49:16 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-677d35fd1d2so2243834d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 06:49:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793890153; cv=none;
        d=google.com; s=arc-20260327;
        b=XGv5uK41sZnCm1m0bx/oDQun6B9GJnKzsibH7xexzr4b9NPlvQ7wi1W8L+Ws1YRuQa
         SbEwlslc8uOEoBeai2DQEgbt7j6AScADPXK39bpfFKRn8Qgztz37viHHvS/yosXRqx/R
         cw/knAdGb2eF1eTwGYLj/D62owxLWp948c86OI93zvb4HJ+pdbt1hGgXGNPjiK83yPHn
         LcfbZjHqzTx+98O2F83u8xeTzFJImNUOBvQvbcte2TiojWMJ6F0lMEMQerty18n1zz2G
         bcnDaao1PPhgnLnV/dn/T3KlZjxBDWv47Uc2H/rtDuhYVCV4UxdNQDqqIQ8mq+XW596/
         GVFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VgauoPLiP0v5M8oyKkXnXeYyHv/1syF6LIptNT4Sfz0=;
        fh=350pK7btVtYLDFelK5YUCfbodgKtQKCZ/AIbZUfAJF0=;
        b=fPJhPlCuNNF5qTJVNgKpDQGaJtQ+uv/HZ4pxD9OANnrHVUSdeLZ7mB82qQgJA3kUel
         skNG6lZi5O1qxFyB6JBzRYW+z8xz1uXvSHE81AtQsfyKL4EA6VKX+lzv28VfA2uJIfhL
         +xCjf8huhr2itTPZcsYmuQbK8n1dlj7wH4S7qiF6Vc2tMqf0w3yj/S7SS9Abb3S3r/XU
         xSmj+XR+kD/vIphT1+WXEIj+hLkRonU9HSo7W74PatNCyRfR5o4l7bKpWRqqxpYT9Lnj
         ogpKCJVIu8LKiP9dhcxJznO1N0lO7WsJFLdhlvG6KP+1azF663AG4ohUjCeYxv1K5Zti
         bP9A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793890153; x=1794494953; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgauoPLiP0v5M8oyKkXnXeYyHv/1syF6LIptNT4Sfz0=;
        b=oPQrvn/HeHKUmKY1AqyAwrdk6d4nRqZOvu3SIuUPHb2iXohU/aKmYU6hc8F0BaRlci
         eCfe8unFWQ98k/fGcNNeCeMHubGAv3JIV1zaG3CX1NQ7B04cTFj8JEOshMjr075gi10V
         y2PcTA06OlC9O8rplTed/HIBm/iPwol5xTO5MA/h4wEgvcjwVvo7kwRX5XT/tH6MJpjM
         NTJsCaNtW7tflxd6Yj2nAdGwdl8aiBs7qaNYH8HFRte2RHPTnSuWebg4GXPmEQRKGADT
         OojVDzAERyU+mCb74crAH4biHloE3GOFdPiv289/pLhsh9EqmmH6XJN+E8rQN/FUM8S0
         bEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890153; x=1794494953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VgauoPLiP0v5M8oyKkXnXeYyHv/1syF6LIptNT4Sfz0=;
        b=IS2Dp22gor8ycoPzcsmAHWPk2puHvwJhjrjJN5ogsEbDQk6z02Bz2i9NVST4YOyiZ0
         TMZwaeK6u/AsWdE/Hh3gDOTTNGfHk8SdG/5aQLoOxaI00Ro6jqsgdqmJZH9BQ2fXeN6m
         9gdMvaJ4swY3i42mu459hJFJ9DwjQBmOUq3RTZ1Yk70f9d3b0/phKBtq79nOjCmWV3me
         tjyDiRKBnUMK0ezSAEzCbvWyha2iocPn2DqwA4Nes8wbJMW8oE5gzcR7UyL9+JSySJnZ
         3920AFe42Uri4BtYwE5Jk0TmmjbMSVwZ0KLWZ5yznSCjj1+lHiD6bJwmmnd6c1/ZhfZz
         +ktw==
X-Forwarded-Encrypted: i=1; AKwUvBz5dWEjUDHdTVihgVwX52DQWHzlvrjZ7sN7kC07LLeRk5FdKKnTN/8Iy5UllttGhhRNmQbkaVStzUF5gczzYkg9@lists.infradead.org
X-Gm-Message-State: APuU4Z9r1DmVvZ0ZMOxEhmqpp5sFsqUCaUB/F0gDbZyWJn7ypZEaqy1L
	YItH/Pz6Y1l6z3sm1LkvyEq1d+F0FQTCbSEsQ3erS01YF6asiko0p+tCh+YLnaoRy3q0R/8HlrP
	uC2jezxcTC6eDV8ieqFGTrbPgFCe+MQ==
X-Gm-Gg: AYBFou3BI/vn8m0nOWuJ18gHIYHi/SSJ9B3k2bUxQRSyJ86e7uCBYy0LXVGwLfPeBpc
	VdO5phkieYrzkfMDbeV3JpfPzJXLuSSsyKqraRHdl3MDrNUwEpumzO0V1KU7oRugjbuwsbyRYSx
	U7jOYD9egnXgW5nuDY4GQL9qH5sBqxdBEAD4Rwbyv/RZUcYTlXJ65yWa6AQZEEDDHVT0ZKlL43P
	eXh1Ueg2kRbKakzh/wN6YEv90BG8QacLEZfczdhupIbrAhyLqEKBMlEFmwG1rOkdqso9GHVFB3H
	88h/sM2BMvtOu4+bOMftFPPO+aoanyZlkamTh+9+NOD/Fnu7hbedMZi/vZ3js2DJb2DCebCMFkZ
	rYHiWAeLg6DsynOtpa0MIRJ7RPHJI5nLHxWx0ogLT1C8Owbsq0BPYnthjdvm4YxAhJloDTp/qmB
	Dztgc6bPU/9XHHQ7Q=
X-Received: by 2002:a05:690e:450c:20b0:67b:31a:9b7b with SMTP id
 956f58d0204a3-67ba4fa40b1mr7256109d50.33.1793890153050; Thu, 05 Nov 2026
 06:49:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-a133-series-v1-0-58217cb33a87@gmail.com> <d4d89cf9-884d-424b-927d-5b6692f50327@arm.com>
In-Reply-To: <d4d89cf9-884d-424b-927d-5b6692f50327@arm.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Thu, 5 Nov 2026 08:49:00 -0600
X-Gm-Features: AclHuK-SbGVRFFZQFk2Ozvq-Gg4EdtItrFF8Dqsp7Ze5suIdv9U1RHoClLmzyb0
Message-ID: <CANxy8yTiJoGJe5uz_R5hTdmT9A8ZsxAphB6qWSB4_SDuLSHSaA@mail.gmail.com>
Subject: Re: [PATCH 0/6] sunxi: A133: Add CPU speed grade detection and OPP table
To: Andre Przywara <andre.przywara@arm.com>
Cc: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Cody Eksal <masterr3c0rd@epochal.quest>, Alexander Sverdlin <alex@sverdlin.org>, 
	Paul Kocialkowski <paulk@sys-base.io>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_064915_567870_54CD0B29 
X-CRM114-Status: GOOD (  29.62  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andre,

Thanks a lot for the quick and detailed answers!

On 11/5/26 12:30, Andre Przywara wrote:
> So I read about the 1.6GHz somewhere, might just be a marketing claim
> about some max frequency. If the common speedbins do not support 1.6GHz,
> that's fine, but apparently some do, so I'd keep them in, for people who
> happen to have those SoC revisions.

OK, v2 will add 1608 MHz for b0 and b1. The SDK table stops at
1512 MHz; 1608 MHz is only in the table of the factory firmware on my
board (its kernel was built in January 2026, the SDK import is from
October 2024). I compared the two tables entry by entry: the factory
table is the SDK table plus five OPPs, all other values are the same:

  1608 MHz: b0 1.18 V, b1 1.13 V (max 1.14 V)
  1416 MHz: a0 1.18 V, a1 1.18 V, a2 1.13 V

Should I add the 1416 MHz OPPs for a0-a2 as well, so that the table
matches the factory one?

> I think if we can be sure that the current mainline OPPs still apply
> with this series, that's good enough.

They do. The series does not change the A100 code path (patch 2 only
moves the cell reading into a helper), and on the K5C the patched
kernel with today's A100 table gives the same OPPs and voltages as
before. A 6.18 kernel without the series and with the new A133 table
falls back to the A100 selection (with 1008 instead of 1080 MHz).

> Regarding 1008 MHz: This was just some frequency close to 1GHz picked by
> U-Boot, that should be low enough to not cause any trouble, even with
> the default voltage. How critical is this "unlisted initial frequency"
> message? If it causes trouble, we can add a made-up 1008MHz OPP with
> some safe voltage, otherwise I'd say we just leave it.

Not critical. It is a pr_info, and cpufreq switches right away to the
next higher OPP (1080 MHz). With the A133 table it does not appear,
since that table has 1008 MHz, as the BSP does. So I would leave the
A100 table as it is.

> So like for the H616, please just use the SoC ID call, that's a clean
> solution. Maybe just make sure that it can fail somewhat gracefully
> (read: not crash).

That is what the series does. Without SOC_ID the driver warns
"SMCCC SOC_ID not available, using speed grades a0-a2", falls back to
the A100 selection (plus the BSP's a0 rule for normal parts) and
continues. I tested this on the K5C with a test build that forces the
revision to unknown.

> I think some of those handheld gaming consoles use the A133P variant?
> Maybe there are some tables in "their" source code?

Good idea, I will look for those.

> Thanks, I will try to get those logs, I have the Liontron board and the
> Teclast tablet.

Thank you! I will wait for your logs and the other reviews before
sending v2.

> P.S. Since you mention the KickPi: can you please work with Paul (in
> CC:) to upstream the DT for this board?

Yes, happy to. Paul, I have a K5C DT that I run on mainline kernels
(6.18 and 7.4-rc1): eMMC, SD card, USB host and the PMIC work.
Ethernet needs a PHY driver (Maxio MAE0621A) that is not in mainline
yet, and the Wi-Fi/BT chip (Seekwave) has no mainline driver. The
"kickpi" vendor prefix is not in mainline either. How would you like to
do this: should I send the DT with you in Cc, or do you already have a
version I should build on?

Thanks,
Rajan

