Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA3BC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 07:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEP+L3xpS1RDue2uh0ljoigdAug0LR5qiQnir/JxXss=; b=X+IzjKV0wGJksPttjZnpDpkPzF
	7xDiidQCB64p6f97zi45fiazsfpn9XrRjUEeXu4OrYGSQZL/gDpLs5Dham2NaFyPtGhhuHdYIztCh
	7MI1wyu7et6qJWKH5jQFoTSJc4swc5IUw1ZCQcJLyReI2p5gRGP3LB8pQWfIdmE17SCRi5IdWQLmc
	3GOQ1+bAE7a/ZAJbak1YUjtoQaxLo3BaXfXknhnRANofNtFjsa2pZLQ6ddUxSUvwRmPOWQzOHLNB2
	P/bvGbbnxhaGGxkwDfrPbVb2D5RMjt+wmPrrtMSAS+e2DnsA2vuX9VKXeTpEwUtHPuGJQAWvUH1Fg
	C0iWbMzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4wsB-00000008YgS-3vGE;
	Wed, 16 Apr 2025 07:07:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4wqL-00000008YGc-08vC;
	Wed, 16 Apr 2025 07:05:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 02F1AA4B055;
	Wed, 16 Apr 2025 07:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B175C4CEE2;
	Wed, 16 Apr 2025 07:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744787156;
	bh=TvXOOfKd0AybmzJYKKOIvlp2HZzH1NJikgI1O9LLoI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pga454ijr9cG0L5OgTIT2/FkeP0bBGXdaK2we465eqKPpHz8IGq3a1p1nXMDMQKT6
	 GB4EQIzSJKyWdnsVmZfr3LNLtmPMXsCzplmXasJAA5dqMY3klHwHOtrBT1ZUvARjN/
	 Zzbax0FELML6UEenIIsL8HolP4iUWgDgDapZcU/Dn61a8PPpSuwT5iucZYIWsk/lZP
	 3uPhtIxDWz1tsQ7v2llcz2HDuCexK4UYI/UrHmy8nIC6s1i3671YFiMHRoFjhXL49d
	 VuqQP61yqkW2fZoS5glxVuRYO1m74CusWu/82h1+wclWgomWjUNbZ+allUKFvzwVoK
	 L8J/T4NyXXyTw==
Date: Wed, 16 Apr 2025 09:05:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	Finley Xiao <finley.xiao@rock-chips.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Elaine Zhang <zhangqing@rock-chips.com>, linux-arm-kernel@lists.infradead.org, 
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: power: rockchip: Add support for
 RK3562 SoC
Message-ID: <20250416-elegant-devious-rook-1bde16@shite>
References: <20250415032314.44997-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250415032314.44997-1-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_000557_133820_29D9355E 
X-CRM114-Status: UNSURE (   7.84  )
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

On Tue, Apr 15, 2025 at 11:23:13AM GMT, Kever Yang wrote:
> From: Finley Xiao <finley.xiao@rock-chips.com>
> 
> According to a description from TRM, add all the power domains.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


