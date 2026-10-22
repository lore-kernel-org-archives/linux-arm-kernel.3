Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FDF606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 07:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zWccb+3/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GewONFtE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ByBpVD7FPTufElpNoOF6mqXMOL+Kv6Ik0YaJGkEPtg=; b=zWccb+3/guF3plZ6UTaBbSIpsa
	kSGMtjX4RKUWT/qh+drh/Wddg9AB3y7QEO244lM+GVTeabDb+MwTUSs99+MbJCHnvR2PFSLKUsoxV
	R3HSBv1fqtrzIqFsFkcgcwdoNVyF0kPbCWjyz8D3D/cXrPnAgsMZKV6RoQScS8oABafhWQ5xzartG
	kSHB5MN9PQ2b0yahP1nuch0PL/8eEC6nlkbmeel3yc/P1ACCuAL6YwWB2dYN85wwu4u9kWPV+gQlk
	2P7y+ga9XNP7FpOEPu0I7ViiP2zAI/I+hWLN2NRbadkF/WPQ/CEaD19dRm8fhm6tswGX3zbUkUUWU
	RHrc8nBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmqa-0000000DX7N-3QOf;
	Thu, 22 Oct 2026 07:04:20 +0000
Received: from mail-pj2-x02.google.com ([2607:f8b0:4864:39::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmqY-0000000DX6a-1Tt1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 07:04:19 +0000
Received: by mail-pj2-x02.google.com with SMTP id d9443c01a7336-2e876f468e5so5077615ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 00:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792652657; x=1793257457; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ByBpVD7FPTufElpNoOF6mqXMOL+Kv6Ik0YaJGkEPtg=;
        b=GewONFtEPkfPZnIRMeU5EnecWvrmzWCSKgScWzyiY80kPdpys4iWqSE22mRL5ReEK1
         KDu6xkgFmjcJgwG5MqgbWov7/fCcZeZmI/Pna/fiXi5tAz4UZ7jjjmUUSibt86Fo/Ol9
         Ewgh0hK50hP3RMVcURUAYWzmzMP4l7G3TY0Vd4L/YXgrrETOA0dPOr5Wnqa6ZcPM9ioL
         h2fPoPsEQlIAmdY87Gi5l5WN6PyOL+Ttfsonbsv/nqMFdqY0UXf6IGj7zoolXsFWvhnK
         fT4MZy6kDvFr3JboDEfMLVpiBjYRJ4DBN2ykjfuafURDhXjGzU3N4pxAAQzd1b+M2jGb
         WWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792652657; x=1793257457;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ByBpVD7FPTufElpNoOF6mqXMOL+Kv6Ik0YaJGkEPtg=;
        b=ISUlFmkvw8pXsWRcwAWGkm+OAaa1/I9g6zBJGcwBRhdSee6osRvxjhuc48gjDsip/T
         SkOTLZfbuKLn1LO1Tc7eUAS+YoHvXQqwwMpmmKzAUA1mhBYcZWMOGlNfJ1qu6B8lFOWK
         wctON69aAYF4gCAWINmN8h1czmkhhJD6Szl4XM/4sYIuv+Hza49PVniS1V2rm8NF53en
         AtNYtUr4p2SXXHKdM57Nmr49gQAYdfkvXBTWi2Le4Zh/+OmEVVr2s+3JwnVCqvAipj5N
         ONAPdfEBN5OwTCWXFjArmqWNs9SmqXvkh6cSP5OCLlO7ApmHzc56bR0F31pZLAj5rcx2
         2LDw==
X-Forwarded-Encrypted: i=1; AKwUvBxUH6JXwNR5XNujMj1ygjzatlxAHgXpJah8eH8mdoh/IObJOxfCa/WMrlsJwpnf0h8WDf5tJPGxlIug0PYLpo+H@lists.infradead.org
X-Gm-Message-State: AFq9FYK/bg8bp9zXrp91cN7lo+cGPNLtsb0eqNBAosRZsb1q5p5iAUz8
	4pSeEa9j9j8UQbl5BO15IoIthYLMqGcGSFxgZVGJVhS8fbC/8Zx+LwYh46kPfrdGRLpR4w==
X-Gm-Gg: AYBFou1ntXqJkfzp4XPUIdgnvIZEQgu2P7YKaJK8J4U/4lzLZbJZSE8LF9whyPEWp7v
	OLCsr6CPmxMUzgscweP6x51kPMae/Hi45H0QkMBAmjLh1hUD5lsZRPb7/hAAAbpeCLme7X8Cd3n
	KkOhK5VYZ0k7NAS/6wOAKn1o0Y5/+cvigRo3ZRnSWGhmk52fnZ0E3SMMfQnQoQRYMvFL/kva1sW
	M+fV6M5SUBYmxTAn/9qoyHfnI4qtPWn4MP/0nfoTKwLTtROOMmwBYXySxMzuXSJVgIOGA3v2piR
	QVqAKZRVJ1iyym1WBsDCjUtvKecJBGilYm+NoLeuj+hN4zJraxni0O579cS7U7CGxXj+8LX42r8
	CWIo1Zjo9MGYEUAGy3oLMWDY2aaM3M5iHm8H9bb0GO21Y/H3jZAokpUXe7M1oodp+FWdoiv68k5
	USip6E09Q+zWp8Vx99iMR2nj/3AIjK095q7d88KN0g4HE/KXVGl5XvxQG9qXgyVuoxN6EHvC28o
	3Xe+e7pdJDPzPfsd+MNm7TfMtvvmWP1Rgl74OI1yYQN3zaP7BzZe5axHerdD7Q=
X-Received: by 2002:a17:902:e947:b0:2e9:9bac:2e84 with SMTP id d9443c01a7336-2ea43d3a8e5mr34417885ad.66.1792652657298;
        Thu, 22 Oct 2026 00:04:17 -0700 (PDT)
Received: from [10.125.112.22] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b43478csm19901295ad.28.2026.10.22.00.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:04:16 -0700 (PDT)
Message-ID: <95f18ef2-8fda-447e-bc64-1732febea363@gmail.com>
Date: Thu, 22 Oct 2026 15:04:02 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/8] kdump: reduce vmcore size and capture time
To: Rob Herring <robh@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>
Cc: baoquan.he@linux.dev, m.szyprowski@samsung.com, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, chenhuacai@kernel.org,
 kernel@xen0n.name, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 saravanak@kernel.org, akpm@linux-foundation.org, pasha.tatashin@soleen.com,
 pratyush@kernel.org, ruirui.yang@linux.dev, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 iommu@lists.linux.dev
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
 <20261021132308.GB3667411-robh@kernel.org>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <20261021132308.GB3667411-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_000418_397798_8C004033 
X-CRM114-Status: GOOD (  16.28  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/21/26 21:23, Rob Herring wrote:
> On Wed, Oct 21, 2026 at 04:30:03PM +0800, Wandun Chen wrote:
>> From: Wandun Chen <chenwandun@lixiang.com>
>>
>> On SoCs that carve out large firmware-owned reserved memory (GPU,
>> camera ISP, ...), kdump currently dumps those carveouts as part of
>> system RAM even though their contents are firmware state that is not
>> useful for kernel crash analysis.
>>
>> ACPI systems already filter reserved memory out of the vmcore through
>> their existing path: firmware reports those carveouts as unusable in
>> the EFI memory map, they get MEMBLOCK_NOMAP set in memblock.memory
>> (is_usable_memory(), efi-init.c), and the ELF header builder has
>> always skipped nomap regions; only DT-based systems currently fail
>> to filter these regions, which is what this series addresses.
>>
>> This series introduces a MEMBLOCK_NODUMP flag (suggested by Rob) in
>> memblock to filter reserved memory on DT-based architectures. A new
>> flag is needed because MEMBLOCK_NOMAP can only express regions without
>> a linear mapping, while MEMBLOCK_NODUMP can filter regions that are
>> linearly mapped. Reserved regions are marked MEMBLOCK_NODUMP by default
>> so kdump omits them; reusable CMA regions are different because their
>> pages are handed back to the buddy allocator and may carry crash-relevant
>> data.
> 
> There is little point in continuing to send new versions until Mike 
> agrees with MEMBLOCK_NODUMP being added. You didn't answer him on v7.

Hi Rob,

Thanks for the reminder. On v7 your reply to Mike stated exactly what
I wanted to say, after a week without further objections, so I assumed
the question was settled and went ahead with next version. That was a
mistake on my part: I should have gotten Mike's agreement on the flag
before sending a new version. I'll hold off further versions until then.



Hi Mike,

Sorry for not following up on your v7 question. The reason a new flag
is needed is described in the v9 cover letter:

    A new flag is needed because MEMBLOCK_NOMAP can only express
    regions without a linear mapping, while MEMBLOCK_NODUMP can
    filter regions that are linearly mapped.

Put differently: today, whether a region ends up in the vmcore is a
side effect of how it is mapped, mapped regions are always dumped,
nomap regions never are. Nothing can express "mapped, but not useful
in a crash dump". MEMBLOCK_NODUMP decouples the two, and DT is simply
the first user.



> 
> Also, I intend to apply this[1] before any further reserved memory 
> changes which will greatly simplify the code.

Understood, and it makes sense. It removes the two-pass reserved_mem
initialization and indeed simplify the code, I'll rebase on top of
it once it lands;


Best regards,
Wandun




> 
> Rob
> 
> [1] https://lore.kernel.org/all/20261015082315.56876-1-m.szyprowski@samsung.com/


