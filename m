Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A392FC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsPbG2sxHkzvuTHXqj1JiQI2+sOYq53q88gbM13lipQ=; b=xtA/dRXp9TpB7iWR3NazjeJQjo
	9dkVUFhOcrJXyAqGDUh+RgamNCI4xaXE+g5h4S4IrmVMmuSqLSoaQGvo+74xZtmxu3gMnM1jatcrD
	p8OX3sfL5kw6kcSLRkL3PHmvV1K2WoIxMBsFxHdOuffu6S/9sif9hn7qSs+LzC082LF6GU/8HbheO
	uVo08pjh+wNWwa0sG2BPay0xD84nf47t76yjynOChFDgxmPUA1KbvW/BHcKtdORR0DHZXqMjeyQ3K
	girWat28XCsXD+B1U5YjLuM/DoBIZlhuu4QxHfz9kTvHZXkim4HZ4fHOu9olFO48A4OPwv2fWRtVA
	WSx1h0Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiD5-00000001zVx-3Ec6;
	Mon, 07 Jul 2025 09:32:27 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhWm-00000001tMM-0qim
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 08:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=TsPbG2sxHkzvuTHXqj1JiQI2+sOYq53q88gbM13lipQ=;
	b=o/ebLf8suS5RR8N+OU7tt48i8ubjqk2zS2pmotDdF/YH07Er7E+V3M1vpvEiQq
	vGeRiHF1Oa2tQBxO/7+X5fbkNwd9yZjpACpVNZpMd2HLFHL+w1kph5whvPLxAA/g
	OgiBBbAInh5K2agkFVed3uUGzkYdb9PqwNZR6knTSvO+A=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3n_XOiWtooSc9AA--.39027S3;
	Mon, 07 Jul 2025 16:48:15 +0800 (CST)
Date: Mon, 7 Jul 2025 16:48:14 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: fsl-ls1043a: Add missing DMA entries for
 I2C & LPUART
Message-ID: <aGuJzj1BZ5P-P-mE@dragon>
References: <20250701062157.514969-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701062157.514969-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgD3n_XOiWtooSc9AA--.39027S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU5nmiDUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwCDZWhrVSm7qgAAsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_014844_576179_8D9BB178 
X-CRM114-Status: UNSURE (   7.52  )
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

On Tue, Jul 01, 2025 at 08:21:54AM +0200, Alexander Stein wrote:
> Only i2c0 had it's DMA channels configured. Add the missing one.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!


