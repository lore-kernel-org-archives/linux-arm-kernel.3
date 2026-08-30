Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF7CAC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 20:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5valHy4vnBBktPpX6plSalDk14R3xmNoib3KQEg9z7E=; b=X3lIcbVNbVFv/wnNeVW0YMzHP7
	XEpNmF9lUIAqyzprWqvcEL71X6Y2pgD4AJCysAMyPZMvqw0FODLq5dSa+Vhex1dKWvK9L35hN0WP5
	C3ZrofP/Eh6ssuLhH9l0lY3EqdxsNp31+D/qHSElH/3Tv0vuMnDNw1sXamVR6FVPwzxhb/t5ZyTiO
	7hrX4ONr7NNq7WMpuvv/UARIIDINfPgwk+wu/pecvV8mwEmTy0GPWOO9JNA5hhmuG7phAA/oaWky4
	2pKKWLbH27TVij0VqEsPaK0aby285oY2+4/1oSzTU3MERVpYDrBscduuFxT4wMn3tFVa62BQgeoah
	wzxFOMag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0lza-000000082hV-33ie;
	Sun, 30 Aug 2026 20:19:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0lzZ-000000082hI-2kMZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 20:19:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FF5A414AF;
	Sun, 30 Aug 2026 20:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB85F1F000E9;
	Sun, 30 Aug 2026 20:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788121140;
	bh=5valHy4vnBBktPpX6plSalDk14R3xmNoib3KQEg9z7E=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=dw6R521SZdU2bA6l8sFN5acQvAm2gbT0tvNzgq2Y/ojqKM5bikpiDN4U6xQdGmloq
	 0FYHlj2mEhgbEvpWxbwYDRNjAtIoLNHeS3LaaSyQtpWrrjnb7Qd1jmGFO8Bik/iiq+
	 5zqECuSn4Ksqxt16msSsgWOowuX8P4Z7b84y4WEMPHBVgPd2W4vANf7h8r6pVXVN5J
	 K4yMF0c9sC9uW1AtNe+29IV20n3oDs6GFf9cai0tQzQhz4gYMA3noXFo3xzi5V5iL2
	 Ziz5Ojj//I8RH9oREwHosXegcWgirBZxmE2vXu8fb/ml/6S/7W2cYQ7mN2WHrm8LF2
	 BAY9afE/2wePA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 3/5] iio: adc: bcm_iproc_adc: use devm-managed
 cleanup
From: Jonathan Cameron <jic23@kernel.org>
To: mdshahid03@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, 
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260830170919.470974-4-mdshahid03@gmail.com>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
 <20260830170919.470974-4-mdshahid03@gmail.com>
Date: Sun, 30 Aug 2026 21:18:41 +0100
Message-Id: <178812112191.2788519.1724251718821055090.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100;
 i=jonathan.cameron@oss.qualcomm.com; h=from:subject:message-id;
 bh=gFdcnHzLitFN+WfXJUaU1+e0UbdVLCMriM5Zp3dAhHc=;
 b=owEBfwKA/ZANAwAKAVSFNJnE9BaIAcsmYgBqlJAkl6tSVRNmqepL/mprtKJm8M/Z/MHeK2wpx
 K9GjhH4aIKJAkUEAAEKAC8WIQRuKWazh4QGUpEmgbFUhTSZxPQWiAUCapSQJBEcamljMjNAa2Vy
 bmVsLm9yZwAKCRBUhTSZxPQWiPCOD/wP3KiOH6qh3FNOj3N7WShzTh49BJRqclbUWo62WVYmGJZ
 bcJwQ0RSgif1LyMaP8FUeJYpGkl7dz7aIvIxkfjHLy/Q8dKRkTiReofSbjwkovAbKwQGFZicc2P
 kISguP4ZskcplbOWO+zdkFbvU65qWRpgecZsaJZ013zBZ6YBy46aukeX974zMo6SX4mjGf4NZdv
 9/qMxCL5lzgOa8jp/szW0hZE7IhwFDKTgaw+2QO1FEGC49TdSiKaNDSxQ9vtru35gbhIs0WFOLJ
 vwMPnb48Wpk3MBFjAvxXsvJyQGTrZSrnjs/tYTU1imJJoWshv9M2OX9TbSp+MMgX3mOUQUJ+C+S
 lEBzCkHi+jEDlizz1QEl0WwQiQVXB+MF5SSqE4CWRQ+idV9lY+o9fhxt3izFYuaIQQvuMAIb3lt
 w/1w4dQClkBY0TvOfvS6VdM4EpU+1SHtZdhc/4jtCmt9AQ+VxG90LbGyumfkYHBDQw2lsXIsOIu
 IqlFutDmUvXzpBovT3PjE/oyt6DcYYxRXXJzsGCRtP0w5l8zsf9M70KzGoW8Nw7kAqP16NsuV12
 8wapqZQIFq2uxjiq0MakBqBFNvzuQOUfAwU21v0eHwD3Tg50Ax4i8M8QIhabjFUp/vW7cjdQdnD
 /9ZL212jYFQVjtq6WwJXk7fMhcANCMYWilrXy7g==
X-Developer-Key: i=jonathan.cameron@oss.qualcomm.com; a=openpgp;
 fpr=6E2966B387840652912681B154853499C4F41688
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

> Use devm_clk_get_enabled() to manage the ADC clock and
> devm_add_action_or_reset() to manage ADC cleanup.
> 
> Since the clock is only needed during probe, keep it as a local
> variable instead of storing it in struct iproc_adc_priv.
>

Given this section needed discussion...

> Register the ADC cleanup action immediately after enabling the ADC
> so that it is automatically performed on probe failure and device
> removal.

I would have left this for a follow up patch rather than
doing it in this one. Here it is not really the number of changes but
rather focusing the reasoning on one thing.  Even without that
splitting the two changes would have been fine.

> 
> This removes the manual clock cleanup callback and simplifies the
> probe error paths.
> 
> Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>

Otherwise LGTM.  Note this is a minor thing so if nothing else
comes up after we've let this sit for a few days on the list
I'll probably apply it as it stands anyway.

Thanks,

Jonathan

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

