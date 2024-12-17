Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A669BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QNzKWwcjuKoS1G8q7vft+5gTVP09htSDXmMOavO194=; b=QU/fy9IW6t/t/2K4Sdl8Gm57R3
	ngD2eVub0nE9e09HX3QS7y2WzkVldx4O60xsEFWpkbc2E3sU2KaVBKqXQHPOwkZy39Z+/3p8mT3g1
	gmFVSGeF+iqYhQs1lh3xgLvNK7Pils93mPM4NrAhZfiV+Uvi4LuRVfpfe5gUjhQPiXR6W4WqqiPSJ
	Xp8+obRoGUucBG320Vk6pE+mUOyuHtMo2NbOnrmpFDpumkQ60xYPWfiGupb8vUiLva0nUR36dSP6Q
	6x89XvxY33e9tm/ii4A5DNHwuaxQpYHTyWfoHC6rSAPib1AleqeuaSnS0zpMRCH3Z+ca5d7Z4GqU5
	oQ64O+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXjB-0000000DbHE-0MXK;
	Tue, 17 Dec 2024 13:35:09 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXi6-0000000Db50-0KFC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:34:03 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso912394666b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 05:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734442440; x=1735047240; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9QNzKWwcjuKoS1G8q7vft+5gTVP09htSDXmMOavO194=;
        b=qpORo93rr8tGtikjUnCCRe1c7M2h3ykfebREyrm/32NRoI60Y/GJ7kbTjII9kM9ldy
         ybhGluAsQThOrOWez9Xj51UZcfh2bajPDcIM8QV0OgynElXwdZnPj61WoSDBYOHkkfff
         ZkhMQrPfD2MMMADwrMCsd5PyqmAIs2EsDOR+z/GhOTx+Kvm+oTJ+g7aK4DH2P4awARo4
         kvBLotLAhPDlj4csdNZKg4klD3+hiDWgDUT5GC+xpRKbTcxXttVscgoIlhdl9fccLNpL
         kNDYKG/VfIr8gQN4gDDgyIME8Oh6WZeU+i+537xH6+T1sc+0xJRmXI4piCSmZETLjAOB
         2BAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734442440; x=1735047240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QNzKWwcjuKoS1G8q7vft+5gTVP09htSDXmMOavO194=;
        b=et7/5NCmfkxR6gZu58I8EEJhoyYx6GTKlkP6SpMnTunSqERNBVciM6chb01FkajooB
         2ADRBMW0giDg3H7cwc8j9aYO+gl6/BND+WSEL36jZgyxkrM3vqIIpgdbbpkx7VWmaAY/
         gPs5pG4JIru060ru5lyTANoW1aL4hboi7AthM6IdsF7QLBCIn1cPc08OubUj81rgbkcl
         t4f/+7XlKuPiKYBPUvxNtoZ8y/CNiziAmT521sZ0lIDIvRvomQJZjyN3yfNajXpHxhQF
         9sX3nFjreAIJpxqmIUYhn69ALPCedNmnsZUcMoT/VdtMRvCMmuZN6G3DPMF17agJeVwB
         3Ozw==
X-Forwarded-Encrypted: i=1; AJvYcCWh+0URRj0dleLfdtF2j6vc8Tr3P187YFjUZvBR6Gtg5UPE4p7xLDIR/4qmINLTnJstCpZ2wqbgvOU8W9VOQVqg@lists.infradead.org
X-Gm-Message-State: AOJu0YwVh5OrbXNGpb7x6CFelCFSZ77tFs7NNCKYjB1w15Qa3HdUumeu
	YWm8/IxI+GqDR705lh2AtevNbeMZk1gX7pUO/KxV0+eItbU4HJZ2VBb9J6ACJA==
X-Gm-Gg: ASbGncvDxP5fzobFw4aSqENuNhbQ6YJZAME3wMZbKpvkI+JaH3wOoRNrG36TBwqz+4F
	snEi0GDh0HmvG3F5bpRvJsGgG7sCW0GCHrGOYj/yaeO7IZy71P88Bd2qb/ABnsEs1hqZ9HhQ1Kv
	xvrle3ftaoymS/yZuD2qgkVyNPBLssNM3BrXp063wB0v8Z/3qyDgLkuJ1StcmqQDDbiHovhvW77
	yAtPec3da5CXTbJiwyIMEaxGB4ZgVFxH54HD1PXcAC6LUK6MXQOUmUhD52Mxa3SRrbe6Y15mLoh
	Hc8rXuxFK+KCUnk=
X-Google-Smtp-Source: AGHT+IHaaBpKehN/3xKCSI4k6TebR04IYJYJaUaIapMz4+szmzBaeqriWGDQgSt0k6S3fPHQK0lNaA==
X-Received: by 2002:a17:907:7296:b0:aa6:6c08:dc71 with SMTP id a640c23a62f3a-aab77909ee1mr1749746666b.23.1734442440424;
        Tue, 17 Dec 2024 05:34:00 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab963c54c7sm442926066b.195.2024.12.17.05.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 05:34:00 -0800 (PST)
Date: Tue, 17 Dec 2024 13:33:57 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/18] KVM: arm64: Introduce
 __pkvm_host_unshare_guest()
Message-ID: <Z2F9xb4jrK1zRtNV@google.com>
References: <20241216175803.2716565-1-qperret@google.com>
 <20241216175803.2716565-12-qperret@google.com>
 <86wmfyr1j4.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86wmfyr1j4.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_053402_113262_1DE0A1B5 
X-CRM114-Status: GOOD (  19.79  )
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

On Tuesday 17 Dec 2024 at 11:29:03 (+0000), Marc Zyngier wrote:
> > +static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ipa)
> > +{
> > +	enum pkvm_page_state state;
> > +	struct hyp_page *page;
> > +	kvm_pte_t pte;
> > +	u64 phys;
> > +	s8 level;
> > +	int ret;
> > +
> > +	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
> > +	if (ret)
> > +		return ret;
> > +	if (level != KVM_PGTABLE_LAST_LEVEL)
> 
> So there is still a very strong assumption that a guest is only
> provided page mappings, and no blocks?

Yep, very much so. It's one of the main limitations of the series as-is
(with the absence of support for mapping anything else than memory in
guests). Those limitations were mentioned in the cover letter of v1, but
I should have kept that mention in later versions, sorry!

The last patch of the series has a tweak to user_mem_abort() to force
mappings to PTE level which is trivial to do as we already need to do
similar things for dirty logging. And __pkvm_host_share_guest() doesn't
take a 'size' parameter in its current form, it assumes it is being
passed a single pfn. So all in all this works well, and simplifies the
series a lot.

Huge-page support should come as a natural extension to this series, but
I was hoping it could be done separately as that should have no
*functional* impact observable from userspace. I'm slightly more
concerned about the lack of support for mapping MMIO, but that too is
going to be some work, and I guess you should just turn pKVM off if
you want that for now...

Happy to address either or both of these limitations as part of this
series if we think they're strictly required to land this stuff
upstream, this is obviously up for debate. But that's going to be quite
a few patches on top :-)

Thanks,
Quentin

