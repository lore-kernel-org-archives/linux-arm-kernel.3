Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E61E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 06:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wfh1Xou8z3BisOqIZhOUtlsTFKtmDK+w6iynuuptxoI=; b=LB5jyC18j2KoPkIMgF9+Miaqic
	FQn2uELlmQxWWBSKIHeYRF/PsNOmaEvViY9CY5dk1ePraLElmOVDLdh1q3QwLt1R3PBQEGmEfJbXd
	7EIsfyjrl9LNdsebc0jnGj7mAyUs1bCwOox4QUlPjv6hKNYVYOkCS72mt806vxDmrDvAA/agsg6lg
	GtfimbBhav9vNjt69sm64SOZ3+oI2+an8/JFI2EA89AKOZ9yKVQsw8829cloKW99VFCE+Ggd1ov3N
	wTGFuLgQkXncbL9rBKCheL409ezISEpNTnnWPmCxdYMCvkohuH3VHgkMMLhpMAjKpe35RCWopPdKa
	u1sRmy/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNQfd-0000000CMYt-46s8;
	Tue, 17 Dec 2024 06:03:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNQeY-0000000CMTY-3HiP;
	Tue, 17 Dec 2024 06:01:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 510375C04DC;
	Tue, 17 Dec 2024 06:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3174AC4CED3;
	Tue, 17 Dec 2024 06:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734415313;
	bh=MQnRWevRgWT/JlpN36fyGwLKn3r7MNLcMMTBRQu2YQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f5iO8C/UuhniGjG0h7aUi4m9cu/4f33aLXIkr3YdZtV3rXyiPpHQxHYSGoeFDoAL4
	 fCLW1PBKHXIn6wwZ0dj4hZXpc2s4ToXDvbMugCnwll8wMaIhQveLO8Mpr5W+v5AdWt
	 0Sc4SZpbNql6q4Ez/a0AqSoOW1knPOv4beOfH/mFstcy+eXkSf2znqRPb2gnco99Rk
	 7TDt62Xh5umr2vB7LM8d2XcRfFugVwvuZZd2/LzVoSPFQYb7z5LTlag4TTjefejDoD
	 1EEn6P33ac7bVJHfmITQaD99iKsN/VOTYYKQfzATTjJ5MrP60iBV7e/rBUG/0Kzb2e
	 Q9lJhU5D9CuHw==
Date: Tue, 17 Dec 2024 07:01:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shimrra Shai <shimrrashai@gmail.com>
Cc: linux-kernel@vger.kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, heiko@sntech.de, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	robh@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: rockchip: Add Firefly ITX-3588J
 board
Message-ID: <lkj2atlhann2t4b2oiztnlurr6zecmzllxstaf7vdnj2zy5x5d@pbzfqr6lsnhu>
References: <20241216214152.58387-1-shimrrashai@gmail.com>
 <20241216214152.58387-2-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241216214152.58387-2-shimrrashai@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_220154_863558_A9E409B8 
X-CRM114-Status: GOOD (  12.79  )
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

On Mon, Dec 16, 2024 at 03:41:51PM -0600, Shimrra Shai wrote:
> Document board compatible bindings.
> 
> Signed-off-by: Shimrra Shai <shimrrashai@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation: Please add
Acked-by/Reviewed-by/Tested-by tags when posting new versions, under
or above your Signed-off-by tag. Tag is "received", when provided
in a message replied to you on the mailing list. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for tags received on the version
they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof


