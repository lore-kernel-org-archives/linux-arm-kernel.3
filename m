Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4955C18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 16:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQRI4aIadB4SLc9qyuQyLvmXyLZ4PUpJftVwm1r9GBU=; b=NykJT4m0+IYBk9WXxtwGCEWJ68
	5+a5SkpmeCMaNF7kyaWrUV/9ND1ICJdU1j2VNSb77cmnqCV4AA5lf5o2Jot7Rvx8Wvg7Hr5kgLQIB
	Yjtdm7m2BYEWESSOQWUoHA8yvFSbd6g2RivU3DeiAGI+CVOghR/rDbROWEkqkTojBnTSTuHoW8wd2
	QUrT/u9n5kfimmb7ibQR4eOCJctheUCwPm+U4TYYnfFZs8/2+FrPf273MTQR2aAJmqW/jC3sPHlIo
	5aWeta1srz5wJmApPbDAbDA0Ndpf7yq5ActQ10DiV2TvhZz07EDnSdiazFN5EcEqVyJm6zGyZ9TDI
	oqUIMM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJpy-00000004RZb-0kBg;
	Wed, 26 Feb 2025 16:00:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJmq-00000004Ql9-34lf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 15:57:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 59B845C721A;
	Wed, 26 Feb 2025 15:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02C1C4CED6;
	Wed, 26 Feb 2025 15:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740585447;
	bh=y8jsCkKdNJVLcptk+VOu8TS+CbG14vqEdbXaDiqHOoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fn1w8luBkQwQT5Gf6PbdYbzEcJY5EWhNV4NzILJGStXAiaxMu/LvEjhpUFYE3I6sa
	 8p1YI3R5JehQrAq5WSFr0SY5meqRyh0637IbtXcyOwNcLxhTAmMXaBAb1xGE+cueNC
	 K+MAM+zU1K11J6ejoak9JegH11AZ/kvf+OgQSiQJMohFF1/tJE84weUncIm7M7KxYc
	 AXLyho3vACvIQ3B+Rpe3rhPI9whdWrtGPX8YksOcGZPC5j2A1eSR/RBvE468JSOVZs
	 MBpRXm0jdanQvvLK1hEl/oRO4/xTj75MlLQx7elMSkSclWOo4PuJgfAuJZRQlRZyIg
	 PbFeIDnTOHcGw==
Date: Wed, 26 Feb 2025 09:57:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: ARM: at91: add Calao USB boards
Message-ID: <174058544546.2504002.1070415645254851999.robh@kernel.org>
References: <20250226084938.3436-6-wsa+renesas@sang-engineering.com>
 <20250226084938.3436-8-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226084938.3436-8-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_075728_813513_2707EC76 
X-CRM114-Status: UNSURE (   9.24  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Wed, 26 Feb 2025 09:49:37 +0100, Wolfram Sang wrote:
> They have not been added so far. dtbs_check complains loudly.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../devicetree/bindings/arm/atmel-at91.yaml   | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


