Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AB6C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 10:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/1p2IYCyp75jiiPs5nQsnCdxcy917exhcMFmdMkG1E=; b=1BtQ6GGmCcmsPidSKPFsn62taJ
	8KU6E61iuwN8wI4d2IKfBqyzDpqSuBVaPq4+OY3ZkrNtr8j+QdnP0puLIyScBghjIO5Wxqj8DIRF5
	+ohYmBDrM91hZRJ3yOWW4RKBDPHaBRkptzk797U6Iz2L7UbeygRFL+XNmqNZfSuE2bfbhnrUv8f1x
	NX7C9mV8Riabpxdw4KaeV+IlaFNvQwXBa4wduAVpB4xMcv927JXmWCDPklUSXnTMn+N1lmRI081o4
	h9QetZUVjNb+yRit46gHh+c1VoMzGnegLXuW2npZTA1wol1AwfjLVQNfsniE5mtPBTsj7pwu+2K8D
	rOm0b7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI38y-00000000hHz-48NR;
	Thu, 22 May 2025 10:27:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI36u-00000000gt5-0usD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 10:25:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 137745C5633;
	Thu, 22 May 2025 10:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34090C4CEED;
	Thu, 22 May 2025 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747909510;
	bh=9/1p2IYCyp75jiiPs5nQsnCdxcy917exhcMFmdMkG1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b5pHahLAzrgZmTpWA+9e1ow/jOZ3FUjPLlUNAjwA6b6hjUsHVCmWvxwxn3mZb//Wt
	 Ibb0h/ZAsMwTve4dV/icFCCuVv5+jbBId4JUJuKyAKhZRNBkax3mczqR0XAQ9pAyN2
	 aftx0NiehHi7eI2hBWbedRj4sNkFnUOtt7WncIr879LRma9KvDSDDiM7zpW6cDYUZM
	 Har/FUTJ0VbshKv5GPL8EKklUWu9mMEHc9SgKw92uPJag0R3SFYDcyXNTTWocHaGTX
	 zx74Pk7RFQqPwwiHgzTyHSLfHMCyn7TFSZ4/tqAb4cdGLwWofsV+sgb52Y2Clys73Q
	 DmhmfoGwPhOXA==
Date: Thu, 22 May 2025 11:25:03 +0100
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com, acme@kernel.org, namhyung@kernel.org,
	peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
	jolsa@kernel.org, john.g.garry@oracle.com, james.clark@linaro.org,
	leo.yan@linux.dev, irogers@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, yangyicong@hisilicon.com,
	jonathan.cameron@huawei.com, hejunhao3@huawei.com,
	linuxarm@huawei.com, wangyushan12@huawei.com, caijingtao@huawei.com,
	xueshan2@huawei.com, prime.zeng@hisilicon.com
Subject: Re: [PATCH v2 1/3] arm64: cputype: Add cputype definition for HIP12
Message-ID: <20250522102503.GB21627@willie-the-truck>
References: <20250425033845.57671-1-yangyicong@huawei.com>
 <20250425033845.57671-2-yangyicong@huawei.com>
 <557c852c-3c21-130f-c096-2d09052e04ef@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <557c852c-3c21-130f-c096-2d09052e04ef@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_032512_297996_6097B831 
X-CRM114-Status: UNSURE (   7.53  )
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

On Thu, May 22, 2025 at 05:13:25PM +0800, Yicong Yang wrote:
> would you mind taking this kernel change? we'll add this in the userspace tools' cputype.h and this
> patch is aimed to synchronize the update in the kernel.

Sure, I'll grab it now...

Will

