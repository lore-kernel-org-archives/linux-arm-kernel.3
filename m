Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EC2C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 May 2025 15:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mr4QmUNUxLgI7MAI0PM1OEpPLWwkauECf8Ka11LpNrc=; b=WVpJfu+VRRs05m
	P9TQNB+k7+Vg4PbAb8QfuzjHOZ1bMXyQwekP/5c6Jwxinzh6BWbJ4Ew98/RBAb0Adl0csnLJNaLb7
	lDqrGscgeNnUffRa53ZM09gFVBzQxStlL4i3uV+zz5F7Hrp3XIj3OFbTqlFS/u5iz3M8/eMLaq0ja
	E21jcasN6pCDiZ1uzB86nInGhDy2kVFX/eC+EnrSEwVFarY7NCK5/q8hCbGkW9OKsthIlBEb3fWfV
	nYpc6rBohbUmuFVwB0zEzJT/AC+TQri/zJ5rPH6GMl2P7TPxJee1t4FNvNtfYslYxrZvQawmYIGuH
	xKbbHcDKHmzEGBzDa00A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGJMj-00000005tdw-0kpC;
	Sat, 17 May 2025 15:22:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGJKi-00000005tXG-2n2l;
	Sat, 17 May 2025 15:20:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C8E3440DC;
	Sat, 17 May 2025 15:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B00C4CEE3;
	Sat, 17 May 2025 15:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747495215;
	bh=8fVncvvRgORD7nnO2q1jkuf3elL3c4jA4fKkUkepRII=;
	h=From:Subject:Date:To:Cc:From;
	b=J96ysViXsP1Sf9mPRtiJhxqp2hMPelaI7YXOoiYKFbtbjJiRArtTWqRpuo0xs3vW2
	 w0Goytm1sQgrHr4qLjwdxi5dpp3NH9xX7cXhW7ZTQvUKx4aZw9uIonAC6fMlHvlrqP
	 CPvh/X7QQvtW/G0X5ZLm6GbZd6D1KUjwJ02dEwGxAdJ3LWjit8TOIQ/qS0o9N7+0su
	 VtmxzN8xc71IVsrSKrgifcNIvEdsHvXe/OgYCaOnV3e5dNozLq7LcPZyb3qBCzG+Z/
	 cTD0IysJQRtgdoOzmNgu6HcrBk3wwAT8dO/k81u7Q2hwt5iaUCesR6xx5iBOahxF2z
	 SmI64gugwqxuQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 0/2] Add PCIe nodes to Airoha EN7581 SoC evaluation board
Date: Sat, 17 May 2025 17:19:42 +0200
Message-Id: <20250517-en7581-evb-pcie-v1-0-97297eb063bb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA6pKGgC/x3MQQqAIBBA0avErBtwCsu6SrRQm2o2JgoRSHdPW
 r7F/wUyJ+EMc1Mg8S1ZrlBBbQP+tOFglK0aOtVppWlEDqM2hHw7jF4YlTO2V2T1RAPUKibe5fm
 Py/q+H3KotzdhAAAA
X-Change-ID: 20250517-en7581-evb-pcie-0b8a301a5916
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_082016_728702_2B8573EC 
X-CRM114-Status: UNSURE (   4.39  )
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

Introduce PCIe controller nodes to EN7581 SoC and EN7581 evaluation
board.

---
Lorenzo Bianconi (2):
      arm64: dts: airoha: en7581: Add gpio-ranges property for gpio controller
      arm64: dts: airoha: en7581: Add PCIe nodes to EN7581 SoC evaluation board

 arch/arm64/boot/dts/airoha/en7581-evb.dts |  30 +++++++++
 arch/arm64/boot/dts/airoha/en7581.dtsi    | 105 ++++++++++++++++++++++++++++++
 2 files changed, 135 insertions(+)
---
base-commit: 6df944d2cf586213c48428223ab0e6b9c7c0b94e
change-id: 20250517-en7581-evb-pcie-0b8a301a5916

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


