Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7DDD4899D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 13:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkK1Ejw0KxmIMEk93SickPJJ21Kj8+bMSYnsUDhPGNk=; b=JuCIuSZgEE3WFg4RzkyH2UJS4w
	oO+NLgBeChjHheR5uEBUIeC/S2oancVGfZyJfbI80is8WJ6lX1aaO8Po1RzTGFkhYIQ8eDnHlGXsi
	XVtmNL5Uh/s1N/sbx5fFIsWufPpRB6K74AlGYFM8SlSQoqNupTg4ljCnsyrhbc1BBusVwWtCCCmKa
	l6hIMNVRGhZYKwA6Ekht+00FcpTPRR3quJ1N2IQxJBXQiSKilHvzVCkSPsUuNRVzetQ5vUFlzgy8o
	qpsv5LhfzXLdID36EeFr2sRgkMN+JeB1539pWh7yOpLfS3Eei2N5ZWcG0WeGWbaew0O0NTozIPbrg
	hcP4EsHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjVD-0000000E8XJ-32sf;
	Fri, 16 Jan 2026 13:04:35 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjV8-0000000E8U4-0q6W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 13:04:33 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-l5rn.prod.antispam.mailspamprotection.com; s=arckey; t=1768568670;
	 b=vuDgTWgibTz9qhhx9CN7vW8bI4t+Vnb2JNFrqYIygCM0AoZaN3ZV9IAtFGQZMk0IVXIVtXu55D
	  ga1UqAh8+TQF4rG+Z3U3g3UrtTtQ4sEGeRsvBTnn3kN5dPJ60ueZTDz1OQONvqCCUp0xi5V9FI
	  1KMI2Vnd5GpOcuuYgiSJscuFEwt6+vcgcd+9tCA37A/17GozyOKVKkVdcKYf9/znV1DSayWj3X
	  oLnfBzwKLHsdwcXi/zBUft0CezrjsHMtdIUWWvaAhJSfgv6NJMP8tigAccb74rzlb8gkEvncbZ
	  Dc1ceXnYGflikVL0hasME3SgFJRpgmRfk/yAdbW3FxtJQw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-l5rn.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-l5rn.prod.antispam.mailspamprotection.com; s=arckey; t=1768568670;
	bh=XSE9gGYLw8PadLVndxcVP/TcpVS4AVlOUv4UXdPej8w=;
	h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	  Message-ID:Subject:Cc:To:From:Date:DKIM-Signature:DKIM-Signature;
	b=FGOGbue6NAOOf1hq+q4rQ/d5c4N9wgH2hDRJMiPCQ36hcaqND4/LBEIvjGFFI5yk8ZfOoPkfaT
	  IYXjR2nu8tPD0DDa5l8p+f7tdqeFfaMyYFpyBtBs1oT9GGl76SU+kfT+L5Cw0+0J6CRF2fESmY
	  wBAUpuoDvn+vzwdNnHdMYrNvThoNmuXZzqtulq4K3wc5WGqSBCyI+1KTAb0Kn/n3/uxUCqhBw3
	  c7viB/CGkzBExkvZU3nrziWcRZo3brwsyO+6H3dokhHtZYWWCSGUKbk/FuC5datlaQ6vBQdUKm
	  nHUnRgetEK2vEOMYq3t+jK6My6B4QvW5FDRaUEh0pNE/eA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To
	:From:Date:Reply-To:List-Unsubscribe;
	bh=xkK1Ejw0KxmIMEk93SickPJJ21Kj8+bMSYnsUDhPGNk=; b=Ugsz+7DE1oXOFYR0pc3G6HK3Mf
	j037T6mj6BWWd1ybIvulakRoLxRkG/lG0UfEEhWJa+7XFemLSkeiw8Hob0DBtzUJbFPDYE8/qIouA
	v4vkhZJGPHwjA/BlBYN+7OBecltrB5ErYZM4gnR/i1z/vMPu4urLXkmFKefmabpUiafc=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-l5rn.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vgjUz-00000001br1-0ZUz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 13:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=xkK1Ejw0KxmIMEk93SickPJJ21Kj8+bMSYnsUDhPGNk=; b=P9H/Nd9meIDed7qu/cwVrC+SAf
	H5B+l1TOcHF68tQvca42uE+EHuoM987Rq7Xu9rl1ZwHLEiK8M+VUs0dKW8y8yGIyTl3ie6IMU4UKh
	YVStldrpw4Qp+67x9HRFZ6jHr7lRObEXorWIXr7JrzFSHSJSk6k4drDjCvVA6MeGoKgQ=;
Received: from [95.248.141.113] (port=60003 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1vgjUd-00000000M5y-1XmV;
	Fri, 16 Jan 2026 13:03:59 +0000
Date: Fri, 16 Jan 2026 14:03:57 +0100
From: Francesco Valla <francesco@valla.it>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx91-11x11-frdm: fix CAN transceiver gpio
Message-ID: <aWo3PZni1Pb9T6FI@bywater>
References: <20260115-imx91_fix-v1-1-9351c3fac76a@valla.it>
 <CAEnQRZD2CvQLO2hBDbX2H8PeeNkzQmLoK6jzeF6HKw8HHa8ukg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZD2CvQLO2hBDbX2H8PeeNkzQmLoK6jzeF6HKw8HHa8ukg@mail.gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 6a24f6a303db1600773d4a81a1927982
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vgjUz-00000001br1-0ZUz-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-l5rn.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_050430_397971_27D5FBB1 
X-CRM114-Status: GOOD (  17.16  )
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

Hi Daniel,

On Fri, Jan 16, 2026 at 01:40:11PM +0200, Daniel Baluta wrote:
> On Thu, Jan 15, 2026 at 8:25 PM Francesco Valla <francesco@valla.it> wrote:
> >
> > According to the HW schematic, the CAN transceiver does not have an
> > enable pin but a silent one. Fix the GPIO property name and polarity.
> >
> > Fixes: b4bf5e55899e ("arm64: dts: freescale: Add FRDM-IMX91 basic support")
> 
> Just for clarification GPIO 23 is connected to a pin named CAN_STBY.
> So I wonder if it isn't
> better to use standby-gpios instead of silent-gpios?
> 
> I am looking at FRDM-IMX91 schematic file SPF-94610_A1.pdf.
> 
> But on the other hand we have
> 
> static const struct can_transceiver_data tja1051_drvdata = {
> »       .flags = CAN_TRANSCEIVER_SILENT_PRESENT | CAN_TRANSCEIVER_EN_PRESENT,
> };
> 
> So TJA1051 is not advertised as having a stdby flag.

Regardless of the name of the net, the functionality of a standby vs a
silent pin is very different. In this case, since the TJA1051 is
including a silent pin (pin S in he datasheet [0]), I think it's better
to declare it that way.

In case someone adds the support for a phy-oriented listen-only mode
(which is something I am thinking), this wouldn't break the integartion.

Regards,
Francesco

[0] https://www.nxp.com/docs/en/data-sheet/TJA1051.pdf


