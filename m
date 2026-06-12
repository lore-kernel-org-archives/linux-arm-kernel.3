Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420F0CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 23:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4Z6iPCoEVif5czqX7mpOnEGf86eCdSIsJaNrDC+CNs=; b=UWOvmH50YkpMZA9u/KhgkkMiwc
	D/aK8qZI/l8BZ2sdYzdJj7KBxj3t5zQFBrr/dGl93HcBicGTGH/lj1kpO7uebPN/ao9T/Eue5TnwL
	1PL9vFaUcwrjtoa0y66jJ4rEwcl++jHVEgL4ln0sBEjDP7zDiS09TTauaguBLO5DgliMTGxnjSI/J
	LzzGArsqZ6HPdewKD9QI5IAgtTP4xNfvvvdsoOgdDEDLAHOkCjbvrA0gwhdtTbXhqrkvl3cInsHez
	hvcrFJTOSyJTS7DjOT1f0zOwZBYljtRxPhxXKz4bT7heuyciiuQukWWHAUThOOm3In36RKGrYrELN
	tjgZSr5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYAyV-0000000BjwF-2tNO;
	Fri, 12 Jun 2026 23:07:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYAyT-0000000Bjw0-3G7P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 23:07:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 43D9043FE4;
	Fri, 12 Jun 2026 23:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 238EE1F00A3D;
	Fri, 12 Jun 2026 23:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781305661;
	bh=l4Z6iPCoEVif5czqX7mpOnEGf86eCdSIsJaNrDC+CNs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=a17gwCrfd6vGLIr9o7ocQWB8yED4dumZYT1bcPsAcP0zxi7uH9swCs0Hume9vvyMZ
	 GPChiMZ3ClFFffdyym8c/OSAoMoO8fqfknGIpynYwKhPuQMPKu80PflMlMvMgUy0O1
	 +TcW6YWg/moGnwUwQRj9ahHQIszFKkQFz7cictCJXRaYSgTGM/zSFKr/W2y3IbGO7w
	 CWkNViXkTWqgyAPnCfFfYxOtfrm52G0y7Nh17Xpt9VxUDAWjuK624UQKhg3EFh3SNB
	 HJ99ubusY32W/5Zw05LBcxOhVBS9Qe0567FEv4fix4DiBje+pjEmex0/FN1046pW0d
	 nz2bjmXs7yh2g==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5C9B0F4006A;
	Fri, 12 Jun 2026 19:07:39 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 12 Jun 2026 19:07:39 -0400
X-ME-Sender: <xms:O5EsasWXLEW7BfEs00q2LOU9UGNxJD8cSyX8hmuNQw6AjmRdF9fjqg>
    <xme:O5EsauDizZYmqNrKG1kG7XvyhWVjSF-XTC2CAzI1HcX2RJkVGSdX2p8IWW5WD4VsJ
    SdkkiTQB44YrKdpeLAmbtCMthxV8ac7Uw-ZwfiZYvjLEcY3EyvLuyQ>
X-ME-Received: <xmr:O5EsagWVT7RSGKTAb2dRsQ753FoYwqJVH5pl_ky2k-XpQPdMjviWPxKxCJQheRyhGJb0wiAI1S-0GXFJUT2sz-213Xqnx7xQvsg>
X-ME-Proxy-Cause: dmFkZTEJDXZbVWi1dWDhXfR3V8OFIFiukzmdYSaS1v+Di3g5XrlCcZQ2QlKQoSOmWsLUgI
    fFYKOPBvXSD2ZDBY5QNO9ZOLn4eJl4GE23lbKDOq9+RQnuQznFY+fZe2+MOTgIWBnUIR5c
    ngPc3VFH7ztEHkppv8h4DL/BcASSCwg+98kWriWtVY2EdphbtpA4jwK+n/gNLhr985JXpV
    +wCZ4KiAal7aBY0rnSZmnNYNkmEmzhTnfb56Ezfu6V39YKqbO1wtNlmYEzB20t5yaXEQDr
    VvT7qPO88nnScuZGDmAjNdUC4T2R3ssLj+NJikJAwvx/9Jvnz0VW9GvTyn8bW1OyQ5DNsb
    aL1Io+iSKFP9VyhFtluoCMXLJ1J99LlVqAbTC69H04hf4ASy496Hfl9japnmqVgoUHhXhL
    5G6bFTlaIqCLCnTvM/KaqRqVntbjZtTtrhdynyW5KPUtVanarfQRLdydRQ1Q3uaCMX6CXX
    Xl6E86OWrLbEUcHk+0JUrOM8o3CaMfdulStNuOtYNdihXP1YjItSJGiTLUq817GD0JNEm9
    lo4QflSOqWvm9DspG1du14Vhh5Ec0T0gB/+Pxt09JU+vhhQPpJ6qamChF5Ry85Y+9SGcq3
    vs0yMtOD8M8QXLdjNJ3bYO+TUItd3ggWkvxH3zvl8lCB17ryr3QvFTpU/onw
X-ME-Proxy: <xmx:O5Esas-JpWaqtyuBUxQT17fhEmc3A2gP3VDEOKrFGwXRkHyq0BMdcQ>
    <xmx:O5Esamn_4yVPWbvirZegfSCN5xEHFNBrHWG6QTUL705GNOar8dJ0Vg>
    <xmx:O5EsanJHtm2vJS5foGBWbQl6rGnD6xB-Avd9YnSlmzhuzZfeVr1aSg>
    <xmx:O5EsaspAtn0tZxi8290aSDSph_1CT0x4Te6T-uEEdVr03kyGmBSGiQ>
    <xmx:O5EsakRxFm_NX6lZNtxUMm8ycxZvTjj1Vziuk8xPU7epbDt4FN8vifXD>
Feedback-ID: i67ae4b3e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Jun 2026 19:07:38 -0400 (EDT)
Date: Fri, 12 Jun 2026 16:07:37 -0700
From: "Dan Williams (nvidia)" <djbw@kernel.org>
To: Steven Price <steven.price@arm.com>, 
 Gavin Shan <gshan@redhat.com>, 
 kvm@vger.kernel.org, 
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Marc Zyngier <maz@kernel.org>, 
 Will Deacon <will@kernel.org>, 
 James Morse <james.morse@arm.com>, 
 Oliver Upton <oliver.upton@linux.dev>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Joey Gouly <joey.gouly@arm.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Christoffer Dall <christoffer.dall@arm.com>, 
 Fuad Tabba <tabba@google.com>, 
 linux-coco@lists.linux.dev, 
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
 Shanker Donthineni <sdonthineni@nvidia.com>, 
 Alper Gun <alpergun@google.com>, 
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
 Emi Kisanuki <fj0570is@fujitsu.com>, 
 Vishal Annapurve <vannapurve@google.com>, 
 WeiLin.Chang@arm.com, 
 Lorenzo.Pieralisi2@arm.com
Message-ID: <6a2c91398fad5_a003b10027@djbw-dev.notmuch>
In-Reply-To: <50d70588-2ebc-4c9b-98ec-68f3d04a9d21@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-11-steven.price@arm.com>
 <872ce762-0a83-42a4-bbe8-b21ea6f4e1cf@redhat.com>
 <50d70588-2ebc-4c9b-98ec-68f3d04a9d21@arm.com>
Subject: Re: [PATCH v14 10/44] arm64: RMI: Add support for SRO
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
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

Steven Price wrote:
[..]
> > alloc_pages_exact() will fail if the requested size exceeds the maximal
> > allowed
> > size (1 << MAX_PAGE_ORDER). The maximal size is usually smaller than
> > PUD_SIZE
> > but PUD_SIZE is allowed by the RMM.
> 
> This is an area where to be honest I'm really not sure what to do.
> Technically the RMM is allowed to ask for a contiguous range of 512GB
> pages (on a 4K system - larger with larger page sizes) - but clearly no
> real OS is going to be able to provide anything like that.
> 
> In practise we don't expect the RMM to do anything so crazy. It's not
> really clear to be whether even 2MB (PMD_SIZE) is needed. But the spec
> is written to be generic.
> 
> So my current approach is to calculate the required size and pass it
> into alloc_pages_exact(). For "stupidly large" values this will fail and
> Linux just doesn't support an RMM which attempts this. If there is ever
> a usecase which needs this then we'd need to find a different method of
> providing the memory (most likely some form of carveout to avoid
> fragmentation). But my view is we should wait for that usecase to be
> identified first.

Just some comparison comments as I am also going through the TDX patches
which enable "Extension SEAMCALLs". These new SEAMCALLs are similar to
the SRO mechanism [1].

TDX asks for an upfront delegation of memory at init time using
alloc_contig_pages() that is never returned until entire module is
shutdown. alloc_contig_pages() is not subject to the MAX_ORDER limit,
but not sure that alloc_contig_pages() is suitable for small+dynamic
runtime memory add / release that SRO potentially wants to do?

Does SRO always balance the size of RMI_OP_MEM_REQ_DONATE with
RMI_OP_MEM_REQ_RECLAIM, or might some donate requests be a one way
donation like TDX? Just poking to see if there is a path to preallocate
a pool vs the fine grained per-operation alloc/free.

[1]: http://lore.kernel.org/20260522034128.3144354-3-yilun.xu@linux.intel.com

