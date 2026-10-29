Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78EE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Etb7ZdkD;
	dkim=pass (2048-bit key, unprotected) header.d=blackstar.nl header.i=@blackstar.nl header.a=rsa-sha256 header.s=soverin header.b=Xp9mItBp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lmBuoMUfPtdILzvdThWk+I2StXUMo6PgR05OK0TYJQ4=; b=Etb7ZdkDs5DSNJrE9kchrKCe+G
	peDF6UOrzYyTMPYccnUyIa3IzFLljAoYAaOD1PZE8VFLihY2qRVK1F2qfHfgQDzuJV5Xe4cBrVpoX
	cawnEhfqx1Jv5FLHSRj94XSc5nnCwzgINCAaiZvcM3UjwAsjysXkP0uGrouy84MymQ+303GCO+Loo
	OcQ1lohBHGyw672idS9d6pFgS6Q93Gzuj1pMKUIJeloDnd2C2P6ZRfB6/RGmoJ6yPpnUti6lTPOOd
	JaypzrtGfOJvoQPELfq0V0wYdKMTKa0RoXCw+oiC9wqx6LzWytGJ2HLQbPmfoh3usWiRVgkX/dNXc
	1y9GpsSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMLJ-00000008pTy-3bUO;
	Thu, 29 Oct 2026 09:22:41 +0000
Received: from outbound.soverin.net ([185.233.34.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMLF-00000008pSt-3DJI;
	Thu, 29 Oct 2026 09:22:40 +0000
Received: from smtp.freedom.nl (unknown [10.103.10.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 4jFdzq0gk6z1NH0;
	Thu, 29 Oct 2026 09:22:31 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.103.10.152]) by freedom.nl (Postfix) with ESMTPSA id 4jFdzp5lKJz1DBX;
	Thu, 29 Oct 2026 09:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=blackstar.nl;
	s=soverin; t=1793265751;
	bh=mPcH9yUJR8Lq6Viwwx8vM8rEwIePxRgjFV0ZYkyNql4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xp9mItBpjh/pxgWpegBfAurtunamUF70aud0SJXY9Su4c+7JsT/e8y/cqUeqKd+WU
	 p57x/IAFLS+azpdboKNGY0uxbYhS3pvlYBzWoKSspz7CS3xwAuh93FrsqhVj8suk9/
	 sFFCD8XHHlFURy1WeXSGryw/gmpKvoiRiC15Icdy3SCl7BKmiROPBfRYd24bFpWzl0
	 7x31PUXCncoy0PBd8k+G/BYabWRez5vORbqned7QVLs6NOOdEDJ0CNjWoOIlnC1e7G
	 qgebL2cSyRgA3CZKbJofmA7zfYvRAVVbMHmSx1u1Ug/eHlXrO//HzQJHiNMW/8rdpq
	 fSIDE0ig6Iu9A==
X-CM-Envelope: MS4xfMVHYTJlhsrIp3dayFAJ3bdUU8/zYSur98eWcaQArq5n3dIy5cT3GmElwlcF0CZwaDmoiVrHOC4X7Y+eNno2nm2LxBbzj6+glBi0ALh20Iq1ZEPu4pnt aEtV9HJ39eO1tmeyKJ8cgSFehOjFn+FEfovV4DU9VF3bYnckXaDoavC0D4mcXAhTFSFK6JZL7tj3h5fKNiwNRwjwunif7636U3QX0oxMlRZuJSC0yCjYwWfS km3XEDhpGtRSBIpSewYboplHIPVQvYRv5kUfVck7EMjD4CYRxGOEyxkEZ6bj/Tx9F/BxMNlL+62KmsXwVvbSfVXJr9QNEb0+89tnVPtFmooP6tgLdTd8soJi YA4FZoSnlbxiH0U2BkmqMD++I5qQaGenpfi1/kxEVW8sHCQndU+urRLHzBFT/Xb7dvBf06jKNTi6jvGG3KfryjhaCsvyjwfNAKW2GZmnHex+ejxtPahMxE0e Cquv5lHigwcW2heGXACdzbe/mfSe7xO/8ymECn2X1Izf0kTcgA1fOE/6aYP9/undzFzE9Hw+Frk2B26n+13y3NLbh6ZenVmCrkcF7Q==
X-Soverin-Id: 01a186f7-cff0-7f6d-b1a2-6ab1d5091462
Received: from blackstar.nl (m17r5.blackstar.nl [192.168.3.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.blackstar.nl (Postfix) with ESMTPS id 1C5CA3FA91;
	Thu, 29 Oct 2026 10:22:30 +0100 (CET)
Date: Thu, 29 Oct 2026 10:22:30 +0100
From: Bas Vermeulen <bas.vermeulen@blackstar.nl>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Damon Ding <damon.ding@rock-chips.com>, kernel@collabora.com,
	linux-pwm@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/6] pwm: Add rockchip PWMv4 driver
Message-ID: <auMQVkm3liY6C2GU@blackstar.nl>
References: <20260420-rk3576-pwm-v5-0-ae7cfbbe5427@collabora.com>
 <20260420-rk3576-pwm-v5-3-ae7cfbbe5427@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-rk3576-pwm-v5-3-ae7cfbbe5427@collabora.com>
X-Spampanel-Class: ham
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_022238_294412_C41FCEAE 
X-CRM114-Status: GOOD (  21.08  )
X-Spam-Score: -2.8 (--)
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

Hi Nicolas,

On Mon, Apr 20, 2026 at 06:52:40 PDT, Nicolas Frattaroli wrote:
> The Rockchip RK3576 brings with it a new PWM IP, in downstream code
> referred to as "v4". This new IP is different enough from the previous
> Rockchip IP that I felt it necessary to add a new driver for it, instead
> of shoehorning it in the old one.

The same IP block is in the RK3506 (Cortex-A7, arm32), where I am
carrying this series on top of 7.3. It works there, driving a PWM
backlight and a pwm-regulator for the core voltage, but two things in
this patch need adjusting for it to build on a 32-bit kernel and on
current mainline:

> +	if (rate) {
> +		wf->period_length_ns = DIV_ROUND_UP((u64)wfhw->period * NSEC_PER_SEC, rate);
> +		wf->duty_length_ns = DIV_ROUND_UP((u64)wfhw->duty * NSEC_PER_SEC, rate);
> +		wf->duty_offset_ns = DIV_ROUND_UP((u64)wfhw->offset * NSEC_PER_SEC, rate);

DIV_ROUND_UP() with a u64 numerator is a plain 64-bit division, which on
arm32 becomes a call to __aeabi_uldivmod that the kernel does not
provide:

  pwm-rockchip-v4.o: undefined reference to `__aeabi_uldivmod'

DIV_ROUND_UP_ULL() goes through div_u64() and works on both:

-		wf->period_length_ns = DIV_ROUND_UP((u64)wfhw->period * NSEC_PER_SEC, rate);
-		wf->duty_length_ns = DIV_ROUND_UP((u64)wfhw->duty * NSEC_PER_SEC, rate);
-		wf->duty_offset_ns = DIV_ROUND_UP((u64)wfhw->offset * NSEC_PER_SEC, rate);
+		wf->period_length_ns = DIV_ROUND_UP_ULL((u64)wfhw->period * NSEC_PER_SEC, rate);
+		wf->duty_length_ns = DIV_ROUND_UP_ULL((u64)wfhw->duty * NSEC_PER_SEC, rate);
+		wf->duty_offset_ns = DIV_ROUND_UP_ULL((u64)wfhw->offset * NSEC_PER_SEC, rate);

Since MFD_ROCKCHIP_MFPWM allows COMPILE_TEST this will also show up in
32-bit allmodconfig builds.

> +	/*
> +	 * For referencing the PWM in the DT to work, we need the parent MFD
> +	 * device's OF node.
> +	 */
> +	dev->of_node_reused = true;

struct device no longer has that member: since 7.2 the flag lives in
the device flag word (commit 4aca5e62f37d "driver core: Replace
dev->of_node_reused with dev_of_node_reused()"), so this does not compile
against current mainline. The accessor is:

-	dev->of_node_reused = true;
+	dev_set_of_node_reused(dev);

With those two changes the driver builds and runs on the RK3506 with
7.3.y; happy to add a Tested-by for that if useful.

Regards,
Bas

