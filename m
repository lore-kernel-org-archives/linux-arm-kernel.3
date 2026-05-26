Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D903CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 19:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHu61V9glS/Y4VHMiUleiLB3zLNBd4rcjKVPWNimHUk=; b=XCWgblqxZAZRe3+6/ioNNc+0IG
	5pbOfIHLqklw6vSaWbgl6MI3aW33etRq3eQA680S8PiB0TOIfPp7qN/8eh+CCVttz9kb7RPJRXmx/
	fy28l0MGfPGoMySpwcHrnMWCVG6dy4lrO3TuoyE50IBZd6yyCQICxqR9AlBGEDbxbIT3bB4pX4um/
	DXGC/DT3uvvVV0nNp6nQ2KjGfXGaAaWL9vtbiHi8spHjdqOlJ2F5dB1jlaJFCWoSv500um5eLNfK6
	zfIAXOWOZnK/KPHpD+OUNQzAn+Jj5ywMuysLeGrVDzbRi9cFAgNyuFKgiFqDqMH57y/ww9ydLfy9J
	kobSTK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRxkr-00000002vDz-45Kh;
	Tue, 26 May 2026 19:47:57 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRxko-00000002vDN-00w3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 19:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yHu6
	1V9glS/Y4VHMiUleiLB3zLNBd4rcjKVPWNimHUk=; b=Pm1FXxNKnGU6CCHHZm0Z
	7o46lu3vYQzXzPorLDSse0cHtyGWfIn+OSCg5qA8BngoLL6PE9qkn8rAZzN3PqhB
	bQ27AUqzoh6cjJxY+8MXa9Yv79TMfBxgANsZvX4+G2dSTN1+B1VHxKKX4ImKtTCd
	aok2REIiE9bikt9m2rAxA9V0nqVeW2aM0ciboQJHG7ihpOWk50trcYdtQCv5Yeza
	xAC4+PiSz+HzUUWPkVtIuBR3PT+HNn7zAo2Fvok6gpa80eD6S92zLdKbhbChtWRz
	+Mf9fQ3zsaus4YYbmfDcq0XD/b4lcXXyk9HjaLG5ZPsauovq5GCrPYcMD+1QISRK
	4w==
Received: (qmail 387587 invoked from network); 26 May 2026 21:47:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 May 2026 21:47:48 +0200
X-UD-Smtp-Session: l3s3148p1@2/gExb1S4VOSABpf
Date: Tue, 26 May 2026 21:47:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 1/5] i2c: core: add callback to change bus frequency
Message-ID: <ahX44_rzaRlTLSLU@shikoro>
References: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
 <20260324-i2c-mux-v9-1-5292b0608243@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-i2c-mux-v9-1-5292b0608243@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_124754_905640_6CC546A7 
X-CRM114-Status: GOOD (  16.58  )
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

Hi Marcus,

finally I found some time... thank you for your patience!

Some comments here, but I have high level questions first to be
discussed in patch 5. Maybe we should start there...

> +	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_hz); /* Optional */

Shouldn't this rather go into 'struct i2c_algorithm'?

> +static inline int
> +__i2c_adapter_set_clk_freq(struct i2c_adapter *adapter, u32 clock_hz)
> +{
> +	if (adapter->set_clk_freq)
> +		return adapter->set_clk_freq(adapter, clock_hz);

So, Sashiko mentions[1] that setting 'adapter->clock_hz' below is not
executed. This is fine in my book because the requested new rate might
not be the actually used rate. However, I agree that it must be
documented that the callback is required to set 'clock_hz'. Or maybe
even better, the callback should return the newly set value and this
function then updates the variable?

[1] https://sashiko.dev/#/patchset/20260324-i2c-mux-v9-0-5292b0608243%40gmail.com

> +
> +	/*
> +	 * If the adapter is a root adapter without .set_clk_freq() implemented, this feature is not
> +	 * supported.
> +	 */
> +	if (!i2c_parent_is_i2c_adapter(adapter))
> +		return -EOPNOTSUPP;
> +
> +	/*
> +	 * Update the clock_hz for non-root adapters, even if .set_clk_freq() is not implemented,
> +	 * to allow the clock frequency to be propagated to root adapters that do support it.
> +	 */
> +	adapter->clock_hz = clock_hz;
> +	return 0;

So, Sashiko is IMO correct with asking what happens if setting the new
freq in the root adapter fails? There is no path to restore the old
values for the children then, or did I miss it?

Happy hacking,

   Wolfram


