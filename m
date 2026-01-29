Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F114D358D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7hRWk5Gw4Vd9HLwzQPnE1UIY9A6TXP9px8gBcbEfJw=; b=x3YA0eWKwoLEMZDA6neWdlllrE
	XbBbaQNNvT9tXVl38E3vki7boL3t/6N6zC4d+mbhtA1kltti7S+c/IINOa9SPu9V4aRUWoCpcsng8
	3Cez/gZRsV9L5csyhWZsLJOrglWkMKZ37KyS1X9YAGuyzqqCPPkMPWl+1iiVaTlDVmq1H4pBZzb2F
	NjeGbS5KQxofXdMIM9vy6Lq5A2yzZZIgumwRB+RYPOMXNitbgm5z8RyV/R148fb4RFg2PpddNAtNK
	X1BP8yKWSVb5ChM5N7STj/NZnP/Stv90U9CGpjz+jKl+6mi9r03QLQJZav8v0HUdfgqHySQUrTVYV
	FzFMqH7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVK8-00000000Ngm-3lWW;
	Thu, 29 Jan 2026 16:56:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVK6-00000000Nfs-29CD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 16:56:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAFA5403C7;
	Thu, 29 Jan 2026 16:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E40C4CEF7;
	Thu, 29 Jan 2026 16:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769705809;
	bh=m9r0bV5tm34u19PRjkFevkAscNe7jnYkskW251n5sIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QP7IlsrJqnXK7Mc8acLftaX0JPlcSCxuVo3HTmS6OQFbSsRbCD36wcsyGQGa637Gk
	 wOJgfBgh6yk3d1Jtdf2mT7l5zLfkyUCOwGnczCaXCFc6T0VMncyoCqlLbm94G/QXsN
	 +Mkm9/VVYcvfxdZFdY4uQ0UACqEFk3DmBIYii4yaqSPnX3wqdldqwIvbCqpaCugIF8
	 GCn5m+HD9dXQavtq7UlCsl3FAbetoldcdvQDLH7g4Mo6Jz34aIHy2SPmIZtWlhrSM7
	 M1Dd98j92+i2AOp//1EjK9T6TVwpKFwZtH9TBYdyXtp+SvPHTuud8xUUQbsE632LU8
	 xJ5iVrgt45DqQ==
Date: Thu, 29 Jan 2026 10:56:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: imx@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Abel Vesa <abelvesa@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v4 2/4] dt-bindings: clock: vf610: Drop VF610_CLK_END
 define
Message-ID: <176970580832.1273597.12768632002684119735.robh@kernel.org>
References: <20260129095442.1646748-1-lukma@nabladev.com>
 <20260129095442.1646748-3-lukma@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129095442.1646748-3-lukma@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_085650_569229_FF9391C3 
X-CRM114-Status: GOOD (  11.45  )
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


On Thu, 29 Jan 2026 10:54:40 +0100, Lukasz Majewski wrote:
> The VF610_CLK_END should be dropped as it is not part of the ABI.
> 
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> ---
> Changes for v4:
> - New, separate patch
> ---
>  include/dt-bindings/clock/vf610-clock.h | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


