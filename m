Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA968CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xj+dVF/YryccXvlypmfMjf5O3cBWAm2GjD0ww5V4SRc=; b=O/hrgY9JPha8zxPlxSI0dCmzgb
	JhfyACAckQ75cIQ1dcaj5u9s1qx/VsDRyrgVPLQdGcRZe27Z00nmq1XkxWIt4WCL6EayCCKz/9kLs
	xWQ1HA/KLBtdUuRqgxzyxVmwDn0HWDrODSfC3oYCs8o6MeWHtxtEILOJkjRWQUrVVUON8GRveJIJl
	+iYJw2hge339VsIcinRo82fFRHLFnGC+XSmwcFcHlLrWaMYEeudCy/uPoYLGFMsCWs+wGQJWaUqxw
	8utvYukofxnddrDTKndA+kGGGbzzwaRwIwydjf7VpFODXV0MSj2QlwBoxxWSaAkYwu60ggXDs0FWr
	IV0tQrHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugY9-00000005WXb-2LfN;
	Sat, 06 Sep 2025 00:13:02 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uucfo-00000004LMJ-1MzQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 20:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=xj+d
	VF/YryccXvlypmfMjf5O3cBWAm2GjD0ww5V4SRc=; b=cDgw8gAm6HQuL4qnbhvl
	3V6qT3ETttXViq6E5ZyRDIYxChs5GwPHsWTHbtNVW67zgU4/3k1pEKUYAbBNd3Qq
	2scnAxM/L4uNOofMQ/qeBfxqRodiA710te/seFHfPtU6aB1QIN0JLhjmv4Mq+R5d
	2dulOOJ4AqfWSoufO+bdRIAlHkTyladuFqFxktJdASuIs34AZ5vN8knCjGuqTXWh
	DfBBI6YZr5tyWZy0UrbnqQjd/CbzM2F9btK69XrxlICIJR376sA2sVi00BXg4cw5
	JIg5BO13UOlxoy2JROtFVUuTEsFR0BvKxFXGpu6SWvOLJcQb98ggG7Cf+/c7l+qL
	eA==
Received: (qmail 4158411 invoked from network); 5 Sep 2025 22:04:35 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Sep 2025 22:04:35 +0200
X-UD-Smtp-Session: l3s3148p1@CwbEWBM+JqsgAQnoAEvNAIPWyJz1dhzG
Date: Fri, 5 Sep 2025 22:04:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT
 DTO to Retronix R-Car V4H Sparrow Hawk
Message-ID: <aLtCUoIPSFfYb-k7@shikoro>
References: <20250905020149.257459-1-marek.vasut+renesas@mailbox.org>
 <aLrXzl38OUhTJgxP@shikoro>
 <273d5067-4c9d-4c8c-8633-7f2d7c708216@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <273d5067-4c9d-4c8c-8633-7f2d7c708216@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_130441_226307_C1A86368 
X-CRM114-Status: GOOD (  15.77  )
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

Hi Marek,

> > > + * r8a779g3-sparrow-hawk$ grep -H . /sys/class/hwmon/hwmon?/name
> > > + * /sys/class/hwmon/hwmon0/name:sensor1_thermal
> > > + * /sys/class/hwmon/hwmon1/name:sensor2_thermal
> > > + * /sys/class/hwmon/hwmon2/name:sensor3_thermal
> > > + * /sys/class/hwmon/hwmon3/name:sensor4_thermal
> > > + * /sys/class/hwmon/hwmon4/name:pwmfan
> > > + *                       ^      ^^^^^^
> > 
> > For me, the output looks different, though:
> > 
> > /sys/class/hwmon/hwmon0/name:pwmfan
> > /sys/class/hwmon/hwmon1/name:sensor1_thermal
> > /sys/class/hwmon/hwmon2/name:sensor2_thermal
> > /sys/class/hwmon/hwmon3/name:sensor3_thermal
> > /sys/class/hwmon/hwmon4/name:sensor4_thermal
> > /sys/class/hwmon/hwmon5/name:pwmfan
> > 
> > hwmon0 is the Argon, hwmon5 the (unpopulated) on board connector.
> > 
> > I hope the naming is stable, but in any case, the docs need to be
> > reworked a little, I guess?
> 
> The hwmon devices are allocated first come first served, so the list can
> look different for you. You need to look up the fan you want to control, of
> course. Look up by name is simplest, if there are more fans, it might be a
> bit more involved to find the right one.

Exactly. This is why I would suggest to drop the '^^^^^' line from
above. We definitely have two pwmfans with the above dtso. So finding
the right one needs a second look anyhow. And while I think it is quite
likely that the list of hwmon devices will look the same (I don't see a
race condition which would make hwmon0 and hwmon5 swap), I agree we
shouldn't rely on it. I would also think that we then maybe should
change

	echo 2 > /sys/class/hwmon/hwmon4/pwm1_enable

to

	echo 2 > /sys/class/hwmon/hwmon<X>/pwm1_enable

or something? What do you think? Just suggestions, I am not really
insisting. Well, maybe, about dropping the "^^^^" line ;)

Happy hacking,

   Wolfram

