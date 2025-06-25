Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0446C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmkRmugLPeEiNCztgb9Mu9nY17HCj4W91WE+Tsea3D4=; b=Lr9kkcz5s70PENb1FBxVzX9qnL
	hVZOYsejgRS75oPSSbHwCLyezff8bp/8xwmQrT9nBHp4o0CgrS7wIv0pqk6fWI/gMoVWWvMhW/6iQ
	BNQ0ii9Prlg7v/2bvEJaVsxzlwE8xheXeFH7TdQv5Yt4y03VfsrHXh+53WpaOhU38Uz4Eumdmk6Z7
	xS5JdPMqvcLwBPB+i6w+pJviH8g4XUAqdT+M4VjCh3JgNdCiKsJGMFlYPgikIig73q0rucqLv5N2h
	3Cf/WXdFbP3DOWg8skRVTBoQRITPEGL6IRT+rqH3W1wJJINDdcfkkPeIQDEzVqV/qeSTzgTwy3GAa
	kCrDfq2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYLK-0000000A2fo-0qtH;
	Wed, 25 Jun 2025 22:11:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVxz-00000009lbb-1tIO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 19:39:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 24D9A5C5B90;
	Wed, 25 Jun 2025 19:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 287D9C4CEEE;
	Wed, 25 Jun 2025 19:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750880370;
	bh=6DlABh1XUb+M1JsVeT5pGkKPi41UFB4YwPIf08LrXVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qI74I42ll82+zvFWcVZyXaVmuxMf7u+kk02cQ8TLcVhrTL52wWJdtmN+SJVzBNDT4
	 xs0pmAXDwyLZ0FvAsy2Xs0y3ThFiOEh4sXze8nMvTzBRKSechWnTFLeilUvYMFRSXT
	 aUEF8Ey9epIZRubAvMu8N0lkFuzszQ8OTC3AVLjz9YUPn3McrsNc0O/tngf6jUbO3E
	 Jvx5rYw2OJK19QznYDnJa1K4oLCZ9tnPjmRa8Z4ctR6f7nWpcVMHlcT8KPxUdMIBOL
	 1KGLmSIPtfLMB/UMGDoiuVyBokOCX22JABMKmZhSa7SSidbZvPWQ2rrDNO5V83FC75
	 VpOeZBsZzwpXg==
Date: Wed, 25 Jun 2025 14:39:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: asahi@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>,
	Sven Peter <sven@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	devicetree@vger.kernel.org, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: Re: [PATCH 1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
Message-ID: <175088036858.2092918.12040107423396326625.robh@kernel.org>
References: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
 <20250609-t8015-spmi-v1-1-b3c55ad01491@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-t8015-spmi-v1-1-b3c55ad01491@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_123931_534100_32B4C743 
X-CRM114-Status: GOOD (  10.13  )
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


On Mon, 09 Jun 2025 22:59:40 +0800, Nick Chan wrote:
> The SPMI bus found on Apple A11 and T2 SoCs are compatible with the
> existing driver so add their compatibles.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


