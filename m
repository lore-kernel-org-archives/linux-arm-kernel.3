Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00B4CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 06:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFBoEv8v084BfoqwXczJZhbGZtca4Wxb8uo/uPmEYgg=; b=C07SX2fhdDPrv3Wl3KQZsYz+Es
	ahICiZ2c5ObNBDKkwcJSuEAhDO2f9bGK824HaNNV9QHEGdqALdZ7IuiSPfQXsSDGSi1qcP8+7FObP
	P/bftkCLvusO6rFBpE04MsyFypqL6mLAqNjNEMVlZO39CkuO09sMd2cfPjkFYTf/pgpYVMqF2QGAq
	qRsoeoyX46MOX4G8YSmfHXvBwf4volOK+RIviN5ONW2ILQkIK8rFrDXY+jVIeAQMEbMXlel1CVjWu
	YB6zSFrzxn7RFp2v0h9zCsKDEsMckNBVRu5d/XHXk/9ECOZEfQbiQ64eE6iebnKtoDqEP7OxSS0GJ
	232sSElg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKVbf-00000000sSi-0NxY;
	Wed, 06 May 2026 06:19:39 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKVbc-00000000sRO-0vnu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 06:19:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1778048370;
	bh=hvqJbeP9p+DGmQxzChdUPddmFOg9jOAGvwXULn0ZZtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lJFELCGX2tnCb7XQ6D91OyvhKKho8SSNh/MtHe/NkjVeDbHLNTKJAPJcFPMyY698i
	 ACQ/CSywPxE4pjIU0nD9MsCr5kv9O9wlnTPjUQbdVtF1V/zQxqkTr+lZTy0rRJMs52
	 VlS6OW2VZgMAxVC1O2tWeoNE5iJXDh6xZIIpOjj0=
Date: Wed, 6 May 2026 08:19:30 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH] leds: Move MODULE_DEVICE_TABLE next to the table itself
Message-ID: <357c1670-c8f5-4506-a49a-b9315201d3c3@t-8ch.de>
References: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505102846.186219-2-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_231936_408120_1397291B 
X-CRM114-Status: GOOD (  11.73  )
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

On 2026-05-05 12:28:45+0200, Krzysztof Kozlowski wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Most of the privers already have this correctly placed, so adjust
> the missing ones.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Acked-by: Thomas Weißschuh <linux@weissschuh.net> # leds-cros_ec.c

> ---
>  drivers/leds/blink/leds-bcm63138.c | 2 +-
>  drivers/leds/leds-cros_ec.c        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

(...)

