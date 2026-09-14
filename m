Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA53C88E65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VD5+dnKwxN3gQ837DuD8GmCLdkSGJUHg5yksucA26Ws=; b=Q/OHQnPg9IJLE4dDqjTRY3kjr3
	LVqzdHCa6CBMm1K0TsT9HGMDbMrUox4UcJZcA5mQ9CdlheDNSIMwVFCuSzGcE+YL2rFb6+30W/baM
	nLSL1DPO3VAbVeEtdfYmrOqai/wmHiEiWn0AP4sknxTOp2HId5ZnsrMPiK0qqOWbcPZWa3njoFc7D
	HlLY3zQdGN6ZuWoAACqyO39WQBhKc8wTPH6PupEMMBvqsTonL5bC/+tUd23OsEn02YcoOY+Klsb4K
	FYPYKDER9XWZBBCt7f2PGY02szpC6x3NTQy8F3ecAj0kYvhJrD5Mir4m9+8VOxtRlxlgCAnNFXa6Z
	H3JgWPqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x647j-00000003Ale-2X2A;
	Mon, 14 Sep 2026 10:41:19 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x647h-00000003Akd-1B9S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VD5+dnKwxN3gQ837DuD8GmCLdkSGJUHg5yksucA26Ws=; b=ts8EaFngOdljHS6oD+Lktxvm6i
	ZsRmoTdkxEyt5HW0rYKBAeQ0yzYn5zzjiokXYmHM4Bxz7YYK+aDk+k6n1p5+ceacoasfsdd1QDmEo
	Z36xzbouEs8+37FhrezG1YVUDXyemEdFmtiWmEIzB1cdZcWSIQsKo0apu7tNAXmrGvTJ6+q3xJbrd
	B112129JJoZBKipZRuKTUvwXRqx7b/EpRoqbcJyMqgZ3hMP692a2hia1gnZdS1lq8gS7ghJVQxlN2
	KpeEakJp+Nvtw1ch3qeF4fzAa30clb3vJAgrcx+olhY9YRBa8CbYK/5M71VlEO5caAxq+QRFFAKgm
	eR5p+nnQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x647Z-003Yeh-1O;
	Mon, 14 Sep 2026 10:41:09 +0000
Date: Mon, 14 Sep 2026 03:41:04 -0700
From: Breno Leitao <leitao@debian.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org, 
	praan@google.com, kevin.tian@intel.com, smostafa@google.com, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	jamien@nvidia.com, kas@kernel.org
Subject: Re: [PATCH v10 00/13] iommu/arm-smmu-v3: Adopt the crashed kernel's
 stream table for kdump
Message-ID: <aqfPKIeO4lWCHlQ3@gmail.com>
References: <cover.1788130528.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1788130528.git.nicolinc@nvidia.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_034117_316994_9E0CB13E 
X-CRM114-Status: UNSURE (   6.87  )
X-CRM114-Notice: Please train this message.
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

On Sun, Aug 30, 2026 at 04:18:01PM -0700, Nicolin Chen wrote:
> To safely absorb in-flight DMA, the kdump kernel must leave SMMUEN=1 intact
> and avoid modifying STRTAB_BASE. This allows HW to continue translating in-
> flight DMA using the crashed kernel's page tables until the endpoint device
> drivers probe and quiesce their respective hardware.

For the whole series:

Tested-by: Breno Leitao <leitao@kernel.org>

