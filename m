Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BF4C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E372M33xfbBlxY96rpMILM58r6QIxHS+6Mzjsgps5Wc=; b=Wnzc01Mi2WBeORQyQ9dP7h6dWP
	Q17tkXSWfD+JV/5HB2XhdPoH99mU8RzIF0CucqzptVkfp/EGT1aiPym3DtO9O6LFgDNbKWV5cgQD8
	i8UU2k8COmxB2BAhzh3EP+ZCS+9YbjIKZYmi1VRfeRIqhJlPaXCZtq9VDMX9SXZtZWJ6VYGcYQ137
	5vNEP2zVy0vNjIrBTc/hR+7+/PY6x6v/dgS5gjXWQvS41BqX5J4BUgk+eEUMgXFnoYbe5GB8JHnCn
	hEX/7Itptu9mrd0D2mGPpz6N8Ht0xoSJznLvA6qYyoWi+hyTAHxRIbl1/HS5zR/Z1Uc225JhV+Kyh
	1BPzIjUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB4B-00000008PBX-2uH7;
	Mon, 13 Jul 2026 07:27:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjB4A-00000008PBG-114p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:27:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86FBC60018;
	Mon, 13 Jul 2026 07:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87721F000E9;
	Mon, 13 Jul 2026 07:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783927621;
	bh=E372M33xfbBlxY96rpMILM58r6QIxHS+6Mzjsgps5Wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G3ton2aGo8UP6tslQcS7Wf1uzCZLPkA0gMMsOPLTIrantiXEqm7TMCVKLhylRDPlF
	 XJfjADxNpgBP3y0bRogsdCoS1aoD9VBOtm0zg8lVtmLpv/vH9q59VDNz4hR99HyQMe
	 JViYlBji3/YRYS5N/J97KblnwHUoOYTwt3x9Qv00UjNBCUzj4kMBJdLQ2ER8PEmGps
	 bYZq53qWEY2SCfh59r91BH3bhYBys53GqJ5pEj1eVK6cx7GlfxYe2d1OctOxygo7py
	 2KGWTCPkHGfB0PZCaGaTCLyt/z8kNT3BT4rpFs9KxOjP/Oz60lP7gAIcssJkd3kycD
	 OCCy4Om8Thsxw==
Date: Mon, 13 Jul 2026 09:26:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: perf: Add Arm Bus Monitor Unit
Message-ID: <20260713-noble-jade-wapiti-20ba9d@quoll>
References: <cover.1783439341.git.robin.murphy@arm.com>
 <1cd17d9c07e9695e1dffdeaa5409f0a1db8ccb81.1783439341.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1cd17d9c07e9695e1dffdeaa5409f0a1db8ccb81.1783439341.git.robin.murphy@arm.com>
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

On Thu, Jul 09, 2026 at 08:22:07PM +0100, Robin Murphy wrote:
> +required:
> +  - compatible
> +  - reg
> +  - label
> +
> +additionalProperties: false

You need an example DTS, unless this is a subdevice and part of other device as
subschema.

Best regards,
Krzysztof


