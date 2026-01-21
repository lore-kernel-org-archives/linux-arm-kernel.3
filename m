Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3657C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dm7XchuQ7EtTYN/0CYHS1O1+uc7M2nKMlAI6E0+znro=; b=oop2w91P1cqgwoEIZn+vk7zvGv
	fG6H0DVwYN37yNTzfs1KJUrqG0qaSLNVOtUAEi961frkjQ4o2IQlnhX9x5be1xi473ihFOYFTrqPx
	VnfH8Y6V3bQp2zNIktZUf6I6aFyd6JTWy1Qg8XYM00bd9WSPqk72mL73amE3+4VPWa8d3Dkz1lVPS
	Cjzy/kC6+rDGB0Np3+O/wF5ORow5V2z+Ltv7263laXDWZ+8H50koCR7GlrCWO9nl8nEpwVo4awBPc
	Y0ryN6SlHWhwJi9x91aw7eB7vpcGBsotow2bc1YXbKePL8DGM294jD3p6vjQmVYm5cwdVv6F2typl
	v6sjyKDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibVX-00000005pv2-1XZy;
	Wed, 21 Jan 2026 16:56:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibVV-00000005puB-0bE6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:56:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DBBC60152;
	Wed, 21 Jan 2026 16:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D08C4CEF1;
	Wed, 21 Jan 2026 16:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769014594;
	bh=z6ncdW1tF9rL0/zlvdL9Ux7pYtvgWh2A0N0+vyjHyGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFk3fnG7osBlyl3ml764DVFHhbwUZIABeT1VrstE1l2ROLa/nx2XDArVU1Zd+7+FD
	 uW5E3IZZ+1AgpfP24oQ9ooG5pqzuIIryO1KtY3tVj00ogJpBAnQ27N3EVuU0ovDb8t
	 3WDc8LLi1gJqg4yZqJSG2aSBsTOYX+ktPd6j81UgjbUf28fyxhx+osy15jmWrCq4EQ
	 uzoA6kLYsi2cm6U0V8c8FgT4DtJZCyeszqcXrjyUJ2DCeOK0Z7drctfitn2CvOE+NM
	 /6BFxL7TB1j4At/HQrJoAKH550exBh4mzA/Yp1nmMIgVPDk+j8/XaMz3wIBVE5ZQyn
	 N5eCElyvjp6hA==
Date: Wed, 21 Jan 2026 10:56:33 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/7] dt-bindings: rtc: sun6i: Add Allwinner A733 support
Message-ID: <176901459264.3452980.894788621483141855.robh@kernel.org>
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
 <20260121-a733-rtc-v1-1-d359437f23a7@pigmoral.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-a733-rtc-v1-1-d359437f23a7@pigmoral.tech>
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


On Wed, 21 Jan 2026 18:59:07 +0800, Junhui Liu wrote:
> The RTC module in the Allwinner A733 SoC is functionally compatible with
> the sun6i RTC, but its internal Clock Control Unit (CCU) has significant
> changes.
> 
> The A733 supports selecting the oscillator between three frequencies:
> 19.2MHz, 24MHz, and 26MHz. The RTC CCU relies on hardware to detect
> which frequency is actually used on the board. By defining all three
> frequencies as fixed-clocks in the device tree, the driver can identify
> the hardware-detected frequency and expose it to the rest of the system.
> 
> Additionally, the A733 RTC CCU provides several new DCXO gate clocks for
> specific modules, including SerDes, HDMI, and UFS.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      | 38 ++++++++++++++++++++--
>  include/dt-bindings/clock/sun60i-a733-rtc.h        | 16 +++++++++
>  2 files changed, 52 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


