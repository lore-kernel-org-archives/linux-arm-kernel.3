Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6215FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 08:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VSBl1JNqJ182CJBRaWBDqrXZEPtyAj0Lsbjgus1QlEE=; b=xFkD5r66kHqXrhxYKcyTUx3Uut
	sMVFzUaqApa4jdGOr38+uKSjxdh/MCiZM+Mir5+bl+pEhkkYqMaJKx3uMMVgK946we/rrnFEg1Tc6
	9heVbP9aIdCEFH+Zd5JXtCoLext52FI+//rvIk/I1Q+QsZxeEKZdTvwpgrbrkoa5kLerlBTl/YThC
	k3tgcoOaRFGkj+Xg17btLFQapZXDh276iC+VArXfBSk6We7Ew7NORz8JvwfT89riqRc5lbKZ3sAMf
	jPtOXfGgjrYHq/crA39rIIiXDk046fMWC0VJZQpsowhA9tE0SbGiQti+hbsSRezT7yckYWUF2MkWb
	wi1JmgRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bP8-00000004wd1-1HF6;
	Tue, 15 Apr 2025 08:12:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bCk-00000004uFj-0pNU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 07:59:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 128815C110F;
	Tue, 15 Apr 2025 07:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B91EC4AF09;
	Tue, 15 Apr 2025 07:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744703976;
	bh=apFQ66fRd9xJJsmDFT4fBVyQEd5Nz16mGiKFnHmC7co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TNzdiH6/EXzWt2LSkm++qPQ5Fi1SmCx/QCDtAtqoxR+0chB6LuqksMS20c/Jc05ND
	 /VIq5F9XibAyFdR50Tk1e4C5vLAE5WqtxCsOvMybpqLNUgjei4jBKgl8hYVIFkRXGl
	 MQpd4WkZhZ7XBeKzr+ImQUKcnOz68m0Exe0L3y5CLzrDfF0msE6Scpb3Dm2kRwasgk
	 +oB0XfNDTk3DipE8933EZD2sk9WODydfZEt6cZMyS5gO+b4Y9Qe+IshU3bLvk463IF
	 ufYm+YoVTKMvwjE+pnRLrKq6RFvrq9mxSRl90+BKFpb1F5C4PE6wHpgHOMi2axBvgB
	 A+34xcNp8Gc/g==
Date: Tue, 15 Apr 2025 09:59:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	lee@kernel.org, sre@kernel.org, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5 02/11] dt-bindings: power: reset: atmel,sama5d2-shdwc:
 Add microchip,sama7d65-shdwc
Message-ID: <20250415-wise-uptight-earwig-31ceca@shite>
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
 <24666308604d3eb9f2b8c64d4a466c6fd77120e9.1744666011.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <24666308604d3eb9f2b8c64d4a466c6fd77120e9.1744666011.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_005938_296111_908046FE 
X-CRM114-Status: UNSURE (   7.66  )
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

On Mon, Apr 14, 2025 at 02:41:19PM GMT, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SAMA7D65 SHDWC compatible to DT bindings documentation
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

You are sending patches which are already applied.

Best regards,
Krzysztof


