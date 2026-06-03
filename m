Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA42CCD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 10:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIaWOz4jzomrlICte653zCUp4/MwcwzwiqZTiopmMBg=; b=Yo+Le4ra2RXC3m4uirlKeGTlYG
	7PyxPgWhOkKsl3KVhoLbzeYr8S+1MYOg7qJXnJPlyyDG3IO5GZhirbXud+t8Tw8ETPBIV5p+VBgbu
	VeO3n7qsZUrTZ6gH/N8Sx38dmtaFc9PIgq1E91fae468poF2NPlL/W6tVre3wExdcPOdH0wSRIV97
	zE5kDgitCdvZkAfYTeUz3LiWHTk0btPXuycio+8dLQo9PRSzQcLhgClX9D2amd5ykW3M8HWv5Tom0
	NlxC7HEm1V4/1VPjlD+LvDFTQZPNGmeleNMkh9JraQ7ePyhOj0CSf+JY8vShC9bmMemSAKRzJj32t
	MpS1pXLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUia8-0000000EmV7-2s1w;
	Wed, 03 Jun 2026 10:12:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUia7-0000000EmUt-3hiL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 10:12:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pIaWOz4jzomrlICte653zCUp4/MwcwzwiqZTiopmMBg=; b=UA4ae+BuGK3YDFXG70HnNrux5w
	eBWAFrwSTYwbLsOMFO2v9JVUDa+k6b5oR/fW3bAE2ES2PNRfHLTz3zoZMSWfI/IKdsGCE/8n168Je
	VX4LL0nbl2bR5XGs+qTjUuv8ud4gPQ+4AJzk1MaSh3neeCC0X6omgMdjus+WjLM98cXByCvc2127h
	6cx0Kq3Pzzcm2iQGbRRkS5CG+3qTplj9lBMXAVug03OJsNusWv4VrFXo5zloJS9hKcVWcSeu19SAe
	WDSKcpLxRVSkk0c0tc0mgnFee6uSVS1+RTfWoKgU36GBdKK82KXrYKlIpp0heB1M7ACi+9BnGjeB2
	FVMz4y6Q==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUia4-0000000Bo4H-4C8Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 10:12:14 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49041e84237so4665045e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 03:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780481530; x=1781086330; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pIaWOz4jzomrlICte653zCUp4/MwcwzwiqZTiopmMBg=;
        b=cvK7Hn4pcVKLChReq+7O/AHcj/4Sb8jj4pY6zikuIFNqPC0eODW8/MyFD+/6ksHn11
         RR4hZZy5Rvuo5YLLEG6viklWA4h7fe0fTnC3TIBRqm9lsq8SNd6PYOYJTqKbdOZ9vrv9
         U5UGZaLgoGi+vODfTYQMFwEMX6pu/KxCLpWxQb90ZLBOO7OxuOG1u1Ank3bj9egvGylN
         MgOux+1yqDPM/xb3O9eGdd9Q/Zdg54xDVY+kDscMFhdU84fyeZNz3x/acEXA7jO4Qwxu
         qbOtkeQOBhTRp2VPBCPS6rK2SAWgg3bLf16mlzewa4eu7/vJVgSciMrP7hYFBCh8vF4W
         ywNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481530; x=1781086330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIaWOz4jzomrlICte653zCUp4/MwcwzwiqZTiopmMBg=;
        b=Q/FEVpeJ1hsZewQDzFM39c2I20mNOIvf6dUxrapaXPWNm62o6EMw21iOJJ2nImHaOx
         kCx7VoE91taBYj6/NHsmLNqnSlZ10ZPihZiSQW5H7qd1hJc5dx9IF10pxNSIjR1uh3F+
         Xh/LEVgu5I/4ds/ImkYtjiPHmFoO6spL24jIITIdPAztNxsNboIynOaLULmC4OzOcKgn
         ESL7onlb3oB8u6Pg51nnQVx4ZpDjZ+JK1ilXLRA2ToFE8y2pc9GAz3kmeENUJPXsaAe/
         34mrenWDtfSpQQjgz88vrCAqux6KtjROvcj68/Aa1Izsk1tyYgl4XIMZErEPMjCre1fS
         q4Xg==
X-Forwarded-Encrypted: i=1; AFNElJ9IuNPYxdNKi6NPnoc0W81xPuwV2wd0PgYg0AItAkCacCTh7eMHDZtZLxqghcRlv9D4L4MXcl3M8fUDuPlfYaKn@lists.infradead.org
X-Gm-Message-State: AOJu0YyMDbW5LcjHObwWY8inxbKzwipVfkAw8svufbtpIP5plnrRPRv7
	z3H3ZNmEkCPYcLa2Ndeca3JPeCqu2fU/4YuWMnFxefsoqMOTRHnPdUFlNtqWbOTB3A==
X-Gm-Gg: Acq92OGQFGapWxTOumtC7HEhekMtif3KUKKtPxeuvzRfmd1zZd9I53aMwatFSnGaEja
	TXFFFOdhPgiqeePDVOfz2TqOfjFdi07mis3F7oj5CMWceOBzeVTioviy9jD6uOE1l91QAZRkSfT
	zdaAit2/cevt2qDnbPB/4LHagniDo8/pZsF2LvhqXGKlwGP5S3eUcsRBuYx2DlZkCrgJRKOn8CK
	jYnq5BGOdWG4S0NnHIq+CInuqVZOsnQf45/aC00v7RrYf/ShBemk17voJoKBxXTR1FCfFBQRpke
	1XWP9LujHclU5MuMt37lhYEe3PNCogutkMCXOJohhZpYQO/3bsgt4rIn0BL7FHWQFiYbaEf+6Cw
	DC6CPTY2IS4+7G9epv2pOCPntPiNevlXlN435StY7EBs1nwYd8Xe4FIFL2dADrZt2JHtoCyrLYs
	LQX+D79a5NDW90UQdr9fzobA6wNOWsfDwUYrwxxUJSpFw0OwgRG7OozLStJJpVchNDH5CjVIBZd
	vTdYMrvJW6LBw5b
X-Received: by 2002:a05:600c:8488:b0:490:b4cb:3866 with SMTP id 5b1f17b1804b1-490b613f181mr34363835e9.10.1780481530006;
        Wed, 03 Jun 2026 03:12:10 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63e63d7sm51863845e9.12.2026.06.03.03.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:12:09 -0700 (PDT)
Date: Wed, 3 Jun 2026 11:12:05 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: tabba@google.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Perret <qperret@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] KVM: arm64: Fix host/hyp tracking on
 share/unshare hypercall failure
Message-ID: <ah_99d29qLuQey35@google.com>
References: <20260529121755.2923500-1-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529121755.2923500-1-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_111213_158354_8FB6E2F1 
X-CRM114-Status: GOOD (  22.71  )
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

On Fri, May 29, 2026 at 01:17:52PM +0100, tabba@google.com wrote:
> Hi folks,
> 
> The first two started as bugs I found testing Sashiko locally with
> fixes to review-prompts. The third grew out of the v1 discussion.
> 
> share_pfn_hyp() and unshare_pfn_hyp() in arch/arm64/kvm/mmu.c maintain
> a host-side RB-tree mirroring the set of pages shared with EL2. The
> hypercalls they wrap can fail (page-state mismatch, EL2 refcount still
> held), and neither the per-pfn helpers nor the multi-page wrappers
> cleaned up correctly on failure:
> 
> - share_pfn_hyp() left its tracking node in the tree on failure,
>   leaking the allocation and presenting a phantom share to a later
>   unshare (patch 1).
> 
> - unshare_pfn_hyp() erased its tracking node before the hypercall, so
>   on failure the host lost its record while EL2 still owned the share
>   (patch 2).
> 
> - kvm_share_hyp() returned on the first per-page failure, stranding the
>   pages already shared by that call: the caller treats the whole range
>   as failed and never unshares them (patch 3).
> 
> As Vincent and Marc noted on v1, none of this compromises isolation. A
> page that cannot be unshared is simply leaked: it stays shared with the
> hypervisor and is no longer reusable for pKVM. So kvm_share_hyp() now
> rolls back on failure, and the unshare WARN_ON()s are left non-fatal
> and documented rather than promoted to BUG_ON(). The system keeps
> running, and only later pKVM reuse of a leaked page would fail. We do
> not expect any of these paths to trigger in practice.
> 
> Severity is low and this can wait for 7.2. Patch 3 builds on patch 2,
> otherwise they are independent.
> 
> Changes since v1:
>  - New patch 3: roll back partial shares in kvm_share_hyp(); document
>    the deliberate leak-on-WARN in kvm_unshare_hyp() (Vincent, Marc).
>  - Patches 1 and 2 functionally unchanged (patch 2 gains the call-site
>    comment).
>  - v1: https://lore.kernel.org/all/20260529074341.2271950-1-tabba@google.com/
> 
> Cheers,
> /fuad

For the whole series:

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> 
> Fuad Tabba (3):
>   KVM: arm64: Free hyp-share tracking node when share hypercall fails
>   KVM: arm64: Avoid host/hyp share desync on unshare hypercall failure
>   KVM: arm64: Roll back partial shares on kvm_share_hyp() failure
> 
>  arch/arm64/kvm/mmu.c | 39 +++++++++++++++++++++++++++++++++------
>  1 file changed, 33 insertions(+), 6 deletions(-)
> 
> -- 
> 2.54.0.929.g9b7fa37559-goog
> 

