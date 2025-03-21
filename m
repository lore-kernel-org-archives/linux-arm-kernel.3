Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85575C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 10:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68U2xOJN0FdMowzUkCY1aIhi5big7bilZhbRnPyI3bA=; b=ueFJRWzmo5fjWtp5nOnFIMgzuh
	GcsgLMkUuXkxe88lhPIBmriUYpMWDCwcvt8EBLJJEbtOWvPWWSxP5qatMsecPhyNwHBw8Osn3rJ93
	tdZCsguWBXo5autds1YZkZn8MFrUBDV5mdBFK6UKprKktb4G9qdlSKuy39bXEESXfoMNzwqb9Ss74
	wOJ4hZPFiUizEKdsqVhxOxA5YeO67ySsK0xsEv91b6HEJw73TDGrhieZiId9+2ix1lOhnR9cyGPOn
	+1Pbe1eDsaaxk24VJV/roqenhHxyNAr9Hgr5rV9xU0qZq9q9VvLSxgNADxWuHkK/HLHcgXHtPEfOc
	cvufm+pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZtR-0000000EZF0-3Bii;
	Fri, 21 Mar 2025 10:46:25 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZpW-0000000EYr8-0aMr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 10:42:23 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B4292114010D;
	Fri, 21 Mar 2025 06:42:20 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Fri, 21 Mar 2025 06:42:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742553740;
	 x=1742640140; bh=68U2xOJN0FdMowzUkCY1aIhi5big7bilZhbRnPyI3bA=; b=
	XjnjdZcg53TQoWY6DbowpGSf6Ma4/nsFtY8lkgM2pEJsZCUXCKKwcIm7QdV7M4Bf
	2yM/xCCXpwT3VCW/Nf9a/BX5QIhRI8DG6QFz0DYU5i+JJjSMcsuSwvkAiL2im1/B
	QUptqhaFFJMriuw9uGO3DvCvSVZBNlMR98m+YkVFJqKLF4NvSZBKjcgEnRsAB/tQ
	GA+u373L0rT8LwfZDfN7IoF8Ae7CpZXBhKthdAo373/RsGSTPT+8lljNoe/2pxZW
	qmLXa/EfmC/hpqNMa2nvBUIZRSnZ5Ij5kEXUNkbgs9aVIg6/D2HQSrEvWZgqjqP+
	354rucCqNwBj7TNoacjEgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742553740; x=
	1742640140; bh=68U2xOJN0FdMowzUkCY1aIhi5big7bilZhbRnPyI3bA=; b=g
	gxomf2o2Tzd8VqwlKhcjQellV0+NwxdKBaE8avhS5rYKhDZa0Ghdtmqk737JgchC
	hOzMB+Mqa0XBnoWrLhvB0iXiVdTvFODyXMi+zZ5OxvSZsWps8Rq108K4//zyzO3F
	eiH70PU+qr5b18HI0fxDKjhdm62raRMh4jNwz3AVz/jG02/G7Cv9xMLW7yqji8/T
	M859M1V666xCrodf5rK91YQJ80iJENomW9W1LIJu/CiZ2+CIjNqJeK63099zJU0c
	UY2kzKmZ00WbGH31yXB8ARjAJq3PjPWLO0lP8GRVoY/h4fpdMiu25xlhdEhALANe
	CUAEDcYfu4f6wfHRj291w==
X-ME-Sender: <xms:jELdZ3Qub_8dm9XOH3yQjxa06hPdPSXZkUYGDPZhLOyeo-2A6Nk_Yw>
    <xme:jELdZ4wb-VhBLRDtRTQgYrx28aExpsmKbLRcj1mPXYv6xEC-Nt5etqa7R-KnIBLPi
    Nq4Z6LCF6f0-9-qB_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedtkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    kedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomh
    dprhgtphhtthhopegrrhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrggsvghl
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkh
    drohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdr
    ihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehovgdqkhgsuhhilhguqdgrlhhlse
    hlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepghhlrghusghithiisehphhih
    shhikhdrfhhuqdgsvghrlhhinhdruggvpdhrtghpthhtoheplhhinhhugidqshhhsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:jELdZ83aQHV9LtOryKkIY-LnH0PwTwyEk09Enz43tjsIsJiEDDKD8w>
    <xmx:jELdZ3DDEPGE55RY2nfpDjDUc_c3w6BK6D87xaXuBcNEG6F60073Fg>
    <xmx:jELdZwibPTszLGO-UHzIzm2F1Ncl2_meCfYni2K7DYg2cqM7epW0cQ>
    <xmx:jELdZ7rOyu6iqfshT38zNgtCmoZfQTkaiFvSUeK8RI94N64sk42t-Q>
    <xmx:jELdZ8igUHd-95sRvIhWoI_NxZI-x8VCjyjdp2II0S9JiCsqKfZLABYb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3C61E2220072; Fri, 21 Mar 2025 06:42:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tcf25c5c4b21ac15d
Date: Fri, 21 Mar 2025 11:41:59 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "kernel test robot" <lkp@intel.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm <arm@kernel.org>, linux-sh@vger.kernel.org,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>
Message-Id: <86813d50-d4c2-4220-a5a8-2a264b37f7d4@app.fastmail.com>
In-Reply-To: <CAMuHMdUeynpmUUmZPViEBttANFmEhpjFn0wqNc1wQB6wRbd0rQ@mail.gmail.com>
References: <202503211029.DnQpqsJs-lkp@intel.com>
 <927105f8-4aa8-4579-ac2e-bce4bce12b1e@app.fastmail.com>
 <CAMuHMdUeynpmUUmZPViEBttANFmEhpjFn0wqNc1wQB6wRbd0rQ@mail.gmail.com>
Subject: Re: [soc:soc/drivers 20/24] ERROR: modpost: "__ffsdi2"
 [drivers/platform/cznic/turris-omnia-mcu.ko] undefined!
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_034222_245698_0C796D5B 
X-CRM114-Status: GOOD (  15.24  )
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

On Fri, Mar 21, 2025, at 10:36, Geert Uytterhoeven wrote:
>> >
>> > ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
>
> Bug in driver (must not use __delay() directly).
>
>> > ERROR: modpost: "devm_of_clk_add_hw_provider"
>> > [drivers/media/i2c/tc358746.ko] undefined!
>> > ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko]
>> > undefined!
>> > ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko]
>> > undefined!
>
> Missing dependencies for driver.

Agreed, but both of these only break the build on sh because
the architecture code is different from the others. It's obviously
best to fix these in the drivers, I just wouldn't expect the
driver maintainers to care unless someone sends them a patch/

>> >>> ERROR: modpost: "__ffsdi2" [drivers/platform/cznic/turris-omnia-mcu.ko] undefined!
>>
>> This comes from __bf_shf(spec) in omnia_mcu_request_irq().
>>
>> As far as I can tell, this is not your problem but in the
>> SH architecture missing one of the libgcc functions that are
>> called by gcc.
>>
>> Since this is only for compile-testing sh allmodconfig, and
>> that is already broken because of other bugs, I'm not going
>> to care either.
>>
>> Adding the linux-sh list to Cc, it would be nice to get a clean
>> build again. All four problems should be trivial to address,
>> and some of these have been broken for many years.
>
> So one SH-specific issue to fix...

There is also the missing clone3 syscall that has been
causing a warning for many years.

      Arnd

