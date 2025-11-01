Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51323CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 01:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABUDdk1Usc9fX4YsALDLoAC6ksakhsF7viib7Uv/BEw=; b=z82tZnB65sy4ZkLTlMeGSbNIuk
	cZzDPJ1BU4bXiPHFQvMfuKg8dVOkbQtaPWe1eznMxsOCpquIhW7uVwp1PlD0Q4ktIIDC/0k2yKHso
	X6tVEakqsKHeXQiCVXVLtIVaWjizMIdohTCoRd/mO/gs0Sq7bThv8DNpT1geKde11PHtaUhToW8SF
	cKJ2LzFMcllPZOkE4gze4ue1UxXBq4FCJ6P2Yf9gk0yh42cnM8h1ac29Ksg8R4+cdXuk9Kg0z9lIs
	/leEg7C9b58YGloMGKGqnMFpR50Qn94ituvZIYtfmwtE7tBNiJSZY7n9GRVAIvxt7Il9TDr3rVTlo
	cHJPHM+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF0Rq-00000006xsa-1uBz;
	Sat, 01 Nov 2025 01:30:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF0Rp-00000006xsQ-0K1l
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 01:30:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 922C760141;
	Sat,  1 Nov 2025 01:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2199C4CEE7;
	Sat,  1 Nov 2025 01:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761960627;
	bh=KXYybCMOsoyA4teq+q4E5zSg7BKUEaObugsAPZvSEno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X0dH7PohthNUAtWxRoNk0PmkxBDL9Z6ClZf8aFue7LAJzpIvq9jsZKWFrYsVrZIIa
	 XamLTAut8d09LoegkWaICab+CJELKuwY4pKkJgyQqXk+7F/UBkS53giaia9JdLbNJ4
	 vRoSRG09lO0c0vRBodZ1ueP0buUdXei/qcAxPYuVMpIKvTltPVtQv5l+PCbtbup0+J
	 zNd17NNF8Ovs3HFFI+x2GT7/CwAFuHHYHxdWs6FfHVLHXq2erCQfqiPm2w5ByGLdX2
	 jv6HhtMn5K1+wqWNizB23E/Dvx2cSc7CdKtqr/Ln3PC9YnzIaYpy8fYqZ6Q7qD407K
	 0L82NzguODylg==
From: SeongJae Park <sj@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] Documentation: treewide: Replace marc.info links with lore
Date: Fri, 31 Oct 2025 18:30:19 -0700
Message-ID: <20251101013019.68183-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251031043358.23709-1-bagasdotme@gmail.com>
References: 
MIME-Version: 1.0
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

On Fri, 31 Oct 2025 11:33:56 +0700 Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> In the past, people would link to third-party mailing list archives
> (like marc.info) for any kernel-related discussions. Now that there
> is lore archive under kernel.org infrastructure, replace these marc
> links
> 
> Note that the only remaining marc link is "Re: Memory mapping on Cirrus
> EP9315" [1] since that thread is not available at lore [2].
> 
> [1]: https://marc.info/?l=linux-arm-kernel&m=110061245502000&w=2
> [2]: https://lore.kernel.org/linux-arm-kernel/?q=b%3A%22Re%3A+Memory+mapping+on+Cirrus+EP9315%22
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Acked-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]

