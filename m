Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D7BC4450E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 10:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZ9neGSTZv0tRZ93sQ9W4RHlZGFSNmTmyLUpPYeswWY=; b=d58WCvcruFiS6+6t68nvxQv0EG
	Phe31BxYtp4s51+vmVCQjMZCQADyooH26NfHnBcXS5xPg1deVTJ4QqBcxyZfg5Pk/r4fBbUHSDBbj
	THppv+ZUxeX2KHpiOIu4BjIn/jxq1PCTgRHH0hkzQaPx7j+8srfLh/YxXvI8MH/s4lIsFMnb6H1/9
	JqZcbFW/oL3kzGsA0GkfO3uTu1gkbOheOQGeCBb6k3SeYQ111tWfXcxhFNHIxQYL11jOJelgyaGcE
	9II6SO6tQuvV7IOmggecWNS3KQ1ouNfmWRmuD1plir22PtdB8Naajq77B6AeL1L69DYiiB0+wuDKZ
	Z3RQ3m/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJR6-0000000H1u2-2zpp;
	Thu, 16 Jul 2026 10:35:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkJR5-0000000H1tl-2146;
	Thu, 16 Jul 2026 10:35:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D24260054;
	Thu, 16 Jul 2026 10:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257321F000E9;
	Thu, 16 Jul 2026 10:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784198122;
	bh=XZ9neGSTZv0tRZ93sQ9W4RHlZGFSNmTmyLUpPYeswWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BkpHrTRTQT75v0uMFSewydd/owJ6qBCoAG5UY1ioioKVsH5yQth9Bxoh4lAkzkHRc
	 NJA14urfKi711qp5hkcEZt4Ng+7oeOXrLAonuzhVVqAmWJK5dzAq1jae5v0+pK/Opp
	 xahRoQrykXPo7nAMmlwsNq/g9LJW+TplC3EkGQd+P7ZijU25AZCIsYIB4ufX1a0Da9
	 xor42r0e/e/X/SAuW4HNVBoa7qLXRI09/+nEnlxrx6+2KNyVcDY5xyFLfHMLeq1GYS
	 MDM76mBUU8A6gxO193nizg30o+pNhbDC84KUGp3jBXxnHJLC7IV6OHsc882KzNt586
	 D+gbeD4t6lThw==
Date: Thu, 16 Jul 2026 11:35:17 +0100
From: Lee Jones <lee@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>,
	Pavel Machek <pavel@kernel.org>, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: leds: Document "gpio" trigger
Message-ID: <20260716103517.GA1260374@google.com>
References: <20260711192842.845048-1-samuel@sholland.org>
 <20260711192842.845048-2-samuel@sholland.org>
 <5188715.0VBMTVartN@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5188715.0VBMTVartN@phil>
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

On Wed, 15 Jul 2026, Heiko Stuebner wrote:

> Hi Samuel,
> 
> Am Samstag, 11. Juli 2026, 21:28:25 Mitteleuropäische Sommerzeit schrieb Samuel Holland:
> > The "gpio" trigger is used to control LEDs by the level of a GPIO input
> > referenced by the trigger-sources property. This is already documented
> > in the trigger-sources property description and is used in at least one
> > devicetree (am335x-regor.dtsi). Document it so validation of those and
> > future DTs will pass.
> > 
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
> 
> having Lee only in Cc in a longer patch series might make it difficult
> to notice this change.

It's okay.  I don't pay any attention to To:, Cc:, or Bcc.

> I guess this patch needs to be applied or at least "Acked-by" by them.

Applied.

-- 
Lee Jones

