Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71016C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 06:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4ONJ+n3Pv9YpqOEBl2+oLZe+h2jOZe13b2JLstbHFA=; b=UtLIeoqyibcqUVNo2rxRJ5h76M
	E0MMqtyWXKWkJ7sI/Tq5iyG58N/vTS8yeeZzWBoU3GHkQfuHvejL5eBvdDnZEIxXk1fHHPMJbBtjb
	XxOueWgUMcv9qfiTABHnHnmgVdfhI+QBpXCwuqjycmoddgULLbuBNy2fDwQ3SYRr1BThA7O4x5Nv6
	K/eVr6OvIJRmaY7I8E87NpW/tlGGBcBqg1eyXXTZSFgy+hJJKwmy6wsiWz/uGe38aMHXIRb7w4hoR
	N/sMAflr0nCTaF9LPInf9KKyKPr1jEhQtJxAVANsSaTNZiU+7zM9TDMGfpT8JchVUjW7MCj1hvSYj
	/Okl7HRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvBN-0000000HWVN-0FZO;
	Thu, 08 May 2025 06:56:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCv6F-0000000HVx2-0Oeb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 06:51:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 418F75C5CE4;
	Thu,  8 May 2025 06:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9794CC4CEEB;
	Thu,  8 May 2025 06:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746687078;
	bh=6fnJ9jGwlkD8+oSN+9SAHKBF+vAgVZ3vIthZt+o0e9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SaIZcmSgUv2/V++rgg4TvDOa2n+fWexIMQaOqzTaj5YRRI2WNI3T+W5T85q9E/TZF
	 dq+pHz/VAieDDGbh/iW9QtBdJfL0X9CQ6NKpRi4VpC0oiRUfYsSCALbH0ZQHN/pdEo
	 /N+bBMNVDplf/U44JgXUPqVvHkTANPTLmUNwHOryimqLWCOhVhx/ZHsxvP8LlQWecT
	 glPWIhjZX96UnCAVIQDp4Fzk7tvUW5r8pGH7HHTrHbv6TNFttBwLptuPAJUD3Mjpou
	 oNSUdaKe8fKlRjuxiDqAlCYZ9MyM10H6qyaAPjmTO7LMiA9Q9VZbQzcebfrsKjfzR+
	 m0N7N9RNhYz4A==
Date: Thu, 8 May 2025 08:51:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan Brattlof <bb@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: arm: ti: Add binding for AM62L SoCs
Message-ID: <20250508-splendid-rapid-sawfish-f1ee18@kuoka>
References: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
 <20250507-am62lx-v5-1-4b57ea878e62@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250507-am62lx-v5-1-4b57ea878e62@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_235119_170920_C3525FE7 
X-CRM114-Status: GOOD (  13.39  )
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

On Wed, May 07, 2025 at 10:09:19PM GMT, Bryan Brattlof wrote:
> Add the binding for TI's AM62L family of devices.
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
> Changes in v1:
>  - separated out devicetree bindings
> ---

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


