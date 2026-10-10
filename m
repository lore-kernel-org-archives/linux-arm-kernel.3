Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAD7CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 11:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRvOqyoa2yGlfCD6zElvclBcIrUaBdOVdd/2GnBR7tE=; b=y7duGCrxjnmTlGyPVG1L9PuigI
	SI85aext7Wi9jRaLpZbup6kjHIidkTvZeiJc+jWnb0i7V9Avn7nSUGbZKdhhHSae92CpoE8x4YeJs
	qi3GfGKG6+3IS7hltCa+RisIBVwxSbdfgEl7fEJfFLxtKc2VXlbLTCfMgT+JlYDvDa9c+EbBaiT+R
	zNpXuxhxbXswOPBsxD+TtQPyB779DVUgIfZs49don/BgblC+iL2naC4NXhq0N6bY+L7qCJsgDDiVA
	9V2jczstbm1zwDQ6sRRiiTzEwEMmkk1IooapXKpm+UaR7Dmu1VPnwNUuK41QhsIjvBHGnw80crRbl
	XVoV7tnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFV2K-00000007tv1-1sZa;
	Sat, 10 Oct 2026 11:14:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFV27-00000007tmi-2A8U;
	Sat, 10 Oct 2026 11:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=rRvOqyoa2yGlfCD6zElvclBcIrUaBdOVdd/2GnBR7tE=; b=kZtjQvAHyRZZBrt4oeO+HQ/QE6
	G9ydsbXj8mzw6jrGPOqfpRYADvpDHhXfzFi8f3VAz0k3vwRpKdDL1DDTIUEI47XQm1t/M207MGE79
	1G+Txy9UIBNtO0QNnSaYO51Peok7ZRo44gvUAkk8+JmPsWsShHr8ZX+xue0j/x1yakt1ZNPBfmLcM
	RnsQwfsuqpnhTW6BzLUiH9H4J7El3uwHi45C0c7WzhZsVQ1C+G8xbesRu2Md+wFco5/WeXMF+6cyr
	kG6ya5n0lAa34vvlJFpvc37N6WED9dsO+MQBL636rHRLtUDhdU9S1iLrobuovQDZfqgUdVDIOgSNo
	fF5ohTqg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: remove FRL GPIO for 100ASK DshanPi A1
Date: Sat, 10 Oct 2026 13:14:09 +0200
Message-ID: <179163084343.3536058.11998324830928383594.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010100000.2236931-1-amadeus@jmu.edu.cn>
References: <20261010100000.2236931-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_041431_554359_0135F22E 
X-CRM114-Status: UNSURE (   8.48  )
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


On Sat, 10 Oct 2026 18:00:00 +0800, Chukun Pan wrote:
> According to the schematic [1], the 100ASK DshanPi A1 board does not
> have an hdmi_tx_on_h pin, so removed the non-existent FRL GPIO.
> 
> [1] https://dl.100ask.net/Hardware/MPU/RK3576-DshanPi-A1/DshanPi-A1-RK3576-SCH_V1.1.pdf
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: remove FRL GPIO for 100ASK DshanPi A1
      commit: 99feb764fa6c3b260e03903f5d30e15428fedc08

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

