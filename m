Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1C0CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 09:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npJkpA4zj0f0kUp2y5oDOcsYgf/eC/DfE8/mAA2FKTk=; b=i/l96QwUgzXwc2K4oIN7C6a1co
	MCIyml/Xxzu0SIVB/F9NmZ1qK43KU7YM2lcDHmB3m9GhMykJDE3fkh9y7ZumeKlh3J3aUhdaAKnPx
	87dGqCQO2EP0ZVQkgo0B2c5ZfBQLTU78e+BSXrFx8n44dy1MaUzKXbFtU0oa/K06XK0WZuVRLKyXz
	1KOD+8D6rDg7ARogjVKAa8O7qeD5EkGhAkubZgAZvhYJH6h0XOtSxlTHSViXNQuyUM3E0klqyYSRx
	iaeyNDyVVHTYLORztALGj++lpehMtUA1aqKrUwOEY+q8CkKw+WkLrSi6VTQGTIvQUdMlsREV1cnyN
	fpPtLfCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuT9D-00000000sAP-05wm;
	Fri, 05 Sep 2025 09:54:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRgW-00000000Jx4-2OXW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:20:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4AB4140489;
	Fri,  5 Sep 2025 08:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFE0C4CEF7;
	Fri,  5 Sep 2025 08:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757060440;
	bh=1NT/J9zy+wp2WIDDw1MZkz4+Ema5iHWmh+YcteWPW9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bI2gIws5IK3KjZoCKjEfQSCveSDzyPef2WcTJ2SWU78Qo4+kuev4nc1ClkUZeHe1b
	 0T2q8lFfzXl/9pygx1vXkJ/jrzh31H72fH/hybLYLHsJKa5hq3xd0WyV+YP6tiXNfx
	 b/y5KYE6nae/LAzna+DXu8qgSirjGkxgo5dqLMe+VjClsXDcdAytJIJybGXPsVHaYw
	 gTPYudJukJkiu1+ct8nlHssSsL593gb32imFWjpSQVw3bN1oyKY1BKoXtzrIW7fBwV
	 B/aknTh/77HWQ0oztPegXY+qR/MmqYOX7Edw2ioZzLyyTzR72Pi1l3R2Pw73W8L1jd
	 5NaKsmHgdVTkg==
Date: Fri, 5 Sep 2025 10:20:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	upstream@lists.phytec.de
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: afe: current-sense-amplifier:
 Add io-channel-cells
Message-ID: <20250905-dainty-liberal-monkey-ec28bb@kuoka>
References: <20250905065503.3022107-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905065503.3022107-1-primoz.fiser@norik.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_012040_628796_96BC0CAD 
X-CRM114-Status: UNSURE (   9.49  )
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

On Fri, Sep 05, 2025 at 08:55:02AM +0200, Primoz Fiser wrote:
> The current-sense-amplifier is an IIO provider thus can be referenced by
> IIO consumers (via "io-channels" property in consumer device node). Such
> provider is required to describe number of cells used in phandle lookup
> with "io-channel-cells" property.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
> Changes in v2:
> - refactor commit msg drop warnings introduced by commit #2
> - drop Fixes: tag

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


