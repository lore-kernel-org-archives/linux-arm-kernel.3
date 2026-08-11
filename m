Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0798CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzwHSdBmwhLieEAHmn4MmbcHzXYEspbtH9uAMrfqvTg=; b=YeBX9K0BERsVwWjqJeSSKvOyzc
	3cX0QIUoy8t4Q1NtshSTMgF5uz8iBnlcCq7x92TR3z90xr/e5unZadEs7/29bHPx1rNn/53+9iZEt
	GxRpL8fjToXBW3gZiA3vDFpQ0MHByYNZrJTL/V9NlziNwukQElPIvsINztsoWbIKjEv6I2YWLsc/s
	KB7qtidGaUbfmJpPyEP/ZXZ8d+ZP4qote4MPm39lSxUm5Sv4749L5+6UeVUm8Qsr2OZygh15YSiEL
	uYXkA9UaWzieul51heDaTgOopQ2cYk1822oFDkal9MsXq/GRviREn/lDY9hG7alGBBAZSvY/bkwEJ
	txU1CQiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpBN-0000000ETJy-3Udm;
	Tue, 11 Aug 2026 16:18:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpBM-0000000ETJO-0VgJ;
	Tue, 11 Aug 2026 16:18:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 40A9A600AE;
	Tue, 11 Aug 2026 16:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CDB21F000E9;
	Tue, 11 Aug 2026 16:18:19 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Jim Quinlan <jim2101024@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-pci@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260801195517.235161-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801195517.235161-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: PCI: Correct white-space style
Message-Id: <178646509977.341711.3716669174459184382.b4-ty@b4>
Date: Tue, 11 Aug 2026 18:18:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Sat, 01 Aug 2026 21:55:18 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.

Applied, thanks!

[1/1] dt-bindings: PCI: Correct white-space style
      commit: f7b2ceb411479b4c95aee1c0dd720af53367ff8b

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



