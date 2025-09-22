Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94636CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 07:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrkFqzHRtzNnfsVqi41bfkuCyZbhMb/ERUPCAxjpsyY=; b=xKT7kPgtw+jvG3UlJwfL0zQUsN
	fTh1pEDl6F6eTfM+T4SItEPz4PMyXPW80AaMuoH2/BGwpS2AT//6JtKChF+xmrhm2K7613kxRfnND
	SV4POgfvps93Bv1wS1IRazFwyIq5uksV1OQ9jpZV93/GMo90pMMZT27DHEiFh3imMQf83B1jA5M9f
	EQaXQT6PFNtgWw0sX91nK+ibyvTAkglAtmI7J5HYqH21YCs4pGXpd9acGpRMTPerYxi2PnTDl5Xld
	3fTfAsUeOrFxow4lCHjvKRNce5xcTaTMxdPdXzFYpa1wL6Il4mI2SaDXh9xS31m9YXshgA5l9d/+d
	U/nk/MdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0alJ-00000009AMK-2qAA;
	Mon, 22 Sep 2025 07:15:01 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0alH-00000009AIs-1hBP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 07:15:00 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1v0alE-0000j7-AD; Mon, 22 Sep 2025 09:14:56 +0200
Message-ID: <9cafbc70-7235-4e49-928c-4d68a57b7d46@pengutronix.de>
Date: Mon, 22 Sep 2025 09:14:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] scripts/make_fit: Support an initial ramdisk
To: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org
Cc: Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?=
 <j.ne@posteo.net>, Masahiro Yamada <masahiroy@kernel.org>,
 Tom Rini <trini@konsulko.com>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20250919211000.1045267-1-sjg@chromium.org>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250919211000.1045267-1-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_001459_455376_FDA767E5 
X-CRM114-Status: GOOD (  14.47  )
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

Hello Simon,

On 19.09.25 23:09, Simon Glass wrote:
> FIT (Flat Image Tree) allows an ramdisk to be included in each
> configuration. Add support for this to the script.
> 
> This feature is not available via 'make image.fit' since the ramdisk
> likely needs to be built separately anyway, e.g. using modules from
> the kernel build.

AFAIK the kernel supports multiple concatenated separately compressed
initramfs just fine, so it may still be useful to add a target which
builds a cpio with all modules inside and the rest can be then
concatenated.

What do you think?

> +        fsw.property_string('compression', args.compress)

compression should be none as the kernel would take of decompression.

Both U-Boot and barebox should warn about ramdisk compression property
that is != "none".

Cheers,
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

