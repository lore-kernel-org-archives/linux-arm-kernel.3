Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B2EC3DA4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDyMyW+XNeNFvHCtauvA31hxzHhecP8Z4JekRJFtRU8=; b=JAfL3+80sMbk3C8nEgzOxvwK5E
	u8xtZ8ujA4LwAYJuXytXhS4YwHuLsLGGk8RUjAkyqOgxNgKFZaiPX7PkHRG6HU4BzsEJSyhlrCWVw
	39fVPubf+BVgO/WZhx64RpWSHQ3h+QwiLL+btZKtTLpuJAejo+VbOCS1gouvpD5vAy0M2cprr3RL0
	Wxtk2j3tcywYq0c7neHM7sCUPF+avxQmU9gcOoLiTKABLDh+qTaJKBRbDnMB8KVhn89XlNCLr2fhf
	TF45/LY25mIu/U3fv/GZUjtRXne9nqyQAxj/piETPwM7ICzTx+i0lHUehb36o2OJ43jFWkq9eGSip
	uLfTO3jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGC4-0000000FulD-2JEW;
	Wed, 14 May 2025 17:47:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEo5-0000000FihM-2axh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 16:18:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C0F185C4A67;
	Wed, 14 May 2025 16:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2C8C4CEE3;
	Wed, 14 May 2025 16:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747239488;
	bh=9FKUWOJipi0rvxqpVFsZ5LYqcVI0NRqJ68uKB0gVQIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=euaCr+8AKPHRyz/S1xRm+eifwxkWnvCWj6ryx2SEkc/es/8/TklpQ27Apc/7mPCYn
	 ek6zQnZ5gjOkys6Zd2bOW7CxnIQQ1jlXU6BmqSHyyvsG/PChkIa97YSO1GFA7yMYWm
	 0LB0sxJB8L++cdbEmREWHAoam82GIh8/0eAHDMcsmBkBaDhMK/j9QAmVH+JRPOU2xa
	 cPRh1wWSYKaxPwTmSTD9CjiSrZdi8IKQk+rp9P9jIQgnE5H+KxI71ffQ9aTjdEqAiz
	 ra0FFH5vKpORB38+L1v02Ngl4VBHuyx2EdCQt/Iro80xSH4HDhvxkBm0Ml5tH2d49d
	 H2sMnC4juA9yw==
Date: Wed, 14 May 2025 11:18:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 05/11] dt-bindings: misc: Document Tegra264 APBMISC
 compatible
Message-ID: <174723948656.2532633.8102674613984687601.robh@kernel.org>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
 <20250506133118.1011777-6-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506133118.1011777-6-thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_091809_694775_B3DE2778 
X-CRM114-Status: UNSURE (   8.35  )
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


On Tue, 06 May 2025 15:31:12 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


