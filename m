Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444BF606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 12:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dLYUIl6A;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ECT3i2U5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cVLVUDAQ/S8P7wIqNsNlHQ7D4Qx5qIHxAIVrj+ZvXUo=; b=dLYUIl6ABUl3SUYhUe1iNsUnO7
	NxpNM0Qs6et+I9MITtr07YetlAMwtArv3X9GZoXQCLnw/DP+kfCSg8Ndpo4RZ+8EHIVv8OzECXLfZ
	dIWVB3wIEr+ivTjJkMmnN6IO91RvMKwIIDib1sMdO9J/ZfhWE7eh5MsSUt6crPJtWkItcrJ8nmYBV
	ySVCMDTWvPcGmf1l6lmBwNWb075hCRyKpJbCWjLO7KQ3sQSrT+RVYPeA8+8hT6fCyP8oh9X5abwGI
	/TcrNeZWaji8FfNraKuSEfnNL2i89aQYpFW7eg8to1JAUDEgUWUYvyPQJjX5lStlETq1/e+rsk5vq
	KPii21gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJTg-0000000CMnH-1xwv;
	Fri, 06 Nov 2026 12:55:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJTf-0000000CMn3-0A38
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 12:55:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 36FDA602D4;
	Fri,  6 Nov 2026 12:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BAD61F008A2;
	Fri,  6 Nov 2026 12:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969729;
	bh=cVLVUDAQ/S8P7wIqNsNlHQ7D4Qx5qIHxAIVrj+ZvXUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ECT3i2U5LWvD96+SCQy4BY79Px0+LDDQkEQLvJIAJSGkKs9QsvVoBFan9ktO5ZAoX
	 va1/OGEa1g7t2MYQt/3KARMxop2KwWT3C6iksHVrLmmSjiCvaI1zdbVttb7dFnMK7v
	 XbL211JxP8D+wxkDxkpaeehi6T0a9PmquD3ReY7t8B7KeasBnxexlU8oc5eyxDBwkE
	 ATD0mGfwA4di50LX05xToAT/GDO6sk6aWM/0i13UdQMOjzoGYb6isYxZjKdT5sm7xQ
	 kuXKCjfjhfuQKc8qKRT1/4wdspO2NsgdQi4rTVx5OsAmmREuauI4GFPpDJIHwQEM09
	 HYtPH22IRay9A==
Date: Fri, 6 Nov 2026 13:55:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Myria Sarvay <myrialsarvay@gmail.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Marc Zyngier <maz@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, Yuvan Shen <yuvanshen09@gmail.com>
Subject: Re: [PATCH 01/13] dt-bindings: arm: pmu: Add Apple M3/M4/A18 Pro SoC
 CPU PMU compatibles
Message-ID: <20261106-meteoric-tench-of-proficiency-a000ee@quoll>
References: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>
 <20261103-m3-plus-pmu-events-v1-1-a8eb6c1139fe@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103-m3-plus-pmu-events-v1-1-a8eb6c1139fe@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 09:14:36PM +1100, Myria Sarvay wrote:
> Document the compatibles for all current M3, M4 and A18 Pro SoC PMU
> variants. Note that the M4+ are split out by chip codenames, instead of
> name for the types of cores, as they no longer have individual names for
> the performance and efficiency cores.
> 
> Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/pmu.yaml | 8 ++++++++

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


