Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1390E606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UAY+FgPc;
	dkim=temperror header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ONXl4iDR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s6X2gYN7fkTtxsBcmhfLRe2w6HM2vKpv8k1R0jXNwjU=; b=UAY+FgPcIWUaXT7+jHGXc+C1rs
	2jfmI5ITXmg2dTQbt6z7+r68Gvfu9DywEm4B1UWom016E15spqfI9jDVxrtJL8zsn6BTojd764WJY
	3TGGF1ja04U48TuxpDuJAwLEV3PQGLVt4RnUwqCUb/uXTMpgeu4AFt4GBDjSLgTdQMDWPkm+qY5bZ
	uIxtRs6QSWNYchPLf9IhSrTtBCNz8Tgu6usK8NM5baGyQGseTbJsLrvEIFy999XtkiNEgMs3TkyZd
	sVnFOhZvCsG4qov3gYrzHWbT3iGL9vHZqa1xXT3aOh1nWcqMQKu9lcZOGyr6eLZG/uO8GCfVJK5KX
	4jLqODag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObfJ-00000005a38-3Xtg;
	Wed, 04 Nov 2026 14:08:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObfH-00000005a2Q-3kcn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:08:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1ACDA60D7C;
	Wed,  4 Nov 2026 14:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5261F00919;
	Wed,  4 Nov 2026 14:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801314;
	bh=s6X2gYN7fkTtxsBcmhfLRe2w6HM2vKpv8k1R0jXNwjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ONXl4iDRXEBp71XgwO/J/f6bQy6nlJqupV/W9bk3s8uYOyPLUrAVQshBXJ5D7Bw+h
	 K/JT7oyU2YuHqH8cPtcQeISCxN0r1ZUd9SC0YiO244jyYwG02a8iZL/ZUuhPKVhlsG
	 QCF0O2Djjf2ZtLnBwOn0m1t9pillIzeVLt3dfnwXMwUB+tmlOMUnzr865/RzsWdlon
	 UxRLkJKfZx42J5D03EDHVh0zpTkoh2585WIsQsopd9rRQ4PBUH9dNUCTTOTjlqGv66
	 1K2iijMfxKAQ77/YMl+F+4UbLG6gTAUifoOv9zRg/a2lmPSPKP8W+G66aOOzaQcGeQ
	 qaYdkYKhWKvnQ==
Date: Wed, 4 Nov 2026 15:08:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: vamshi gajjela <vamshigajjela@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add smartdv
Message-ID: <20261104-rebel-kind-rook-abaab1@quoll>
References: <20261103042608.387626-1-vamshigajjela@google.com>
 <20261103042608.387626-2-vamshigajjela@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103042608.387626-2-vamshigajjela@google.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 09:56:05AM +0530, vamshi gajjela wrote:
> From: Vamshi Gajjela <vamshigajjela@google.com>
> 
> Add the "smartdv" vendor prefix for SmartDV IP Solutions Private
> Limited.

There are multiple smartdv companies with different domains, so I guess
you want smartdv-ips? Or maybe all companies are the same?

Best regards,
Krzysztof


