Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FE8606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 09:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W96V80pR;
	dkim=pass (2048-bit key, unprotected) header.d=blackstar.nl header.i=@blackstar.nl header.a=rsa-sha256 header.s=soverin header.b=brejh+2y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lmBuoMUfPtdILzvdThWk+I2StXUMo6PgR05OK0TYJQ4=; b=W96V80pRjS5RScJ2O7tqBSWjok
	Cu2do5hamCoB8tEh+SQIoqiLN1ikc4sHe0LrAoPbXoUPlCkrgSbawPSUfCHKutJMrIlqEcmttCl7h
	ImadEuKfJKhw98It90Hsz41UlZPjNEAChhxOIuKtILYmnFuxBGOQ4Sutqo225sUlb8Tuz0r3gcg+1
	52VZnHu7FI8vlke53E9U2RIlk5Uens+VKtWCc0OrYrhxta0i82REb0IGelMY4jAcPmJzKn4+Cd/Ze
	Kt063WxXN8kk1tSYTt75D7e5IRzXZKjwwWfu7IPtOPVpyNJ+tvzAwTQjDaF82VfDGpfwkdPQEMGCH
	N4+FfDSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMO0-00000008q0E-3sCe;
	Thu, 29 Oct 2026 09:25:28 +0000
Received: from outbound.soverin.net ([185.233.34.146])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMMNy-00000008pzd-1Z5u;
	Thu, 29 Oct 2026 09:25:27 +0000
Received: from smtp.freedom.nl (unknown [10.102.10.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 4jFf374QNPzXTT;
	Thu, 29 Oct 2026 09:25:23 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.102.10.153]) by freedom.nl (Postfix) with ESMTPSA id 4jFf372mfvz1Fmh;
	Thu, 29 Oct 2026 09:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=blackstar.nl;
	s=soverin; t=1793265923;
	bh=mPcH9yUJR8Lq6Viwwx8vM8rEwIePxRgjFV0ZYkyNql4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=brejh+2y6hqzLX63zDzi34bIaFMOoIaGxFxKN004YKZYe6T781WtXEBsBxzh4JngI
	 vDrq7TrjL7vdRIrFGCovZEkLztHmXohw5vzR1n+bwKG+utErYgagnbsv9tlGubtPtY
	 J+7wWtv857qeUglV2a6IIYvCvHn+c69ygv3ND2XwZZAKix09uB/2seIw54qIdlPE0N
	 qnZv9GTksozeX2ZDezQFqOh6fk1rkj0ENXziA/EM+z6vG5QG6inwrgnkm5kDi/g2yb
	 MXosi3dwDPlEcM3iqf0t+KR+qER4uvZis+qsmV4OPvqjbkwLUozWtTMqEC08Y8zQUc
	 McDKK2REC/Ajg==
X-CM-Envelope: MS4xfGhtgRHNjV/Y7PxulfcY31YnGRcDgXHoO4rsoQgcrPSH0vjkd497HF5N09wbnKa1pajdJ3yXRPC7uB2oXcwkwc10CtIJctelfMKsSxVM/nNRNfxsYsoE pEeYLSJO93yUjgo2RZCih2k8DQMD2FY2xMcuNVUIYccNxbSvUUp1RP3ilLye104ZS+eihWnyanA5MO1bXaxu9vNu/KZxXspU9kDs+UUd4P05h/eHJsjLRdHV Bja6idH+BZvVH6eUPq8ZvvY2Ykr3hfUMIF0S16WX48wkQjT4Mf4wddyGFv4x+HRbBbdbPmTnGSlBCPyMCtWe5+bTjGMEDJBxsD9JpliG83fD0r57n8mph5yM slIS+XHpu1mNzP3YRpA1zuLhrhw26aDCqBYtpTsU9rqX+hYcupADjws9aZQirCzNxPglggvWbypQkYn7SbU7pidrftqFRDg9LCigCoyPzr6gzKH6evQC73Vc lOrtnPG58TRoIkpN9MySt3/by57f0eJeZZ8oOBetOrTSlf1o3QqLmzvyFOztrbZl45fxBt3L2EV7Fgapnbe9nRXgs+ZBh4BQ9ASGdQ==
X-Soverin-Id: 01a186fa-73b8-7625-910d-49e7a653716d
Received: from blackstar.nl (m17r5.blackstar.nl [192.168.3.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.blackstar.nl (Postfix) with ESMTPS id CE5A63FA91;
	Thu, 29 Oct 2026 10:25:22 +0100 (CET)
Date: Thu, 29 Oct 2026 10:25:22 +0100
From: Bas Vermeulen <bas.vermeulen@blackstar.nl>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Damon Ding <damon.ding@rock-chips.com>, kernel@collabora.com,
	linux-pwm@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/6] pwm: Add rockchip PWMv4 driver
Message-ID: <auMRAj9wGYmH6ZI1@blackstar.nl>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-rk3576-pwm-v5-3-ae7cfbbe5427@collabora.com>
References: <20260420-rk3576-pwm-v5-0-ae7cfbbe5427@collabora.com>
 <20260420-rk3576-pwm-v5-3-ae7cfbbe5427@collabora.com>
X-Spampanel-Class: ham
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_022526_554253_293D8319 
X-CRM114-Status: GOOD (  20.94  )
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

