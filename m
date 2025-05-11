Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACA2C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 16:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0CB2JpjoZGONd8v1KJd8Otov2jPw4W7BcFKfdFtLG8=; b=lp9roQvB/MlJBNq6MKL2r4xqnn
	mj+wC7jIl3jPePzr/DfgmvPFNi1T3AiznWt50BX4itjnY5fSKRnrS4YUDYvzIh21EpgIvxrKzEvH7
	q/YfzHnvdbYkXeRuT1bCWUkYXyZkng2W/YZ82ItsYc71n+ImhoUyOSoe2OPq4NCgd1JZxKN0ZbsCv
	P+Uu+gksqnzsXYT89IKd6b6id4G4qbTwN96ueeyCKsCmzv/klVna+xXImSkna4BCrCvNobipASpT1
	J6kDkk8ptzyhJf0Ov59daHezepDX5DmPuEy+JXJGSVxBiR/lD9w8FBKRP+rMQPQjJkE3GI5p+uBTM
	U/6vWdBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9O5-00000007V9G-27bV;
	Sun, 11 May 2025 16:18:49 +0000
Received: from mail-m82236.xmail.ntesmail.com ([156.224.82.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE8Av-00000007QXD-1jGb;
	Sun, 11 May 2025 15:01:12 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c03:9b0:dce1:ee4:cfd7:5cd7])
	by smtp.qiye.163.com (Hmail) with ESMTP id 14a30f72c;
	Sun, 11 May 2025 23:01:04 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: heiko@sntech.de
Cc: amadeus@jmu.edu.cn,
	ziyao@disroot.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 4/5] arm64: dts: rockchip: add core dtsi for RK3562 SoC
Date: Sun, 11 May 2025 23:01:01 +0800
Message-Id: <20250511150101.51273-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <3317829.AJdgDx1Vlc@diego>
References: <3317829.AJdgDx1Vlc@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHxgaVhgaHU1JSUNPTEsdHVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtIQUIZS0EfGB5KQR4eT0EYHR9MQU4YH0xZV1kWGg8SFR
	0UWUFZT0tIVUpLSEpMTU1VSktLVUpCS0tZBg++
X-HM-Tid: 0a96bfdd298703a2kunm14a30f72c
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NjY6Nio6GDJPGUoLFB8zHBMo
	OgoaChNVSlVKTE9NQkxOTU1OSklMVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0hBQhlLQR8YHkpBHh5PQRgdH0xBThgfTFlXWQgBWUFKSExONwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_080109_704047_1139D6C3 
X-CRM114-Status: UNSURE (   8.08  )
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

Hi,

> I might be blind, but I don't see a tab missing here? #adress-cells and
> #size-cells are in the same level of indentation as the other properties
> of spi0? I did move the -cells down though now.

Sorry I didn't make it clear. This refers to -cells.

> hopefully caught all pwms now

The pinctrl-names of pwm4 to pwm15 are still "active".

> +		saradc0: adc@ff730000 {
> +			compatible = "rockchip,rk3562-saradc";
> +			reg = <0x0 0xff730000 0x0 0x100>;
> +			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +			#io-channel-cells = <1>;

> > `#io-channel-cells` should be put above `status = "disabled";`
>
> moved now :-)

It looks like saradc0 forgot to change.

Thanks,
Chukun

--
2.25.1


