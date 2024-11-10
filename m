Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9DAD5E37B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 08:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCArtm0/M3O14zaqBDC1ZV/MO/wWGrn7nxjF+ZbVTkE=; b=pu09Ea31TLw0B3lC0UXwOSGQp8
	jd2lJvGkJM+efsBjz+7TohMPpqRnc9nUTvaJnOVRznbArC3eY14CVwMCBLEQly6CtV2RtRyayTJW2
	CPSVfrbmHM9WuQWxSiD3v0BMosrTxbM/q9z737N2typu9/Z3vC0UlvWm2Ym5z+xTVXqcskN6KkbDR
	1Y3FTvbpSmGhF6eUlf2lDNg7zSjzy7YtF5ZPX2tOL5CkXv/J9BpnkNXrKBQ5haYPcg4/lGdEL/p/W
	XXfyxoPImfVMpe8NzycE5GcH50GxJvz/2wlekYGo/iXRW16t+MdMhjwa8ydkVQTuhLD+/eYK+lqTs
	5zXw7BgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tA3X4-0000000EZ9r-3G5B;
	Sun, 10 Nov 2024 08:42:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tA3VF-0000000EZ0p-3T0J
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 08:41:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DF452A4009A;
	Sun, 10 Nov 2024 08:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1834C4CECD;
	Sun, 10 Nov 2024 08:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731228060;
	bh=XHpF6g9TuwAK/W3q4RtoekD7zC117/f/yfx6R0MdJ4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lLB48SLKKv0Dcg3qDNxI7nGRi/3pSZN1FpGn4YSR15aeQDTEIsGGyi6MUwnhOcJkc
	 c1kI0pctXnjnU2M4/3VW29qUrFkSQlt9hV5y8Nwc3EVChAObK8+uE+huODKks17K/Q
	 dqGQkSWGlgRweJwWFvplRIuQSJFI/TBEDgFhqgtqpOez4zOaOyR4Tb12GI32I5oHJy
	 hatuNk+/M4X2THnAc1mx8ZKQ3eoM5I4vl9/GDUkYCMWiMpPaXB3Xkp129eZG+trL6w
	 dtc3NPGJx3sPN1EhFnjSorztifOOH9V0t/sAB5ecthUno8rAd3s2AueASaVHmltxnn
	 4UyID6w8p3Crg==
Received: by wens.tw (Postfix, from userid 1000)
	id 6DF9F5FC24; Sun, 10 Nov 2024 16:40:57 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-sunxi@lists.linux.dev,
	Dragan Simic <dsimic@manjaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: pinephone: Add mount matrix to accelerometer
Date: Sun, 10 Nov 2024 16:40:53 +0800
Message-Id: <173122798221.3483730.11740779803275328915.b4-ty@csie.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <129f0c754d071cca1db5d207d9d4a7bd9831dff7.1726773282.git.dsimic@manjaro.org>
References: <129f0c754d071cca1db5d207d9d4a7bd9831dff7.1726773282.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_004101_955934_D3E087F9 
X-CRM114-Status: GOOD (  10.67  )
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

From: Chen-Yu Tsai <wens@csie.org>

On Thu, 19 Sep 2024 21:15:26 +0200, Dragan Simic wrote:
> The way InvenSense MPU-6050 accelerometer is mounted on the user-facing side
> of the Pine64 PinePhone mainboard, which makes it rotated 90 degrees counter-
> clockwise, [1] requires the accelerometer's x- and y-axis to be swapped, and
> the direction of the accelerometer's y-axis to be inverted.
> 
> Rectify this by adding a mount-matrix to the accelerometer definition in the
> Pine64 PinePhone dtsi file.
> 
> [...]

Applied to dt-for-6.13 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!
Helped-by tags were replaced with Suggested-by, as requested.

[1/1] arm64: dts: allwinner: pinephone: Add mount matrix to accelerometer
      commit: 2496b2aaacf137250f4ca449f465e2cadaabb0e8

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

