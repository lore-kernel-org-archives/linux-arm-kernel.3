Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69088E6F06C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvXXKKirgYBhDMBn+0k209YUUu7Ka/nZ5P08CFtOYmI=; b=42Y9JOuxV8rTVXi2HUNGfZ/WAM
	h7ffckC7oTfdmoX6y1raPFhtoOuV2UtBipLLyu3WeqjdhPBekg2zvEDrgeYA0rSvvwut7IRyOQ0P/
	33IpY29pG7eregQQyECGuHEETBKPD/4wjh2xlxke7dKmaPAYS9qLYlu2HoHHGibxp8O0/rzSbBewj
	MfvDKi959uWzONDQa0QF2hWUbW7Fpmw+T3rd2aLiPz3xgeZkRkGK+Na17qOzdkgtDrmKgyj5c27cO
	9wlBnJng3ZSkRsSLY0vMCMSnCPVL1Y2ZNhdG/NGD8UC6ljbG7/Gt8aKaCpV3ZQrvM1ynFlWmgzHH+
	dWB7Uo2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uMm-00000007dtE-2AOa;
	Fri, 01 Nov 2024 16:19:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uGC-00000007cdh-2zGx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:12:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7EFF0A44587;
	Fri,  1 Nov 2024 16:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6598C4CECD;
	Fri,  1 Nov 2024 16:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730477547;
	bh=uwXUT5FtHSsLYjY23SN+coyvRK2O8i6XV0K5dlhp3Qs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dmaX2Nplc9QxCZRRY5Fbnq/PxjXcgLVPzmYLgxlaDO4rna64XDtqCOrxVYr0J5szB
	 Npqtvz8dRNAd7ViCuk2MLHkGA7eTvnXYkKUaQlwl3qlrx76/ULmaSEoLyntGzpWWPC
	 KJ7D4NrcX42+sZjs9FbV9YsttI11hzwmwuIP24o8vvdU2uO/EfBI5jRrX0ShKM6SfL
	 6aEYFNomlrRPUn5PkorX0hSmyFwwDwTPvpOTSbTPA6cUxo7FZT0hr8efh/D4opvx+F
	 XyqwQvcAxFIennJEMO7aC8eKS25RdXOLLlevMAiDhz7zVQbNc5xd/+eliz609Z2B19
	 Y2V5d07aSa/Kw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, dmitry.baryshkov@linaro.org, 
 Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20241023090153.1395220-2-ryan_chen@aspeedtech.com>
References: <20241023090153.1395220-1-ryan_chen@aspeedtech.com>
 <20241023090153.1395220-2-ryan_chen@aspeedtech.com>
Subject: Re: (subset) [PATCH v6 1/3] dt-bindings: mfd: aspeed: support for
 AST2700
Message-Id: <173047754439.1930424.6922132618537420144.b4-ty@kernel.org>
Date: Fri, 01 Nov 2024 16:12:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_091228_832766_59963B12 
X-CRM114-Status: UNSURE (   5.84  )
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

On Wed, 23 Oct 2024 17:01:51 +0800, Ryan Chen wrote:
> Add reset, clk dt bindings headers, and update compatible
> support for AST2700 clk, silicon-id in yaml.
> 
> 

Applied, thanks!

[1/3] dt-bindings: mfd: aspeed: support for AST2700
      commit: 76c6217c31266e800b67a476bba59dfeb9858a90

--
Lee Jones [李琼斯]


