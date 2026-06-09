Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5F0CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 12:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IyCAMloLhkllngJF0JqA/JkEkj/AJ7aZDzAZ/+FDEJ8=; b=TAXJUKPG1cbF5GheNMOSZC9V5X
	p8H8lOqdHzVl6r6cIDDxKK+AwZzqBvbJPBUsNz0WfzJJ7SIk4jAbjPL+qO67H8aBA/DEXjYTTnHF7
	2Qbil6F7ppZ06dZs8zrjPecOnwaai1t1KiCEfLGAc/lle4SgcbS+WmLEBAlGbkAp5g9OlDpZRqp62
	x5EoNRWjMgL764CCAr+zOXyQQJfHKl9qO8YuHlfx+5EIwWPlUZEm4pEtOczgHNBxJPzBqrT2Y8wg6
	HbMkamxZI/oVbaMHyGpU8QLAcI6eNcsgWg1cEzBYws5kHeuBv4CF11Z3dEJ4OESSNtoItPmO05oPt
	qoMUZxuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvAN-00000005U6S-43Cg;
	Tue, 09 Jun 2026 12:02:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvAK-00000005U6B-1zPa;
	Tue, 09 Jun 2026 12:02:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E10FB601E1;
	Tue,  9 Jun 2026 12:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70021F00898;
	Tue,  9 Jun 2026 12:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781006563;
	bh=IyCAMloLhkllngJF0JqA/JkEkj/AJ7aZDzAZ/+FDEJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OqNRQoCzjVI35tiv/Ve4MAFcrROXYcwRIoudRVwqkbkgbAtDgIl+92WZgUwkTjP2r
	 7aMD5jVkxTepGqd883cal6QC3VmS75R0ZLMiH98jpGhwA6F/P9+Z8NWJlUL045F6ta
	 KyWKkSNG0wNrpRB2oBH96YyxmNU5ME+RYq0BLNq5d3A2AtVYumWQqzq6vFAXP4V50l
	 IERNvQzoyVbVLkELF37wPNvErD9PlvvGrx6J0SXg1CPI+G4XUFHEPJy5qRbAF5uVUR
	 laOHEcz/z8Yq+KY1Xnew+e03UBPiI2TGAlfgQwnJpbBtwuP6eRzEcSc/v414whXln+
	 DirBb+CLAGnKg==
Date: Tue, 9 Jun 2026 14:02:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.2 take 1
Message-ID: <20260609-raspberry-mastiff-of-focus-e74de3@quoll>
References: <9d4694cb-f596-4538-a437-6f2fbb6304f4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9d4694cb-f596-4538-a437-6f2fbb6304f4@linaro.org>
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

On Tue, Jun 02, 2026 at 09:52:55AM +0200, Neil Armstrong wrote:
> Hi,
> 
> Here's the v2 of Amlogic ARM64 DT changes for v7.2, contains improvements for the Khadas VIM4
> and VIM1s SBCs, plus some additions for the Phicomm N1 and a couple of low priority fixes.
> 
> A bad "Fixes" commit sha was introduced for a commit in the same PR, I squashed it with the
> appropriate commit and dropped the previous tag.
> 
> This PR is largely the same as `amlogic-arm64-dt-for-v7.1`, but I sent the fixes
> separately as `amlogic-fixes-v7.1-rc` as discussed with Arnd, so this tag
> `amlogic-arm64-dt-for-v7.2-v1` is based on top of `amlogic-fixes-v7.1-rc`.
> 
> Thanks,
> Neil
> 
> The following changes since commit 174a0ef3b33434f475c87e66f37980e39b73805a:
> 
>   arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number (2026-04-21 15:46:29 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.2-v2
> 
> for you to fetch changes up to eec0722a5cac08ba995847c8eb63118cc708560b:
> 
>   arm64: dts: amlogic: t7: Add i2c pinctrl node (2026-06-02 09:49:46 +0200)
> 

Thanks, applied

Best regards,
Krzysztof


