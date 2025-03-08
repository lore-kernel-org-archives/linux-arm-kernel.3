Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAAFC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 21:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W4poDmOA64pY4uvHZcOCt8hPoavx9e3hXSZvtxdXHKk=; b=dfCcCoB/Rejcw4udW5bvojf05T
	6nz/FfVnZFhN617MOjm8KuYVF9jE43jpHmi8yVGbEeJ4x4DKo5mcwl4yxclktwsjwo9rXpr1M4czt
	uxSaOO4GWf/NOCqPCXCWngOSjXhNmlES664t11kCtlnNOtSRZ0LVJQ5qV9UUg0PZY+V1CvUOmCR09
	TlGESe1s+crPNHIssCXN20/6wdhkEeL/NBHIgILKDjeWPYoclCaiIpA9e4EIGM0xV6z5Sw3NEZ2AP
	hGGhe5rmEt45e98SCwbfr10xqj936da8rf392v9hujKmNHHUiBLnnfx8sQkOja6uU5LwEcFy4h8Uc
	FFoHbBzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tr1ON-0000000HBZi-3IJa;
	Sat, 08 Mar 2025 21:07:31 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tr1Mk-0000000HBTI-1CBs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 21:05:51 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailflow.phl.internal (Postfix) with ESMTP id DE8FE2017E6;
	Sat,  8 Mar 2025 16:05:46 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Sat, 08 Mar 2025 16:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1741467946;
	 x=1741475146; bh=W4poDmOA64pY4uvHZcOCt8hPoavx9e3hXSZvtxdXHKk=; b=
	PbjaYFSX9IBx2Zrs40HbC9+xW+mfnGRXkjrLnF/lmBTxXHH5vogiHSSOspqIeun1
	NHfBh6H00r3dQfPeg/5Np/6Z9XnSuH0FKD+DR2HubpiuMGQ/cIlXZj4R8B8ROhDL
	goKIgFL/GsoFSOene+PO+8yhXJyNpaw+RIaTc2mAtJJGV6CjknGC9TlrbTxPTF9X
	pWcsaTZU3KhhEbiIyNbOPqhcecuUGjnfGnDJ2dWkoU+YL+V5DIIga1Rn2j0Bl5qL
	u59YI9TE/OHE24iRU+89XEMwS2VxZLS7RtbtY5u5kVRUVTePTpxwefPCm6nJdU9/
	et5ORwsXOuqEk213wxjyfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741467946; x=
	1741475146; bh=W4poDmOA64pY4uvHZcOCt8hPoavx9e3hXSZvtxdXHKk=; b=2
	k09chLWM/lSt9ok/EPaPM1tR7eBje/kIsmlJQe/3mXR56QFqC9W69F7BHwDF0fGM
	kODKlY76T3e9H8oa0C+vm3AnKrYBg4EHOFO+NeDTv9i2LVhrbDe+4On1enx+SXkf
	jCuY+jGWCb7dq6bVKRic6ilsWWRffPxqNl3G4H3ZyFTFR5vG3CC93kYg0GtIJREx
	i7ppS1ZpZObOXtg1acJC8U8r4gnYj7l+dkuLnVJPKp/LgM21hZnVKFd/s3wHJv+C
	oYUKaTLoubtPOBBZsxqlbvftF3FJJh5RQfjk0WIAx3lkCwrtVye9WojKDgsaWm8w
	eqXtQNTKoXuDuJ4eq/jTA==
X-ME-Sender: <xms:KrHMZwqQWf1vmDRRZmKYix9_AvEX71hk9A5-PUg-mMHoqyGuX43GTw>
    <xme:KrHMZ2psuRMKaam0ybx-JZLEC1a7vUGqphSu1hLVSUR3YOE3xwz-daI2PPjxwEq4X
    bngyXPelqUm1rvI9Vg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudegheekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    gedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghp
    thhtohepjhhovgihrdhgohhulhihsegrrhhmrdgtohhmpdhrtghpthhtohepmhgrrhhkrd
    hruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohepshhuuggvvghprdhhohhllhgr
    segrrhhmrdgtohhmpdhrtghpthhtohepshhuiihukhhirdhpohhulhhoshgvsegrrhhmrd
    gtohhmpdhrtghpthhtohepsghhvghlghgrrghssehgohhoghhlvgdrtghomhdprhgtphht
    thhopeihuhiivghnghhhuhhisehhuhgrfigvihdrtghomhdprhgtphhtthhopegtohhnoh
    hrodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:KrHMZ1O9ctL676w5AHUIxE0SC1uXzVCBMq5d4oaLxLgUSw773mfxVg>
    <xmx:KrHMZ36aWng3VojtFfg9JWrEIO2NAAnLf-1dP-OHoquiOYe6lO0u_Q>
    <xmx:KrHMZ_6_zJEf_V0pq87wzL4JG8U2CRExCG9veX074cbH5tYyr-yvvg>
    <xmx:KrHMZ3iPusvaeexA7SSSlwDrRNP8bOUuPa3aybP_Ilx1k2AiNrnRHA>
    <xmx:KrHMZxAOYkkYPw5ZnbYA_W8w8hNAHsxDFHKJb1ECP7qxkoZka0El8mlf>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E676A2220072; Sat,  8 Mar 2025 16:05:45 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 08 Mar 2025 22:05:24 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Roman Kisel" <romank@linux.microsoft.com>, bhelgaas@google.com,
 "Borislav Petkov" <bp@alien8.de>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Dexuan Cui" <decui@microsoft.com>,
 "Haiyang Zhang" <haiyangz@microsoft.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Joey Gouly" <joey.gouly@arm.com>,
 krzk+dt@kernel.org, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, "Len Brown" <lenb@kernel.org>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Marc Zyngier" <maz@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>,
 "Oliver Upton" <oliver.upton@linux.dev>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Rob Herring" <robh@kernel.org>, ssengar@linux.microsoft.com,
 "Sudeep Holla" <sudeep.holla@arm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Wei Liu" <wei.liu@kernel.org>,
 "Will Deacon" <will@kernel.org>, "Zenghui Yu" <yuzenghui@huawei.com>,
 devicetree@vger.kernel.org, kvmarm@lists.linux.dev,
 linux-acpi@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org
Cc: apais@microsoft.com, benhill@microsoft.com, bperkins@microsoft.com,
 sunilmut@microsoft.com
Message-Id: <e0f81049-688e-4f53-a002-5d246281bf8d@app.fastmail.com>
In-Reply-To: <20250307220304.247725-4-romank@linux.microsoft.com>
References: <20250307220304.247725-1-romank@linux.microsoft.com>
 <20250307220304.247725-4-romank@linux.microsoft.com>
Subject: Re: [PATCH hyperv-next v5 03/11] Drivers: hv: Enable VTL mode for arm64
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_130550_602616_1C52B5B8 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

On Fri, Mar 7, 2025, at 23:02, Roman Kisel wrote:
> @@ -5,18 +5,20 @@ menu "Microsoft Hyper-V guest support"
>  config HYPERV
>  	tristate "Microsoft Hyper-V client drivers"
>  	depends on (X86 && X86_LOCAL_APIC && HYPERVISOR_GUEST) \
> -		|| (ACPI && ARM64 && !CPU_BIG_ENDIAN)
> +		|| (ARM64 && !CPU_BIG_ENDIAN)
> +	depends on (ACPI || HYPERV_VTL_MODE)
>  	select PARAVIRT
>  	select X86_HV_CALLBACK_VECTOR if X86
> -	select OF_EARLY_FLATTREE if OF
>  	help
>  	  Select this option to run Linux as a Hyper-V client operating
>  	  system.
> 
>  config HYPERV_VTL_MODE
>  	bool "Enable Linux to boot in VTL context"
> -	depends on X86_64 && HYPERV
> +	depends on (X86_64 || ARM64)
>  	depends on SMP
> +	select OF_EARLY_FLATTREE
> +	select OF
>  	default n
>  	help

Having the dependency below the top-level Kconfig entry feels a little
counterintuitive. You could flip that back as it was before by doing

      select HYPERV_VTL_MODE if !ACPI
      depends on ACPI || SMP

in the HYPERV option, leaving the dependency on HYPERV in
HYPERV_VTL_MODE.

Is OF_EARLY_FLATTREE actually needed on x86?

      Arnd

