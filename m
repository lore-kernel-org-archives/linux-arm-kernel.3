Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191C5606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 01:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3kFtfeWY;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NAUoKj2r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=n0CzGjJGWSs7TyNtwS3AbENhTdJBxVqswg2+oAuEStg=; b=3kFtfeWYn0sAZ8hfX20KKErnlj
	GQQ50kSyBgRAS3GxCKXn6idti+RqArOeNb5HGJZQySE+0vwdeYepNNRLt12ZcHRazNoDlkKbpQC6w
	4emXzhGWupBfRKuekyHhDk4l+guSynQI2wme2WGvMx7gdhsHlm9OaergmOzOfvw9tNysFmGpbFiE7
	dP03YxZQdf/FTBfb9aLi9S4gg3jtQeFJ9a0sUzgm20NrBuQkt9MEHjKHe26hCnfvfN76CKhhcmxnw
	GFlEgUuWYu1uH1s1wbErD58JRVsLj8il1hfL1fN+ej7K3haFQW7mx/gR/L4aF2dszm/UzIdkUi3aS
	Mzx1SLog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2vi-00000000mb4-0oxp;
	Tue, 03 Nov 2026 01:03:14 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2ve-00000000mZ8-3dQg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 01:03:12 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-36661f953e4so5635559eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 17:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793667789; x=1794272589; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n0CzGjJGWSs7TyNtwS3AbENhTdJBxVqswg2+oAuEStg=;
        b=NAUoKj2rCnhoYg44XO0Mg48OuJnX//UqyyXHO83g1SxOqss2j/OpMfq4Wc1eKXZPLy
         VENPMALZNCOeETT1fcaCPAeKoyJrYMtlHXB5PkWM+84b5mVMnUr5Mby0VL3jGnpJdZ8J
         juc31HTTOn8gEpcUoen1+Ap0oX40fy6nYtfvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793667789; x=1794272589;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n0CzGjJGWSs7TyNtwS3AbENhTdJBxVqswg2+oAuEStg=;
        b=eEyfO4E5bxWXPSk31L7PD29H6jFMA3j70SwOrvO2TP5nXCRupB6biERt/p9prDdn3b
         ucJhnSKYZGC5qVdYjN+CWLwiULqkl5G2uBl9Clbbvls/MMNmiFWdUCg4b6kr5l0lS2W/
         KXaL/HfXWsDErvvAMnwoN9aTJVKT4zYFB5LtdPZjflSvSSKgd6Lp4csiVR/xTnMuBfQo
         Grwy3FfiR7kF9DgXG4L10lh4Y653clS/qz6zhXTDr4l8BUBkpQSMaJgwNOjQtpFRQAaQ
         Ljw2AEwRWQ5GjSNQKt0/bbpLtkdHMATSVdilLEx0NX8MTAGs5bBE8NWZbjHc3F8aDX6m
         T+zg==
X-Forwarded-Encrypted: i=1; AKwUvBwz/+JExghYi7+N12UBQqQbEb9V0zsES844FeUStSn1G1rqJN0U9E0mobBQT0Etb5Ktrm0Vu58PMDkckrW1dM41@lists.infradead.org
X-Gm-Message-State: APuU4Z8M0RfdAkwYT+vWR2zs2DWATc28xr/L3HbRkgVL1oVBqUFzWCDc
	2T9OYvwUDe0Xtz1s+sb/2peRBcQEe92G6kJFCAwt/zvaptZOy9D3OlsW93sG5z1QhA==
X-Gm-Gg: AYBFou0fHfME/tWS/1rfddb38gBjyOOCSq24NGL4WuEA6qqKauYY5xYaGgXoQKG7ySi
	3DIGYV3ByC4uxfWXp7puAkkKyhGqWnzNl8Zr8FtwNI3qREGvVON84DQlRRQS76mMMUcN7YOYlVG
	rHplaZZuQbjU0BO+UxwSsf+dx9zcQ3FR0HodlsVtqMh/DyoumOZCluyv/PrLPffvYbNEP3J1IVN
	pczX5Vt5/kRRXWiJtlIW8NGH9u1Ig9UIWqt7VNoqOBNSXNHRgrDw8R1eHmdebi7c1ZpjstgDX68
	2jybknC7aarSMWA93vNaba5yCcb5uMqYvAuCKicKSzWIWQMVDCGxLVOavw/EIubOIo2K2le2IpQ
	PA+hDLkKxjzqzdGTAM0HPNMFpIn2F9HpDVW5rUWute9aV1AwB/+5ln8jf3y2lSq3X1MuhtfbqYr
	ze1JINYjuKxbDQ7RPv4wT+d3ry+z5XsvinUbXpYMv3mWWSHNtieZTc9VL11uKmkBm6XViOYqsop
	bUvll0YDHpX1DIUhK5QL0PwADYliqXJhTyk9rKy6baULqnZ6695v3rlHF7iz5QGpaFg8vtOauFG
	D/f5JXpcQ7TkLveN/cuNpj3qxuiz/D3yGEw6JJuBmPPJuJvmuSI5IdDa8Exao5ULKZ4=
X-Received: by 2002:a05:693c:60dc:b0:36a:7c69:3f83 with SMTP id 5a478bee46e88-36a7c694623mr1481055eec.3.1793667788944;
        Mon, 02 Nov 2026 17:03:08 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:c57d:c93d:3543:aab5])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36a429000f8sm41756066eec.13.2026.11.02.17.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 17:03:07 -0800 (PST)
Date: Mon, 2 Nov 2026 17:03:05 -0800
From: Brian Norris <briannorris@chromium.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 6/9] reset: google: Add CPM reset driver
Message-ID: <aukyyYhDCBUdIH16@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.6.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
 <8d57f0a1dc8a07838bf1320f9b79588196264ff5.camel@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d57f0a1dc8a07838bf1320f9b79588196264ff5.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_170310_952912_B09B7ADC 
X-CRM114-Status: GOOD (  36.29  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Philipp,

On Wed, Oct 28, 2026 at 03:03:24PM +0100, Philipp Zabel wrote:
> On Mo, 2026-10-26 at 14:43 -0700, Brian Norris wrote:

> > --- /dev/null
> > +++ b/drivers/reset/google/reset-cpm.c
> > @@ -0,0 +1,367 @@


> > +static int goog_cpm_rst_mba_check_ret(struct device *dev, int ret)
> > +{
> > +	switch (ret) {
> > +	case NO_ERROR:
> > +		return 0;
> > +	case ERR_LPCM_NOT_SUPPORTED:
> > +		dev_err(dev, "the received request_id is invalid\n");
> > +		return -EPROTO;
> 
> -EOPNOTSUPP?
> 
> > +	case ERR_LPCM_INVALID_ARGS:
> > +		dev_err(dev, "invalid lpcm_id or rst_id\n");
> > +		return -EINVAL;
> > +	case ERR_LPCM_TIMED_OUT:
> > +		dev_err(dev, "operation timed out\n");
> > +		return -ETIMEDOUT;
> > +	case ERR_LPCM_GENERIC:
> > +		dev_err(dev, "internal error occurred\n");
> > +		return -EREMOTEIO;
> > +	default:
> > +		dev_err(dev, "unknown error response from CPM\n");
> > +		return -EPROTO;
> > +	}
> > +}
> 
> Is this specific to reset functionality, or should this maybe live in
> CPM common code? I see that the return values in the power-domain
> driver are not translated, but the clock driver contains a near-
> identical copy of this function. Or maybe just printing the translated
> error with "%pe" is good enough?

Good question. Looking into the CPM firmware, it seems like these error
codes are more or less standardized (they're a common definition from
the Little Kernel project (https://github.com/littlekernel/lk)), so it's
probably fair to do the translations in a common helper on the Linux
side.

The strings are also probably unimportant, so %pe printing or similar
seems fair.

Regarding power-domain: it seems that the *use* of these "standardized"
error codes is somewhat haphazard. The LPB services within the CPM
firmware put error codes into different parts of the response payload,
and use a different style of error code. So indeed, the power-domain
driver cannot use the same helper.

All in all, even scouring any additional services we have in
not-yet-included-here CPM service drivers ... I only see clock and reset
drivers using these. So the "commonality" is actually quite limited.

Anyway, I'll see about a common helper, even if it's just for these two
drivers.

> > +	return goog_cpm_rst_send_mba_mail(provider, lpcm_id, rst_id, DEASSERT_OP_ID);
> > +}
> > +
> > +static const struct reset_control_ops goog_cpm_rst_ops = {
> > +	.assert = goog_cpm_rst_assert,
> > +	.deassert = goog_cpm_rst_deassert,
> > +};
> > +
> > +static int goog_cpm_rst_debugfs_assert_set(void *data, u64 rst_id)
> > +{
> > +	struct goog_cpm_rst_debugfs_entry *entry = data;
> > +	unsigned long idx = to_rstc_idx(entry->lpcm_id, rst_id);
> > +
> > +	return goog_cpm_rst_assert(&entry->provider->rcdev, idx);
> 
> Calling into reset_control_ops like this bypasses all reference
> counting in the core and breaks reset controller API promises.

Yeah, sorry, I meant to take another pass at whether I should drop this
entirely, or at least try to explain it better when including it. I
clearly did not do that. More below.

> > +}
> > +
> > +static int goog_cpm_rst_debugfs_deassert_set(void *data, u64 rst_id)
> > +{
> > +	struct goog_cpm_rst_debugfs_entry *entry = data;
> > +	unsigned long idx = to_rstc_idx(entry->lpcm_id, rst_id);
> > +
> > +	return goog_cpm_rst_deassert(&entry->provider->rcdev, idx);
> > +}
> > +
> > +DEFINE_DEBUGFS_ATTRIBUTE(goog_cpm_rst_assert_debugfs_fops, NULL,
> > +			 goog_cpm_rst_debugfs_assert_set, "%llu\n");
> > +
> > +DEFINE_DEBUGFS_ATTRIBUTE(goog_cpm_rst_deassert_debugfs_fops, NULL,
> > +			 goog_cpm_rst_debugfs_deassert_set, "%llu\n");
> > +
> > +static void goog_cpm_rst_add_debugfs(struct goog_cpm_rst_debugfs_entry *entry,
> > +				     struct dentry *debugfs_root,
> > +				     const char *name)
> > +{
> > +	struct dentry *d = debugfs_create_dir(name, debugfs_root);
> > +
> > +	debugfs_create_file("assert", 0220, d, entry,
> > +			    &goog_cpm_rst_assert_debugfs_fops);
> > +	debugfs_create_file("deassert", 0220, d, entry,
> > +			    &goog_cpm_rst_deassert_debugfs_fops);
> > +}
> 
> Please drop the debugfs functionality or explain what it is needed for.

Ack. I think I'll probably go with "drop", but some notes:

There's no real way to test and validate a "reset" driver without a
consumer. There is no direct (even for debug) interface into the reset
API, unlike in some other subsystems (e.g., GPIO). I believe the main
purpose here on Pixel drivers has been hardware+driver testing, so one
can test reset functionality before hooking it up to real client
drivers, and without adding fake drivers or extra debug code (a la
"printf debugging").

(One might observe these results either via /dev/mem-like access to
registers, or even through external debug peripherals/consoles that can
monitor the status of the underlying component that is being reset.)

This all would generally be in an early hardware bringup scenario, so
admittedly it probably doesn't have as much of a use case in the
upstream kernel  -- it's a long shot for this kind of hardware/product
development to *actually* work directly on an upstream kernel, with
upstream drivers.

...but if I were imagining a better way to do this without bypassing
reference counting: perhaps it could be useful to a have a
debug-oriented "reset client" driver, that could bind to arbitrary reset
devices, if they're not already owned, and expose a sysfs or debugfs
interface like this? That could fill similar use cases for this sort of
hardware testing/validation area.

But anyway, I understand such a proposal should definitely come
separately from this driver submission.

---

Thanks for the review. I'll try to integrate the rest of the feedback in
v2.

Brian

