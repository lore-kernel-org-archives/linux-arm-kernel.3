Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6884C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 12:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3Y4C6sOP84Tag+2ZuIgFb5dpvTWt6qSLRmgeaKfMp4U=; b=1jhk09bElbx94l
	z9PJdxCl4TQ5T5zeNOkZMJB8knkYDQDtL0n7ZURkaPMFBeZcOgAQ5tGvmn1CubxUR9rCeXozoipmM
	BGOUwkLkxSwncvZXDwA+UeWzBRGyfMPLQ9GXKP0FTcIHPal63cFNc4Af1FszNcmhtIjTvlXji3qK+
	FHJzhfmEA9TFEe9NChwPDlR66bV8ql1QHSyTqjUFAzefAJsofnFESbw+7SdSUGxAYwlprXxkBNulS
	3dIyF0txjvDma2klCXqUPQW/Oe7gZ/OhIxMI+YeeWlW+VMULchevpxlO0InHezc8WM8TlFPxidOyS
	0RcQvdcHJbqj11lwBGRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9He-00000002W2T-37S4;
	Mon, 17 Mar 2025 12:09:30 +0000
Received: from smtp-42ad.mail.infomaniak.ch ([2001:1600:7:10::42ad])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9Fx-00000002VdU-2Edy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 12:07:47 +0000
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZGYd82wt6zJ20;
	Mon, 17 Mar 2025 13:07:40 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4ZGYd75JMlzJG0;
	Mon, 17 Mar 2025 13:07:39 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH 0/2] arm64: dts: rockchip: enable HDMI audio on RK3588
 Jaguar and RK3588 Tiger Haikou
Date: Mon, 17 Mar 2025 13:07:25 +0100
Message-Id: <20250317-tsd-rk3588-hdmi-audio-v1-0-0b8ceb9597a6@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH4Q2GcC/x3MTQqAIBBA4avErBvQpLKuEi0sxxqiH7QikO6et
 PwW70UI5JkCtFkETzcH3rcEmWcwzmabCNkmQyGKUihZ4xks+kWVWuNsV0ZzWd5xFGSEk2aodAO
 pPTw5fv5v17/vB93IqlNnAAAA
X-Change-ID: 20250317-tsd-rk3588-hdmi-audio-c0ea0f1ab689
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_050745_715650_D169926A 
X-CRM114-Status: UNSURE (   7.11  )
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

Both have an HDMI TX port and can carry audio, therefore let's simply
enable the nodes required to get HDMI audio on that port.

This is based on next-20250314 and the following series needs to be
applied in order to reach userspace:
https://lore.kernel.org/linux-rockchip/cover.1741886382.git.robin.murphy@arm.com/

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (2):
      arm64: dts: rockchip: Enable HDMI audio output for RK3588 Jaguar
      arm64: dts: rockchip: Enable HDMI audio output for RK3588 Tiger Haikou

 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts       | 8 ++++++++
 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts | 8 ++++++++
 2 files changed, 16 insertions(+)
---
base-commit: da920b7df701770e006928053672147075587fb2
change-id: 20250317-tsd-rk3588-hdmi-audio-c0ea0f1ab689

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


