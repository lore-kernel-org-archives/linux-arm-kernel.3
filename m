Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DC5CED243
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 05:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ui5JgHaqznu9uTPWoAnSZMimlW8C5Kqsfngdtt1Sz4=; b=O5wbhwTOijrC70VYGYOawpOaqq
	eNqonlid4M/Re6t1rivhuP8UXHXub+dvWIjFuhk8Zv1oO2UjQPh24WemS2UEvVwfjtpJyxKkrWDWs
	Ib45EHqO+i1Amjvyn9R8YVNuWfIN8AEuJIrqG/mW2iukiqZklvvJsnSu02A9K7b6g/ccyf0CgHjpP
	SM1yk9VUm3cfzQjDmzmeOkGB5epNCexzGc3MpYeOp6/XSipi7r3Euc5HU7Y3VWYYxsxQdLYuFNY2l
	T3DFW0RvCR/W0dU3mWsCjOUPvh48KK+Dw2fIp1kCeZ4jI50XPYvTcwg0GXTEHEjQ+iQNSKh6PX89N
	iwgT/ssA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEk7-0000000HSEZ-386A;
	Tue, 18 Nov 2025 05:59:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEk5-0000000HSCA-0ODY;
	Tue, 18 Nov 2025 05:59:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F10BA60192;
	Tue, 18 Nov 2025 05:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E765C2BCB7;
	Tue, 18 Nov 2025 05:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763445543;
	bh=1QM0t5Ua7sLNTgCR2HCyFI0Jnd2kpNqkgXu1GjfNhHY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=E9YcQUDCSPZ1s7ElomysnOqhC5nBV15S334tuOosNWPvrCLnJDUJ1m1K0CGehwpiU
	 Xlndy8n3uljPzF/1NVk/+oQUMRPcpDuhxDRcSCAPH//R3FfUKifLqzgWEObe4BA6zj
	 PzeZlOi9TFj9e+BJ6A2CzokL16qXoqe19B4U1wXbDwYyF9PeIhTDIQSmj/8Eqjwnml
	 OV0v5nINQkkkaiO0kRZ0VVb0ut8YkXGWE3BAL+ZN7mZWD+Gx1BFrBbCHvbP41RFVPl
	 uYjK064FPsdMb7lP7O6n4JbVeju7cey418FE9S0YACRSGEODY9oZdldnOMVoxwegqw
	 H79SW0HHucHjA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DF9CEBF97;
	Tue, 18 Nov 2025 05:59:03 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/5] soc: amlogic: Add new Amlogic SoCs info defines
Date: Tue, 18 Nov 2025 13:58:59 +0800
Message-Id: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACMLHGkC/22NzQrCMBCEX6Xs2ZVs1P548j2kh3Sbtgu2KVkpS
 um7GwvehLl8A/PNCuqjeIVrtkL0i6iEKYE9ZMCDm3qP0iYGa+yFiCxqYJSpC6g5apHSoiEu84q
 I7bmCNJyj7+S1S+914kH0GeJ7/1jo2/50xT/dQmgwd03pXGNOLfubGx+hFz5yGKHetu0D1mZ4E
 LYAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763445540; l=1206;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=1QM0t5Ua7sLNTgCR2HCyFI0Jnd2kpNqkgXu1GjfNhHY=;
 b=6aaN2cau58FDKag+CaRCY9OtdEKI+wgC9kmXaJRppovgKuLz5yFuPf3aqOJpLRo4zWGkyj+PD
 R0NlVfv75jSBPv4plZ5B2cpA89fs99xDjoRI2rznjksDCqkur0j8a7q
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add more Amlogic SoCs info defines, include S6, S7, S7D.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Restore the previous accidental deletion of A4.
- Link to v1: https://lore.kernel.org/r/20251117-soc-info-s6-s7-s7d-v1-0-6ab8aab03dce@amlogic.com

---
Xianwei Zhao (5):
      dt-bindings: arm: amlogic: meson-gx-ao-secure: support more SoCs
      soc: amlogic: meson-gx-socinfo: add new SoCs id
      arm64: dts: amlogic: s6: add ao secure node
      arm64: dts: amlogic: s7: add ao secure node
      arm64: dts: amlogic: s7d: add ao secure node

 .../bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml          | 3 +++
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi                       | 8 ++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi                       | 8 ++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi                      | 8 ++++++++
 drivers/soc/amlogic/meson-gx-socinfo.c                            | 6 ++++++
 5 files changed, 33 insertions(+)
---
base-commit: 8d5b965a53bf6a4e2a2a028b75b2c7067cde5397
change-id: 20251112-soc-info-s6-s7-s7d-01c86911c249

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



