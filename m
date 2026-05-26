Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FE7CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 19:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cY7PmbuIO+wL0uJ2uHrRtzrWH+FdbJWbWlM2ezduFew=; b=bE2D4UQF+7mx00ikNt8H346qX6
	yNUyQX/9cKhGYRg5BQV3RRcbSfDNRQcpikA4FI8eox8xJLd67D5EYBpt4FrdEismSQnvfWkPRlTPF
	62CupGVXNyF7D/zmz2J6jM1QeXWHGZXUL/+YCCVVwxfHmUN69i1b6bY4/t6i883lm+pt17/CCZ3P9
	mspxdS0UIsR7gSqJRwh3sDZTwHvBos2Orcu+XhiMzTHEPnerou42eLKeGzwEcIrK3ccszFgGHXgm+
	fi4ZG+9cs1QqLVqDf1CAYlm8cpzDgXcV5gUReXvZrrtCp0ZbYOwONyXYLHel9hIHdWVwd57PJtAu6
	qhFtm/Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRxlD-00000002vGD-0KCA;
	Tue, 26 May 2026 19:48:19 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRxlA-00000002vFg-1XgU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 19:48:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=cY7P
	mbuIO+wL0uJ2uHrRtzrWH+FdbJWbWlM2ezduFew=; b=bbaoKaIhE2stUAQjF+qp
	e5k+KFnssZaLadQbzBvPrVO+x0Z/lZ4yrLiKyuco2pzoP8GxeQpGq/Faamk/QMlc
	H49x4g28PQzCLD8Xmf2SPiFs6rM81aBGELe/gGomrOOEz7kp5IZ2QYXtWxaRmg+K
	W7b+0uR0NcxZGb5rdn/vRLWU9hrOA9pv7+qbQow1wZvpTe+MnOpSeLbBrCpy3JWG
	nxGKx/TP4XfnyjXnHMnSfOTEDu/PXznTkr4fVivQ/tQL+GEeBkvu4W38BoC64IdY
	Kwip2QCsLx3mNBxiWjVuoDO6b9AAJdNAqrYXkuq5JOlyi9zMP49HC9DW5tTRKc0o
	aw==
Received: (qmail 387701 invoked from network); 26 May 2026 21:48:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 May 2026 21:48:14 +0200
X-UD-Smtp-Session: l3s3148p1@QSmTxr1S41OSABpf
Date: Tue, 26 May 2026 21:48:13 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 5/5] docs: i2c: i2c-topology: add section about bus
 speed
Message-ID: <ahX4_WaqodYt3PmD@shikoro>
References: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
 <20260324-i2c-mux-v9-5-5292b0608243@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-i2c-mux-v9-5-5292b0608243@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_124816_685764_2D145A94 
X-CRM114-Status: GOOD (  18.27  )
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


> +Multiple muxes in series
> +--------------------------
> +
> +When multiple muxes are used in series the same rules applies.
> +
> +Transfers to D3 may interleave between select-transfer-deselect to D1, which
> +results that the bus speed to D2 or D3 will be at 100KHz.
> +
> +Transfers to D2 may interleave between select-transfer-deselect to D1, which
> +results in that the bus speed to D1 may be at 400kHz as the transfer to D2
> +will set the bus speed to before the transfer to D1 starts.
> +
> +This is probably a bad topology ::

In documentation, we probably shouldn't say "probably" ;)

> +
> +                     .----------. 400kHz .----------. 100kHz .--------.
> +    .--------.400kHz |   mux-   |--------|   mux-   |--------| dev D1 |
> +    |  root  |--+----|  locked  | 400kHz |  locked  |        '--------'
> +    '--------'  |    |  mux M1  |--.     |  mux M2  |
> +                |    '----------'  |     '----------'
> +                |  .--------.      |  .--------.
> +                '--| dev D3 |      '--| dev D2 |
> +                   '--------'         '--------'

400kHz leaking to a 100kHz device is bad. I guess we cannot do much
about it here because the bus speed is a board specific parameter...

> +Idle state
> +-----------
> +
> +Muxes have an idle state, which is the state the channels are put into when no channel
> +is active. The state is typically one of the following:
> +
> +- All channels are disconnected
> +- The last selected channel is left as-is
> +- A predefined channel is selected
> +
> +Muxes that support an idle state where all channels are disconnected are preferred when using
> +different bus speeds. Otherwise high bus speeds may "leak" through to devices that
> +may not support that higher speed.
> +
> +Consider the following example: ::
> +
> +                          .----------. 100kHz .--------.
> +        .--------. 400kHz |   mux-   |--------| dev D1 |
> +        |  root  |--+-----|  locked  |        '--------'
> +        '--------'  |     |  mux M1  |--. 400kHz .--------.
> +                    |     '----------'  '--------| dev D2 |
> +                    |  .--------.                '--------'
> +                    '--| dev D3 |
> +                       '--------'
> +
> +If the idle state of M1 is:
> +
> +- All channels disconnected: No problem, D1 and D2 are not affected by communication
> +  to D3.
> +- Last selected channel: Problem if D1 was the last selected channel. High speed
> +  communication to D3 will be "leaked" to D1.
> +- Predefined channel: Problem if the predefined channel D1. Set predefined channel
> +  to D2 as D2 may handle 400kHz.

... unlike here. We have MUX_IDLE_AS_IS and MUX_IDLE_DISCONNECT defined
already. And I'd think we should only allow bus speed switching for
MUX_IDLE_DISCONNECT to avoid out-of-spec scenarios. Opinions?

> +Supported controllers
> +-----------------------
> +
> +Not all I2C controllers support setting the bus speed dynamically.
> +At the time of writing, the following controllers have support:
> +
> +============================   =============================================
> +i2c-davinci                    Supports dynamic bus speed
> +============================   =============================================

This paragaph is easy to get outdated. We can document that only
controller drivers with the callback function implemented will work.
People then can find out if that applies for their driver...

There are some grammar correction in the Sashiko-review[1]. Most of them
look correct to me. Can you have a look at these, too, please?

[1] https://sashiko.dev/#/patchset/20260324-i2c-mux-v9-0-5292b0608243%40gmail.com

