Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CFEC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JIYSRvzS+lTZK1y1XxDKW9rrYSsqjNnfXKv1cTCBldM=; b=ha8hLe0y3e6MH7O95NuH3MqBqr
	fFwe2ZqkAXTQXjkt6q+j8fUizLrzqNFoej02tALTMOsEszMeALi90l2xT++tbM23xhpuk9guUxBvX
	ou1iPqoFROWbDJG1Zp2dn9BAmjU5ib1kwwOfzTI95FXmq9+Cq3ZWxUWHdPO4d8TcZm/L5h7iXS3lA
	yjC9WZiRRJLehSpleIFl8qtFF+yeHYdFgD8a1HPXGJPbHsKJLslyA1gn1bApEmtrMOsJNZW8i4Pfz
	v3+UqzPQBLZEV4GEBIRgwjMiKFWxpKg8CYFWYJjF3TqflyxpeHcK00DVpDUDMLMOF9lb0sYvZyaUH
	C+bB+6Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zPe-00000005Hbh-2g1T;
	Tue, 22 Sep 2026 12:15:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8zPd-00000005HbU-2P4F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:15:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F05441600;
	Tue, 22 Sep 2026 12:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9C51F00893;
	Tue, 22 Sep 2026 12:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790079352;
	bh=JIYSRvzS+lTZK1y1XxDKW9rrYSsqjNnfXKv1cTCBldM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fj4Nz8fBrlIMtPAwuvyzWYgk2LXF8Lpt0kYzJikISSS2f0gxq5cu91MkPgMyWhjmi
	 TYz4m2gkgQqLrmbKjfBYcSmLKtH9wodN2/Y73RJQFK/57b5LQAdtG2hb2KfS+yWqCf
	 uNGH+Od6166rVnHDSiH0YgzkLIKrgic57G4b6NwkebXfJEq90QcRbBTIoiN+jCNjab
	 YExQKEHAAB7yOuSq+JSzzcGGcPv8ESaG5JOBvLB4k0H0oXfFsb46GRQRjewGO8R2SG
	 3PR5daWjK6PZ94j72UK/IRJGiA/l4632P8gg4blm110z9uU7grk6wVndtuhCAc7xSE
	 9eHOmJN2e4u4g==
Date: Tue, 22 Sep 2026 13:15:48 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Snehal Koukuntla <snehalreddy@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Will Deacon <will@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: arm_ffa: Add FFA_FN64_MEM_RECLAIM2
 function ID
Message-ID: <20260922-chubby-cicada-of-exercise-bbb429@sudeepholla>
References: <20260921164748.2958578-1-snehalreddy@google.com>
 <20260921164748.2958578-2-snehalreddy@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921164748.2958578-2-snehalreddy@google.com>
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

On Mon, Sep 21, 2026 at 04:47:47PM +0000, Snehal Koukuntla wrote:
> FF-A v1.3 ALP5 (DEN0140 rev J) introduces the optional FFA_MEM_RECLAIM2
> (0xC4000091) ABI, which enables an Owner to reclaim exclusive access to
> a subset of pages of a memory region without requiring the Relayer to
> maintain intermediate transaction state.
> 
> Add the FFA_FN64_MEM_RECLAIM2 function ID definition to arm_ffa.h.
> 

Since the spec is still at ALPHA, I suggest to add RFC in the subject
if you post newer version so that it is *NOT* considered for merging
until spec reaches *BETA*.

-- 
Regards,
Sudeep

