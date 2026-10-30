Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2309F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 05:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OnF7RzFI;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XW8WCvWg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FQn8AMTtavP6P181h0fXU4D+4WY7Po1HblFZ/HaZCWU=; b=OnF7RzFIHJgK0M
	zo06w0jTqnVUWV+zJKBfmBxZaGV4pJAbCUYVjx0UUwF6aMPX3MUSmmk2hYtH8Ngab+11+8t9psMAv
	K+9KqfsEWqiUeYBf9fhjnuwBkx4g/qriNJvxhb9Y4wZvGIc4lNAZYglTWRixobcXSHCOcaQ2bS1QZ
	/wrpEvm6EV/aRx5o3e3n3kAEqCAWGcRG2NmFPwE5ULhsm9W3NADMP6siTf1iBurzWo8XByI2y5AGN
	ANq8ReUSlodETucA6iV37gx1nWg/6n73HDRxZEqG9XQuDM0jqZmUnLMrw+IQ/Y9gp6kVG6DKK81pE
	c/uWzwdEnTajoFoeUf3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMeuC-0000000AqPN-2Bdf;
	Fri, 30 Oct 2026 05:11:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMeu7-0000000AqOt-3sJp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 05:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793337107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FQn8AMTtavP6P181h0fXU4D+4WY7Po1HblFZ/HaZCWU=;
	b=XW8WCvWgJGCrtcAiWgfwcMqLGT72FVAcK/GzlDsd6fHEmEbd6l6zZFb3uH/wrtcJ0HheHO
	vnqnD92aikMqBn4DJIU/Ip7/zTrT/bDhA206ONZV8gdRH649FRiiA83ES31JDaHRyozVSr
	BVXxzf3sGvPaaGd4aBDRPZwRsyZbgKo=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-186--NMtoVQWMWGqGNwHvmIR_Q-1; Fri, 30 Oct 2026 01:11:45 -0400
X-MC-Unique: -NMtoVQWMWGqGNwHvmIR_Q-1
X-Mimecast-MFC-AGG-ID: -NMtoVQWMWGqGNwHvmIR_Q_1793337105
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso502950a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 22:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793337105; x=1793941905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQn8AMTtavP6P181h0fXU4D+4WY7Po1HblFZ/HaZCWU=;
        b=k2iaqC38FEOlrT44NoBK+GTzxThINFcuxKdFpJsj7hf11GocC4uuAMxYksw3b7ztFg
         uoXkmW9iQmmjbNCek9twjGjTB12pGE8kKtOCTZzDLh5lZh8GBmLoxte1II4bwftIZfiC
         4g5hMTtp0fZgUPgtNntofPETF4IIpQk3fvDnFR/nzZlQ+dK/T1LBSJ84x4E1csaKyiKE
         AAdOSyXhXKhqUyjKjF9QL/PZ8buM1vf9EZD3LTxsLC/2/iIpkxu3lAtzxE+tiLU6a13M
         oGgVS6s4nB5tMyStFFDk4c8wBK5UHjl2cz0hGlVm1ysChGGXtKNCtH+XTCwwhN0LZG0e
         hkZg==
X-Forwarded-Encrypted: i=1; AKwUvBxB9JT/AzBwgy0KQBBgxG542GBQchtNJlN7raPugc5I7wP5hoKQ7MncGghA/7dnK+twvWh90o53DLx9znbXYdU8@lists.infradead.org
X-Gm-Message-State: AFq9FYKOrZAOzuXtp4uhPX1f4v77CgXxyFMKETfsXB07LJ3LnA3hay+5
	EbwJ5PP2CGWLFb5dql/C6JI/TH7AyDPz5Lux/FmAru4Sb6QWOnS1QyMKzI+srNIyKr9VaYqnPPC
	6g+3LE+EAy2jJRbj+OnxW2tjquUkkXh8IsITSsqvv6Oa500rktNfU3ROj4VDzZ3vJQxXgw4Rxmh
	jM
X-Gm-Gg: AYBFou27A+5O/k767nH81cYBQbiin81WXI2haYDbThbCbVq40WAny03hyF1+1TCYVhY
	Cq26vL5unrAflWxWhIRKa8Jt6xFXhhL6xQyOmutq25+41wHEzASshV3UVqytLmSKFucDILz0ioL
	ThIvKbk4P36T/e9EjzKSi6P27VoIkL/8UUrczyPoSJQbClFADJ/buittZUDxROgQxy4qZlv+NpE
	PHUHvGLZlo41qxpDkBs9qTgLYbzW9cfyoMbdS6a6nTYzcOYOQzVfcRxyQfFKtE51GJvpPcOWbfC
	tPRrSdmGLpo7rRsrSRzsew9wM8rTXy1MrRJZlGnLcCF6hdRmFhfcPrnGIMUF3IQfVvSqLz8h2nR
	o1e7pMgsX30Sn+EBUHvOnGb+ZXJsYrOHbA+SOg5USz6B8GOgK3CeryrE/0VNbaY4EJ9B/nQh6x/
	mYVqd+lRhesjIBqFQ=
X-Received: by 2002:a17:90b:55c5:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3ae8987e75dmr994563a91.67.1793337104503;
        Thu, 29 Oct 2026 22:11:44 -0700 (PDT)
X-Received: by 2002:a17:90b:55c5:b0:3a4:ad5c:d48a with SMTP id 98e67ed59e1d1-3ae8987e75dmr994554a91.67.1793337104101;
        Thu, 29 Oct 2026 22:11:44 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9b1506sm6728517a91.15.2026.10.29.22.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 22:11:43 -0700 (PDT)
Message-ID: <6c683dbf-45e7-4a19-968e-5acab3290090@redhat.com>
Date: Fri, 30 Oct 2026 15:11:35 +1000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] KVM: arm64: Fix dirty logging detection in
 ring-only mode
To: Wei-Lin Chang <weilin.chang@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Leonardo Bras <leo.bras@arm.com>, stable@vger.kernel.org
References: <20261029175238.3214788-1-weilin.chang@arm.com>
 <20261029175238.3214788-2-weilin.chang@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261029175238.3214788-2-weilin.chang@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GX7-rxfd4h1jN_o_0zQKmfRu6gOneafoVCDAJpIiC58_1793337105
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_221152_090643_C2FF207C 
X-CRM114-Status: GOOD (  13.79  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/30/26 3:52 AM, Wei-Lin Chang wrote:
> When checking whether a memslot has dirty logging enabled, the
> KVM_MEM_LOG_DIRTY_PAGES flag is the source of truth. Previously in
> memslot_is_logging() we were testing the dirty bitmap only and did not
> consider dirty ring.
> 
> With the ring and no bitmap, a logged memslot can still get block
> mappings, so guest writes to most of a block are never logged and a
> migration can copy stale memory.
> 
> Fix this by using kvm_slot_dirty_track_enabled() instead which checks
> KVM_MEM_LOG_DIRTY_PAGES, within memslot_is_logging().
> 
> Fixes: 9cb1096f8590 ("KVM: arm64: Enable ring-based dirty memory tracking")
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> Cc: stable@vger.kernel.org
> ---
>   arch/arm64/kvm/mmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


