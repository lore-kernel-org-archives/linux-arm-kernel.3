Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50702C54754
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 06:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGWWGObFky4XfteGhgj8OLpa2tRiAIZQ3jU/ccCP2cE=; b=tW0tTfIlHibqjFrFtJks1vz1z2
	G04Xa8wXIABVosC1GmhP7QtbK6zQycMdVdYeAtlW+jcirLv8NAKREnBp3BrAOZTxI9wGg9ZMqO4aP
	QIIP6g+LxnxHQy/fFIU3pBhd4oJnJhhv+pdD+cUu/EVPf1X98FIDlAMvdfb2nIaU+8VVs95RV1tu4
	MRe7d46STdZ6dp330Agew7ooXD5jBg9OBSvTSEQtRbNDr12DWTExAXEqa6EAlNO5agC1MQfHb3vpL
	IDNwi0Kd2YiesVGGbkb3iDVwKAcbOoo52m/mJ1X0iF5wpvl4VrmDtbaKXfTEIBaNfWHAi9PLwKdMx
	AI2dVi4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSXF-0000000HD0I-1e60;
	Thu, 15 May 2025 06:57:41 +0000
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSI3-0000000HAlI-306O;
	Thu, 15 May 2025 06:42:01 +0000
Received: from localhost (unknown [82.64.135.138])
	by smtp2-g21.free.fr (Postfix) with ESMTP id EE3E32003E3;
	Thu, 15 May 2025 08:41:48 +0200 (CEST)
Received: by localhost (Postfix, from userid 1502)
	id 84740C4D1; Thu, 15 May 2025 06:41:48 +0000 (GMT)
Date: Thu, 15 May 2025 06:41:48 +0000
From: Etienne Buira <etienne.buira@free.fr>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Etienne Buira <etienne.buira@free.fr>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware/raspberrypi: raise timeout to 3s
Message-ID: <aCWMrJcldfrsNTQq@Z926fQmE5jqhFMgp6>
Mail-Followup-To: Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Etienne Buira <etienne.buira@free.fr>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <aCIiEp3CXD2o9dTw@Z926fQmE5jqhFMgp6>
 <048fd6c5-9f09-4c06-9a23-e5821dc291d5@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <048fd6c5-9f09-4c06-9a23-e5821dc291d5@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_234159_897930_5AFDD684 
X-CRM114-Status: GOOD (  10.96  )
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

On Wed, May 14, 2025 at 06:20:32PM +0200, Stefan Wahren wrote:
> Hi Etienne,
> 
> Am 12.05.25 um 18:30 schrieb Etienne Buira:
../..
> Out of curiosity and because i never saw this issue, could you please 
> provide more details?
> There is nothing connected to HDMI 0 & 1 ?
> Which firmware version are you running?
> Do you use a special configuration?

Hi Stefan

There is nothing very special, hdmi0 is connected to a monitor, there's
a (independantly powered) hdd on usb3, keyboard/mouse on usb2 ports, a
Gb network wire, UART, and nothing else.

The afore-mentioned next failure is also about graphic stack (hdmi
signal is lost as soon as VC4 driver loads), i seeked for help here:
https://lists.freedesktop.org/archives/dri-devel/2025-May/505475.html
(btw, if you have a hint...).

Regards.


