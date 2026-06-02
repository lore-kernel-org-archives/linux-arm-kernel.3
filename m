Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84692CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 20:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrU63UCVbr/RMktFStw/N/Cq0t0EE/+RrYLIke7ByI8=; b=y6yaUGxDE8k3xbhS8wj4ZbrKub
	sYCinIMgacbmTkJ1Z2EiGwxzDRY7ww55RLGxmR3UgKbLtseKBo8K5YLsP3MYrOCQt8MVZ4VLQFxFd
	Eo5Asp0KMmypiD4+WN97SDg3vg9XV5Itt4ulxxb5458gTrL0W/6B1f5HnBNfxNk8mrqV1dG8znuF6
	FhwBX/cs7njzopNnGYD5B4oJIZXRC/CbukmyZuujG0XmsSLcl6doZ/ysiHR7v5Yww5G5mbrJDKuIj
	jmecSjhngGDuZ6/2u7cgj+cpjCfwzk+RM1gWBx5X5f1OkKpvwgw5u2HYIuccutZxDzixFLbS829gq
	mVOJhyhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVp8-0000000DknS-2lY5;
	Tue, 02 Jun 2026 20:34:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVp6-0000000DkmS-2XAs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 20:34:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B32A43672;
	Tue,  2 Jun 2026 20:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942311F00898;
	Tue,  2 Jun 2026 20:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780432491;
	bh=VrU63UCVbr/RMktFStw/N/Cq0t0EE/+RrYLIke7ByI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c0sZouvk4e4Jqrclvd8C5to0HI2rLseFYdKuMFJDwPyo88XjlELMuupNsDpjEtFlr
	 f2WStga8mX1c0fqsGwIEhnVTGWH1icXafdGrxpGmasRAZQSpTMIu4IdUAGrjsMyrmz
	 +9I6KiUaAkz9VhyyllJwSulCQCbD8NYhelZIKlLRyTNGYsFZ+eD7WmurlobSxPCn29
	 UdtbaNRdu4SLLn7P8wO4evZRndequVdZ3KNCO+CwqP4Kl6X9+3u3lR1gU1tyHT9r9x
	 BsfwNC2Xbg3JfhsJJIQ2m5LweTxsDLoeHbj5ZTZZFRE7fJ6Mt5hsnkda1SaQy98i+q
	 jcV/eHc1HqwJw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] ARM64: remove unnecessary architecture-specific <asm/device.h>
Date: Tue,  2 Jun 2026 21:34:37 +0100
Message-ID: <178039862024.3772531.12905709702902200821.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260517025348.96906-1-enelsonmoore@gmail.com>
References: <20260517025348.96906-1-enelsonmoore@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_133452_659974_EB19A5CD 
X-CRM114-Status: UNSURE (   7.13  )
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

On Sat, 16 May 2026 19:53:42 -0700, Ethan Nelson-Moore wrote:
> arch/arm64/include/asm/device.h is identical to
> include/asm-generic/device.h, and therefore the ARM64-specific version
> is unnecessary. Remove it.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] ARM64: remove unnecessary architecture-specific <asm/device.h>
      https://git.kernel.org/arm64/c/32e4c96d6a71

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

