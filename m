Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737FFC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 08:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahjfqGs9wq4KFXzZn67FkJN5xv6p8oQq4kYbdTZptho=; b=nIwcQ5/ew45eLBCM8l657uAkBT
	w5/4in8YRPCugpOvb43v4lojHVTG5dMCqLW3E1D1Ikf3Y1UACJNRuCBrDZ0m0aie+IlyxjjX1cBtE
	MB7Pb7Uy3Dc71jZx5U29jbERTJHHjcUOilh3HqiRXRVCpPRgpM0MTsddCY70eEJe4JISgwAWHn4En
	g14CjyMiYLFpinwTyt4g4pvI+crkGz3lciI7J4B1JmZf0//jOy0gSAyMk8zufjer0WoKD5xkdWi9e
	J3ISPY7+2raXVyK47NqCUpGeLARsnCA7Pt67XcwAD3UWmVFHHlhFbhoD0JsS1OEDRwks3ldf7Wx/T
	X6DC5myA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOkH-00000004mYO-0jjs;
	Fri, 21 Feb 2025 08:50:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOh3-00000004lrX-1EGy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 08:47:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96FEB5C582E;
	Fri, 21 Feb 2025 08:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71E2C4CED6;
	Fri, 21 Feb 2025 08:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740127652;
	bh=Q6R2QTZZ/LkeT1rRcRWPfG6wHMIMkwW77Qivvtr9ez0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pA12SeK2hrTEOvLyIhrLLK9l2gkUQBiT8i71oXg2cu7FpAaY/yXaRZizSm0TQ2E1D
	 gjDhb/QEHRm3++GXXJsRJ3uDQM73BgeY63OILk8dp5+M8eaUOdTz/0DTp9o+DBwQxV
	 Otg6m0ep7sKY1qqGdONPqeTNWwP4izNkYSJkj7udeX07ycI4b7nXenGUkHUKr05nJL
	 aEP1+nqETTI0ll5nH281D8Y7QpwL0wnWqx8Dulrs7sXigOpZyHcYp9oT2PFm4nshIy
	 D6kjw3gOmBDm92Iv7EoRB3k0W8H6z8fUicOm9n/5BCJr47klYjY1N5i7XE7Zw/0WuK
	 AD4tapFr9m9Lw==
Date: Fri, 21 Feb 2025 09:47:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wilson Ding <dingwei@marvell.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, andrew@lunn.ch, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, salee@marvell.com, gakula@marvell.com
Subject: Re: [PATCH v2 4/4] arm64: dts: marvell: cp11x: Add reset controller
 node
Message-ID: <20250221-majestic-opal-ermine-cfe5a3@krzk-bin>
References: <20250220232527.882888-1-dingwei@marvell.com>
 <20250220232527.882888-5-dingwei@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250220232527.882888-5-dingwei@marvell.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_004733_380633_6B7F7490 
X-CRM114-Status: GOOD (  12.28  )
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

On Thu, Feb 20, 2025 at 03:25:27PM -0800, Wilson Ding wrote:
> Add the reset controller node as a sub-node to the system controller
> node.
> 
> Signed-off-by: Wilson Ding <dingwei@marvell.com>
> ---
>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> index 161beec0b6b0..4cd900c02b3b 100644
> --- a/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-cp11x.dtsi
> @@ -273,6 +273,12 @@ CP11X_LABEL(gpio2): gpio@140 {
>  					 <&CP11X_LABEL(clk) 1 17>;
>  				status = "disabled";
>  			};
> +
> +			CP11X_LABEL(unit_swrst): reset-controller@268 {

Test your patches before posting. You have here warnings - see W=1.

Best regards,
Krzysztof


