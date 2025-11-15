Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5B1CEB2CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 11:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftFK8f1MxTkZFsA5k4mTwDbzq5URTz70kJwwvDhRBl8=; b=j53FRx1b8wMJt615mLHuugB9z5
	2lGo6jJs9GWiDEkl0baG70i7AjM2L2SiUd5jZDsi3xSpI3SNSVdN11yMBz6mk4yRgjBuCwatqSykU
	pipDJj0Te4U9QlkecbO/wTAR8uiYPDeV/yHRSVlYb8wGiDgxBeryTEYn60OtavqU/NxZxT7kkkprk
	3mAWKOr/i93rabqZn5Due44ZqYXyPMbgRr4js2JnSctVHyhWuZRVqNefjeCZbC/+EKVSVyIyzfF5V
	RpFzrDPs71YCwb434XywAc8vp1MrkqmP/qRug2hJKcXSEDQQbD7kGNvTEN1G6PLmAW3wSO1+hzF9N
	ozBEe7SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKEbR-0000000DkD7-0gHm;
	Sat, 15 Nov 2025 11:38:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKEbP-0000000DkCu-3ODv;
	Sat, 15 Nov 2025 11:37:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BBCE460053;
	Sat, 15 Nov 2025 11:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5C2C4AF0B;
	Sat, 15 Nov 2025 11:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763206678;
	bh=RyNJr6KEy/iMq/PeGlX/MfabCcw400KzLWVVXMt+6uI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfiHv6bgxlCivypemtSc4LdrcLrrKEFwqjnyJIDC/Iy6hRcqL7p3A+1oiH/KlOv8h
	 sn5nkLj5VvSopnQuItaZ5KyscJPMVQaXz5lVxsdSzuV38nXf5uu9fjA25AeCMJP8xk
	 ENtIz8uoP294Ws9sgTVowMrtucdPEnNeuyyISW7M1s6xh2BCeldt5l0Lh70jKVcBRJ
	 T3tYQ97wtfHrV+oJI+jNpfu3rfydg3cOHvqCMSfyodcjfFLI6bNosErKX4bDzbl+l1
	 fIC3fwYw5aPptZ8/WnLTGG99RZt+UTFY/miKy/qLJGB6ZyhoUGMq777T7w62DK7K3b
	 CFmkRPGb2gAHg==
Date: Sat, 15 Nov 2025 12:37:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: michael.opdenacker@rootcommit.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	heiko@sntech.de, dsimic@manjaro.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add Asus Tinker Board
 3 and 3S
Message-ID: <20251115-dragonfly-of-fantastic-innovation-9e7f7d@kuoka>
References: <20251114154617.69950-1-michael.opdenacker@rootcommit.com>
 <20251114154617.69950-2-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114154617.69950-2-michael.opdenacker@rootcommit.com>
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

On Fri, Nov 14, 2025 at 03:46:42PM +0000, michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> Document the compatible strings for Asus Tinker Board 3 [1] and 3S [2],
> which are SBCs based on the Rockchip 3566 SoC.
> 
> The "3S" version ("S" for "storage") just adds a 16 GB eMMC
> and a "mask ROM" DIP switch to the "3" version.
> 
> [1] https://tinker-board.asus.com/series/tinker-board-3.html
> [2] https://tinker-board.asus.com/series/tinker-board-3s.htm

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


