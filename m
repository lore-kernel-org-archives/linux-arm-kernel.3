Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE6DE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 19:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sSmW6XDedd691EvxPX/lmckuX33s1JHR6tDLocY4PNw=; b=fqPuVyxt/pPS5KVYFIgPCbszDD
	a+cGLj6gI7c/hyUIPSTDhEXgihC6xcI0XrVo1VYmIvLarosmBn06hxiV3Fg9OLERoRoT/59lRBHNY
	DwR5wgYAmmmhmyRAiuWu5pvbR9J4/Nx8Fxh/9Yr3+QxRh1XpzDXYnhLEER5IqUAbaVTRbw8U5YYQD
	kmViVi0932ZhNcfMAoAR4WqmGyXujFIVY6Cx8K4p9VNSWTqW8eDoBVRLl3jK4uN9mfb4xsBsrR5av
	cRvg711F/I4FwWqFmck2+N7M2oloovd7zg0GQHncwwboI42Vz8jrn6DxI5/DM7K3qjItz3WPYSsGl
	BkCiN6iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMVd-00000002tdV-2NnE;
	Thu, 19 Dec 2024 19:48:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMUW-00000002tPp-0XkV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:47:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DA122A42770;
	Thu, 19 Dec 2024 19:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53FD5C4CECE;
	Thu, 19 Dec 2024 19:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734637643;
	bh=2jRwjqhkgep1pL0mpEZG3HiVJkFkBo9BC51mkxHjI4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BwcCmXu6Hl5w+eM6rh1h0JNcORSpRVuhlpPCgdkkgbP4aILL/4F/h5lLh0FoxO8Y3
	 6fOrSLkRhO4KoTTP+mHjZz0oNpJdCLdItMrD5k25ypwa1coRwEPSAWQlnkYz6h+W4C
	 gXgVSmhr5Ls8hFySWAHWcNqbjTOMutDhHMUFwSNE/pv45pU5hLUdlt41CqRC2/liVz
	 auZrZLpcWsqK8Sy5XhzFXN+gk57lrTSBtUE00E2MhBlZDjORDJRqzf04sTZ+oig3mv
	 Ho0zY8/5plNXojzxlfdwIib02+lziSH8K9xyhGUkuGKYFGB5S5g7j/4udrTvt5WMS1
	 wUVMgi0YYO70w==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] docs: arm64: Document MDCR_EL3 boot requirements
Date: Thu, 19 Dec 2024 19:47:07 +0000
Message-Id: <173462766799.3925724.13780644464677755383.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241211065425.1106683-1-anshuman.khandual@arm.com>
References: <20241211065425.1106683-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_114724_231668_610881E4 
X-CRM114-Status: UNSURE (   9.54  )
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

On Wed, 11 Dec 2024 12:24:23 +0530, Anshuman Khandual wrote:
> This series adds missing MDCR_EL3 boot requirements for debug and pmu
> registers that are currently being accessed in the kernel. Please refer
> the following link for some earlier discussions on this.
> 
> https://lore.kernel.org/all/ZxfOeqyb3RvsdYbU@J2N7QTR9R3/
> 
> This series applies on v6.13-rc1
> 
> [...]

Applied to arm64 (for-next/docs), thanks!

[1/2] docs: arm64: Document EL3 requirements for cpu debug architecture
      https://git.kernel.org/arm64/c/3e5be4e11aac
[2/2] docs: arm64: Document EL3 requirements for FEAT_PMUv3
      https://git.kernel.org/arm64/c/1e4a5e3679cc

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

