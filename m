Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF309CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 21:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7p5lf5hswHmqSvQefpV12eu4f1a/WMpYwYwBP6vLB7A=; b=S3x1HzcnsoBfFAfD3rQ4qb5req
	v+zkRUenAqRY91EShwDAp4VMaBbL6OwuR07uQCrr36Rt2WC26bnF7j7bB9BppYo76oVhhp5U+Hes+
	pKGVL/oTTSZcmp5GyweJXuTGiM/6H+2uXrXc98n8x32TRryMHCzE11KIbBtK1N6lQTm/nIKUZNQnz
	ktrv2J5EIMCZlf3oLK1GZ/F5j1FhoBfD6GL+4qxnY8GoeSaL5DME3Zpecs/m2dDjTmU03PW/dZKp8
	p1+owzbiABSovGUu16w3Fpitla4vN5Ov+M5IFhbjVoDBuXjy3rn0uSTEnoOvJg1GQBSB9sMYsJp6E
	WNDvyRSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWS2-0000000DoG5-1kIW;
	Tue, 02 Jun 2026 21:15:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWRz-0000000DoFa-2Dcy;
	Tue, 02 Jun 2026 21:15:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=7p5lf5hswHmqSvQefpV12eu4f1a/WMpYwYwBP6vLB7A=; b=ehIUepHfrxEQp8N7IY64K7OP8g
	qanKSA8DkbZJRYSL/zJiDyVcjp45OA7sajBXx3jzl7RE4YZ6KEN6GRyeH10SNC61QstrjhckWAGAO
	iTnwrUJ6VwngAKwkgtHMtkQoFow1kL3iRKHqLYGZdVdZXA5Bngwx4yobnwH7Vzm0X9XYE5QlpQnEK
	OVI8lyoHheD0eBYneDiP8fmeZLUx9AHo2CV1PUSDCiisfo2Wy2D08pBOjjEEvwIfhfDfXaWHU8Emh
	SvnVvFdeXdNY2iXZG0eU/H1f9MTyvU1bbHp/ZQgbezJTYRW4Gkt5NMKXvumzQkD2sxRrb9ZOc9g4L
	OAT44QVg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	amadeus@jmu.edu.cn,
	jonas@kwiboo.se
Subject: Re: [PATCH v4 0/5] rockchip: add USB nodes for RK3528
Date: Tue,  2 Jun 2026 23:14:56 +0200
Message-ID: <178043489360.713702.10193094828449758923.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260529190355.4148175-1-heiko@sntech.de>
References: <20260529190355.4148175-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_141503_590070_B91D2D82 
X-CRM114-Status: GOOD (  10.93  )
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


On Fri, 29 May 2026 21:03:50 +0200, Heiko Stuebner wrote:
> This adds the USB nodes to RK3528 and therefore needs both the dwc3
> compatible [0], as well as the phy support [1] to be merged first.
> 
> changes in v4:
> - phy-supply not vbus-supply on armsom sige1
> - adapt e20c commit message explaining the hub
> - describe my changes to the original patches inside them
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: rockchip: Add USB nodes for RK3528
      commit: 5f3ae9b12a6c523992a7216bbc4420ac33450b79
[2/5] arm64: dts: rockchip: Enable USB 2.0 ports on Radxa E20C
      commit: e897bcf81dd920bf80ace6d98ec6f9645c5b50f2
[3/5] arm64: dts: rockchip: Enable USB ports on Radxa ROCK 2A/2F
      commit: 4e55d52f5f3b333a9ff5103099df97291aaeb083
[4/5] arm64: dts: rockchip: Enable USB 2.0 ports on ArmSoM Sige1
      commit: b6b74087f90a201cfdd6da6a43e7b92dba8370e3
[5/5] arm64: dts: rockchip: Enable USB 2.0 ports on NanoPi Zero2
      commit: ff660109f4129a13bbdc31bc14ca233ebf0c9450

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

