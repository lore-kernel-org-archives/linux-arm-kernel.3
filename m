Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A66D26D9D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 21:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LFMBQzdDTLfWqkoGaZyXGViff4oWj13kcQX+84aEuA=; b=VO8hBEt/cBgngroeV3FcDM4/W4
	HyXCHgeZ5XGyVKCfmpn2219wThgVI++Rffs1kVYpwcDQOG2AXM+n1mCDYHKqLZG18QImow80NB40i
	3v5G/cM1wkiP+6kDD8hh3GKneZJWvnH0IGezs7JyYor2DAl5gaNhBtPzFp28YpoBcHLdhNNtTfPAb
	0OhlfdbtMBpPWcMyxoIgsaph8gPeKBfOnmnOWMVrkDNfu0lrlhQ63pWUzjsqn42bazWepJ+/uxXzY
	IHSSgUxs+CMRdZrYN8w1jv44o5XqYWMh6+kTD/XWeF5WQtnra1ZwwAl/M54aOBYdnkUm4DZyRE7BV
	UH+67hNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veK4t-000000032eN-0UrG;
	Fri, 09 Jan 2026 21:31:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veK4q-000000032e3-3QNs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 21:31:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DD7843CDF;
	Fri,  9 Jan 2026 21:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F79AC4CEF1;
	Fri,  9 Jan 2026 21:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767994281;
	bh=kq8S9JdN8FGOJKkpL5NhMseCIdC2kUO48b6ShMtmxL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tt5q7SYS1QP0werGlT0XfqxlQ7tp1p9QFQVjBqljsH2jII8zDxwvyNZmOSGo09E0G
	 xRaMBLWoREvurv2okuLk1tAUCExEGUukTxbV7NQP1WnriSu3sZal+dwPO3NLzOz1F6
	 5C2fHUKsdtuSk0MnCigttgXFsVoMdC5d5LWzxDprLO4LYocfJrvTypfVMxOwYhZC7x
	 8qwHKK79YnLBcy9eCWdDB5HG19LpRjbXqJZcQ4+NKJ7B6RbDzW4YFS1sO+JOlUgKZR
	 Cl6YUEKD1fPMvcSwnT1o49+VVQggILE+uPtwXYYREXxch7K1oJjI1kM+sXThr2bJ2Z
	 BINlhpYka1l8A==
From: Conor Dooley <conor@kernel.org>
To: arnd@arndb.de,
	catalin.marinas@arm.com,
	conor@kernel.org,
	Jonathan.Cameron@huawei.com,
	will@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Yushan Wang <wangyushan12@huawei.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linuxarm@huawei.com,
	liuyonglong@huawei.com,
	prime.zeng@hisilicon.com,
	fanghao11@huawei.com,
	wangzhou1@hisilicon.com
Subject: Re: [PATCH] MAINTAINERS: Add myself as maintainer of hisi_soc_hha
Date: Fri,  9 Jan 2026 21:31:01 +0000
Message-ID: <20260109-overeater-underfoot-f832469e0a5e@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108133128.777813-1-wangyushan12@huawei.com>
References: <20260108133128.777813-1-wangyushan12@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=336; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=h7GO3dleLkvfqRjrlK8rjVyU/kB/RLFd2g6mJq9C6Xw=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJmJxbPPMwVw7LefI2C8nIX7/ZWWu3eZbthx7zZ7xJOc8 UF8CZdcRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbCtoiR4cEXU//rl0K5d5/u sbn16WlP9bfAWxOOfz81q7vy2t4SJXeG32y6qzILz92a9TPx+uW7Z9WjT7b9yIo77ahqmDfxZ5W WMw8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_133124_879570_28119E3C 
X-CRM114-Status: UNSURE (   6.26  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 08 Jan 2026 21:31:28 +0800, Yushan Wang wrote:
> Add myself as maintainer of HiSilicon SoC HHA driver as I will be
> responsible for this driver.
> 
> 

Applied to cache-for-next, thanks!

[1/1] MAINTAINERS: Add myself as maintainer of hisi_soc_hha
      https://git.kernel.org/conor/c/015f1bea6fc1

Thanks,
Conor.

