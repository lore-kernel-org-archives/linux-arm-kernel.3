Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39709CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 09:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16fzktKxUy6Xh35FbsFWwaYt1pE18auc4mAIyTScTFI=; b=27Q+vfePuX22YryJFGTtcdNyad
	I78J+yDyutdGzuvAnhYwgZivVyokD3dx2XK5PdqXi8jOfE6w1vbgWP4zNAce7rJCqlZPwBLqG9XB9
	Y1NlBt25Ss1tUkT4BWw5sumqLTi3/6DPtlcAj3+OW3NeSZW0ZBfLAGwAWEa3/aP2EmMukgb3WSa2E
	pFqLhyUJMbcUZ5KoczILeRaRhuoLzOz6HpOjqQtxdaOjDjrYIbVNED6fSXq7YE3M58Z3iF6Y9budX
	uftKS9m3zgRa3hjiam6NFRkxM6J4DalfKPyUkjON2gIwMPNpBwjubyu2pOoHExMpMvu7hwatUe3px
	+nmdsZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIfB-0000000Gx8i-1vIo;
	Fri, 07 Nov 2025 09:21:45 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIf9-0000000Gx8N-1Cva
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 09:21:45 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 2883B1D000F8;
	Fri,  7 Nov 2025 04:21:41 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 07 Nov 2025 04:21:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762507301;
	 x=1762593701; bh=16fzktKxUy6Xh35FbsFWwaYt1pE18auc4mAIyTScTFI=; b=
	C3jdLXC/Tsizyb1vb++Rlc1wLjYnba7mP8NFlmYxL4ww9yjvdkKoNU1tvC3Z3yjF
	DkMA8ifW4ClivToJfFhk+A7zIjuDmm9QMS4Ly6fLYhkvHALq1lGE5VEoEh/xIe5m
	nPs/cTX0VLxNXpnU91spQCR2LAG3sxVZpeIT2aW6mzqa9hFjFBbt79r3ghuzzzPx
	MUC6SkkxcKjj5GqNH2swGPa9ssEXfxuKKxw65AIUzSl2L5pQ897faEvBLh36uRzo
	C8ABhRs3w+u2tmbRf+JE6CA8ycuJwt/eftOdI8paWmZxqHeMvE3iQYX4zXpPhtWN
	YDCYtNbinxOMRkH1OXXuqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762507301; x=
	1762593701; bh=16fzktKxUy6Xh35FbsFWwaYt1pE18auc4mAIyTScTFI=; b=v
	pXaUf+/9D1v0yWUm4t6enuolfwQK37TZSBKfy6CjzEATR76rbRs4gCYdadP7W22I
	N1/rl9mTdWYGXSa5cqFuc2VG0LopYF3FGZp9I5K1nNlxYE3bVkCN+pQHDa+JDIwN
	XoH3Gyv/enItVhxzE3tUIyplkGk3ZZtcMMmHA51xelqSKFMRPmfXQbVtPFkzC7UB
	BJklCgrjZd+Sq904ePaic70Z/rmnxd7nEkMcG9f/hKq9Iqd0cX0yGp5JwxcYIKil
	LCUE4DF1pQcfbOmA2z7QkIMk0++PYbWor3EppworgiT8o7gNr2UGkKV6fPObvgGv
	w27LkOP9UuDvbwFWK+zFw==
X-ME-Sender: <xms:I7oNaRd9Lm1AVOBtRqRzlxUJaWEojcAL233D8R675Wtf1ekk36hOxQ>
    <xme:I7oNaaDA8F9zhOGR1tslq6JIEWLoPnDmNx_Hvr3Qfyhlkmp1Wdn0WU-f0zHZYbred
    w813rm2BSROOCUYIVRkh5qLclz5rJbkYfiak9_woguoMZYJ--UXww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeelvdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtg
    hpthhtohepjhhovgihrdhgohhulhihsegrrhhmrdgtohhmpdhrtghpthhtohepshhuiihu
    khhirdhpohhulhhoshgvsegrrhhmrdgtohhmpdhrtghpthhtohephigrnhhghigttggttg
    gtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphhrihhmvgdriigvnhhgsehhihhsihhl
    ihgtohhnrdgtohhmpdhrtghpthhtohepfigrnhhgiihhohhuudeshhhishhilhhitghonh
    drtghomhdprhgtphhtthhopeiguhifvghiheeshhhurgifvghirdgtohhmpdhrtghpthht
    ohephihuiigvnhhghhhuiheshhhurgifvghirdgtohhmpdhrtghpthhtohepmhgriieskh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:I7oNaVTgIXKz7BmbT0aSRAsCx8hbsswWFfQUYcM3259OvbNxTDxWkQ>
    <xmx:I7oNabdHEru5fn9Ue_PlmlaX3x4eW1HM_zpUKxCLbnf1iWGRQsYdjA>
    <xmx:I7oNaevV2Ft3T0MEW76UT40yX4u6Ma3mYD8C_8Cxhh7ts1PLqczJiA>
    <xmx:I7oNaXIq7odSdSjkeeYUUcsFuvwY4hPlEzUnJuK0S7YwwjAquyQPZQ>
    <xmx:JLoNadzGFAutaWLdAzneKsvMe4x0fxomLo89oZ8O8fFh3GaWwCZP7xOy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 97816700063; Fri,  7 Nov 2025 04:21:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A2_nuZaCxefk
Date: Fri, 07 Nov 2025 10:21:18 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhou Wang" <wangzhou1@hisilicon.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Marc Zyngier" <maz@kernel.org>, "Oliver Upton" <oliver.upton@linux.dev>,
 "Joey Gouly" <joey.gouly@arm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Zenghui Yu" <yuzenghui@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 "Yicong Yang" <yangyccccc@gmail.com>, prime.zeng@hisilicon.com,
 xuwei5@huawei.com
Message-Id: <146df4ad-c8a9-4e56-bc1e-7aae53ab8b85@app.fastmail.com>
In-Reply-To: <20251107072127.448953-8-wangzhou1@hisilicon.com>
References: <20251107072127.448953-1-wangzhou1@hisilicon.com>
 <20251107072127.448953-8-wangzhou1@hisilicon.com>
Subject: Re: [PATCH v7 7/7] kselftest/arm64: Add HWCAP test for FEAT_{LS64, LS64_V}
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_012143_656007_7B821F36 
X-CRM114-Status: UNSURE (   8.77  )
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

On Fri, Nov 7, 2025, at 08:21, Zhou Wang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
>
> Add tests for FEAT_{LS64, LS64_V}. Issue related instructions
> if feature presents, no SIGILL should be received. When such
> instructions operate on Device memory or non-cacheable memory,
> we may received a SIGBUS during the test (w/o FEAT_LS64WB).
> Just ignore it since we only tested whether the instruction
> itself can be issued as expected on platforms declaring the
> support of such features.
>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>

Thanks for the changes,

Acked-by: Arnd Bergmann <arnd@arndb.de>

