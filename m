Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1AE5C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 10:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tMnLZYVSEfAWvNGaodVtEGxYuS01waY3GXX/DrGW29o=; b=eUNp4chOvrmvA+zbZSCGsibvA2
	YIhLm3e7gYnQy0Mb/L+s7PBfsjMwG+BL9dkPThKxACkJHdemED4R9AVQCryMeXJBFVAhuNqRKUtYu
	2EdRhkpmYPNeMjWhlNvihD90WqyaDuf1o2NKChHxn9pAH1wxqWl1fbHAVpw7lMvOGZwMzFS06a5SU
	ilti/4XEfg/mTd4FFpg41FmVGTU6xefr9II5oy0j/wQk7+3gkhBD11tkUlQd7bVL4V/sjgJ49HhZ4
	mhPJj3i90Xw4/iieIHPI/g8BK777FMcBP/YRlgLZ1dlUfAs4O7ID2qc3BqyG5DMdDph4J9COhgWo4
	WN04X0cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCybM-00000000Old-3OTo;
	Thu, 08 May 2025 10:35:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyXs-00000000NyA-48X0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 10:32:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 95E4EA48622;
	Thu,  8 May 2025 10:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B65C4CEE9;
	Thu,  8 May 2025 10:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746700323;
	bh=CHelBqBpP/88IAjY7tksAEa5489dB+ryt+w4mhY/WiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PBHuHaai3znTAjUB8enkfdSVPxffzb2rq/068BxCgs5w0kz0FnCgRsw8kyOjOYFUf
	 QANdtmA0BDXy6UX3nLKl6xwbG0klrVWIkiHC4K51Pz4Rqeh+dMCH/bgpi2elHrNZ0r
	 qw6LRXZCkBSnchvRyPJ0nn4IxZwZYsQhBxCtvaPrnSfa+c21oxK++u7xj5SY6XaLPk
	 t8k+mQ3wMotkod79fWhxHH5dO0WbKZ/unNdmKUpN7NIlPBUSXa/PxSJKJwzfUJANb4
	 etGqsAELXDKm5RGDTkBQ73greqCGXhFbvd4PFgUxqiJyPD7pnRmVc7EVQlhbJd8kWA
	 KqTiumGMiE7sA==
Date: Thu, 8 May 2025 12:31:59 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3] dt-bindings: i2c: i2c-wmt: Convert to YAML
Message-ID: <wt7du4fu44sxut5i4ymhmb4akhm46btm7yszz6xbya2sxq7gdp@al24jhhqdz5c>
References: <20250506-vt8500-i2c-binding-v3-1-401c3e090a88@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-vt8500-i2c-binding-v3-1-401c3e090a88@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_033205_091258_C29833B4 
X-CRM114-Status: GOOD (  10.23  )
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

Hi Alexey,

> index 16037aaa770fc35efb45fc26555afaa5102e2640..4d18afdaf12bf6a5956793814f8db39b34074a12 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3464,7 +3464,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Odd Fixes
>  F:	Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
> -F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
> +F:	Documentation/devicetree/bindings/i2c/wm,wm8505-i2c.yaml

this has caused some conflict. You are based on -next but i2c
hasn't received some of these changes, yet.

Anyway, I fixed the conflict and merged to i2c/i2c-host. Let's
see how it goes, but I believe we will receive some complaints in
the next days.

Andi

