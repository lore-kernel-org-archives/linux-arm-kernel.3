Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A85CC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 13:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYgnB2zxgJ+OK/paOrnG3wLtpZQl67DDaJEbwMptYyA=; b=eZFqhGY8GOxZRPF5Vy8zr4gohH
	MIQgUocXypPOGbp5pjmKuetZMrKtQG5qT2BHEHk2+A1oobaGvXr3e+kHv4gDI7h7Z9eaKYO7yvfat
	KlI+mxlMSh15+d1+PaT3XWyMVHoEPvrWaEThqBtiUzSLrYO3sX/JaqAm2H7l/gNsxn68anI+lKqIr
	nP2aaIFqhA9ujnJgr5ob6IIM3coIwgbr86kt5XftunOQrYng8L4yZxuxPlwmvbXXUFu6i++hy93NZ
	/P8STGw3GcO9xDgFYdJPPzRDNUf6F/c+0lLCa63i278HNN9uMf1DQZYJ6MzvFoy+LCg+lXeXf0AMO
	A3AgC82Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTh9v-00000002rhl-2hDP;
	Mon, 23 Jun 2025 13:24:27 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfe5-00000002YSq-1rmK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 11:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750679249; x=1782215249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=41O4gNiNxKPz02OsVRMHdiJHhSwTSQ4o5ElTBRS0TlQ=;
  b=BhdKGc1wr0kTfSCn2+LTehIGZe2t5o/8/MJeOqjxy1LsXsmDYL/NxQ/A
   FW2Yf7kxOU2GZLGPV8LSvBHShmMnbxTy2fH7tswvvoi6Iq0ax+7BtVZlb
   jNVHIU7YyZsgwMKw9iZY4NScL6KJWgnj8HoilQXqPAb674vMXs7fQLPSu
   KvMC5Wihmz0ea5XwlC8KpCllcE+i/jEgRPYVg8kvGZCf2fvykRdUAIR/h
   GnX5ix/f730qGBJwvKxWLFTLWUhqXWKLpPu2QspGNyhuOU2hoEtAH9Gul
   6gtbbEh3TPH38IXFQc4ZQU/4r3cEmy+E8xkXEJ6USqo8RpKGKg5u1jCSd
   Q==;
X-CSE-ConnectionGUID: MIxZSKtgR1iJUJBEIa3pqg==
X-CSE-MsgGUID: QmannpqOQuaHJ6IS6kaIgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52970577"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52970577"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 04:47:28 -0700
X-CSE-ConnectionGUID: NNEkgUUISDCPawusqMEQ7w==
X-CSE-MsgGUID: JPibauSsRrWbNV/Oed5Qzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151351292"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 04:47:24 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0DCED1201F7;
	Mon, 23 Jun 2025 14:47:21 +0300 (EEST)
Date: Mon, 23 Jun 2025 11:47:21 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RESEND v4 0/5] media: i2c: imx214: Add support for more
 clock frequencies
Message-ID: <aFk-yTSOqzmEW1sz@kekkonen.localdomain>
References: <20250621-imx214_ccs_pll-v4-0-12178e5eb989@apitzsch.eu>
 <aFj5QnPBO0We5SBQ@kekkonen.localdomain>
 <46a681a84a7493e2d0a6d3a4eedb6c86ccd9903f.camel@apitzsch.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46a681a84a7493e2d0a6d3a4eedb6c86ccd9903f.camel@apitzsch.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_044729_525041_15139357 
X-CRM114-Status: GOOD (  16.40  )
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

Hi André,

On Mon, Jun 23, 2025 at 01:34:03PM +0200, André Apitzsch wrote:
> Hi Sakari,
> 
> Am Montag, dem 23.06.2025 um 06:50 +0000 schrieb Sakari Ailus:
> > Hi André,
> > 
> > On Sat, Jun 21, 2025 at 11:37:24AM +0200, André Apitzsch via B4 Relay
> > wrote:
> > > The imx214 driver currently supports only a 24 MHz external clock.
> > > But
> > > there are devices, like Qualcomm-MSM8916-based phones, which cannot
> > > provide this frequency. To make the sensor usable by those devices,
> > > add
> > > support for additional clock frequencies.
> > > 
> > > This series supersedes
> > > https://lore.kernel.org/linux-media/20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu/
> > 
> > Is there a difference in this set from the v4 you posted previously?
> 
> There is no difference to the v4 posted previously. This is a resend
> because there was no activity in the original v4.

It's not useful to resend patches, especially those that already have been
merged somewhere. Please ping people instead.

-- 
Regards,

Sakari Ailus

