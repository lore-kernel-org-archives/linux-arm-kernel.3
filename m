Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F50C624D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+Lnxa8qAtl3sfnYbsfNIbtAod9H5VSN4WCi19YjAwE=; b=iM/H961XKuZxd/RvYNloDXBojU
	0M7a3O3EhSe9XU5sm+rVMbrwjYzeAiAneoef5KATYhJI8GHqOetpXXGblaMon7Bg9YiyLQ5C7p4R8
	OxuG+Om9Vv7DYGRx1LRR6QPM+9LJu8081dvEx9Q+vmLu6BHrorWMlFBGzabv33J4JQeWCPgtOFBKJ
	VYb0ExQSw+WyUr4OyAxSGxLcgbDdtWaP120qfqteK24uGPK5q9wTHjssBfwD6echOnfp7/mHjwBbH
	28x3lYI8o2b+6YzYHEs0YfXyWTHdQcDbwHU+j1TxBJSkiQRlDcc6//kDa77hqrfolYS1DQJxZ/xdp
	MnshUKFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1isQ-0000000ESre-0DFJ;
	Wed, 02 Sep 2026 11:11:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1isN-0000000ESn6-3JF1;
	Wed, 02 Sep 2026 11:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Y+Lnxa8qAtl3sfnYbsfNIbtAod9H5VSN4WCi19YjAwE=; b=J5MFQB1PK3ZEcm5ibvQufTLHUS
	HWpV9V6qfQEPIkzcAtU3BIHBZ0Kt4DsNOXF7nRLahualDqKSoOHbNfWjXBB5Lfe/HQDU0W3SQP9Xl
	jN8iIBtLqash0N94ZgqfWlY/5txdT+2pb5nCCvnLIvgcenvrJCVHyN3kP0xU9Bi/Xmi812q7mDJjA
	6QRBPrcIfVjXNBMhqmf7O/GViI8XeKvddqOG+oOLNnTG1Cg51nLxekReL/x0/aFoi2lHzJyaF1wes
	+0HL/cZ8EKyrGWK2cf+4Dm4ECBs0g0FOeAaxfGJL8ZGjrjcSa4l0ovZgVLAD02MxalzNKLaO01rUn
	EIG0jseg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <foss+kernel@0leil.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Cunhao Lu <1579567540@qq.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: support CAN1-CAN2-UART4 adapter for RK3588 Jaguar + enable CAN0
Date: Wed,  2 Sep 2026 13:11:14 +0200
Message-ID: <178834747222.2268650.15149858790607663038.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260811-jaguar-can-v2-0-7e78415b5a08@cherry.de>
References: <20260811-jaguar-can-v2-0-7e78415b5a08@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_041131_828355_92EE94C5 
X-CRM114-Status: GOOD (  12.20  )
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


On Tue, 11 Aug 2026 16:08:25 +0200, Quentin Schulz wrote:
> This depends on the RK3588 CAN driver support series:
> https://lore.kernel.org/linux-rockchip/tencent_76C8BC251C8C3C068C23BAF859351DD3300A@qq.com/
> I send this series early to try to prove that CAN2 also works on RK3588
> as Cunhao Lu stated they only tested CAN0<->CAN1 loop. I cannot test
> CAN-FD as neither Rk3588 Jaguar nor the Haikou carrierboard for RK3588
> Tiger have CAN-FD-able transceivers according to their datasheets.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: enable CAN0 on RK3588 Jaguar
      commit: b217437b8f20cbc745d789ea99244274b9dc592f
[2/2] arm64: dts: rockchip: support CAN1-CAN2-UART4 adapter for RK3588 Jaguar
      commit: 7aa165b62ccaf340da22c517074e7c6853db55cd

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

