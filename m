Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A55CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ps5J/2DiZZaZALrpYJv7qOm8LVVHiYQgbB13On5S8hc=; b=XlrlvO1g8qVbscylBm4yYFYqFg
	NfoBRel/7vu4v2pYSU6kEBQHwQRn/1m56w8iI9/+r9fCW7BSqrIeYPd1yOcGad9SqabE9NdsRDl5N
	caZPp0HbBEnnpOOLCSE8lKNZVGuxNjjjZDZr9idhjbxy0dL2CwS0arQ0k0DoFNSYJQ3JUfkDPNP3y
	7GWzOaisOahTZlwvHyGXeR8vUh1Q8gqG7Br/AmaDzwEuBxiC8vYQWVGYb28tsYg+UDI50O4M8FeVB
	yuTqKoquk0mn20xLF2m5JJRRQQAhQIUidD5hVS0WxTCpRAfVGeno8balxUZvnSjt4ENG1/MCTXAJR
	rELSdVkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAZ6-00000004mxg-3UXv;
	Mon, 15 Sep 2025 14:52:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAZ4-00000004mwj-45xM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:52:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C116442C8;
	Mon, 15 Sep 2025 14:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2EEC4CEF1;
	Mon, 15 Sep 2025 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757947942;
	bh=ps5J/2DiZZaZALrpYJv7qOm8LVVHiYQgbB13On5S8hc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mmS/Vo21BRD8mRQMpNk4G3zLBRL1lTZ+I8/bL1wg0v/acaTcjlwR1yLqPqOzn7o+g
	 i5K8F8QFOxIMfCjUrvuIK7eLysVkrvP01pRRNVpKklxtCd9ydO8DAFrHznZxg9CTYV
	 wtDkAFc35jVCWqqDs19gsP+Ab/j8IHtiw8vpNKdpZO8QGEyKXFANA/igYzR08SHJ7x
	 OuP7FJrKVTpb9+zNxFo+0uieUv6+X6PrWE2hKtyPyOCUpyXjNZxsh83cxaTFB4Rh7W
	 U6KP2nAyVpU+r/v0bj9++QC7zmWH0e66OPrvfjESyuoGl+vdwHLO4J1CtLSNT+LfSe
	 d/OZQyDPYDsiA==
Date: Mon, 15 Sep 2025 15:52:15 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com, deller@gmx.de,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, fnkl.kernel@gmail.com,
	j@jannau.net, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
	sven@kernel.org, alyssa@rosenzweig.io, neal@gompa.dev,
	support.opensource@diasemi.com, duje.mihanovic@skole.hr,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v2 11/15] backlight: ktd2801: Include
 <linux/mod_devicetable.h>
Message-ID: <aMgoHwP912AEQcY0@aspen.lan>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-12-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-12-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_075223_034396_78994A73 
X-CRM114-Status: UNSURE (   7.64  )
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

On Tue, Jul 15, 2025 at 02:24:48PM +0200, Thomas Zimmermann wrote:
> Include <linux/mod_devicetable.h> to declare struct of_device_id.
> Avoids dependency on backlight header to include it.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Nick Chan <towinchenmi@gmail.com>

Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>


Daniel.

