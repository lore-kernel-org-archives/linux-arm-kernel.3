Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452CEC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 19:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91R3l1V/uOl03V126v1cFNRh0hJ1Q8Z9vQ2ulIXNDfU=; b=FL0pbkWkX06Cb6Zankhaq5nHFf
	8wU534/J68h1B8ltgyNciY2+QM3jVJgcw3Vi8ZtJFiJBl+FmWJMpMiXOZenQEqHwHq+42mqgZpJLt
	F9svr+HL9sEHU5AypJkBatnInQP0643HrToBbh1Dmv9SGRZBVxNVS9d5STFSY1weZn0dL8ZQYeIAG
	5AiwUsQR/j3MpxBMYJJrk6qsuUUU/pwrgZ1yjg3+CseehYuU4mH/LLuyywOyMdRHwphmVAyWyvK6M
	h0gXzRWkAtekFJq3uwGgNcs5MIXAhkqhpY1I+lktoe73BjxJhjdZLwy2cn6fnZFPswFTCv7+j68em
	ETKWLfIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzfVK-00000004gNj-0yKu;
	Thu, 27 Aug 2026 19:11:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzfVH-00000004gNU-3Rx2;
	Thu, 27 Aug 2026 19:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=91R3l1V/uOl03V126v1cFNRh0hJ1Q8Z9vQ2ulIXNDfU=; b=gyBqQhQWSUlpKmkDdVZfEWq4jC
	6Hn05OsO+eGBDUz0AAmCUEB8dWDSJmRIrRRmJjlK6HFS+x9kWb9Lu9gWKzDjol1WfGMTi7t7NMIN0
	VWiiU82QKosQg/iEoVdatEQU1vueasyXko0mWYU4KN2egNMRYMsj6pLR75wquzW36Ad9tlRcEAbeZ
	HfI+ZL/4ygNnv+qG3c7nh5elZzcg+I+63ohE3j5fqgx39c2GRiCbrmcRZrXHx4aBN6AFfeFLxeLpn
	9kNSe8uFVHwuGrBkfCU7MPZ6YyE27qsmSJf+8cf+peQXfCmqIg5VU63anBDtlkGHfABhRaSUqgTLe
	1bQfMvzw==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzfVF-0000000DNOM-0LZD;
	Thu, 27 Aug 2026 19:11:09 +0000
Date: Thu, 27 Aug 2026 20:11:08 +0100
From: Matthew Wilcox <willy@infradead.org>
To: artem.kuzin@huawei.com
Cc: catalin.marinas@arm.com, akpm@linux-foundation.org, david@kernel.org,
	ljs@kernel.org, vbabka@kernel.org, cl@gentwo.org,
	linux@armlinux.org.uk, will@kernel.org, mark.rutland@arm.com,
	liam@infradead.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com,
	panov.nikita@huawei.com
Subject: Re: [RFC PATCH 00/18] mm: arm64: Add kernel replication feature
Message-ID: <apCLzAaw6oRIqbSH@casper.infradead.org>
References: <20260827161158.3618409-1-panov.nikita@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827161158.3618409-1-panov.nikita@huawei.com>
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

On Fri, Aug 28, 2026 at 12:11:40AM +0800, Nikita Panov wrote:
> There were several prior submissions with some sort of replication
> for NUMA systems, including one from our side for the x86_64 platform.
> In the last couple years, several research articles related to solving
> locality issues on NUMA machines through replication emerged as well.

You're lumping a lot of different NUMA replication things together in
your list.  That doesn't give me confidence you know what you're doing.

I *think* what you're doing here is kernel text replication.  Other
architectures (mips, arm) have managed to do this without core MM
changes.  Why can't you?

