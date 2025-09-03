Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB445CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 21:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oxhoZSM+B4HtrA7PSQ9LgwnMRwFbsVe5ETuJKraVDk=; b=4aSXnyMiZmy5uW7fyeAFNpPITS
	hCEkZQmz+QIGDoI/Wn8IdjMuT924P7EA1nIob/5YTVUP7kPErZqMnV/UNDYyvL6RtntT2a7T565//
	wK/4GNj+oqRo4hWBob2XEfPV+Ng1DarBwkrHsK3pgBPwIYWeelaILcGdGfwlmjMF9DDkrwtCnp8OZ
	7b+kaldvdZ18WAGy+IBI0CoE3qGdqobOHcrk+YiPbnPKhibHmUmx4Ausqktp/cerlj0Yga/UeuQsi
	WIMwRPtZZsIo9z9CDFS+srts/qX6LUhCNz7rARImHhxutdKemTO5SoC3bTf/aAE4bmv9TuCHjUOGp
	OZ+j+n/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utuuX-00000007fbF-28dN;
	Wed, 03 Sep 2025 21:20:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrE1-00000007BUE-0rhY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 17:24:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C34C6013F;
	Wed,  3 Sep 2025 17:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823F5C4CEF0;
	Wed,  3 Sep 2025 17:24:45 +0000 (UTC)
Date: Wed, 3 Sep 2025 18:24:42 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Ard Biesheuvel <ardb@kernel.org>, Dev Jain <dev.jain@arm.com>,
	scott@os.amperecomputing.com, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v7 2/6] arm64: cpufeature: add AmpereOne to BBML2 allow
 list
Message-ID: <aLh52smiWpVMCB6v@arm.com>
References: <20250829115250.2395585-1-ryan.roberts@arm.com>
 <20250829115250.2395585-3-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829115250.2395585-3-ryan.roberts@arm.com>
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

On Fri, Aug 29, 2025 at 12:52:43PM +0100, Ryan Roberts wrote:
> From: Yang Shi <yang@os.amperecomputing.com>
> 
> AmpereOne supports BBML2 without conflict abort, add to the allow list.
> 
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> Reviewed-by: Christoph Lameter (Ampere) <cl@gentwo.org>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

Here it is again:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

