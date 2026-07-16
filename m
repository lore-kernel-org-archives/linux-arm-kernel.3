Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3FCC44514
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 19:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syf/c4xtfCw6J0qQudHZ7XrmyO59GTZhy9GPg7y846w=; b=hC+cd8EkasnMn399MJ4WkEf8cR
	icW1ZlBu99J+V/5jFIlrUNSMBST/+0dltnAFYjB2Nz1o39b9LEGa/aCNXKbPL3iKg27tSkvji8LZx
	JkIMWmKcE7CUvCkziKxgNaDOjOSn9IPVvR+tgUEfXOQHUJ/jPiwKN7s6IK9aow0zHI5k0jXvY5D8u
	ydWz/GJxkbJZD0lHmbpylUagPzT98ayotKTY8DBquwlUKYqwgUJYbul/6l51hqrrAsn9xl476SCMB
	VD0ZipCjnwwmEzpH0z5A0N1Hhp9nsfUE1dN+xapJOMFoDjzPLHVZDcYXd+Thxi3CUYf+9HJTU+YYx
	wCC8HWfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkRhO-00000000Sed-2snm;
	Thu, 16 Jul 2026 19:24:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkRhJ-00000000Sck-33Gi;
	Thu, 16 Jul 2026 19:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=syf/c4xtfCw6J0qQudHZ7XrmyO59GTZhy9GPg7y846w=; b=VMpI8zO5PejSNJcUCtSLfLMhEX
	fe0fBLLbq+OfIZTzY/pM5QLK4FL0MNVf5ef11MpBxFadwotDtU18xR+4PQ4f/bmEB70NdAXiny76C
	uwhheG0+R4P09lAQTWDM8O9QzLrnXE4WHrVdmqU0iQPBiB5EP2ix1Yh+Wmu7wxmDBAw5UwMkopKgV
	MhrqVxLt/sVDN8ERKtkuEl9WJnTXHGVSCKAvRdueitSbCEJBXf4NH1pdJa/6lP4u001aRL0Ykw9Ug
	p/rsdb2LXuGvF0ClaFNjjDJL7LyLopwAVOE9cppQW/CNCd1izPfDZRpppvjXXZy/AMDoG0cjMYr3p
	vOnEvjlg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Liu Changjie <liucj1228@outlook.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Alexey Charkov <alchark@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: Add LCKFB Taishan Pi 3M
Date: Thu, 16 Jul 2026 21:24:32 +0200
Message-ID: <178422977234.2335819.5634374946197621892.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <MN0PR19MB60918292CC2D566716815F26ACF92@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB60918292CC2D566716815F26ACF92@MN0PR19MB6091.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_122441_792293_2068E541 
X-CRM114-Status: GOOD (  11.26  )
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


On Tue, 14 Jul 2026 14:53:20 +0800, Liu Changjie wrote:
> Add the compatible and device tree for the LCKFB Taishan Pi 3M, an
> RK3576 board. The device tree is based on the published board
> schematics and only enables interfaces exercised on the hardware.
> 
> This series depends on the separate net-next series:
>   [PATCH net-next 0/2] net: phy: Add Maxio MAE0621A support
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add LCKFB Taishan Pi 3M
      commit: 2df7f27058018463e1f38a6e4c53cf551130bc4a
[2/2] arm64: dts: rockchip: Add LCKFB Taishan Pi 3M
      commit: f35d9eebeee5268289f0b9e424a651907a27b575

I resorted some nodes, to match the alphabetical sorting
and dropped the maxio,clk-out-frequency-hz property for now.

Please send a follow-up patch, once your phy driver series lands.

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

