Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8D2CCFA19
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 20:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmJlGjVG/zoDzJWq8Db/3IHfkM4X5cLIYq8ruVf3Mng=; b=owcUuRj9D3zteB9EO9HIOr/jVJ
	gkAXElqZWL0kKS2WQKebcM7/DrC/DmSxW6c5+sl3r4O8SlZG13Dc8oEi4xERSFj0zqs32OrrDVSwt
	ZjPSqgk6O4d+pMMtZuAxgpXYUVBsQhY5XMfhi8J4M2bgkA4IXGFDtWbgJl9e79SQ4S0m6MwkjqY0f
	61L9F7sVOEZ7UZOMethoQ4BqRWsD1/zPEPkcud8JgEQnxZoXPhCcXn/UTNVVXttvaizv+NJ3b6RSf
	kOeavBr0wmmcuEsC3i69+nY54n0nj0XvRV2S0LxAE1xSarnDPWr5MOJApHKM2s8hndAAlE1fhUMqF
	Q9PYMOtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHTSN-000000012Fi-33lQ;
	Fri, 07 Nov 2025 20:53:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHTSL-000000012Dz-3Mi1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 20:53:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4DE343DBD;
	Fri,  7 Nov 2025 20:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9603CC113D0;
	Fri,  7 Nov 2025 20:53:11 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Omar Sandoval <osandov@osandov.com>
Cc: kernel-team@fb.com
Subject: Re: [PATCH] arm64: remove unused ARCH_PFN_OFFSET
Date: Fri,  7 Nov 2025 20:53:07 +0000
Message-ID: <176254876744.3846522.6609972659295147149.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <9078f326973e9065eef9d7c3198f94ded296915c.1759964446.git.osandov@osandov.com>
References: <9078f326973e9065eef9d7c3198f94ded296915c.1759964446.git.osandov@osandov.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_125313_860393_173CB1F8 
X-CRM114-Status: UNSURE (   6.60  )
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

On Wed, 08 Oct 2025 16:01:30 -0700, Omar Sandoval wrote:
> This is only relevant to the FLATMEM memory model, which isn't an option
> since commit 782276b4d0ad ("arm64: Force SPARSEMEM_VMEMMAP as the only
> memory management model").
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: remove unused ARCH_PFN_OFFSET
      https://git.kernel.org/arm64/c/bf6b3fed1866

-- 
Catalin


