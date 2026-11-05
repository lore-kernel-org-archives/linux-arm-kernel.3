Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29C7606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n89ufnu7;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RC6nnou3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JQmg4zxeUYL2PPa+vgHQ5g1Y2E23WzFCydvT5jQRgwE=; b=n89ufnu7ILVWZN
	e2wslxZj1e7eCXeGuSk5UjiwagPJlW4FYZ4sgV4Jlq+hblPCV/myRbpJzAj9PamfZdIdYkzMRZCgi
	7UM9Z1kvCcanIv0un63G9HpaBCyt7xY0ZFkeI46sTmibQq9j2qVi+keke1Pgh2G2sc5TgkO/HKLEA
	aiyWwUNbyYp9qA0hhQGG5fqhizLUXtuyqWCJGXn6IXn7f1xvekiJnUuBtRKicU4qpjTqQCOTci5oP
	ZGPkoORl4sI5hJRc8+oTbOEsnH4WEMVeiQ09fCHgcPtvixZQgrQBxVTnw468r9fRcaufD999clEbz
	4BAKGlR6cXGiG/xpOLPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvfw-00000008ehc-0I0s;
	Thu, 05 Nov 2026 11:30:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvft-00000008egU-2ZsV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:30:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3854715A1;
	Thu,  5 Nov 2026 03:30:27 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6E943F628;
	Thu,  5 Nov 2026 03:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793878230; bh=C0b3O6W1wzcNoRzD4HqefcZG2lnlYH/+Xnqj36zkkwo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RC6nnou3GWdlDGhCm9PHgWnLnyV3Titnp/aOc2ba+ADA92hOXYckqG8IGQoQ6DJiQ
	 Sf/GPRNpCKJfsM1gSmSuOXwh7DnCcpvXZEWb7pkvK+nllUkZ4FeWcqxwqnRiE2TO8P
	 VvBbzKqwuj3MHj1ZGd8Fip2yPX3KcqvQnSGOQV8U=
Message-ID: <d4d89cf9-884d-424b-927d-5b6692f50327@arm.com>
Date: Thu, 5 Nov 2026 12:30:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] sunxi: A133: Add CPU speed grade detection and OPP
 table
To: rajanyadav0307@gmail.com, Yangtao Li <tiny.windzz@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Cody Eksal <masterr3c0rd@epochal.quest>,
 Alexander Sverdlin <alex@sverdlin.org>, Paul Kocialkowski <paulk@sys-base.io>
References: <20261104-a133-series-v1-0-58217cb33a87@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261104-a133-series-v1-0-58217cb33a87@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_033033_754139_A71632FE 
X-CRM114-Status: GOOD (  34.84  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Rajan,

many thanks for putting this together, especially for really going deep 
into the problem, and trying to sort out the messy ID scheme that 
Allwinner employs here.

Jumping straight to the questions you asked below:

On 11/5/26 05:40, Rajan Yadav via B4 Relay wrote:
> Andre asked [1], in his review of my A100 thermal trips patch [2], to
> look at the A133 speed bin selection and OPPs. Mainline treats the A133
> as an A100: it reads only the CPU bin field and picks one of three A100
> voltage tables. The vendor BSP for this family (sun50iw10, KickPi A133
> Linux SDK, linux-4.9) picks one of 11 grades from the chip marking ID,

[ ... ]>
> Questions:
> 
> 1. 1.6 GHz. Andre mentioned the nominal 1.6 GHz OPP. The SDK's code
>     and table select b2 for this chip and stop at 1512 MHz. The factory
>     kernel on this board (built January 2026) has a newer table: there
>     1608 MHz exists only for b0 and b1, the revision A-E high speed
>     grades, at the same voltage as their 1512 MHz OPP (1.18 V and
>     1.13 V), and 1416 MHz is added for a0-a2. That kernel selects b0 for
>     this revision F chip; its boot log suggests that its cpufreq code
>     does not read the revision (the revision is first read about 110 s
>     after boot). With the series' rules this board stays b2, so adding
>     1608 MHz for b0/b1 would not change it, and I have no revision A-E
>     part to test. With the b0 voltages forced by a test DTB (6.18), the
>     K5C was stable for an hour but sat at the 90 C trip, cycling between
>     1416 and 1608 MHz, with less than 1% more work than b2. The A133
>     datasheet says 1.6 GHz in V1.1 and 1.5 GHz in V1.5. Should 1608 MHz
>     be added for speed6/7 (b0/b1), as in the factory table?

So I read about the 1.6GHz somewhere, might just be a marketing claim 
about some max frequency. If the common speedbins do not support 1.6GHz, 
that's fine, but apparently some do, so I'd keep them in, for people who 
happen to have those SoC revisions.

> 2. A100. The BSP uses the same rules for the A100, and the mainline A100
>     table has the a0-a2 voltages, but at 1080 MHz where the BSP has
>     1008 MHz. U-Boot starts the CPU at 1008 MHz, so mainline now logs
>     "unlisted initial frequency". Should the A100 table move to
>     1008 MHz too, or the A100 board to the new compatible? I can only
>     test an A133.

I don't think we have ever seen A100s in the wild really, reportedly 
they got phased out very early in favour of the better performing A133. 
A100 is just used as a name because it was the only name back then when 
support was upstreamed, and in the kernel we tend to not care too much 
about vendors' marketing and naming strategies too much ... ;-)
I think if we can be sure that the current mainline OPPs still apply 
with this series, that's good enough.

Regarding 1008 MHz: This was just some frequency close to 1GHz picked by 
U-Boot, that should be low enough to not cause any trouble, even with 
the default voltage. How critical is this "unlisted initial frequency" 
message? If it causes trouble, we can add a made-up 1008MHz OPP with 
some safe voltage, otherwise I'd say we just leave it.

 > 3. SOC_ID. Would you rather have the driver read the revision from> 
   SYSCON+0x24 itself (the system controller is already in the DT)?
>     Then it would not depend on the firmware, and parts would never run
>     below the vendor voltage for lack of it. And do the Teclast P80 and
>     the Helperboard run a TF-A with SOC_ID?

We simply do not support non-mainline firmware, both TF-A and U-Boot, 
with a mainline kernel. For older SoCs they were just not compatible, 
but I don't know about the exact situation with newer parts.
So like for the H616, please just use the SoC ID call, that's a clean 
solution. Maybe just make sure that it can fail somewhat gracefully 
(read: not crash).

> 4. A133P. My SDK has no A133P data, and Andre expects it to go
>     higher. An A133P whose marking ID is in the BSP's high speed list
>     gets b grades with A133 voltages; otherwise it gets a grades (at
>     most 1464 MHz). If someone has a newer BSP (5.4) with A133P tables
>     and marking IDs, I can add them.

I have just read that the "P" allegedly stands for "performance", and 
this it can clock up to 1.8 GHz. So again, just use what the BSP OPP 
table tells us. We are in no position to qualify enough parts to make 
such a decision. And we can always extend the table later should new 
data appear.
I think some of those handheld gaming consoles use the A133P variant? 
Maybe there are some tables in "their" source code?

> 5. Testing. Patch 6 changes the Helperboard A133, Liontron H-A133L and
>     Teclast P80, which I cannot test. A boot log with
>     dyndbg="file sun50i-cpufreq-nvmem.c +p" on the kernel command line,
>     and the contents of
>     /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies,
>     from those boards would be very welcome; no fuse dump is needed. On
>     the P80 (secure boot), could someone also check SID bytes 0-1 (the
>     marking ID)? If they read as 0 from Linux, a high speed part is
>     treated as a normal one: it gets 1464 MHz instead of 1416 and
>     1512 MHz and, if its bin extension bit is set, up to 20 mV less than
>     its b grade would give.

Thanks, I will try to get those logs, I have the Liontron board and the 
Teclast tablet.

Thanks,
Andre

P.S. Since you mention the KickPi: can you please work with Paul (in 
CC:) to upstream the DT for this board? Seems to be one of the more sane 
and available devices with this SoC. I think Paul has plans to submit 
DTs upstream, but I guess he will be happy to have taken some load off 
his chest on this.

