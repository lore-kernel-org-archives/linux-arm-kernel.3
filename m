Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C38C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 14:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=StyjNNEFZtQPiYZZ9C61Li3FKQ0J+He8KWWTEjXR4Ck=; b=DcW3sOCqrIXPJEpU3NUeDUgQNY
	YqKZ9Ho21nM7JQGVfTwdNF+AUyE/3tjHWP0PXPCQ7JpuySpREsMbMZdg1rGZLTlcxlf4tAQGOF61g
	45DTq/q5DaogWyH3C/wzHmi0WCtU4UA0xLz/Y00FiPB75zpbMyuMMlwRebLxIFQ1to+UW5qP553uc
	MRpt+TT2hTGohDqYMptCJkl4TecT1MfTgpFwy2Rd9Z7EvwEet+Rdu3QtpOHiZTBB00yY+pCc6iwUq
	zx1raJSuLi2PdhAa7YgV+tYu8t3PpxtDd4p46vUGIfm58PRwflm0c5LtgdGzvApPzH7vYKZyDK0Dr
	wbcGVP0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDqv-00000002gFr-3fR2;
	Tue, 22 Jul 2025 14:20:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDBl-00000002ZO3-3qWn;
	Tue, 22 Jul 2025 13:37:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C2E7601FB;
	Tue, 22 Jul 2025 13:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21798C4CEF1;
	Tue, 22 Jul 2025 13:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753191469;
	bh=wC1RXxQIm9EggCGpr5mxoFHZrulqQ/Ry2RyskGcaurg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vNFCReVw33rx+cRYq3uv7R+665IbodnXYV4q5AluskgBCnoh9L2+lXciDRq2Rsaph
	 LUpQD3mh6wK7YpPYRE40E+7TPfViFZXfrtGi4HvH+YbrmQZ19Bjw5lpPhvJfUkqpwz
	 H5w1DEgkFmy2wMQvLSnL+/tZih3o97KnhGaoDia5H9xxb5h8yEOMBBIb2orDZiBrgk
	 AcoFAek5m+Wqx3jV0j9733u29yWhNe2Z2XDtPxUAuGs9TRk8JliINicTQFMI3Yz/kt
	 lqkSwd590XNK0Plj5Ke25EEmqBUHg6RtKBQz7OS8jaK/oFt/XtU1G3N9JhxG3JGzDg
	 O+dMDWSRuPp3w==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250627220126.214577-1-robh@kernel.org>
References: <20250627220126.214577-1-robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: phy: Convert brcm,sr-usb-combo-phy to
 DT schema
Message-Id: <175319146575.114152.5994506906661121885.b4-ty@kernel.org>
Date: Tue, 22 Jul 2025 19:07:45 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Fri, 27 Jun 2025 17:01:25 -0500, Rob Herring (Arm) wrote:
> Convert the Broadcom Stingray USB PHY binding to DT schema format. It's
> a straight forward conversion.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: Convert brcm,sr-usb-combo-phy to DT schema
      commit: 4c3d05da59eb75bdb7869f8668778dae87229168

Best regards,
-- 
~Vinod



