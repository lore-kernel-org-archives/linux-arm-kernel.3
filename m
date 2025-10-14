Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDF7CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 18:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZQaTp5dpiFS59beowRGw1f34kfsMqratSv3mdigDF0=; b=OOCWsF/Jir2hLTsJJR23fChce4
	Z8BqtANVxhzTI12XVMC7xi7Aj02fLMrYPjYRBQ1m7N8kaFNy2fL77RlSD9G3wv6vVK7tsiPnGKVeL
	pp8T0sVbSO34z/tCZ56lMegll7dqPbhT8hw8cP8G4zzIGmzf3c2XoMhnRFUDoUwASPMnDZaUekPTE
	2UhqhsPO9vwpI+4zfdKPifP8OWzqGegS/W+/o6bOftPMVmwLwf2TCjBzG4oWp8TroRCMWigNhdoKR
	fgVMljIwFgXkl6dHbSUsOPNXY45W900lHKx9Qj/jJv/vVTxee00qJoYl1Ll5qGdCIZynDsySDHdVK
	TXI6gi1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jQE-0000000H8s6-1rdl;
	Tue, 14 Oct 2025 18:06:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jQA-0000000H8rW-343l;
	Tue, 14 Oct 2025 18:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=JZQaTp5dpiFS59beowRGw1f34kfsMqratSv3mdigDF0=; b=VwNm4AZdtwfNiYMqLVaEFrqfz6
	1i9VJITIVHw7aQLbS456E/MRnf4dWGQAvFgfNFAPyOAQ/shrojPOBqI7jZyzQC9UsHGcl+GOCpkKV
	831QxOOMcJ8Ki1wHlyF3BlL05KBlDm2gW3XivlLEnSy+U259HpDFh0poDpnLk2zNKk/lSnf8LTrEG
	aeijyFY+w8HI7SCa8r4tsj4Oi0jlP+Py02DY13DSHq0KUYMPYN4XOWJW5yr1CSmijI7eTRBZ//EVd
	8smZWQrAPGchWrMrtOJryHBgJtvLPc0mPjVHHybE6X+PK2DleXt2zZ1DaaD3jTOkJ+xRjG7DCEtGf
	+2Usih0A==;
Received: from i53875b75.versanet.de ([83.135.91.117] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v8jQ8-0001Gj-Oi; Tue, 14 Oct 2025 20:06:48 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Andrey Leonchikov <andreil499@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Fix PCIe power enable pin for BTT CB2 and Pi2
Date: Tue, 14 Oct 2025 20:06:31 +0200
Message-ID: <176046473172.1662867.5782306342643102691.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251012123338.344271-1-andreil499@gmail.com>
References: <20251012123338.344271-1-andreil499@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_110651_170792_32B3CB6D 
X-CRM114-Status: UNSURE (   7.81  )
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


On Sun, 12 Oct 2025 14:33:36 +0200, Andrey Leonchikov wrote:
> Fix typo into regulator GPIO definition. With current
>  definition - PCIe don't up. Valid definition have on
>  "pinctrl" section, "pcie_drv" (gpio4, RK_PB1).
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix PCIe power enable pin for BTT CB2 and Pi2
      commit: e179de737d13ad99bd19ea0fafab759d4074a425

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

