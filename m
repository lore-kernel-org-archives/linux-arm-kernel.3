Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1069BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 12:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGZgWVjmUU2e98daveVu+Rl8WEA0ynQ2oMHWAmwqGlA=; b=B5dReDFJUx4bBAeq0nQV2yHGb7
	7wtgrRL1+zjauz/CXEBx7IRpCBwxXYDiPWNZa1cDJVJBMn4FkRsv/yhFnd9Xveln23cktCspILRfU
	XoJ7WSc19iy7Of1OrwQGJJzqTv72+F92z+dtp+gRdnbizA7oQglRIdJuUWB0ff+zG3MLuv6ZHl25e
	PY7pkZ8NAwtpsbshdOqPS/5ahBwrxh1znWfmy/E9rAklWDYLDmonk3P6TSecHi1H91OviVfbwW/IX
	WwzFLTSQJ4iX0BiqDaKn/h9E7l5k8M3tQa61k18IF33HnsZF1F0KQs2vZbiqfSEz6zncvE2WG+jub
	MzLR3Azw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DGv-0000000DhJN-2mXv;
	Fri, 11 Apr 2025 12:14:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DDZ-0000000DgYS-3nle;
	Fri, 11 Apr 2025 12:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9D26BA4AAE4;
	Fri, 11 Apr 2025 12:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6EEFC4CEE2;
	Fri, 11 Apr 2025 12:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744373444;
	bh=bef+HJXcEo2hORvZPJWuTpm+dOfyv21lTNoivV+wiLQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EUQNS3TgW4ma5b+9diC1JS/QSa3on9tCBUIieI+S3+FKCYTQCBxu0Q5Lm7WxP0C9G
	 jmTtYq1R2foBthUicTIZLURqxEUVKiAm1xi3yS1nmBl0giAgsKYf3D+23ztucU5UWe
	 LfZex2TS41FS6nMNCTgL5MU45QNz2DbQ6cQ1luO3Ng7CtltHZcrSrYAGUHI2yWmXBL
	 5tn53k04JKavpMLGyI5DHaV8ENyl3w83Emww0DZUmSdtOjLYYwrDXnVQMdh3uqo+6/
	 z+frZgXCsR87+JR+3s8a3vlNgC8B+o0I6DBOjudAKXwhO0G+taW5VybSWG3oJV5sdq
	 JhBLze5q0F96Q==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Frank Wang <frank.wang@rock-chips.com>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250407165607.2937088-1-robh@kernel.org>
References: <20250407165607.2937088-1-robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: phy: rockchip: Add missing
 "phy-supply" property
Message-Id: <174437344138.673939.9714886269957011717.b4-ty@kernel.org>
Date: Fri, 11 Apr 2025 17:40:41 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_051046_016906_A7020C27 
X-CRM114-Status: UNSURE (   4.97  )
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


On Mon, 07 Apr 2025 11:56:06 -0500, Rob Herring (Arm) wrote:
> Several Rockchip PHYs use the "phy-supply" property, but don't
> document it. Add it to the current known users.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: rockchip: Add missing "phy-supply" property
      commit: 070d546258257c75c65a2f15da558eb96bce550c

Best regards,
-- 
~Vinod



