Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40792C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 11:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCkYUzgDxAkXibDkggPAvcI6Vv/4f0QuIfu4aUOzukQ=; b=K8hJohGG2gyR1zNH1Z1TECKtdL
	81CZtH+PrxgRxwN+/aBw22HQMVhE8sp93HfTJg51Q4R84Kaq3TgnXAYYasxMF3aealgxfEeIFLKOw
	Svjh4DlQ7Neu7ROLv37N1QAdHDXDySBUPbbCXVkcv/1SzFMB7VeuCiRu4cdujppUlfBP4aFQ9Yh6d
	fRnFfXiEAHZ4DHRaqIDiAF+fQC01L2XB+I/veV/jE6OSFL7H8WhjnpR/p0q2A7qDE2aMC/3cIKLGg
	Y2h+jqJm1QQdD+KpNGhkAgDlXWMRdZ6ALd5h03WmREA6MJWG793OhlMBvWENkpYMZok8lRHCCCYU2
	z1M+tUnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdax-00000004ugk-1gDU;
	Tue, 15 Jul 2025 11:13:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdWu-00000004uAp-3zQx;
	Tue, 15 Jul 2025 11:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=QCkYUzgDxAkXibDkggPAvcI6Vv/4f0QuIfu4aUOzukQ=; b=jsqW+LHduzFR06/yIXBowzjeHR
	4BiEPIsnvJns23YlNLRNk5uKsJdRchI+f3cxp3XxU3K1VYqZAPSqffxKW3LZAjxWjj/KvNQ/LVDCz
	itWo1HKkSq+6pQ7ccPqFlkq6G4G0S4onLDQ/xtGy0pfvsHDqfdtEqQbbmNJmqtRp09sWH7n2OHC+w
	MzDfFHFY7y1O2yK8F/Kdlvkkj686HCAc1a+qXJuieq0dhGPbQU88BiqYIm7d6lPgq4sMcqXTec4u0
	13WYfULL9kz29TdCQbl0i6ttaHQTf0B/wiBAgybVbkWXfnUV0kSbAUrCA/HKWGemYRn5R6PVRCG2x
	/Pn+3JDg==;
Received: from [194.95.143.137] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ubdWq-0000O7-Sf; Tue, 15 Jul 2025 13:08:56 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <didi.debian@cknow.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Add reset button to NanoPi R5S
Date: Tue, 15 Jul 2025 13:08:45 +0200
Message-ID: <175257771276.2527819.12482160462723164616.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250711142138.197445-1-didi.debian@cknow.org>
References: <20250711142138.197445-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_040900_988784_1C5FA182 
X-CRM114-Status: GOOD (  13.12  )
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


On Fri, 11 Jul 2025 16:20:37 +0200, Diederik de Haas wrote:
> The NanoPi R5S LTS version has a reset button, which is connected via
> GPIO. Note that the non-LTS version does not have the reset button and
> therefore on page 19 of the schematic version 2204 it is marked 'NC',
> but it is connected on the LTS version.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Add reset button to NanoPi R5S
      commit: 954f07012794a3aa7ae89e56f070eaa1643af50b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

