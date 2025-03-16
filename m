Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782AEC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 17:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJftXpExtRrF/94Tz1BbJttMIyB3RAvZpqtBldBW908=; b=EyD+4Yv/id2NdWVyhs7EZJ4v+d
	ZtkFBIT3Fo7sojD6Cl47x2Gj+Zya/rur0YgaScQS8jkavZlYIyUr2lJB1VedF0AReZn4FRnZ3Yfjd
	3l1whv5POBmtpbId/idVWIUsiP/em1TxVvBuGdIeiXpZ6rGVwUugFC3IbTdajDDSwEUgeI9twR5hZ
	kiPaPeV11cChEIMPTkapXaK0ZZUL236YZQCV2HtL+RxgmINoExUHZdB8iFr2+0sh8o6O7QVsRNbOS
	WmdkrM7GGmKl70f6YjfbfU5yILh/KtA9yZUITKesWJE6elvYw5AWOFdqbymuRHVcU9B1sIWTeKwKF
	vcoutTYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttrhu-00000000Pwk-1brO;
	Sun, 16 Mar 2025 17:23:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttree-00000000Pdu-180l;
	Sun, 16 Mar 2025 17:20:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD0425C4ADA;
	Sun, 16 Mar 2025 17:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3570AC4CEF6;
	Sun, 16 Mar 2025 17:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742145603;
	bh=SFCObeKwDsGqowWiN8zpRkf0mL9yfcf2dkwHpOH/boA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sFQNlZ3vG6h4ZA1FGROiCp8yAptwETE0ARaWjZgtjmpZqB1ZGFCJZj7inLur5rsp1
	 f4upQ2TUVMfnrZE6s17dHxt1x4PmWc9FH6C4/YZcxG53VxQbY51KPM0Axs6hdWFz8p
	 B2qbY2xJeGlrK7JJ/q3LDtK0cgjdpRyoyOrLajKpw3FlGA1hlDv+7MCpWVjyePMNuv
	 1AIKgmndW/2GXu0o3HC4Hvfc9lVCjh3fDzbYT9kT/2RGccwgu5BbYrW1d9vGTTYHvY
	 qrQHMFs0YAa4bK6WxfDNYYfVBicRjud3IBF9Iz1SBmFQZ85sdS4TpGssDN12dQkir3
	 8kCwsU4G7BpwQ==
From: Vinod Koul <vkoul@kernel.org>
To: heiko@sntech.de, Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@kernel.org>, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250227110836.2343158-1-kever.yang@rock-chips.com>
References: <20250227110836.2343158-1-kever.yang@rock-chips.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: rockchip: Add rk3562
 naneng-combophy compatible
Message-Id: <174214559984.644495.8037439258836601775.b4-ty@kernel.org>
Date: Sun, 16 Mar 2025 22:49:59 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_102004_353848_68B97B19 
X-CRM114-Status: UNSURE (   4.15  )
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


On Thu, 27 Feb 2025 19:08:35 +0800, Kever Yang wrote:
> rk3562 use the same Naneng Combo Phy driver as rk3568.
> 
> 

Applied, thanks!

[1/2] dt-bindings: phy: rockchip: Add rk3562 naneng-combophy compatible
      commit: 86ae168934098be744cd5a8470544165f0054d0b
[2/2] phy: rockchip-naneng-combo: Support rk3562
      commit: f13bff25161b8a0a9d716764ebe57334d496c6d9

Best regards,
-- 
~Vinod



