Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D26CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbzJ74IpdrLVs+Y0O3IYzwuBnLAyvP58FSzsN8By/Cs=; b=wteDbaTrgn59jlgN+OIK/y3Qng
	7emvpx+LsKjYQdH/uakLb8qmN2PHogHgOYXtMbrTjIY9/a1GPuWFy1peuwRuLNMFSkczGcYhycKs+
	t+TO2sGBT+gA1PJI2I1oPUQ9B/pk2lRyeE8QZZgytXwZwAad3UvqJyL+tpcMCEk9kxd6ds064DFFX
	WHWYdt/tbZPV2Lqt9w9kzSuEFu7mCqyTkjgSSRkz/9pbV8/qma0pJqMSTekJKoYORoQg//H2cRHLS
	807Z4pkpINetu9n0VBKke9eqF+ZU6dOcD+Mbqu/7WtWxYaPn1q+K/gN96VgEAMS3iOP2VriKpfqF9
	YQQe04BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXajH-000000090GO-1ak3;
	Thu, 11 Jun 2026 08:25:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXajF-000000090Ft-2ZIf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:25:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 09500600B0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 08:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0DC11F008A5
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 08:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781166332;
	bh=hbzJ74IpdrLVs+Y0O3IYzwuBnLAyvP58FSzsN8By/Cs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=YYiVVYNSzF+Cf3Yx50hPpm45j5U7xTjL8FgJQmJQi+tPGvF2XaEjiliC1a2K+cSRB
	 RdDpq/wdd1HskPDJzDwvLeoQ+MofyuQbYVNsP6QYqxy4PxopxWAIE5hpuM+hjXW0u2
	 Lao2XOnP6L+oxyCHvc8QnjKvn/MCo6/vnbkIFyWAS6ScPRAoJyfo+TIMH8w17DpQKw
	 +pJ/yvmavKcLpayfSjykTz22wcDF4RnomxL1PViyS2BX8DLE61U9j7YcflzcikejRz
	 /9tbE++2bLJji/fJSgASBT8kQCpxY1ZYzxRpdjdBNSwT/VI+G8YM/ZeQ7kmSoiEuEZ
	 3os4qXlv53Tgw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3967724bed1so83442521fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 01:25:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+1+pCdUIR+MJe1jHEvJwOVSBKX6YdE3fY0RndfMoKp7mtMXQwljd5hDTeyds04n3ITXDcUrlofPe+32yT61yJ7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9iBicxNvj1q+/DgHNIjDXi7NBy0ASD4pMulFSLKU0fJBw6KDE
	aKcDaayRsN6p50W8u7fG1BVIKbS34YaoqAMfaqabl7eI3vGj9oshEg9ZCZaWl3uGifXsgavTgOg
	bnE+bnPy3NQ8l4slP5seSmnttReBxBLAnyKit14J4xw==
X-Received: by 2002:a2e:bc88:0:b0:396:6705:d244 with SMTP id
 38308e7fff4ca-3991a0d60d3mr4699081fa.28.1781166331314; Thu, 11 Jun 2026
 01:25:31 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 03:25:29 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jun 2026 03:25:29 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260610084053.2059858-7-wenst@chromium.org>
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-7-wenst@chromium.org>
Date: Thu, 11 Jun 2026 03:25:29 -0500
X-Gmail-Original-Message-ID: <CAMRc=McP9FM9X7TBfGrf+9Ju6=n_g8_H-FWTitCKovjoCvWWrQ@mail.gmail.com>
X-Gm-Features: AVVi8Cei7hYbpuq4j9lODYGpwH8njTDuNJY7X5DUGeetWn08wd_jggR-VxE4bK4
Message-ID: <CAMRc=McP9FM9X7TBfGrf+9Ju6=n_g8_H-FWTitCKovjoCvWWrQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 10 Jun 2026 10:40:40 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> usb_port_is_power_on() currently takes |struct usb_hub*|, but only needs
> it to tell if the hub/port is SuperSpeed or not.
>
> In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
> state tracking field in |struct usb_port|. Either structure can be used
> to identify whether a port/hub is SuperSpeed or not, as the field in
> |struct usb_port| is inherited from the hub:
>
>     port->is_superspeed = hub_is_superspeed(hub)
>
> Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
> |struct usb_port*| so a subsequent change can use it.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Makes sense.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

