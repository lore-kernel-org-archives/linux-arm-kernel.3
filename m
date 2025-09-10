Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8B4CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 21:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7izxSB8D3yRqJtHIZH5edeexLBqkFjInj4/i/x0Co/g=; b=AkyM0SVBPSs2yxnQEL2CpcWCUQ
	mPFo2AqMbrmj36qIfO9VE+q8ibRPoU3U1u10IBxMu0u1jcxeEbGrXGpacaCtDVuqzY3YnA/e2jmLi
	WGrh0IpfBxUepuJEjTaTjOwZTepNzFxpxGttqDZeDZfKsxeo4zHoDAjZP11cXwWwZ4/qXDD74ZYQh
	S9HnKt1lTBYh227Cc8tTOUofga7vPMXpipqm+S1rMRcu7xqHG3meB2ac6um5+jHG7m2MOHXbQE99p
	6PjYIWSmUdiWKfkdRNat56ciXHr/mKuFgoW/8GMLJ/bEayVuw1sAYLYljMPoth0c6VsgP6nq6O4hn
	8v2ULBBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwS61-0000000GnZP-20Jv;
	Wed, 10 Sep 2025 21:11:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwS5z-0000000GnYH-0JiH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 21:11:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F622416D8;
	Wed, 10 Sep 2025 21:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60254C4CEEB;
	Wed, 10 Sep 2025 21:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757538674;
	bh=uYOJ00hDbxfZ7PoTwhu15yA05ZdjJwHavqckAn9kWJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uWmLZEuIfr9OmvUzqUOenDPH2KzmBSo6/YqX9fcEBa2WgoHiRFIlcc28tysrgexzU
	 ESiFzSYIuRftAdX/Nf0GS9cKQa1XhmeXnJu03HJbEBBCq85vK6X8J+HCNm4zXS5a73
	 gx6isX33vvObcw5ygajcAv9JXQbKagc/sD3FFVmrqZ+5eu0aNVeWTPRQqW5ZfTZTup
	 wDBJphd3cftA/51Xa31pde+MiQv1u5xb3T1i2HJ1y1rpwNsRRLGGXEuJmDGcxWZO5t
	 006ITRujbc7XLwiWTfCupkgSU01919wRAyuOSdEXiyVrfoC/xkz4ZchhzcbH8knEGH
	 8PNAqNMntzgew==
Date: Wed, 10 Sep 2025 16:11:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org,
	Lukasz Luba <lukasz.luba@arm.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-pm@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2] dt-binding: thermal: Convert
 marvell,armada-ap806-thermal to DT schema
Message-ID: <175753867139.468005.15982827346149015413.robh@kernel.org>
References: <20250822225701.766947-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822225701.766947-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_141115_132573_8254CAA9 
X-CRM114-Status: UNSURE (   9.75  )
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


On Fri, 22 Aug 2025 17:57:00 -0500, Rob Herring (Arm) wrote:
> Convert the Marvell Armada AP80x/CP110 thermal binding to schema. It is
> a straight forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> v2:
>  - Mention the SEI connection
> ---
>  .../arm/marvell/ap80x-system-controller.txt   | 39 ----------------
>  .../arm/marvell/cp110-system-controller.txt   | 43 -----------------
>  .../thermal/marvell,armada-ap806-thermal.yaml | 46 +++++++++++++++++++
>  3 files changed, 46 insertions(+), 82 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/thermal/marvell,armada-ap806-thermal.yaml
> 

Applied, thanks!


