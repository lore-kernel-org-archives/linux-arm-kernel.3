Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5FECA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 20:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPls3TjCTwHtVh3Bw6nK86vmTR9+EVEHAOk7K1jVm2Y=; b=l/fWsk4X9mGAaDjPZdNKw3E2ax
	DHknbXbNL067TVY9kzx81KV9C1PtuITifgyO3mBIoXZUDVl7tVHnVWyG974P29zLxE9rgGXuZxlME
	jLcUuJz534Tw72M0w/ONNDP4Gyy5Lq0b71CnLts2AffpNe0db21pYUcGi/mMVwpIUHxRYPHMiJxc2
	66Xck/eCs8a5FWeUTwUew1CGTcEyx2Pb+AmE6AmQc1Twsf7tvc6YW83EK9tc74BEjEnArfxuKscOt
	A6a378Yzs4vA8Xyj5XjqI2HKFqrPqFAcR31t5A8/kebZojhJz+jVd9myHZad6InjW1CjykOq8zkMC
	FE3WdMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urjXC-00000003DcE-3mWb;
	Thu, 28 Aug 2025 20:47:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urfV5-00000002G3L-2jwZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 16:29:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 597EE409BF;
	Thu, 28 Aug 2025 16:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC55C4CEEB;
	Thu, 28 Aug 2025 16:29:21 +0000 (UTC)
Date: Thu, 28 Aug 2025 17:29:19 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Yang Shi <yang@os.amperecomputing.com>, will@kernel.org,
	akpm@linux-foundation.org, Miko.Lenczewski@arm.com,
	dev.jain@arm.com, scott@os.amperecomputing.com, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v6 2/4] arm64: cpufeature: add AmpereOne to BBML2
 allow list
Message-ID: <aLCD35VIvfJ8UeSA@arm.com>
References: <20250805081350.3854670-1-ryan.roberts@arm.com>
 <20250805081350.3854670-3-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805081350.3854670-3-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_092923_709330_894E7C6E 
X-CRM114-Status: UNSURE (   8.78  )
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

On Tue, Aug 05, 2025 at 09:13:47AM +0100, Ryan Roberts wrote:
> From: Yang Shi <yang@os.amperecomputing.com>
> 
> AmpereOne supports BBML2 without conflict abort, add to the allow list.
> 
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> Reviewed-by: Christoph Lameter (Ampere) <cl@gentwo.org>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

