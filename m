Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FF8C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzaVQgmUjj3yboNck6ZN7uxKTqD/GTSC4SxoAn0RljA=; b=cR4MCBnI3tgm8ejyXuS0qGPLuZ
	mweklu0+Nnr/SogfZCmeC8hae1imOjH+BUdXM43/l+XenYDywXLTOGk6xcRvR9Avuaxar8xQeSRZb
	rEsj74Tb7s+04Q97JUM4wbEC3tNrii3Q43HbEkC/ABPcuEHR1QnmMwH5p/ZE7hB0htfItq6bodCrH
	oBzSq1dae80ieZH7Jv7TQDDy1LhtdbIXRKy+nawDgLR/d5DHKGgIJHqr/Fa7j+ekLtH6yrnOMcTc4
	24TQXNIYoSPo/MAdHaiHvVgNyUK07BjBfYFv1vfUA9DxHNq3GoPLsBUdvc7Blri2xlz4E8gO4JkxF
	er1D6L0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxU5-00000003xAg-28Y5;
	Fri, 16 May 2025 16:00:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFx8J-00000003scH-0FmM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 15:37:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DCCE62A61;
	Fri, 16 May 2025 15:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F9BC4CEE4;
	Fri, 16 May 2025 15:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747409878;
	bh=QQKk6g3yLr+R2BFA9IAkVDHQuBoMLpMsNvn/ihr3ZD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kWBl02GXfhE5oumlw0PWfw+NyXYGdfHVPzBrZ/+vnEOrhMIA23KwmnQGmEQO0gZXC
	 T+U9c/dUqBJfv3k+43gfle4oGatHZ6gQBOn1xrZPp0kkZm72Oc1JMiyV0fnhVCsSpU
	 guiZ61ZUNhP81KUVWHxdyTDuTd5Yl3m6wmvAsaLurngtyJ8YmUQvklfVd0p6iNPcSd
	 MTP8XI5btzvyARVjhvBzAtWDZSaE1K/CA4sCQFqXNoY2A8tk0nHc0JrhyK3wf/2nuD
	 hUpNJgA6JArfHH+2weyGdimSbr9Djv+SRKWG+spdaJO1CYax7ezrxsY30Wn3K0DEgL
	 jzUl1G3ixOE5Q==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Ben Horgan <ben.horgan@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] arm64: Update comment regarding values in __boot_cpu_mode
Date: Fri, 16 May 2025 16:37:45 +0100
Message-Id: <174740474202.2576553.17992016241320510860.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250513124525.677736-1-ben.horgan@arm.com>
References: <20250513124525.677736-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 13 May 2025 13:45:25 +0100, Ben Horgan wrote:
> The values stored in __boot_cpu_mode were changed without updating the
> comment. Rectify that.
> 
> 

Applied to arm64 (for-next/entry), thanks!

[1/1] arm64: Update comment regarding values in __boot_cpu_mode
      https://git.kernel.org/arm64/c/694f574f741a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

