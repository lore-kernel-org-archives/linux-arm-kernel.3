Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB46CF256A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 02:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yaE7bNOBLbg0c4ij7ppv8wFK5w7xcwvpDIJH+3xQhcs=; b=jhovdL6pBqlFqE1dE4d3ZmckX0
	eNGvSh3oHoWg5ErNScWf7VWCLGi7iMZsDV4DA/B5fs6/lU+kLUN2yWx8lHFxJCO9Rl38V2GLFEXpX
	LEVHFB5eylgGYwBmsZ3K/S3Q+cH2Q0hvz9kj1nXxJTzuR/Ivnt0s1607z6a5y6uSeii0gvMpgK3jJ
	tDXMMXBncON57wg5BM3y9B/BdP/Ua7eat7YMiypo5n8cicM2ZV9satikduwOWe2Ww8cTIHJMN6utP
	pcgu0vD2Uw4kv9kKbREWXz7otYum4Xvff+7e2E1bl8ZdlfXFRGn+fjhf0KNPQi+MZCoYXd1MjomYE
	IJLNE5fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYJ4-00000001Pfe-0XwH;
	Wed, 19 Nov 2025 02:52:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLYJ1-00000001PdN-33GX;
	Wed, 19 Nov 2025 02:52:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 75A5C60135;
	Wed, 19 Nov 2025 02:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C335FC19422;
	Wed, 19 Nov 2025 02:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763520746;
	bh=yGGQ82tynU/Cs1FoQ40nLIWp5JIbe9V7Pi5kfcfRrgs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Q1yoA/py3ZooYjbabzJ76j5SCOpLsvpaJSbhAuFr6t/a0OtAgOhr0xrZxoJKDlXiV
	 QVyU1s0V93JCOeNLQag7nbJuXuEGhF4Q/nn+WrTqrqsCt05Ni1ixBydISiWj7IKHP7
	 8UoNVF0BQM5fqhKDej5GJRFrpE37ZOnlLSmEDP4NMTZDvoBAtbC/tDK1+Rgm4bWIO3
	 JudQ2AlWVtajR/i0cUAzJHNXyURWJB0WwSZpXoULNiT5J2JrxVtoz5tqpOKlTn7dsX
	 SMIsTXArHV265YEgk/Iln2xZmddR6Ylifvt9Df5nSDWpRrSKDNMeIHpKF7gIQK9Uck
	 eRSAlMyYRcOBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F07CF256C;
	Wed, 19 Nov 2025 02:52:25 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/5] soc: amlogic: Add new Amlogic SoCs info defines
Date: Wed, 19 Nov 2025 10:52:21 +0800
Message-Id: <20251119-soc-info-s6-s7-s7d-v3-0-1764c1995c04@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOYwHWkC/23NwQqDMAyA4VeRnpfRtJvWnfYeY4faVg1MK+0oG
 +K7rwqDDYRc/kC+zCy6QC6ySzGz4BJF8mMOeSiY6fXYOSCbmwkuzogoIHoDNLYeYgmxymOBo1F
 ljWjEqWb5cAqupdeG3u65e4pPH97bj4Tr9stVe1xC4FDqRmndcGmNu+rh4TsyR+MHtoJJ/CJqF
 xEZkcqJRqJWyuI/sizLB//1zP77AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763520742; l=1361;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=yGGQ82tynU/Cs1FoQ40nLIWp5JIbe9V7Pi5kfcfRrgs=;
 b=wLxX3Cp5piFHCG506GA5M5KyuVVL2l6yIS3U/E4ZXAwPWoBvmuxVQ8RNUjDCVjiFcpdjbfvXb
 M9qZKNzL1OfCetJ8p4xOwzCW5G/v9trDHPc3j5bZcR6khXkC8NuBAza
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
Changes in v3:
- s/Amlogi/Amlogic/ for patch [2/5].
- Link to v2: https://lore.kernel.org/r/20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com

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



