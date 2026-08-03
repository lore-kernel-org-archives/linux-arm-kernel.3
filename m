Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22ADC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDfo9eKyzT0l+RmH5CjS8vrTJvuTqzIw9lkamyHG674=; b=pVBM8PH0DCdQPfWoiQbvYDvyQ5
	hUiF6uVv5LEnL9aNVaiPuHmfdWOe8+CJlsWs5UrztrN4kIyAV7Z4DEknnQKmTLumKUNFLUsCQ8V1A
	EyBJLAu7K3USyZ7kOzii/Yu4jl+XaY+7BuuA3WWog9pXZoaWqgj31BUWaUiw9130Y1ePt/t0uWrva
	muZNJiYN8GmpuV2tBmUKCeKwFWlvNKd71Uui/9wnqp9mWNm7UXISNmNS1vr5II+BEjzafCrOC/ldz
	tIY2TtsfiABA75N2OQlwyoE1zDDt97pCUsmSrJXpG/PLqQIzbjPKmduJpRZ179aAkE2YY39bEtJ7A
	g6cagRCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqp4b-0000000GhMb-09sR;
	Mon, 03 Aug 2026 09:35:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqp4Z-0000000GhMN-0DlB;
	Mon, 03 Aug 2026 09:35:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D79360A64;
	Mon,  3 Aug 2026 09:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8C11F000E9;
	Mon,  3 Aug 2026 09:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785749701;
	bh=eDfo9eKyzT0l+RmH5CjS8vrTJvuTqzIw9lkamyHG674=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kALLZ06UVNda9t0bDcd6uyMs7lEZh8yy04oW5oYTXAi/jJXliuy8VPkQf3sTPe2I5
	 KTBNJ/ffKMafuE938wVcQlPB8c/rylf5I4MVy519VsajqFxLS75Cj9ySe1pYGOXyYA
	 TErg+o08hB13kA7aF+srogvZIxD4UIG+GHt1vm8EeKyRbO2TTudacRdj1eRUOyCuZg
	 9xVzYAMXBawN8qynz57qsLff4Hmk7YK30nfm0ISaH7KewEzewg4BJpoX/eE1q6S9vl
	 FoYK1zHxgWRw+tvKjwaTvLhLiLBurmt+PJbK3yFD6glUCEZT9Njip2hghUMxpbODcL
	 +GSM4qrzoPITw==
Date: Mon, 3 Aug 2026 11:34:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add MangoPi M28K
Message-ID: <20260803-fractal-sly-earthworm-2fe241@quoll>
References: <20260801080018.3220034-1-amadeus@jmu.edu.cn>
 <20260801080018.3220034-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260801080018.3220034-2-amadeus@jmu.edu.cn>
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

On Sat, Aug 01, 2026 at 04:00:17PM +0800, Chukun Pan wrote:
> The MangoPi M28K is a dual-gigabit SBC developed by Widora based
> on the RK3528 SoC. Add devicetree binding documentation for it.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

How did you resolve my comments from v1? You split patches instead of
squashing and removed any explanation I asked for.

Best regards,
Krzysztof


