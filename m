Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2058C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 08:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOaYlMR16ocTVhMNRL7whz12otBB12k1wVD5/NLoge8=; b=mL7v3UiC2BEaifC53m5tokonpZ
	nsjOh7wRvR2w1ms3+azNUBSLQnVhPO51j47Pd6wrAzSqH4RIcDckMSKDbKY1fQbklfmHpRB+5+eR5
	acqDFMrG00Ecnk9RoxiwDBv9s8RUQxKYdeYTrKoFEGm2CWbbCQejbtob0syzCRbzyWsEQDRuMB1Cn
	nSCalCQ4O8mfesP1kfYqtKwMWvdUgywXL1n8fU7doWA9zpcDoMqFSHNtGKK4KG8NIwWfUrmcJ62sV
	rlNipO2AsLwUhzkomsTzAApmLTDP8z8m9tI5LEMZfelZQfca7UamUA54ljhZb+TH3j8+02HuBjoBf
	bUYk0LqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsH1t-00000007m6W-23Cu;
	Wed, 12 Mar 2025 08:01:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGnc-00000007jtR-2eJs;
	Wed, 12 Mar 2025 07:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=uOaYlMR16ocTVhMNRL7whz12otBB12k1wVD5/NLoge8=; b=R+0iOhrkVzLMeMS4WK5rrjMT1j
	xCzYlbkluSbN+92rrwqkiedltm7RTJoT4ShJHDMUAw5pUrZzqRVBKbXO2KnTeTF1ZGB4iXYOI4Q8T
	rEWn9pa9zBbqsbVJtixVEveeO6l69pOQEfSqpjMfSo1OTMz4SHPM12Nbc8fivMcNud3Uy+DplQcEj
	qvV/2kHhbJIjRdQ/MfGoAhpT0rzkTtpxmih18sMbjGGjWHFd6fikVEcgUdk0son5E34rzpwSQl/TV
	2ezAlW2CAG8vcilkizrqUfcUfD2Eu95EMZc5Tuo3HdeXYrF2AfeMoo/8ojB1X3oCP4ny3W0589kEt
	t+sum3/w==;
Received: from ip-185-104-138-79.ptr.icomera.net ([185.104.138.79] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tsGnZ-0005zY-BT; Wed, 12 Mar 2025 08:46:41 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Chen-Yu Tsai <wens@csie.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shengyu Qu <wiagn233@outlook.com>
Subject: Re: [PATCH] arm64: dts: rockchip: rock-3a: Remove bluetooth node
Date: Wed, 12 Mar 2025 08:46:02 +0100
Message-ID: <174176555639.249409.16980967669607961093.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250220165051.1889055-1-wens@kernel.org>
References: <20250220165051.1889055-1-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_004644_670502_27F8A4DD 
X-CRM114-Status: GOOD (  12.33  )
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


On Fri, 21 Feb 2025 00:50:51 +0800, Chen-Yu Tsai wrote:
> The Bluetooth node described in the device tree is actually on an M.2
> slot. What module is present depends on what the end user installed,
> and should be left to an overlay.
> 
> Remove the existing bluetooth node. This gets rid of bogus timeout
> errors.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: rock-3a: Remove bluetooth node
      commit: 9602f47fe6dcca9318f35f7b72b4e98b91c5a5cf

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

