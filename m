Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5DAFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qD6xKOC7DbHs1Zr+DjL+w5JYaLfJ53ExtMFnEjDnAvg=; b=2yif+7KGO3IAm3NF04PmDSCVc6
	B6IhduS2PUCUqyirbHQbFJruiDJfekMDf9bHxo5l7F0QuQf+PmerwUei8se5D63gD0Z2NJ3KLvHCQ
	bsXWn0Pdd9FTebNZhRj5ebuQkccOF8FGeXVPXoTeVDg3kOfueuyR+UHjm5o7pNVbkRZFyd4wCfscl
	RQxh+p1s48uKhP24HxdPucuYDL1X0NU5tnS4hvn6D9fLa67FR2hD404ttMWCgVSC9sOCzWhGsONkb
	bWDBBmtryeC0uMITAXaS9IYkDfrE1MTenu1ol2S6rNe3M6CmaH6+1CxZHqEZoSw0gZXc2QvpiIEjw
	xd3ELGhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNsQ-0000000HBlL-2XO1;
	Mon, 27 Apr 2026 15:28:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNsN-0000000HBkh-0brj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:28:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6247C41AF3;
	Mon, 27 Apr 2026 15:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73360C19425;
	Mon, 27 Apr 2026 15:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777303677;
	bh=kZuAlP3Nr9NwZ2yzjYCg6oSkTi0vhJTtqOJ280luNbI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BpV+2Zm5Pm4O+AF5uQ263C+7+iiIt0dmeth3oLzNyLVtKNWDk9uaQl3eMJ3uWBzwI
	 wdaJzdzXQiIg3lalSrc6BOYtuubnyL7EYt4KrE2lkHUIVkG6wrOu99QsjnQrJHDW2M
	 nXx6BzRa4Sne14Fx0ifIM9D6G+HMfT/4tNFB0MOlCSqCabgERNo7FI3/cbbfl7plZP
	 LctWmDmtkoz3xsGpDY/0x3U6IJ0nRXmSDCUmVhYJqhqM7/tMhjVN58luCeZYYfIQbe
	 PWDsSnPbGwhlo4r2zX/9B/AXs2zRwWkAfkcmTVHCZMEK19Lpm5Y3iuFKtczaYeTIcA
	 YaBXUAv5peQZA==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260324164357.1607247-1-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
Subject: Re: (subset) [PATCH 0/7] soc: sunxi: sram: Add H616 SRAM support
Message-Id: <177730367517.346804.17043761045926586221.b4-ty@kernel.org>
Date: Mon, 27 Apr 2026 23:27:55 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_082759_838567_70049DE3 
X-CRM114-Status: UNSURE (   9.25  )
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

On Wed, 25 Mar 2026 00:43:48 +0800, Chen-Yu Tsai wrote:
> The Allwinner H616 has two switchable peripheral SRAM regions:
> 
> - The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
>   to this region is enabled by default. CPU access can be disabled,
>   after which reads will show the same stale value for all addresses,
>   while writes are ignored.
> 
> [...]

Applied to sunxi/drivers-for-7.2 in local tree, thanks!

[7/7] arm64: dts: allwinner: sun50i-h616: Add SRAM nodes
      (no commit info)

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


