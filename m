Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09FBCD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dr50uPO7eF9OrFOOFLaGBZ1ya8dzFvE9OZgobV06/Y=; b=Cd+87uyWNZgUhoWF8APavAQgr8
	FPzWBqw9Pxcsy/Uc3cp/OqcJeHhAD8mKU7pcVQFkm64vnSls/07tRP+8gJB7nBvGp3ncuBdcqmH8i
	hf8lCdWJenagesAWQ7HlgOf4mXLgdnHG1cn4IGiNorXTGgEbUr0R154sVaM7/wKSrhGoXeQ44i9R0
	6Jf54lO81zzAIRgdJOeWTKnS27EX93KYVa+DHmbTdLMwvnDk4rQTz2KUh0wDJLmZwM7pmrWqgWLzY
	Lu1OiyRzODd8dpWGX2kOMW7xKbK7DAVWkpfGN/VWspPJL+h4+bBOM0NFMqI1I/IHNiudFxILwxr4v
	dZkNM39Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWod-00000005gZe-1oIn;
	Thu, 14 May 2026 14:13:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWob-00000005gZU-2Z4q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:13:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ABC1D60008;
	Thu, 14 May 2026 14:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8635C2BCB8;
	Thu, 14 May 2026 14:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778768008;
	bh=vecM+NvydGm3n5aPBbo+HzeFwabzmwcQucOYFjvSKhg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XkEHt8uWWQKSBKZ28HG2MVM7OP5TcnsspKmi+712eDUBP08VVTF3q7cwbdL7vIDrL
	 P40fcVGnciFBb/xwmE+oj6q3lT4AGb/EwNz8qhuKp7AcviwDM9s/NqKv5OThLSZCqi
	 IHur3CiTebWzCJOq5EeAjzhZEs8uHJT5Qaav0rrqVsslds8y+y5gVGaKlwbDf5bO/9
	 etsbVV3oJG08NkrhZ5YkrLDojMKCL8Tfv+EGQH2RZjPeNXbJf3EfJX+Lqao/QtqF1H
	 2FSn4NyD+u4CVGU0G49LIMN0wOus1x0FawEKPtAVg6wbPCjbnWFNBkcqcvTP65RUBE
	 hdfoMDt2mAI7A==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260428-upstream_pinctrl-v8-2-eb8ef9ab0498@aspeedtech.com>
References: <20260428-upstream_pinctrl-v8-2-eb8ef9ab0498@aspeedtech.com>
Subject: Re: (subset) [PATCH v8 2/3] dt-bindings: mfd: aspeed,ast2x00-scu:
 Describe AST2700 SCU0
Message-Id: <177876800455.2774299.12102353346237716077.b4-ty@b4>
Date: Thu, 14 May 2026 15:13:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Tue, 28 Apr 2026 17:49:46 +0800, Billy Tsai wrote:
> AST2700 consists of two interconnected SoC instances, each with its own
> System Control Unit (SCU). The SCU0 provides pin control, interrupt
> controllers, clocks, resets, and address-space mappings for the
> Secondary and Tertiary Service Processors (SSP and TSP).
> 
> Describe the SSP/TSP address mappings using the standard
> memory-region and memory-region-names properties.
> 
> [...]

Applied, thanks!

[2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe AST2700 SCU0
      commit: 821fe4172d2a220278d6d279b695b3e299c1614f

--
Lee Jones [李琼斯]


