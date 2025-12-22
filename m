Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD6CE6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 10:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Zx7Q8sr7rjfiU+r96Y73e4BqFGVxqCj1EpmprXp6n0=; b=YIQyXEYOFXT1Fjd1bmV4v9xzNc
	Xm3GUMQ1hUyUW5aHLNVIHuokpderfy2UGToiZdxeD0F3YBT0fngh5kLRO/9RH1IhijhLYquY7Qg1w
	fXfs6HHHyiS2fEbI4MihfSlKAg74EKsNMo95d2l+sre1tGf43oheq/qLFBW95T2NwljNZfo9w9Rnz
	XgynimhkR4nNv/J3OcJ4v4QdIiU0+D7lEpp0Q1pRrE4UbcKDIQso26KEI32HY1xkq/hB7kMJprFYQ
	CEscbN7lKahT+fiHTyR7Q0VZzqSA+smIph56XCKzgAgVUcQOdUBn3KzKydP+hd4+vK5tSbL8crWbf
	RbpyomdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcjg-0000000DaR9-25Ul;
	Mon, 22 Dec 2025 10:01:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcjf-0000000DaR2-1EKf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 10:01:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 589E86014A;
	Mon, 22 Dec 2025 10:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09D4C116D0;
	Mon, 22 Dec 2025 10:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766397710;
	bh=jnNN9OUQV/TDfCNq4eLmPfl7X2xj/3UHNE0Ln7EzDhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LitlLcjDZ9ye/HF6LppOF8gRpBklExwig3Ny52jFghRo0qc+Jv5KRHyu2V1enjC7/
	 2B6WbMaavuQPmm6Kw267QnVZ1l10qruYRuOQ8iXtCGcAD0qsvN3tqi3DYGMqjlKkzK
	 WMAb/bmcrW1uayNTcNtG7s7FnXmzt+d29lbGFYlNNfuGcjsAF6hR25Ir82Wb85F7O2
	 0yRzmkXufLTeRnCtDSi7qPWiqhzkuIuuNZurYmnHwEJMO7Z+G1T4GFqKss/rOPaDLG
	 KVR+5A5ng8euUZv3fUwws8vffC9wFInDK1JG7tY0dolVd8DwdrLQ6nMBvZWR9moGIe
	 UxphNDp4jLMOQ==
Date: Mon, 22 Dec 2025 11:01:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: soc@kernel.org, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: toshiba: Use recommended node names
Message-ID: <20251222-lean-resourceful-barnacle-95cd83@quoll>
References: <20251216180055.2793215-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251216180055.2793215-2-robh@kernel.org>
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

On Tue, Dec 16, 2025 at 12:00:54PM -0600, Rob Herring (Arm) wrote:
> Update Toshiba TMPV7708 node name to the recommended standard node
> names. Generally, node names and paths aren't considered ABI, so it
> is safe to change them.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> SoC maintainers, Please take this directly.

Applied, rebased on top of my earlier fixes.

I took all your patches to my DTS cleanup branch, not to soc tree,
because that way I can combine with my other fixes. I'll send them to
soc tree soon.

Best regards,
Krzysztof


