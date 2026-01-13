Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1876AD29DE3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 07:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8XvCqm4jfJ0EYruwRkEW7iJ7+FlRDJiglMzZt/0Ar4=; b=iDO7uYsJ2o+XhedcH5fJ/2Dcey
	rDYHNZEYxfpcGjA+e3EKCKvE5qO95O+kFB6e7ovl+nWyfmrM5V0z9bIBnRIbrxqbzA+btaZZBfwZS
	QYx6XMx3v2vVKzcTfQmWmQge3hftcxCZc3PSg9AGblsPUCGlx7Fb/E5+vJEe60t3fNcyK/pgJq5ed
	veXJveDsW5NkFpDtwcOpEiw38vPqX4Y9ps5g7L/eOVeinM1ZdqDZ+xsK1xKrSh6+8XBC9yMou3qVm
	Hei8aTNv/DvK8biMx/60QY15s63igx6ZDkZRFnuw6l8oQXPfge28okFPmgCXkVY7JUGEh4U3fJNWj
	S5tJ610A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYVW-00000006cwI-34zq;
	Tue, 13 Jan 2026 07:08:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfYVU-00000006cvz-29DN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 07:08:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4750F4035A;
	Tue, 13 Jan 2026 07:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F179C116C6;
	Tue, 13 Jan 2026 07:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768288079;
	bh=F8U6Q68qUAatZhyd2d4JaNwkARmZ3sJ39aNTp5Upt8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AfeK4P5itnMZATgBjW473iT+a4FxGLVknDoFxwEPLg1Cw9za4CyKqGICmDBSVjxlp
	 q+tAEz9uR5q17/NHe6iDWjgNk0Xxa3PBkM87+65NJOwq/ZlSjoi24DRiU018TkGWPT
	 xcD2W5R92IbKrk28onhnt2cr0gTiopy78Pe27M8d1CUuk8qSCDvaDh3pl0GHXCiDei
	 F2u7UFsDQxbp5/96KQoFtuYlEofwoWxu4/o6ynHXMeF+riFhPNu1yEuXgjVRD89bg7
	 a7XpHs9DWHJEZR7Ycvjz0dYjCQ92HaENv/s4kYnAM/oAoPLjYExh4Dtn6NRX1vpsGo
	 LizXO4xjhM48A==
From: Sven Peter <sven@kernel.org>
To: Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	R <rqou@berkeley.edu>
Subject: Re: [PATCH 0/3] arm64: dts: apple: Add integrated USB Type-C ports
Date: Tue, 13 Jan 2026 08:07:41 +0100
Message-ID: <176828797321.8477.14188625188804624753.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net>
References: <20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_230800_571908_573938EF 
X-CRM114-Status: UNSURE (   9.23  )
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

On Fri, 09 Jan 2026 15:07:03 +0100, Janne Grunau wrote:
> Now that all dependencies for USB 2.0 and 3.x support are either merged
> (tipd changes in v6.18, dwc3-apple in v6.19-rc1) or in linux-next (Apple
> Type-C PHY) prepare device tree changes to expose the ports.
> 
> Each port on Apple silicon devices is driven by a separate collection of
> hardware blocks. For USB 2.0 and 3.x the collection consists of:
> - Apple Type-C PHY, combo PHY for USB 2.0, USB 3.x, USB4/Thunderbolt and
>   DisplayPort
> - Synopsys Designware dwc3 USB controller
> - two DART iommu instances for dwc3
> - CD321x USB PD controller (similar to Ti's TPS6598x series)
> 
> [...]

Applied to AsahiLinux/linux (apple-soc/dt-6.20), thanks!

[1/3] arm64: dts: apple: t8103: Add nodes for integrated USB Type-C ports
      https://github.com/AsahiLinux/linux/commit/2b737cc5be70
[2/3] arm64: dts: apple: t8112: Add nodes for integrated USB Type-C ports
      https://github.com/AsahiLinux/linux/commit/b4f4054864e6
[3/3] arm64: dts: apple: t60xx: Add nodes for integrated USB Type-C ports
      https://github.com/AsahiLinux/linux/commit/e21c8e2e0276

Best regards,
-- 
Sven Peter <sven@kernel.org>


