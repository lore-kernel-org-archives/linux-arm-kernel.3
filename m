Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4488606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 22:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YWHZ504W;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=u7OMnEj4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rrOsYLZJDf0TzEPP307WDbeBhrlf1yktibJyBkuCquY=; b=YWHZ504WcNLQq2FadcuLoUw9dF
	Nqv4BfTR2r5of49f82ko5GmOXspqmlCJ3gm7B27cVpYhHk7mHDc0IREI5tvVl8XJwpG4dpLgUb0w5
	/zShcdFJfJu6nwWg5zM82n6bja8/rzqElxg7gl4qwrD2iQoYglUP/y1Alk3E/T3GmZ3RpwiPAVeUO
	YijAZ/cXGYL72UduqcA82uBUDtaiXZgajTU+BoBcx4GKpSilY+p8UXKyUZ3g9/9j6jZ5Kpq3IjEhp
	jrlmcIBRHn+iuwE2yIkzEDsa85GFGThCIaigBVNV6rPV0drywuYmslAJMIjGEv6dbu0y8LjKoD7je
	8zGunAVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOEE-0000000H7Vq-1etX;
	Fri, 23 Oct 2026 22:59:14 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKOEB-0000000H7U3-1mjt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 22:59:12 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2db33db4de9so20905ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 15:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792796349; x=1793401149; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rrOsYLZJDf0TzEPP307WDbeBhrlf1yktibJyBkuCquY=;
        b=u7OMnEj4GooVYGFOFjuDHTpwvkQ9zTUoog8oyaLUfKPYsjtpHb+4gvhk0fjTgBgP9u
         BSS2YcQu2N3pnxoAJkx49M1boBwhD/f8lVGxI8+2d4pcFQcjMKiWcjT6OQoBkpE86iT5
         SQFJjatv61P93eWP8BDws8FIE9fRBes6y/RnsisVT9cdCjqiSnK1jRVOzLYc5plltSf5
         8wqp7v9S+wCLYYMXTd7agsnm/MQ7SzuTRk1uAveLpNKJ0zZhxUMU3MhEKSeNGo0OPbDC
         rtA6zkUeHVRsEYQZ2fP1mL16vglbkZ9br4jdaMtIqRaPGis+qu5TrEgjcU16IhAImra2
         uMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792796349; x=1793401149;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rrOsYLZJDf0TzEPP307WDbeBhrlf1yktibJyBkuCquY=;
        b=ynWhhwwZ8PpiRuPLnEgBt0MnoXHyvTkssCMZmxWTZMQtwQfNVSrrWoj/2ILZrQRYhY
         rFNZgMm8oksUMpZ+sLdb0gl2lZwjuCJ951XLF3wu3S8/6iJ+PaXj19Y97490TYgnt3n2
         y4Fua+36JZsNXVvvWFhXDJEF2uLlgdSQhWtNNqt0WNmYvoiyx+vKhxEn18PVFSyV4Rjs
         SDH1Gwz68jNAKppMKvHKjkdXw43lB2iRLtGZxHieuYoaXXJjf3Ig+AVgkunYcSljhi5q
         I4luQkukU6tfjnjoiVN2nbdaFWz0ToZ1u5k+MwKpiDer0pyqS4RQsYp0QMtq3+bYb3fL
         SwdA==
X-Forwarded-Encrypted: i=1; AKwUvByDZvPo1tNaNUfN9Q563EyD1k9gueAD5VfAYOxdz/TXEK7FwVIviIg6fzByEYYbSlVscP93XS1gMohxLomsIYYI@lists.infradead.org
X-Gm-Message-State: AFq9FYILFFa2Mm0WC/4Gvj1egcidrF3XO7ofcefW7dpsHWa05Li3Rv0Q
	nLl9D+HBEQAiPICJRwQn8dNdpE3ucBgMw3bKG0IqqrMoLrf5j8utkcqMDUvKj3kt2w==
X-Gm-Gg: AYBFou0cFjlLrUa4TJ7DSMSdnUwj2cuJiowEtCkxYHfQT6FwC0wD0XWzWy7JIomcJi/
	3fgfgrV6TDrmq0KyNmhsxEDRbdqtc3U7/FgqVoBlQTYaD31D4n5bJXLNwSY00V90X4vdE4v9Eqb
	gdeUTnf61NJIbSus0srfNaDVrbGMp7ObcxK8T9kOI6g3/67fS2CKaqzoYtXMno5uAaJemAPb4ct
	0HyPoN1v64eYii2zbM6DooyUkbcqOgcHBeXsiYtM9spp3jugnEAh2IkjTv76WsmQWcRQtcWcyS9
	Zene0FLdKDFpF2AjEpUy4cB6XwXZuDQyxKslXW09nwkVkGt+BQJOOpG4Ob/OgMibnkLc9eKF3AC
	Ab4gv/ysh5XWML6jMNqxmp1spa1By6hvG6tmwJs+ScIHqyeGIUqAIhygm1ftiknU3BZyoczBZnL
	V1hLXL3yfp+PL3a8e34UWjCwV55JZzehXIbF75B+WzCFiYUIARbzsGDiTOGLqzdLE5R5RjN6U3o
	2wuAL2b873ftCk1C7EztEIyU83oixWBWk5pT9EHLiFeqmq3ix9LRqYeCCMJvNAaih+gHpcXToYb
	a0Wt4Q0OWP6QPOpPzuUZgnbmuig63MIlA2baauhPNztP4uvO
X-Received: by 2002:a17:903:2c0d:b0:2dd:8958:f8d5 with SMTP id d9443c01a7336-2ea9d109b4bmr841245ad.6.1792796348553;
        Fri, 23 Oct 2026 15:59:08 -0700 (PDT)
Received: from google.com (163.1.145.34.bc.googleusercontent.com. [34.145.1.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f09csm649587a91.7.2026.10.23.15.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 15:59:07 -0700 (PDT)
Date: Fri, 23 Oct 2026 22:59:04 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	David Matlack <dmatlack@google.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [RFC PATCH 0/3] iommu/arm-smmu-v3: Add support for hitless
 replace of CD entries
Message-ID: <atvmOnAEhVG3Vevk@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <40a2e1a2-138b-42bf-94ea-a42fda128c22@arm.com>
 <20261023134630.GA3977851@ziepe.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261023134630.GA3977851@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_155911_505998_E626C13F 
X-CRM114-Status: GOOD (  22.50  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 10:46:30AM -0300, Jason Gunthorpe wrote:
>On Fri, Oct 23, 2026 at 01:10:56PM +0100, Robin Murphy wrote:
>> On 25/09/2026 2:13 am, Samiullah Khawaja wrote:
>> > This patch series adds support for replacing IOMMU domains with S1 page
>> > tables hitlessly, that is without disrupting the ongoing DMAs. This is
>> > one of the dependencies of the Liveupdate IOMMU support for Arm SMMUv3.
>> >
>> > S1 domains are programmed by CD entries in the CD table. During a new
>> > domain attach these are updated using arm_smmu_write_cd_entry(). Since
>> > ASID and TTB0 are in different 64-bit words, arm_smmu_write_cd_entry()
>> > considers it a non-hitless update and sets V=0. This means such an
>> > update is disruptive and would generate translation faults if there are
>> > ongoing DMAs.
>> >
>> > Replace the CD entries by using an unused temporary ASID in the
>> > following sequence to allow hitless replacement of CD entry,
>> >
>> > - Update the CD entry with temporary ASID.
>> > - Update the CD entry with the target TTB0.
>> > - Invalidate the temporary ASID.
>> > - Update the CD entry with target ASID.
>> > - Invalidate and release the temporary ASID.
>>
>> Why bother transitioning through a 3rd ASID? The old and new pagetables must
>> contain the same translations anyway, so why not just: switch ASID, switch
>> TTB, invalidate old ASID?
>
>The target ASID may be in use by another CD someplace else. Doing it
>without the temporary could contaminate it with wrong translations
>from the original TTB0.

+1
>
>From a driver perspective we don't know why the domain replace
>operation was triggered. iommufd can trigger it for domains that are
>not identical. Corrupting the target ASID when we don't know for sure
>what is happening is not safe.
>
>Obviously Samiullah's use case is hitless between the same translation
>so it doesn't need the extra ASID, but the driver can't know this.
>
>Samiullah please include this explanation in a comment..

I will add this in the next version.

Thanks,
Sami
>
>Jason

