Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7AB606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 22:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XizbixyF;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JzNir6Sm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IRLDp0EVirBnKgldSRz7ToSM81j0nsSsdeqUHhLddpw=; b=XizbixyFqA4TyI2YUYVUs8uq8C
	7AJYmZ2xx3tuk0uBsQ3NxQHfnQwN4ftbi45+ySlffjQkFWl+8xqqJJ7w3FPW54SsJkOTpy4omldcO
	C2JCEe8iOiZ1Yk4tIhiVIVV6sHDHNoGclHQG0bSk5hPNUU6uGghRJQnLAxW8p9M++q+rebwOIULVq
	ar54j8gXc5oB63XaMC98a7kyGT+VUQHB0puREDQPLhVLZtRoMvc2vYyEZ0JZJ5+M15gCwyXAzEIZk
	vxXoNDFKRbvZkm/GUIpwTlXM7Rk4XPdMpA0ubMLfGtM5EU8+U8bS2A2qaGa/4o5VMjfb/EyVGfnEk
	/tD6ZTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLpWL-00000005qDJ-158l;
	Tue, 27 Oct 2026 22:19:53 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLpWI-00000005qCy-3DjT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 22:19:52 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2e9f6a16afcso11555ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 15:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793139590; x=1793744390; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IRLDp0EVirBnKgldSRz7ToSM81j0nsSsdeqUHhLddpw=;
        b=JzNir6SmOkdj8OtUyzyQ8x7z7xqiTnFn8WAiGZZuKfYruw+nFjQqb9UXg1v7CWV1UL
         q09j9JqtSD14z2VSJ3Qsc3uVtSLH3L37xnhBH3RPzn9RDO35gIMtC1ezRpuDQHyWUCwP
         tH/FoHVg4EpBMY5Rxp1U7CsoYkzjJboDfCUuep5NVuUrids8p10Quuutan/qSgwanTL9
         OMoi4L2g6QxzFonU/hl6nxa7PH/vNPFD29150oUYXDrMqM7yWEWtoqM6V6wgcoLzrE79
         LljWBZ1yvSV9xDG+w5AKsVkPaNOzSokCTOgUu2KChdW/wbGjCwfi2glR9HXcANJtX+0k
         PUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139590; x=1793744390;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRLDp0EVirBnKgldSRz7ToSM81j0nsSsdeqUHhLddpw=;
        b=s5YUzIN+MhuSfoVE99wSlUgqQNoiHKQc9XX3GdwR0/nEBKCt1oF8ndqXr1FPiutAU0
         lDsR0x89GmvO1WjP8vJBZT/5qzJU172e+zVGZLf8E70OmOOVD5Vmo92YhN3zgyRFP++p
         u1PqMguUjffogZg/4EpSMsra9E59b1ykCf4ZqA47XwAGphmWvWVuwiuj8dBSfMUhl4C6
         ebgVuLtEkRV7yO9vCTPA2d3uLPP0YvHE1lA8/5iNuvzHr0mnQW2va9auKuSWFP6hZZI7
         qGnAV88v3gJt7AlED6FmswzfvGA92kkE9myfzfElmTxPF0Ky2kZRTLYGZz+WQv/WrDbh
         8GKg==
X-Forwarded-Encrypted: i=1; AKwUvBxjgItcln1kxAq/sjmlfU+2pKMZ20IuczSjVANcsyNX0qdk5Q6QH6c9nscwwMOVwxE3/h9QadWXISQ0FeylX6z9@lists.infradead.org
X-Gm-Message-State: AFq9FYJHFMh0ITEeLCLnI3ftjiH3Wwa73C5XMevtDp++e5yLD2KNhf8n
	pu2uJM1NwhB9hR1OLNWFMtowldkHYmFLZ4/4/pnLo7OMeSdzDN9wfusJ5VMF9e5J4w==
X-Gm-Gg: AYBFou2I8FQdJ7XZI12f5egeo+aoatFocgA7vFXJX8XDBraM1GWG1FYhgYiMB+yA3F8
	FS36rNGEwt3Zb0q2+r4q7cjVk1bmG0NiexDeUrJ4SBAhooS/DyFUK6Egm7+OpkiAe51X4+J+Key
	MIock/IaOSuIH9w3UkHnMpKM79QRYxkVs4tx51Sxq1jIiwjfgPfEXZvkQRmAyVPsXCBxq3L8gcJ
	2XCL3Xp7ntl90FLWLvuk5oadRLznX8T2Cib28nDZ530kes4/W1BWN31722uoGb+DSjxGaKZqOWU
	uhY4udGsoqbJM1k/1f1mFv1uiTQRwuzvSwfjQczVUSiGWymu7vTOgA+69enN/50Idki+wFe5nDv
	bE0B9LGbep2RyDN/jdq1BlSW0mdP5HyKlTialMFW1Th4mBpxPzNLHfP/e6VpFGeKgv6K1tVoBMO
	C566gSAbnI+VSCJdQoT1FdC/BP3nJ9ZW8afAnEYgbPIxcaJEDTWc38jP84q0KZl+MGZQvfG2lTC
	xK6pdEn5j25tqS076qpKs1kzyl5Crw8hYaBCECixkseoKtvI81LsFMh6YTDmXKlBSTATWCd7vhg
	ueV31x+MEaeLxvADQ4V1/nIm6tDNV6IUh13YRlEzsdp/58tr+g==
X-Received: by 2002:a17:902:dac7:b0:2e9:8c2b:979f with SMTP id d9443c01a7336-2eb018f7c12mr1057445ad.8.1793139589374;
        Tue, 27 Oct 2026 15:19:49 -0700 (PDT)
Received: from google.com (163.1.145.34.bc.googleusercontent.com. [34.145.1.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm152945a91.5.2026.10.27.15.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:19:48 -0700 (PDT)
Date: Tue, 27 Oct 2026 22:19:43 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Kevin Tian <kevin.tian@intel.com>, 
	Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	David Matlack <dmatlack@google.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [RFC PATCH 3/3] iommu/arm-smmu-v3: Add support for hitless
 replace of S1 domains
Message-ID: <auEf3eH6QoiM-f80@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <20260925011308.3381953-4-skhawaja@google.com>
 <3d1eb92f-3447-49f0-a210-fd4fa015304b@arm.com>
 <20261023134900.GB3977851@ziepe.ca>
 <d4570e2d-5b92-4f05-a8b3-34d5d5b299bd@arm.com>
 <20261023142909.GG3977851@ziepe.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261023142909.GG3977851@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_151950_812740_768E665E 
X-CRM114-Status: GOOD (  22.96  )
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
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 11:29:09AM -0300, Jason Gunthorpe wrote:
>On Fri, Oct 23, 2026 at 03:04:23PM +0100, Robin Murphy wrote:
>> On 23/10/2026 2:49 pm, Jason Gunthorpe wrote:
>> > On Fri, Oct 23, 2026 at 02:43:28PM +0100, Robin Murphy wrote:
>> > > > @@ -3664,8 +3726,8 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
>> > > >    		struct arm_smmu_cd target_cd;
>> > > >    		arm_smmu_make_s1_cd(&target_cd, master, smmu_domain);
>> > > > -		arm_smmu_write_cd_entry(master, IOMMU_NO_PASID, cdptr,
>> > > > -					&target_cd);
>> > > > +		arm_smmu_replace_cd_entry(master, IOMMU_NO_PASID, cdptr,
>> > > > +					  &target_cd);
>> > >
>> > > No, we cannot blindly do this for arbitrary ->attach_dev calls - the
>> > > majority of S1->S1 transitions are going to be moving back and forth between
>> > > the default domain and user domains, where there is zero expectation, let
>> > > alone guarantee, that the translations would be equivalent and thus not
>> > > liable to lead to TLB conflict aborts or amalgamation hell.
>> >
>> > Heh, yeah this probably only works properly with BBML2 or something so
>> > the temporary ASID doesn't explode.
>>
>> This is fundamental VMSA behaviour - see R_FVQCK in the Arm ARM. BBML only
>> applies to the one specific case of identical VA->PA translations with
>> identical attributes _only_ differing in the leaf level at which they are
>> described.

Thinking about this more, in case of a conflict, what is the expected
behaviour? Does it result in a DMA fault for the affected IOVA, or is it
a catastrophic event for the SMMU itself, affecting other devices and
the whole system?
>
>Sigh, I thought ARM got past that 'tlb conflicts catch fire'.
>
>So, yeah we need a flag that says "I pinky swear these are identical
>translations". And it has to be a kernel only flag since we can't let
>userspace trigger this.

Agreed, this should only be requestable through a kernel-only flag.
 From the live update side, we would set it only when replacing the
restored (preserved) domain with the new one, where the translations are
identical by construction, including the page sizes used.
>
>Jason

Thanks,
Sami

