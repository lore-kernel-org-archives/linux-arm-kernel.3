Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D928ECA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 10:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFji0/x3X5YusfPZs9m4W+0Sur+eAL9XZMjQEDnUex4=; b=L7udZaeKBj3wl7WgEcBercgQP0
	Fg3uDA6/pKjKjY6xSYmJbDBlXJ/yOMwYrx/6ImbvVkLxgRy3vsZQ+jIWUXaW7u+HxXbHg50imtzOU
	+jUiI712HnaxVBjWqnbXAKiFbab/jH9nYQMJsRJ6l8UH38Q/bvyulMa3GZLV6cLXlQBTsFDJjMdlB
	Mb8VACnqXqJ1LAjH0Xg/MMYH9WNKWVLS75uauyun6IVp4accSiyfWCxWhTtB7K8cuKKk6qmsrzKH1
	MVhzR2dpxKDJ0T52ltQ/QKaoArNSVb252l9BSEDuTtR1NK1+dJM/XXJwdHatpclpb8PqTbo2ntzgK
	3JZbF75Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7FR-0000000AuSI-3Dqw;
	Thu, 04 Sep 2025 10:31:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu667-0000000AVQi-1N4A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 09:17:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A1F7460202;
	Thu,  4 Sep 2025 09:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8F8C4CEF0;
	Thu,  4 Sep 2025 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756977458;
	bh=0MmnVzpzU6gWyC/cUdsfoXzqPUDCX7NyIifVAJ0azTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RlAflKCD6F+7Cd0lmVxfjA++Yh0k//cLYBSTZbn9qvmIbftU7fweSjYCeXlU5YIxj
	 pVKR/ZZzhLiLuHW6ZWjwwXmUsghslV33IDvPasQ5nzaeF70z6jlwenBFan44xblXPP
	 RMwLmwkuK/t5nyFnfSQzn/GaW3KQzobIcMo07+lkopCcasNBta51q9cnVh9NVQ8y3+
	 22T4ajyJYSqgKuobUgakXTuWYjdrP2VGKziF79z40Mw+v684KWhJMOdL/NuVGasZsZ
	 8yapBUWq4w0poU5rYwFRHxVBxjZTRTE4KjLk2Pf7dievHz4xlSrtZu+ju0srNmChfF
	 BXvePHgyyHEtg==
Date: Thu, 4 Sep 2025 11:17:35 +0200
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
Subject: Re: [PATCH 1/2] dt-bindings: iio: afe: current-sense-amplifier: Add
 io-channel-cells
Message-ID: <20250904-tangible-practical-partridge-a1b0e4@kuoka>
References: <20250903113700.3079626-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250903113700.3079626-1-primoz.fiser@norik.com>
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

On Wed, Sep 03, 2025 at 01:36:59PM +0200, Primoz Fiser wrote:
> The current-sense-amplifier is an IIO provider thus can be referenced by
> IIO consumers (via "io-channels" property in consumer device node). Such
> provider is required to describe number of cells used in phandle lookup
> with "io-channel-cells" property, otherwise the following kernel error
> is present:
> 
>   OF: /iio-hwmon: could not get #io-channel-cells for /current-sense

Also, how can I reproduce this error? Do you paste here real errors or
just some invented ones from some out of tree code (hint: such would not
be relevant).

> 
> Also fixes the following dtbs_check warning:
> 
>   current-sense: '#io-channel-cells' does not match any of the regexes:
>   'pinctrl-[0-9]+' from schema $id:
>   http://devicetree.org/schemas/iio/afe/current-sense-amplifier.yaml#

Best regards,
Krzysztof


