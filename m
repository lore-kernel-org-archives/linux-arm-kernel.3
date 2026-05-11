Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57278CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QffmlXKfGIQMvoSpoqBH5tpd14K+nt5m82a+AK1qlTw=; b=DyjpL2WJxZK8PPzdRhONO337b5
	Y8YkXHgSD6mk9qKnKWY4Vh27/KpjQ1Z6553AaQqNUPbDIo8/PoxJSbRO/WLXjWbDsAoONio2IdWjq
	jGXHEzI/z8VuWPNJ/X2/1krk6sqYCydzht1W5Z7ynJYmPlFCeDSvS9MKj9P/YwSF7pSKotlB0iKsY
	/ZwMNsNmxz1GGhNMXe7ETeL5XiI53YG4koDWydj0692T8jrEo+5Hk3ZJ5pqnGsPhdk/Ksuhoe4bxo
	dNprHfb/biaydi6+ItjV5xOR0D6Go1HDBgv4pIcfVK2UYZ9eNlA8S/fOGLtM6m2RreL7HhJLqSEVs
	VMxY5KaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMP5O-0000000DNoW-1dFX;
	Mon, 11 May 2026 11:46:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMP5M-0000000DNnz-2tF2
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 11:46:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QffmlXKfGIQMvoSpoqBH5tpd14K+nt5m82a+AK1qlTw=; b=SqClYjJLDMrm40fb3yzr5mY1D8
	U1MHWZSEKUfadyggiCkoUvaxRaMRuh06L5bmcDxt/cD/0sVqlmnCtvzhamFY4pf3yv5IXSksw/Iiu
	s9t/oLzECr5/yOgPDPN5/esLb2t4O0gGKSNERPd4i9zQkgVZaPi8EImuzamTdVGXlDX+lKJBREnIf
	n/6Ob40crYG5prNxDrhQRAjbpzcpKZXSMshYcz5dyNRKbjDY6m4HNiSq/ZhIBTr7ghziODjslQc8u
	u4sx8SOPb4rbuvbF6JZrAXBahPo+a3hF6c+QLTxncOaQkPpAlJmp/9RS9W4m/ccBMibtqHrLytLqi
	dnJ8AdZw==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMP5D-0000000BWEU-1u7A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:46:07 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4891ca4ce02so865e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 04:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778499956; x=1779104756; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QffmlXKfGIQMvoSpoqBH5tpd14K+nt5m82a+AK1qlTw=;
        b=W+ehbU2WigmcZ+UTX2GKj5+UfmYCus/c/pWQsbo8gLsXInJATVENS1DoJDsg89WJrB
         ynY7l7wy9qhb0Acv+/RuJAojI2sVgOaHIxVUvm6xWEiBWjIKscVFbX3Jif4E5b4GSJXo
         0tynB4+dIMgNB4MUc1CMoyxVK4aLSL97EPYvncJqCWbSWdGkAAZoEfRIAHeR9f+5hdGE
         d5ZZY2vDXaeV0nzYuV6kOxah/ehV9qgH3DLtCIsU9jNPfOEsXk4eY7Byqp3L0kGZrn0+
         MPGl/jq3xZFRrngTBAMJ0PbxJDA6fWC9g3yKoFxdW/9nAcLiEzy2VklzLlYiIDdsNqCc
         srhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778499956; x=1779104756;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QffmlXKfGIQMvoSpoqBH5tpd14K+nt5m82a+AK1qlTw=;
        b=Xv76ELBLrrMAjf9GG5hRQWMuKnRY6Y8LC10Jh98DyWlcpa4bokN1m1s9PxYGBcnpwP
         5qwOwSm/3iLxwaxvU/qGNag+mXxmVdsVqxw4YrL5YAwzwSOffk2gnnmhjyVGUqlXZKjK
         ujE66HTD/RLpBKb3Eg+/3ggoZYv0DQ2fn91SKqE1wI4wbucksOoZUlJwcOX96y6V+fsR
         EjbbHM/PTBcJ2+c2XsQJAfN7u3LDH/WgEckm8Fs04jdUYmpemM81UdklEjszXHpnwpoE
         tppPYp69TsxAljsJZ+z3U31M8jWD7/jafYXgttaBJUjbmydweL8PbKf88ie+Vu8zEH9P
         TLew==
X-Gm-Message-State: AOJu0YxZmR3cqYAnNCvN0vsnyk0gInEa61D6kWqDMzUa8p/sxoUdbiv3
	KGL9cy6uw9CYp8SIVuNV9ja1u/VzgT8S7auNEctLXTkr12xtkxLKzn5ZAHDU9gJnxQ==
X-Gm-Gg: Acq92OErRbqdJU8PoOSNiGBrPxI4FikcIRt8e0a9coBDpKuYxPHHtUjVg/EPb9in3xy
	jF1kRQxvxxlH/aZeSaXHlcx9lBlgk3V+lcYsC79qgpX30hWnCxY5I409VJLy+yAV/+NaTFdQpjD
	2on+QeAIEPFrZil54QcPyNf1LPdh2dFN7IkYu9j/mmlNstgpIFP8EGHRWEVefRiKkEAR9SFcpo5
	b88IKEWu0MOHBwJ6XTpgH/2nzWt05M2HhxvaW2dAYmmOPvIVSGSwFrHN8QclVuQknbfTnXb21qd
	QgbGOn6J1NHrTfl/HEo+SItHpW2ic+QmclE2/hFAnSl8BzmBUzYPNXfQEgCIw4+yDMIL05KMYwG
	S25hXbPGVBAmfaJgZYoQX4ebCgyEhpIcvrU4dXEg9eTpj7Sw895yO8f8Vmn6cYRHIdqSPlG78BE
	SM3I7I4Q/rQxg4Tk2d6GZszGTTCqzSRB3wc6+uUXI9765QqkIlRAiZ4npj9M4cKWhLBoQ=
X-Received: by 2002:a05:600c:348f:b0:48a:5618:b4d4 with SMTP id 5b1f17b1804b1-48e6f4f6da0mr2636305e9.1.1778499955998;
        Mon, 11 May 2026 04:45:55 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454917d57aesm25552833f8f.26.2026.05.11.04.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:45:55 -0700 (PDT)
Date: Mon, 11 May 2026 11:45:51 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 04/25] iommu/arm-smmu-v3: Move TLB range invalidation
 into common code
Message-ID: <agHBby1qBvR6cmJY@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-5-smostafa@google.com>
 <20260501124143.GB6912@ziepe.ca>
 <afiN1UwS9q6F6A_v@google.com>
 <afoYBYIJOTClsdLS@ziepe.ca>
 <afoeIVIGE-JjYy22@google.com>
 <afsPfEzgGtAFrN5P@ziepe.ca>
 <afxd8Km40A5ulZvd@google.com>
 <20260509232931.GJ9285@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260509232931.GJ9285@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_124604_152440_446F4CAA 
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

On Sat, May 09, 2026 at 08:29:31PM -0300, Jason Gunthorpe wrote:
> On Thu, May 07, 2026 at 09:40:00AM +0000, Mostafa Saleh wrote:
> > But that doesn’t solve the problem, which is: At some point, whether
> > eagerly from the page table code, through gather sync or a fancy
> > invalidation array, the driver will need to populate a range
> > invalidation command (tg, ttl, scale...) and this logic is better
> > shared with the main driver which is this patch does.
> 
> My point is this patch doesn't share enough. If you do need to issue
> invalidations then share everything below the top level tlbi entry
> point and don't try to make a pkvm version of the entire logic just by
> ripping out the range logic.
> 
> There is no reason for pkvm to need a different algorithm
> here. Especially when you get to supporting ATS and multiple devices
> and smmus you may as well just use the whole thing.
> 
> Which is why I suggested to copy the entire call chain into a shared
> file

Agh, actually this seires doesn't deal with ATS, which I think is
wrong, propably we have to issue CMDQ_OP_ATC_INV for the whole
space on every S2 invalidation which has to be done per-SID and
as it can't be done by VMID :/ or just hide ATS support from host for
now, I will look into more for v7.

But anyway, we don’t have to share any logic, the kernel driver
is quite complicated as it is designed for a different use-case.
Doing that makes the hypervisor unnecessary complicated and
oversharing this logic makes the kernel driver less maintainable IMO.

The hypervisor only needs to share the architecture spec of
populating commands.

If that’s a problem. I am happy to re-write the RIL part in the
hypervisor. It's not that complicated, but I thought it makes sense
to share as it is a HW contract.
Otherwise, we can break this part into some macros that are called
by this function and the hypervisor but that's maybe over-engineered.

Thanks,
Mostafa



> 
> Jason

