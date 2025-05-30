Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF63C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 21:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=si3SF9j/QxcYzVc63Fo3LxDqAOFGuYFt7AY4pyNbzVM=; b=k/pLQNkFt1wI1fj328OVbbcfzK
	4g/fVfduqK/Zo1LNQ9qmypl6Ljdcshaeqldkw1Hd2D6rACxq4aAC7Zvp2R5HOHedHKV8Q9Bqg5bMh
	lmh3Qpvibm+Gmb/lganX5QqaU1nWgRJt7HIA1LX1l6UW5Gq2y+oYzxuehL68CDUgzJeU8IiXZuyP7
	dF7Or/NcgyshWmHIlSw033R+tIg3uvBVD1dZd2nL6hAOcqF7Z+eBH6tgELFVXkUOh5zY4BUJ6qn65
	Q0nQno4cssJHUN3R2Wt5thPeTwjxSkUv79FFikG/HKv5GPCCtoQSxU57ny/2DsOuRzPcmnvOxGcnF
	/sdPqYIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL7Ng-00000001wsV-3aQR;
	Fri, 30 May 2025 21:35:12 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL7LG-00000001wLD-2b6y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 21:32:43 +0000
Date: Fri, 30 May 2025 14:32:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748640757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=si3SF9j/QxcYzVc63Fo3LxDqAOFGuYFt7AY4pyNbzVM=;
	b=pcjmdGSUBNikrhQQdswudi4WL4piT3kKmievAcCgqON0yv4eo8GFaDENd/gmgCoKtpaVpN
	WzAyvh8W84zwzl4tTvYflOLaJ556bWoEr3Bm41omgPYplmLHdXdQHW7W0sknPJtejTnbEx
	WukuBvJXUV2MXAcV/mvlVuSo8sy0Gpo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, seanjc@google.com,
	darren@os.amperecomputing.com
Subject: Re: [RFC PATCH v2 0/9] KVM: Enable Nested Virt selftests
Message-ID: <aDoj6DjbISGQFwbd@linux.dev>
References: <20250512105251.577874-1-gankulkarni@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512105251.577874-1-gankulkarni@os.amperecomputing.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_143242_863775_F5B79B5E 
X-CRM114-Status: GOOD (  11.55  )
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

Hi Ganapat,

On Mon, May 12, 2025 at 03:52:42AM -0700, Ganapatrao Kulkarni wrote:
> This patch series makes the selftest work with NV enabled. The guest code
> is run in vEL2 instead of EL1. We add a command line option to enable
> testing of NV. The NV tests are disabled by default.
> 
> Modified around 12 selftests in this series.

Thanks for sharing this, we sorely need testing for NV.

I haven't looked at these patches thoroughly but I have some overall
feedback. What I'd like to see is that we force *all* KVM selftests
to run in VHE EL2 without an opt-in/opt-out. The user had to boot their
kernel with kvm-arm.mode=nested, so imposing NV testing on them feels
reasonable.

Thanks,
Oliver

