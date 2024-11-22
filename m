Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D428BE65D2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 08:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95m9sEz4jpY+nXaTdtFnwpBIrBHSe/OWl4KFwSyfVK4=; b=YXzm9N7xwIh6u8upu31Q97p1sU
	4WBKCrVnucA71tzFu2J8rhlgRl7sryePRZvJQw9M5kG++1AFrVS/BkdPgZ7FvY/o+aXITXngl76/R
	ZtBilsJJ3A1S4E+3mTlX82rdwtawr9hFadwlt/D+Y5yKo5V+Xfnc3GDVhFh0brCr7ZU1SNByePqeJ
	JsypYEcklRJ8YGEhPZVpyes8IbcpSGyiqET66YJxDb9ebv3ZxNGwfyxcqEI1sCG4gExbfX1u9yF4A
	sq2fYO9jxGRRBVnXjWX/5FbZgEbl+O9qSK28+Z8c6L349Vmg50S6RI1NS1Jucclm+TgdZRB1v4Bxn
	RW5pniMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEOmz-00000001tqT-2tVC;
	Fri, 22 Nov 2024 08:13:17 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEOm3-00000001tkJ-1oON;
	Fri, 22 Nov 2024 08:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=95m9sEz4jpY+nXaTdtFnwpBIrBHSe/OWl4KFwSyfVK4=; b=HwZjZ7E5ah5YUK4f/LAs3dej5y
	VQaeqiIw7QaFLBsKS6xktq9M0R8Rdhg2s13olioGIrFk+7sS0DzKGZSzBpPKwm4z5mJfHG/+qF4hz
	C8lBCLs/fOxCi1YXIo9yuLQMuz6EHKA2c0+yKLaFagTb2cXRPmHFQfIu/VRu7qyiqbV+QnWmR/uL1
	nd3FFFtXaTshut/LD77DlttZKT9VIzFjc89siOIvmMs3XzJGZENS/Qg/f+Zcvzxjd92hCxwzEKi2n
	trda/bEh6zXgIzoupe/ykeZAQZm64J+qi4f/QdIh7P8jatWOMBR6opKF7oISK1e/+8sCQaGIFp0L6
	+LwSAxRg==;
Received: from [185.156.123.69] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tEOlx-0004My-7t; Fri, 22 Nov 2024 09:12:13 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: rk3568: add reset-names for combphy
Date: Fri, 22 Nov 2024 09:12:12 +0100
Message-ID: <2757577.mvXUDI8C0e@phil>
In-Reply-To: <12563257.O9o76ZdvQC@phil>
References: <20241122073006.99309-1-amadeus@jmu.edu.cn> <12563257.O9o76ZdvQC@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_001219_475338_3DA1299C 
X-CRM114-Status: UNSURE (   8.89  )
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

Am Freitag, 22. November 2024, 08:56:17 CET schrieb Heiko Stuebner:
> No need to resend for this, as I think b4 will just pick up this
> addition when I grab the series from the list.

Of course, I'll just grab this patch, not the series.
The phy driver change will go through the phy tree :-)



