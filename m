Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA36C43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 17:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYlgsN9Z4AbjSHyymQFtlqN19ZbyPZhF2fYXASOTKeE=; b=eBuVwHA28JO9LJNNnFIFmPEZM9
	fQmmg1UAUIqgBum2xwCr5OpjdyAhO0zMzJ2En2eeJ1qBABP+rPRoCWyl9D+wayJ3ZG/lzjvye/ciF
	4/yPXb2C3x/WGiX3Y+1rE4IwuSuQHmDi70Nzgu9d8rzxuOT7LJSf6MX5HG/zZza1d/TlPIx5Zh1ya
	6qaVuxhrhFLdEY8ot4/9ximBGlaNBp1U8HcwiIF5FABPg0fmc065u0B/VzSc2PNdU96JjXA41S0r8
	ur+H+mtjwtnmcKLv/EPRHQAe7DFgBliHjV8oTDTznaEcV8pbRZzybft3TpryVIz2VqM2n/rSxv1Bo
	so4zHnjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdAll-0000000BjLV-1l61;
	Fri, 26 Jun 2026 17:55:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdAlk-0000000BjLL-0wOO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 17:55:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 409F2601CA;
	Fri, 26 Jun 2026 17:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30351F00A3A;
	Fri, 26 Jun 2026 17:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782496511;
	bh=vYlgsN9Z4AbjSHyymQFtlqN19ZbyPZhF2fYXASOTKeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hnv6DS5V3l7VxROMr6+6TE9utD8/wVjwlubrWA/K+8Bsyx5L3pfTWw+WzGxmTL7/a
	 dyXDE+kI5y3o6imS7Nk2s894HMRpbSHRus8RD1/CbFBgmE/Ky+lRMRML/Lc6U4wj6p
	 ZRDkW4tCRWqXAn7V8EELCUacRYF5VFjzu6UcAV40jeN8PTPc1kxdUNzjAHDyU65nbX
	 5/0kihAiyUUXRC2IK2/5LJ1woUwwuMsg+cZnYLNdfQ86iTYl99nDy8qpzaTcdLPKcZ
	 95q7izOkwRSdwkimsz2E/4Fm+ilciL8tFOmpG5H2WaIYoXR0aqRqVxiyfbZ4w3EFka
	 VDQoeZnYDkrng==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: Sasha Levin <sashal@kernel.org>,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	cristian.marussi@arm.com,
	Yijia Wang <wangyijia.yeah@bytedance.com>
Subject: Re: [PATCH 5.15.y] selftests: arm64: signal: skip SVE VL change test with single VL
Date: Fri, 26 Jun 2026 13:54:36 -0400
Message-ID: <stable-reply-item017-arm64-sve-resend-20260626@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260626-b4-arm64-515-preview-clean-v1-1-ad19e286e322@bytedance.com>
References: <20260626-b4-arm64-515-preview-clean-v1-1-ad19e286e322@bytedance.com>
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

> [PATCH 5.15.y] selftests: arm64: signal: skip SVE VL change test with single VL

Can we keep the commit message the same as upstream? Is there a reason to
rewrite it?

-- 
Thanks,
Sasha

