Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED0AC71137
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBVOc7vHR4kZtKiuQ4qQXxVIUQWSopJjHkdge+9ZyYI=; b=YerNmKnk/xN7y2m8aG+kLM55mJ
	aXxSCWwuznXWvkLGbaX+2ZL5Uu+4ct8ls4E2yZ7A6FyBigyMguQRFN6jzrall+BLTiMD7EzUY5rCM
	TiWLGo6uZQAWaG45cQYsWT8Zzvm3X76h2SQEoa3jfr78qP9jWDNeo648KFAUw9DxEyEE7vHKUV8HW
	3XmEPzzUswmv14yQTG0HOF7GpCA2AcOqwQyJdq4vgYPxNaWyRzF/61ycmVDRZvMHo0Dpi/pFm7Mty
	i+IJmLhMH3oAigQ58JV3913SSb5ErdIyD2HiNuXPjudDmcDDnfdMfzS+PNJJc+efV4m5gIWY7PB9d
	f/97HmGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMki-0000000A9O3-18vi;
	Wed, 11 Jun 2025 14:48:32 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHZW-00000009Rjc-2vZk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 09:16:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=rBVOc7vHR4kZtKiuQ4qQXxVIUQWSopJjHkdge+9ZyYI=;
	b=J7t5U1Ss6cae1xR6YupFxGGc+qxjQdL+pQRIcP5Im26N2vSFZReBnh6wVRGzwn
	+3L47mgAfHX002ize/lKWOogiYY1mC6NOONmsu3EllAhGn+8aTKXgGqTeZbh0oM0
	MFA/U67SqzDHLaXQD9EH0eiG3dxYlrsj6W4t9sFPjbdSM=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgC3zlJqSUlopYxpAA--.30940S3;
	Wed, 11 Jun 2025 17:16:27 +0800 (CST)
Date: Wed, 11 Jun 2025 17:16:25 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Martin =?utf-8?Q?Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: Enable gpu passive throttling
Message-ID: <aElJaVxqUUNi1rfC@dragon>
References: <20250508101802.489712-1-martink@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508101802.489712-1-martink@posteo.de>
X-CM-TRANSID: Mc8vCgC3zlJqSUlopYxpAA--.30940S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr47Zry5JF13JFyrCr4Durg_yoWxurb_Ca
	y7C3Wqg345A3W8K3Wak39xuwsI9anFvry7Jr17Zr97XrWjqr9xZw18Cry5ur1kWr4I9rn7
	Zas8Xw4aka4I9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_hL0UUUUUU==
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAQxpZWhJP1YspAAAsB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_021639_050879_D28B5999 
X-CRM114-Status: GOOD (  10.57  )
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

On Thu, May 08, 2025 at 10:18:02AM +0000, Martin Kepplinger-Novaković wrote:
> Hook up the gpu as a passive cooling device to the thermal zones' alert
> trip point just like the cpu.
> 
> The gpu here consists of 3D GPU, 2D GPU and NPU.
> 
> One way to test would be to set one "alert" trip point low enough
> and watch the cooling device state increase:
> 
> echo 10000 > /sys/class/thermal/thermal_zone0/trip_point_0_temp
> watch cat /sys/class/thermal/cooling_device*/cur_state
> 
> And of course set the trip point back to its original value and watch
> the cooling device states jump to 0 again.
> 
> Signed-off-by: Martin Kepplinger-Novaković <martink@posteo.de>

Applied, thanks!


