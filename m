Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EEACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 20:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f21DJ6iYS1AxepjbbwpyUgIz1EeYo2MNWy5iIbDBSNA=; b=xrG43jieHTI6d/Uh7MId/Es3YM
	oeifnAEc6uKjhIQb44OnmwPDiEOr11WRZjEcBeZNv95OtN22TWeU9kWPD2Sw9uPzpR0TGG/BaKiwX
	Ljxa1ljv7iuc5pvuQVTPbINmTaY4G1IX7Aq/3T9GmDQqIDU7yYNeUpskuFmetl1RBFvknNb30ZUz9
	PlCnvl+qH701vulxfRGoMGSDDbSiU8cxjpoH3t4U2orKikZHCzr2+MWw8zOCvV3300CFpKAlwCe+P
	uuL8Tz84oaLVyypubrMjCoHyYXQiUqPBMGrNLsTMEAdPwIsZo8ji5LZnl7eqarQLkquIakFlm93X4
	S6xFGOfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nB9-0000000BSPm-139D;
	Mon, 22 Sep 2025 20:30:31 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nB5-0000000BSPH-43UM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 20:30:29 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B78311400195;
	Mon, 22 Sep 2025 16:30:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 22 Sep 2025 16:30:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsdio.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1758573024;
	 x=1758659424; bh=f21DJ6iYS1AxepjbbwpyUgIz1EeYo2MNWy5iIbDBSNA=; b=
	nyo6oT3TzFlY5I0WXnpyAEAGvwZ7yrOX381aUcW9MCrYjV1HUsv9GNg3x9EVY5/Y
	QWL6QAHCBzf4jqps7hUL3qLz08wWgu5L9PApxBmv5Nq2GjC2S9Mw32eH7y5FSsrL
	mfMy+vxc2HGCVhIXq5c7ufejrBWddxrhN7H/vmBJ6lIfF2d29hXEE4guxmCGb6O2
	tAN9UZB/6gYpk3kLx+AOh7wcP9SFQxEWxTgBKNMOYxfIg694Z2HsKPnMoL+Ll5Xv
	wA9u54MFXg7WqqinMg3l/QI9rhMTX1kA1HkQpcYjsI1CL34LwrH+rbI6Q/DcrN91
	PsPP3aIPgrWohrbWxj925w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758573024; x=
	1758659424; bh=f21DJ6iYS1AxepjbbwpyUgIz1EeYo2MNWy5iIbDBSNA=; b=U
	/yyLiv+pWD3PyJ3colP+XRK6MtW9++tb2sQ00VzQVnQg92g9ccest3ombaG+YE9Z
	Krp5L8hUTSwwYZBpJHra0KTIURfdnOoyX97uyApKmoZpR+6I9N3SkjCLej4/U4LK
	W27W/vuevB1bUNXLn79QfBKen7v8V4DZpm0g34qjTPm4Th2j7O3z714F5uVU9yol
	YAOQTQVGV2eFRnFHuR0t+gdIMGUv+R5x9d/FkA6uAN01QUeF4gXdInta6cHiDpUO
	hmWokA3rolCedc/plYPHvqBVG/la2lgP/LZNJurANuWShYf7RfoIoqu2BtqcwujY
	ZqmsIN51rVyGYb1xe6s3g==
X-ME-Sender: <xms:37HRaIwsafr6gF3kyW0TLuRr05Zet02ihsvoDiCsstmJ3xvHKBm5hQ>
    <xme:37HRaIKSwoxwHK11CbSILFjipTABJQ4lz85Fs-wSsrqBypGmoJEqed1pxua3eIG4x
    RWTyUIAPiBNQ6FvK89blT_-RMo88N3Ez91tGliBzaMVDccw0QqEklnX>
X-ME-Received: <xmr:37HRaHVIHFrvchhMAVw8xJPWG_KL1xYPiWSMNivnGnuUo4hlX_T7MeUbQC7yDEsqLf51VWu0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehkeekudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptfgvsggvtggt
    rgcuvehrrghnuceorhgvsggvtggtrgessghsughiohdrtghomheqnecuggftrfgrthhtvg
    hrnheplefhgeevleehieeuveduudfguedtieetteevhffgfffhhffhveffueegtdegkeek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgvsg
    gvtggtrgessghsughiohdrtghomhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopeiivghvsegsvgifihhluggvrhgsvggvshhtrdhnvghtpd
    hrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdo
    ughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhrtghpthhtohep
    rghnughrvgifsegtohguvggtohhnshhtrhhutghtrdgtohhmrdgruhdprhgtphhtthhope
    guvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdgrshhpvggvugeslhhishhtshdrohiilhgrsghsrdho
    rhhg
X-ME-Proxy: <xmx:37HRaLZiMcZINQDA-uN_LIPEmV_2dg0aaXPTlLUgkpr3xZ7YeQEAKA>
    <xmx:37HRaOzEz13wT_YWvqqDiFluHmxDfIwe9y7cAe2MqgagHS8kgzgsSw>
    <xmx:37HRaL0doQA-z0ua5-aE69gyuEoO6O8YFf-A-gIHr5jrgYcwcxbgVA>
    <xmx:37HRaPkNGJxoOUR2aaf1rlJRRsI-G33G6vzTzi4gAB_GkHccQ5D49Q>
    <xmx:4LHRaF988bm42vHCFUaajGuBKhBjIO4Bn-IfDrAeVWs788Ar0EZuBfyb>
Feedback-ID: i5b994698:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Sep 2025 16:30:22 -0400 (EDT)
Message-ID: <354c5977-2bab-446f-9ae0-b01d678fd74f@bsdio.com>
Date: Mon, 22 Sep 2025 14:30:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: add device tree for ASRock Rack
 ALTRAD8 BMC
To: Zev Weiss <zev@bewilderbeest.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250917180428.810751-1-rebecca@bsdio.com>
 <20250917180428.810751-3-rebecca@bsdio.com>
 <66c5bf80-a3ef-4984-82ce-6d1720b15d38@hatter.bewilderbeest.net>
Content-Language: en-US
From: Rebecca Cran <rebecca@bsdio.com>
In-Reply-To: <66c5bf80-a3ef-4984-82ce-6d1720b15d38@hatter.bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_133028_224815_D08AD2D1 
X-CRM114-Status: GOOD (  21.88  )
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

On 9/22/25 00:29, Zev Weiss wrote:
> Here and on most of the other i2c busses, is there a particular reason 
> we want this bus-frequency explicitly specified?  100kHz is the 
> default according to 
> Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml (and the other 
> existing aspeed-bmc-asrock-*.dts files leave it at that implicit 
> default, FWIW).

There's no particular reason - I've deleted them.

> It looks like this device only monitors temperatures?  If so, perhaps 
> temperature-sensor@29 would be a slightly more appropriate node name.

The chip can also monitor power supply voltages and fan speeds but on 
this board it's only used as a temperature sensor, so I'll change the 
node name.

> channel@1 and channel@2 block bodies look over-indented by one level 
> here.

Thanks - fixed.

> Are these correct?  On every other ASRock board I've dealt with, the 
> eth0 address is at 0x3f80 and eth1 is at 0x3f88.
>
> If so and they are really for some reason swapped on this platform, as 
> a slight nitpick I might suggest swapping the order the nodes are 
> listed in so they go in order of increasing addresses.

After installing the latest 3.06 BMC firmware from the ASRock website, 
I'm seeing:

root@altrad8ud-1l2t:~# ifconfig
eth0      Link encap:Ethernet  HWaddr 9C:6B:00:43:0B:F7
           inet addr:10.0.0.25  Bcast:10.0.0.255 Mask:255.255.255.0
           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
           RX packets:457 errors:0 dropped:0 overruns:0 frame:0
           TX packets:240 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:1000
           RX bytes:88379 (86.3 KiB)  TX bytes:17663 (17.2 KiB)
           Interrupt:26

eth1      Link encap:Ethernet  HWaddr 9C:6B:00:43:0B:BD
           inet addr:10.0.0.11  Bcast:10.0.0.255 Mask:255.255.255.0
           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
           RX packets:368 errors:0 dropped:0 overruns:0 frame:0
           TX packets:26 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:1000
           RX bytes:88134 (86.0 KiB)  TX bytes:3507 (3.4 KiB)
           Interrupt:27

lo        Link encap:Local Loopback
           inet addr:127.0.0.1  Mask:255.0.0.0
           inet6 addr: ::1/128 Scope:Host
           UP LOOPBACK RUNNING  MTU:65536  Metric:1
           RX packets:434 errors:0 dropped:0 overruns:0 frame:0
           TX packets:434 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:1000
           RX bytes:34479 (33.6 KiB)  TX bytes:34479 (33.6 KiB)

usb0      Link encap:Ethernet  HWaddr 4E:F6:84:8E:63:B9
           inet addr:169.254.0.17  Bcast:169.254.255.255 Mask:255.255.0.0
           UP BROADCAST MULTICAST  MTU:1500  Metric:1
           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:1000
           RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

root@altrad8ud-1l2t:~# hexdump -C /sys/bus/i2c/devices/7-0057/eeprom
...
*
00003f80  9c 6b 00 43 0b bd ff ff  9c 6b 00 43 0b f7 ff ff 
|.k.C.....k.C....|
00003f90  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff 
|................|
*
00003fd0  1e 90 db 9a 13 ff cb ff  4e f6 84 8e 63 b9 8e ff 
|........N...c...|
00003fe0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff 
|................|
*
00004000


I don't know why they're swapped, but I think keeping them that way 
makes sense to avoid people's IP address changing.

> As the DTBS_CHECK lint reported and Andrew Jeffery commented on, these 
> two partitions overlapping is a bit surprising -- is that intentional?

It was intentional since I've updated the firmware update script to be 
able to program the TF-A or UEFI areas separately, or the entire code 
region (i.e. TF-A _and_ UEFI, excluding the data/configuration areas of 
the EEPROM). But I'll update the script to not depend on there being a 
'code' partition that covers both areas.


-- 

Rebecca Cran


