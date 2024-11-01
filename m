Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A67BE6F074
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 17:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8VMZJHolWk801p2EbFkHM/6LXR0ruhRGGeu58N+uj8=; b=0D3Uh9AzGpRkzhmPSFgokFWd8Z
	DxmLVoMe2ycNu5CuqSToVgrsA/KuP0T9GCNny5yvm3v3c9rde29s/h6/QaIOl0zx4gSl2AWIy8fku
	Ojh07FtBpscmlFMByuesGKB9MLHNxB+n/TmORrWHSYN8Swf/G2Egs5kXHeuMhwdreN/4xV7rIAzAn
	B8efpRROSONE5EsSZGFCT8wgLkZ6jUSZu9BvercNdaEUTpyqDPrdrrIb3OMmqLaQ7N4X+rAmiUeoF
	retEDD8TuXcjs88jNxdIk3ypqscCzgzGNYFd50olgyed+KTnWmVL0Rof97ZLsfujKtHMyfLvHq0ER
	GKBVCS6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vfR-00000007sD2-0UMx;
	Fri, 01 Nov 2024 17:42:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vZm-00000007rOx-3Ii6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 17:36:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 72390A43101;
	Fri,  1 Nov 2024 17:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964E3C4CED2;
	Fri,  1 Nov 2024 17:36:44 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Kristina Martsenko <kristina.martsenko@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] arm64: mops: Document requirements for hypervisors
Date: Fri,  1 Nov 2024 17:36:42 +0000
Message-Id: <173048259716.1137332.7811273226378431333.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028185721.52852-1-kristina.martsenko@arm.com>
References: <20241028185721.52852-1-kristina.martsenko@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_103646_912348_3525C2B7 
X-CRM114-Status: UNSURE (   8.00  )
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

On Mon, 28 Oct 2024 18:57:21 +0000, Kristina Martsenko wrote:
> Add a mops.rst document to clarify in more detail what hypervisors need
> to do to run a Linux guest on a system with FEAT_MOPS.
> 
> 

Applied to arm64 (for-next/mops), thanks!

[1/1] arm64: mops: Document requirements for hypervisors
      https://git.kernel.org/arm64/c/2cfdb799dc76

-- 
Catalin


