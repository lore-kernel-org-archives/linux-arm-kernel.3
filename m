Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE539C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p442NeFcXiEXEJXATBeXmZTC0RdFcUb4r1aULiQq4oQ=; b=ITlogGGSBj6nZFDaTi0R0j9QMw
	E1Tdih28QWhVC2uvFTpnNSDS3QVfsE8qIhQuoI5c2pXUolG5orPLSz3DLr7TFOc7UphebOqUoOvGy
	+T8OXigb9FAoWkoU2bh+97mVsDzBPLYbsMyzWdTtjkh7wuYUcuqmIoJV8b1JPAEJADmi/ILbpgkd1
	rm/mfHc1YvvqLZm2uKHqUQ0bRC+LSgbhHdm4+DH9leh6uCuvXxxHC2K0FDqXUHwflXFHQVHDyJnfL
	daxaOVPuWqsFPUTzJWuO6A8xdBdmIgKq7BZBK9NbPvjcqGyehrTre5c8kF8uy7LxibEMIBwXZ10hk
	sPvOtkeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we69O-0000000DrWD-1k7H;
	Mon, 29 Jun 2026 07:11:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we69N-0000000DrVq-0qlI;
	Mon, 29 Jun 2026 07:11:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AEDB1416EB;
	Mon, 29 Jun 2026 07:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614B91F000E9;
	Mon, 29 Jun 2026 07:11:22 +0000 (UTC)
Date: Mon, 29 Jun 2026 09:11:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add graperain
Message-ID: <20260629-flawless-cherry-starfish-9c4fbe@quoll>
References: <20260627225755.1710837-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260627225755.1710837-2-coiaprant@gmail.com>
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

On Sun, Jun 28, 2026 at 06:57:54AM +0800, Coia Prant wrote:
> Add graperain to the vendor prefixes.
> 
> Link: https://www.graperain.cn/ (China)
> Link: https://www.graperain.com/ (Global)
> 
> Signed-off-by: Coia Prant <coiaprant@gmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


