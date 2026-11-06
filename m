Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF64606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3F/yThL+;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z2Xrrwyi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NLBSWvQdzP4LSJXmaAVuA3LXFwQgtJwF9yGVYnQFGaA=; b=3F/yThL+vEZyHA8hBG3zZTgRt+
	WAnuXkfwqV1l/k6Pc+OJkdV2H38RfXRHqzlRNQL9M92uSrxKYEr1ptP3Bo9ZbAia7z6ps51GvQh7H
	t1zY+kNZr3KkjdrBcOitNi135kbwGK71A2/7jP7Js5ggTSy5dC2SJnv50ITXQnYXmTvndOCHy+Ak4
	NqikIfg6ZR3KvwPbjm3hSAEbqv+LBrHQ/iSbtIVmvI3v+QXE8AuV8THhTAYDLk/9CUJvWWJPsuYCK
	zD2IjD+VpcsElR/A171rr+ZepCQM/lKR5cKInsJZoHQr+qVtRZOjpqI6Ewg/RkLhlTUU1HwpICAxH
	zDJJ1ARQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL0Z-0000000CgKC-2YR3;
	Fri, 06 Nov 2026 14:33:35 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL0X-0000000CgJZ-0rV9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:33:34 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso5007605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 06:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793975611; x=1794580411; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NLBSWvQdzP4LSJXmaAVuA3LXFwQgtJwF9yGVYnQFGaA=;
        b=Z2XrrwyiUxcg3xlrUqfgE8Q/w05PClxdHn3WHuZvBiDOOBGhRfLuEChWVMbVCQvGeR
         QZci3Pws7xm88IoaWVTtO73qyeaZtgLWV37odZ1ZgvFVsG9ggBsLhB8VkHG72BuRXHKD
         dDH67Dti2kiWhRWw/NTJW6cp+alqc7fFZElzmoovHqw60YWbVXHDdbxWey6BUZmA57IA
         3vqmnAnE+Rp4rXq6V2Ls7Iv19EbdEz2/jrAHG7JqigyGte/j4eYOyrmD4F/9TSo8QWPq
         TdbhMv0kQF7zuVFXENlPLwg0l+eeFEmWFHrOi7t1P/yXLTzMg/sApoBOhmbR9v30mN+G
         5gUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975611; x=1794580411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLBSWvQdzP4LSJXmaAVuA3LXFwQgtJwF9yGVYnQFGaA=;
        b=o8bQ+cNId9qZ6ivESE52lvjIP6dZKya5V22CJh0WG2/JB/sFEb0w0yMoDta/CppyjY
         2N3UZmejRMIEqJ+9a9TKGSAF7k+3RApjBPVXf+VeoZojdP1pVg5OfK7jMVJD8TcK7kGA
         R7QVXgqfZnQe4xkU++vJnYDfg0LUzco6HXrJ9XEi+DVljTOBjuPcrmety6+En1II+Z7G
         /ulrnvCWY45BumFAm6t1Td/JscCbf87nKj9k9yXjUl8IHYWBKSq3SuPoRHOvi19gpYyp
         C8kJfoMvnO4gBGqvqHupq/KyBPLSMXIuqE8SlSkcTTL743DCLbVm49JlScTrqsan8jD8
         W3cQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKPu4DK7ADkIdV3a7Ws/DGKNZwbZOS5H53x6zkL5weBf+6jBmSDit/xpcPMt9sOA2PFsB27vNw5w2qhVqc3cSH@lists.infradead.org
X-Gm-Message-State: APuU4Z/3yunY4bA5g0uk4bx6vHsReRGWEljuq3AFGtL5qckmDgWOLF/4
	iXDNKRXihyQdcDaSz5tt84RY3hBVnVS6nE7Ra9Qe8kREauP5KLm9uECXAoWUeVY2cQ==
X-Gm-Gg: AYBFou38rViA8P5yYgST5T91fU8MBMBU1LM+rUXecAugr373M+FMHkBIq04GApSt5Vt
	BrJehc8tC1c7SxvZwMkLYwCAXQaOVEJOGcuCiT7z0O1mRIqg88UDqiZnPd3XpKNtVCvybRHURZ1
	vayO2YYUEqq7QpclVXfFezO60/ILfLVH1ZdKvFKKp1UgtS4sVsw4TLiS83H+Ss+rR0astuAVE9B
	ERzqM2hFrnT2E6ep4CmsE8UhAOlieATTNhLJYHhicn1knVBxfkOQTQTIIBJwjOGRznr77n+vkjz
	E00q9lJrHce2xBV9fQMMYYC8YrrX5BJMvJt7ALkIO4UWjUcPkv2kyk/yjZRQ4XsbF4ldCdqr31d
	RzaeZxvaa0Zo8nCF8tgfcQPtFXrdF91I/Wmf5AgwHrbUo0x+y4M23OI4TNBhTJ3z/ufn3BZDL6F
	XaYYjKXU3vXYqhKcIUSaJsqpD8MnHEnhWdKt2giT6Y0byh51y06WJeCvTOytDIaNyBUdWmGJPiI
	6enPouoNB0UAlrPq9GLwdckvd9kB9zDChKYYAJAndfwWAeP5RN38wMG1abuPKcPQWgJt3Nt/556
	Oa5HA9LIIbIZsYC3MmBqirZq7aAG6pd+se+kzLeRtgBN1ZMWqCiOn3hVFcgBG6lz
X-Received: by 2002:a05:600c:46c8:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4b6dd82aa22mr47981875e9.7.1793975610579;
        Fri, 06 Nov 2026 06:33:30 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba0f3sm137145675e9.9.2026.11.06.06.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:33:29 -0800 (PST)
Date: Fri, 6 Nov 2026 14:33:26 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: xuheng@cs.columbia.edu, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] KVM: arm64: Don't replace a valid hyp block
 mapping with a table
Message-ID: <au3lNp0vzK94uwap@google.com>
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu>
 <20261105-hyp-pool-and-map-v2-3-44a6ca90190b@cs.columbia.edu>
 <CA+EHjTx-X_2DaO6Yt-AHsP55SFWjz_EYxEr-TB9WSN-ZT+d3FQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTx-X_2DaO6Yt-AHsP55SFWjz_EYxEr-TB9WSN-ZT+d3FQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_063333_262761_4DD1CA24 
X-CRM114-Status: GOOD (  16.83  )
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 12:03:29PM +0000, Fuad Tabba wrote:
> Hi Xuheng,
> 
> On Thu, 05 Nov 2026 22:59:50 +0000, Xuheng Li <xuheng@cs.columbia.edu> wrote:
> [...]
> > No in-tree caller maps into an existing hyp block mapping today, so this
> > cannot be triggered in mainline.  Fail such a request with -EEXIST
> > instead, so that a future caller gets an error rather than silently
> > losing the rest of the block.
> 
> Could you mention in the message that the WARN_ON() is fatal at EL2,
> so a caller there gets a hyp panic rather than -EEXIST?
> kvm_pgtable_hyp_map() is already documented as rejecting such a
> mapping "with an error and a WARN()", which is a better reason than a
> future caller.
> 
> Also, please don't respin series so fast. Give us time to digest the
> series first :)
> 
> Cheers,
> /fuad
>

Actually, why making it fatal? All callers of kvm_pgtable_hyp_map() are checking
for the returned error.

-- 
Vincent

