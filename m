Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD26C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 06:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NJuwD59cIzb4Af+tlSAfPPA3lFxGUeAX1fygvbn4iY=; b=NWqwfnqIqZfyCvNOKceZe+mfF8
	5Sk8dum9JvZqa8+P6pEmYsJUomFT+droB0Txx8M9XCt0P1/fbbZ1TmVSWf0DiadSkQBu+z4TLNFO1
	DUHIp0XVT4B2Np4DZCrIfSAQoE69Kw35EVlFchI+1XVOz+5lMAuRMnrlxa5wsYVSTWMKl1o6R90c3
	GLI4SoD8rRxALVrT+oTaylIC+MHibnK8k1u90SesdATBszKWWwOiUBewCOC81HpTPsFlAe2M+CCN+
	rxM1A3nDEBER867uvpIY2RqyIARMvlnWlwbO0B8ZuZ5eVDK3N0KPidBqMA1iW6Y9opLC1Bqr6RRV+
	6vfE5y3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti6h2-00000006Qj6-2sLy;
	Wed, 12 Feb 2025 06:57:56 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti6eP-00000006QMW-0lH8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 06:55:14 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B05AE25401C7;
	Wed, 12 Feb 2025 01:55:10 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-10.internal (MEProxy); Wed, 12 Feb 2025 01:55:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1739343310;
	 x=1739429710; bh=5NJuwD59cIzb4Af+tlSAfPPA3lFxGUeAX1fygvbn4iY=; b=
	PTBtnGr1VGKL6GzZtS+f8euXR5URncpa2RCMq8nsApxHnYPt57OogC2J63cPOmVp
	2k+9i0nPJX9TEl8G/ZiP5h0yOQa1xu4qw51VbAJXQ1Wu8u7Bj6+jfU4uhvuysesI
	727d0E+HYkerv7Q81K6OVeWVKY2PC5ZIkoPaQjKjbNaSLv7NBUcBXeJRPEEpE8YF
	EuEpv2KYEWStwFIxKHE8LT5EIQefwIJPPwF49NzWR3uOX+uhHR12Qo2NqK7BofE8
	wktQY9797xenfrmWwA/Dw0y55q/mksw5t6JoP+WmFbV85NR5v+6Fj4eJBc+6H20o
	LGiVuXrdnfhBpNnYJcUMmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739343310; x=
	1739429710; bh=5NJuwD59cIzb4Af+tlSAfPPA3lFxGUeAX1fygvbn4iY=; b=b
	J6uMQOP/ZjuxxmWkQIK/wR5R+AhoSeFUoSNOWsZzWewkE4rnAMUCcIg8zqpZRjHJ
	nGLLIp2cNmlOq1h6sUNv9NB6+IzFOlo1uXWlidbtxEYBg52BUHXNmOXIkyitDuB8
	9nCxaEdjfsi3NwVUloaG9rgHpE3Tdyo014H+7DbWsx+0rrMOWA3gGO20tBVOVOxp
	ps/42VI1Y/a1mrMOLuQvfdoL3gpdJ3MflO3ZU2LiCB7s6tMtCOr3u6knY3aQ5nWD
	f3QA8Em5/hFCO+ky7i8BidC4O7fF8B5NbxtNf2C4Hn2CI+K5W8IlRtvvzDM0RzVO
	ioSidDQLPdVwFaugH5+YA==
X-ME-Sender: <xms:zEWsZ-AdUSE0llP3YTj9D_riPe38n4a8-S846_dSLESMca6szqvpNg>
    <xme:zEWsZ4gU1yIJxHIJeThH9z34fLnj_gt02NgXQkvFSXtLXizKP1gKzqDDzMVdF8B47
    0qSaRi6DBavpwQ2G_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegfedvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeef
    tddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpd
    hrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphht
    thhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheptghonhhorh
    doughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlphhivghrrghlihhsiheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghirdhl
    ihhusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:zEWsZxlGxubx8akHImGwweAAVqHfLj02gdt0HRtm0QHmJkREYeDxiQ>
    <xmx:zEWsZ8y6VffcBHiAZMvEZNsvNcFZccVRAilv2Eq-q5RxDp3G1YVHHg>
    <xmx:zEWsZzSVp61Hd4Hv4zNOoukfTc36UKdf69WP_ZovMFngikNyV4DEZg>
    <xmx:zEWsZ3bbPaWbsC8kxvmjxEPz_x3XcG5--tH23KnFwo_f3H8rsUPBXg>
    <xmx:zkWsZ3KHhotJDpG9j-OOWPYElTXm-Qj6unZyqYe1db0466EDl8xDRZnQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6A02E1C20066; Wed, 12 Feb 2025 01:55:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 12 Feb 2025 07:54:47 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Roman Kisel" <romank@linux.microsoft.com>, bhelgaas@google.com,
 "Borislav Petkov" <bp@alien8.de>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Dexuan Cui" <decui@microsoft.com>,
 "Haiyang Zhang" <haiyangz@microsoft.com>,
 "H. Peter Anvin" <hpa@zytor.com>, krzk+dt@kernel.org,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Rob Herring" <robh@kernel.org>,
 ssengar@linux.microsoft.com, "Thomas Gleixner" <tglx@linutronix.de>,
 "Wei Liu" <wei.liu@kernel.org>, "Will Deacon" <will@kernel.org>,
 devicetree@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org
Cc: benhill@microsoft.com, bperkins@microsoft.com, sunilmut@microsoft.com
Message-Id: <1b14e3de-4d3e-420c-819c-31ffb2d448bd@app.fastmail.com>
In-Reply-To: <20250212014321.1108840-2-romank@linux.microsoft.com>
References: <20250212014321.1108840-1-romank@linux.microsoft.com>
 <20250212014321.1108840-2-romank@linux.microsoft.com>
Subject: Re: [PATCH hyperv-next v4 1/6] arm64: hyperv: Use SMCCC to detect hypervisor
 presence
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_225513_287761_F694AD33 
X-CRM114-Status: GOOD (  12.08  )
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

On Wed, Feb 12, 2025, at 02:43, Roman Kisel wrote:
> +static bool hyperv_detect_via_smccc(void)
> +{
> +	struct arm_smccc_res res = {};
> +
> +	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_HVC)
> +		return false;
> +	arm_smccc_1_1_hvc(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
> +	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
> +		return false;
> +
> +	return res.a0 == ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_0 &&
> +		res.a1 == ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_1 &&
> +		res.a2 == ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_2 &&
> +		res.a3 == ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_3;
> +}

I had to double-check that this function is safe to call on
other hypervisors, at least when they follow the smccc spec.

Seeing that we have the same helper function checking for
ARM_SMCCC_VENDOR_HYP_UID_KVM_REG_* and there was another
patch set adding a copy for gunyah, I wonder if we can
put this into a drivers/firmware/smccc/smccc.c directly
the same way we handle soc_id, and make it return a uuid_t,
or perhaps take a constant uuid_t to compare against.

      Arnd

