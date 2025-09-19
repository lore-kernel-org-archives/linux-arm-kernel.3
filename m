Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF32CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 20:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n49DVc4VUCKXny1uX/xyROYie7e+0C0EP7XVOIEc/iU=; b=zMYqNjnkQlkCr38YwuSK+bE+CE
	9gh5G7oM4xdOfqGR2oZnvG3bn9EqsD5lrnejKsywwODWEPyGf5o1kRmKC9mV39fWKpOnwAx1c2FXg
	hhtLHkn0hYJNuPeu0zFIs40T/YnnfXyLr6iXnTg3BkHzKfA7IBnrROBXi7NIiBRfbnzFLgJ5OOT24
	SWZkjSMgR9EvrAnCP6Z0t0kV6OYcxerpNmHXaNWSGXvhn5llGu5ZarhL6wuZE/6qY0X/bKuvy5xCR
	mLG7qU8qXCZ4iePq3n7PlruLW5Lj/Z6/DGNa8VUNcBsPcnktOX3fCwk5ZAiX2V2dgnnMwLTX78o9b
	GgqO01nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uziCm-0000000424Z-1zrH;
	Fri, 19 Sep 2025 20:59:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uziCk-0000000423d-3Lvb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 20:59:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3EAB260194;
	Fri, 19 Sep 2025 20:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6CAC4CEF0;
	Fri, 19 Sep 2025 20:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758315581;
	bh=i/tnZg+7FZHJ7MVvgVqjrjsZ0b0664aRwSQlPNUdZKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RrbSRbwQtN+Kxc97iqWElOG5aU1X3r5q2TSenj6lVTLxZ+9PazqPrVyuDsIw/tH9m
	 dvH8TJf6CpL3tpXswSAHmQ0YSEFJ9enmeoPY64MeAGsYwKSHc6kFDid0glt3C9sYfY
	 L9TtY9KSObIZcNWXAj2B+pU5Ym9Uqm21Dkdn7rvHyOT7DA37aTMHktpXRhSUHGtG5G
	 mld6VmWG/+/Kip2txx4zNmQ0uVS7yziOGxvA58H6eBjCsjIo0LWG6jItyxtQWd4VvA
	 RgHgoP3XYLXKHTinj+B5KK43nY7i7sSAavb9+cC9K3P5QaEAGxSlcBVu6MSg7BPvcu
	 pLhZ9AmEZL9pQ==
Date: Fri, 19 Sep 2025 15:59:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] dt-bindings: hwinfo: samsung,exynos-chipid: add
 exynos8890-chipid compatible
Message-ID: <175831557662.2207360.15078209817499196017.robh@kernel.org>
References: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914112942.2604194-3-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914112942.2604194-3-ivo.ivanov.ivanov1@gmail.com>
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


On Sun, 14 Sep 2025 14:29:41 +0300, Ivaylo Ivanov wrote:
> Document the samsung,exynos8890-chipid compatible. The registers are
> entirely compatible with "samsung,exynos4210-chipid".
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


