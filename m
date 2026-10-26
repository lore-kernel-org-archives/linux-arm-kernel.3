Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BEC606A320
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 11:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wziHUAH7;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cxX2n3Rl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=; b=wziHUAH7wwOXW4
	2KfdQIrZLaohF9N2B1Al4hdigQ2nehT0brmsA1QOwt3lMGikcMWNdgwBXSPlDXVBIbg1NIYdZ+wUS
	1Y90PO6B57S8pZG5D72wJLhJvDdKXb7dDt5ISJRDqLYL+WlhiPxEP4yEj42wr2axlkJoR2wxfzeO5
	ba75xhVNpL3w3/TyfpGDiGP5GNJu1FYaTRd2fLdoVCcB7fouPKpULp7iPVK6+38TFvbp9ITOVq7k/
	9xy3GElTJtFPpDcu1OiG6JIZTVd1MYalvJuXLyrFpkArko0il5z8HMGY6MQGIDajoLdUCOi5d7T9K
	RdMKF9Gedma4ydDNxXiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIsL-00000002NOD-0pDa;
	Mon, 26 Oct 2026 11:28:25 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIsI-00000002NNc-2AOK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 11:28:23 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8a264b6a06bso1100998b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 04:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793014101; cv=none;
        d=google.com; s=arc-20260327;
        b=IyrpzyYBkWPJb1AalmTVNIlcLVxnFBKE8TR9HFKky8o3N/qaClbxFn40ZIZaARg4zl
         +hzZUqAlundhkwCHS7a4ltD7vVkmlmVzcw/S6IBLIx79KDHysjRIJtSc3TVO1iogW9AY
         lT6+Sx4zNmUxWqrDxyCrjOiIZ22xLXu4tWwEwIIfMD0PMNb1b+IkAC8OIuWZce+gPUhl
         haU323HkQwrgryTfXSkVPUnFVNMbeEs0XHibjNSOf4EMNXMImqg9tNpLdfhp15MwRueD
         JJVxlXTcj4rybLnmnP1dv2q1+8KTckHvLF61jjme1EBzoR0y0L3kWOeIJLOPHA6DwHJo
         KSlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
        fh=BigVisCoXS588LeSm5jXv3PQKfE1b/2UbfLRXxA68Hw=;
        b=W56GkSLekNwKltfyHO/0WnLO0mS8pmWQIP55ewisQ5KVlKLjqqgyuU+PAFgqAH+8ns
         ZzioTFmPqYzSNXHjx00Kr5b1sM7CKbCRIj1bHvT7016VYUa+qO8a4VFReSTB1Sh3F3O+
         LZc0KSeR36UQGfqQwUry1nxb72rgqZ7fOUjeVmN0eSw8HgQw8jm2Ix8TCyr0hjjRWt8E
         uR8BC0rYBX7RQgqQp80MUzK5DV+DY+0MUTX/3f1F+7ehCDFaa7hcMJiIOB2/G2R2cB1G
         +ZtPBDJNCW9P1vwZhOE13LbpoBHPUO/XBQyq8MLPud449MOvOGZ4gp3K6tXiNtHejb15
         4u3A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793014101; x=1793618901; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
        b=cxX2n3RlZqkE45MuucCWzZBQDMy1k9tnklIlf9efBXhmdP4oLENDdA83dkFPMs/T2B
         8GnbAJypCRaAYNw5VQBx2a6mEpS59EmDjYrXJBAo3T0sE45QwKE/y7wCwvehYap5afb0
         Lk9pXZ3PnO7KeF1vbvNGFI2pQQR9YYB02slidYtPFua9cximKBY8XDhJTOj2K+yJSq69
         01iq+8eh5ZV4XRu2AFJ/tZjxpaUyFEUaNoYSNls3eiwrRYP5jSBHwWOenhuQnE8xxKN6
         rCFZ83Qcsr0RnMZIWkl2wUrz5JPb7FPIkfSQTebx2cjZoOlLiZ/f/G7mulIg9NHpSOG2
         Oyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014101; x=1793618901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKeZl1Gw10WMRIflMK84zHY+twgH7FBBQrDMYUxvQug=;
        b=Dyvqf7kxE/p0Xd7JPXy9wVhFPWri7cH9RmujTpLUnEHiNua15fAL/D5oFLyiNthdMx
         ppnWKZgQTLAEu4JjNHvuVZsjtyNkPWizS7UZVuCGRn48jKDvbAElY17PjXfeIlQ4stQ/
         oaP3QOTPO3S2ftIv+0FFPgvC8sCBl4CUVH0VU6mwLlzVxi5Uo1FmLpI+ExfPqoHSYF+2
         HhxD08elT7V1uV48Yvef4dzDGf+5ZnvZWmFdcnL1/aDm2BjltNoNF9/xBSDYyKTva9QY
         bV2HOr+9AsBK+26zPzhhIWrZYRivhkbb6/8LPiuGG4Xk8J/7YqEc75zeLGMSpMbcicoV
         j5aw==
X-Forwarded-Encrypted: i=1; AKwUvByrdNKM4CwHrPrNzq+fwH+E9qwFwL0xs4UwtlJ0/cuJj/IhAEbjJYlkWej0hSKZQAnq4B5t17bNSFIP/ia0kP6u@lists.infradead.org
X-Gm-Message-State: AFq9FYJnHFJ+7lW0QjsCceQwWFs5kHpbBcQ7w6WPlP64WgH0NHWmYDMt
	irdFqA7hbMMFhmdg4M/FPpvdc64FiWy4HnFTE6uUH2FK9QHlkomRGPAqvlocZrIqHLB53zl+JwS
	7WrMniOH8cQcx0oxVqw93Hlm5qudOn5I=
X-Gm-Gg: AYBFou2ShCSurvxjVxTrIAFFhmerVvZnFPY4x00fWAsIKwCVU31FrNeJDV+Xf07/F22
	7nsZS5rGyHwnQOfkCXtZEi8w2Jsd6N1MJF18yb7MlCQG1b21Yr0+2JF3DPT6XMRnfoiu2uslHAO
	ES2tZf8EAxZxSEfHR7Q0vXju8OzfPxLr7IT98Sqp5ADFHUSrtPE+cuX/9JM3YR0jpNGACgvPwSW
	Q2TRObzJma9PpZ8CYMEh4ela95POn5EuC9HgbpFC9wChTPHWYK6j+NEbzv0M9b+GoK7t5i3x9jN
	B8cESz4TF1Ze3qyYjZa2yoN1N1woeiBVC5GUWyJnejGzZAUlPWBwvnDom4F1wR6929i8SkBVfCy
	K1ENk8F6TiT8V4YRWVPTGv92QFXzwodVzOkPR1T5CTgqulzWplacv
X-Received: by 2002:a05:6a00:bd81:b0:89e:8915:24aa with SMTP id
 d2e1a72fcca58-8a367a36becmr5121820b3a.18.1793014101519; Mon, 26 Oct 2026
 04:28:21 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026003918.155321-1-pmazzini@gmail.com> <20261026103730.3a79c2e6@kemnade.info>
In-Reply-To: <20261026103730.3a79c2e6@kemnade.info>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 26 Oct 2026 11:28:11 +0000
X-Gm-Features: AclHuK_DqqwJbE8Mxuk5nig_6kiigbCl4FyLzQRmggV5Ihs0oknU8AOuwlyhfVM
Message-ID: <CAAxh=jtYnDNQTUOf-cBN=w1Km+cBFOgrW8moNbHfqcApwxXbgg@mail.gmail.com>
Subject: Re: [PATCH 0/7] sy7636a: power the panel only during updates
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Alistair Francis <alistair@alistair23.me>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_042822_575524_33340424 
X-CRM114-Status: GOOD (  17.15  )
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Mainline, on top of linux-next. I started looking at the hwmon IIO
bridge. Coordinating and cross-reviewing further work sounds good.

On Mon, Oct 26, 2026 at 9:37=E2=80=AFAM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> On Mon, 26 Oct 2026 00:39:11 +0000
> Pablo Mazzini <pmazzini@gmail.com> wrote:
>
> > The SY7636A hwmon driver keeps VCOM on from probe, so a display driver
> > can not power the panel only during updates.
> >
> Yes, that is the common use case, power things on, tune update process
> to the temperature, update, power off. So it makes completely sense.
>
> > Read the temperature in the regulator driver instead, as the TPS65185
> > and FP9931 drivers do, and remove the hwmon driver. Boards that relied
> > on VCOM staying on mark it always-on. The regulator also switches VCOM
> > with VCOM_EN, gains VCOM voltage control and binds to the I2C device
> > directly.
> >
> > Tested on a PocketBook Verse (B288).
> >
> Which kernel do you use? Just curious, maybe some further upstreaming
> actions might be coordinated or cross-reviewed.
> There was discussion about in-kernel hwmon readout interface like it
> exists for iio.
>
> Regards,
> Andreas

