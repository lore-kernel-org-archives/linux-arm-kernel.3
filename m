Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37ACDCA5FB8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 17:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8hiawV26Vv+bQT0ragLMCSj+JMcDW/G0WxHYmhWSSo=; b=Li1d9N+8HBKDtMRmB/7meXd3qT
	XdlHLs8lh8TxGClLEbdlJItnTqUOKRkYHo8mHkm9h76HcAPyinbv6s3GNBX5QYykkllUdNHj19xJI
	kJW1PLq75Y88+Ray8Ya1r9yt1w89Yc8jf78Cqe2cnU6MtnImK/SZSpzyvpXYR2SgcM6NxQvKBpFGD
	j1CxdT/2dvKPf95icGr2GrF0kVIXOXZKCMf7NsV6o7qMuESMeIKDuV1XyXwWJoRscrWwIUzUZEDM4
	ZCRBWagL9+R2N2KzGJWV+HSHQ+7TTEBkM1RU+M8nUtlKxiScCrCs6ZmGZlUcaCvh9A94uSsZQB3/q
	2YkuiUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viFIh-00000004E2p-3iJ0;
	Tue, 20 Jan 2026 17:13:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viFIe-00000004E22-3gTs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 17:13:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 26D8144063;
	Tue, 20 Jan 2026 17:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F143C16AAE;
	Tue, 20 Jan 2026 17:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768929232;
	bh=FCXUTifsoE5ms3846pZc5X2+cn49qG54H5gxPe63MiE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZN/OaL86bOdC6IT7QGy65HSNIb4kEOeBIdUSX4/ywGgfkLO0g/ysRy+uUCedRSk6L
	 /7ldB+MuNTI8ZN6BAobOyyExx/lJYLUv99rokkj0ggeP9X0MOjvEoqNRg3rx37/ww4
	 AkM3YmkKZQJ/1Dlq06eEgKdLuwLvu+2P9rHbQrdfqPD8EPsTrpOcieAgTo+B6z6C+v
	 oyWLQJrVJ1t7QW+Fvmg8cnUr+chDtH49RJer6ZIxDO8gPhzXst88+PFikgTSAsgBss
	 IFwDX/6nyGE+R1dtv2Qz1MpO5QRuygPNb/KnpC2z80oOT4cfGpp1mGhCFPlmXbXzil
	 u8IvFZdYw2gfg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260109-dev-dt-warnings-mfd-v1-1-1aabe37e9a14@codeconstruct.com.au>
References: <20260109-dev-dt-warnings-mfd-v1-1-1aabe37e9a14@codeconstruct.com.au>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: Document smp-memram subnode
 for aspeed,ast2x00-scu
Message-Id: <176892922879.2358656.10600094966614086692.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 17:13:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_091352_957520_4134E08B 
X-CRM114-Status: UNSURE (   6.82  )
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

On Fri, 09 Jan 2026 17:05:18 +1030, Andrew Jeffery wrote:
> The platform initialisation code for the AST2600 implements the custom
> SMP bringup protocol, and searches for the relevant compatible. As a
> consequence, define the requisite node and the compatible string, which
> in-turn tidies up the dtb check results.
> 
> 

Applied, thanks!

[1/1] dt-bindings: mfd: Document smp-memram subnode for aspeed,ast2x00-scu
      commit: d9c80c6393900f810cf30fb33f93c7f762c0ff4d

--
Lee Jones [李琼斯]


