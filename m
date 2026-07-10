Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E30EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZtt9hqfiH8yRk8Y6EHE38Zx3h0iymmFuYoAuIHZpGc=; b=C5EufvW5cVY7+9Mhbo9MA5RtIe
	5pN1cPrrDAxsXcvTi7SrTBZ19xwywHljFyEu1D6pGWcVpD77hD4KCid5zGcYdzqUXwzS1w9RZuvj9
	r5pwQR1ardWIxEHLXEBSirDjKdJmGaTNobdq+TkctbKSK4baj/qRQJIxwyoW19P9uDHtzvPrUruvF
	UwrmBclxs/BkcjlnIRrpKhMw5u1pZrTq2ohtrED/8k5RHlG6tnDy9igUKhLi4p/cFW/ITMED9jXdv
	7sQEoJoYDC2YO5vIyz8PgH2hxGNFgJsGEa+0I6g3gsrz9K8cn2st8xJRwnhQ3JuFjokzn2DuPi1y8
	egeUwO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi87f-00000004ewU-0vOb;
	Fri, 10 Jul 2026 10:06:19 +0000
Received: from mail-10698.protonmail.ch ([79.135.106.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi87c-00000004evR-3SHI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 10:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1783677971; x=1783937171;
	bh=bZtt9hqfiH8yRk8Y6EHE38Zx3h0iymmFuYoAuIHZpGc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=U8hhGQ7VomZ9uCLFY8xtreukqqVFxjRaNesy39m8uy4yjDH/ZFgiC/i5RnCC3C6o6
	 Dom22Z/C7+D+RBR3lw3h6Zo9ByqJrkDQHiJ7djCTu0y4CaUAfp3bwdIixrwK4tjwkk
	 2qJNJd9GJrjZQ3F/Y6SiOnVxFQW/msgkkeYthBcQDSxgIaiMtiJYuhaegNOs7qMLaT
	 rkzBeQPxMemtPk09cv52Df7txq3kbcWSHqnm2o1QWhcYhWUPmrq1yQgYaYf27d2uuX
	 cZih2rYk19O+wm7T+UpBr39onBWBhVlWS2VVAcju/x2YtXy9+EKpIlctVbJNUX2WYt
	 ZWHgwj/nL102A==
Date: Fri, 10 Jul 2026 10:06:05 +0000
To: =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Jonathan Cameron <jic23@kernel.org>
From: Roman Vivchar <rva333@protonmail.com>
Cc: David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>, Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v5 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC driver
Message-ID: <KnchjScV7RNnhDi3rI7qqdZSgivkk8WJiQEGWYifNJJjMzzJrEFfZGEuPWSrQisnh_JDj15_CLSLtO2HEjUFe6Jr4wgramAhYwmJjHy6aiw=@protonmail.com>
In-Reply-To: <alChi9oG0-2XUFXK@monoceros>
References: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com> <20260709-mt6323-adc-v5-2-d11b8332a735@protonmail.com> <alChi9oG0-2XUFXK@monoceros>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: b24ef4ce02959c9f36191eeefd7da36d6ded1b5f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_030617_018162_9FD813CE 
X-CRM114-Status: UNSURE (   8.31  )
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

Hi Uwe,

On Friday, July 10th, 2026 at 10:39 AM, Uwe Kleine-K=C3=B6nig <u.kleine-koe=
nig@baylibre.com> wrote:

> Hello,
>
> On Thu, Jul 09, 2026 at 01:52:48PM +0300, Roman Vivchar via B4 Relay wrot=
e:
> > +#include <linux/mod_devicetable.h>
>
> Please don't add new users for this header file. Only use those
> <linux/device-id/*.h> that you actually need (if any).
>

Jonathan, since you've already picked up the driver to the iio testing
tree, would you prefer v6 or a separate patch on top of iio tree?

In any case, I will drop the header since it's not needed.

Best regards,
Roman

