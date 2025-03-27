Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD9BC36012
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8CCDWJUBxhsV+IhY3hWLPrMBU52UqM2D2Pu0T01IoEY=; b=pDSy5hwqOXlQCYvXRtuWiTQBH5
	jxk15d2bl0SMc4zZY8pRSa09zNG/M/kn9IqpTrucjxh6ZXn/HGyXKx+CADAkwkhU0ZHxNe/NaxjtF
	IZtlvsA5Ix52HXW8YLNuwKzqe3toY9z9S/vXKnbMZ2fbOUYwG50TrYzVhzE0+67Tgt+yqbPtuXs7r
	I9IRA2+xysbwqhVrryrDF+ZMXPZ4dDC6MThQgSCH3ULvVmAjJojVEFax8TYQKAb70Oc0vs0bO4b21
	7iVyk8X6o3fCL97hU1OKGda4bE7bcI6KRJ14m0+xJ59fOkaTKm8vr+DCxV9HH31v0RQPtaayAoeq6
	Z1demOgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjYy-0000000AZeH-2N8F;
	Thu, 27 Mar 2025 09:30:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txjVX-0000000AZAk-0qfz;
	Thu, 27 Mar 2025 09:26:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F41C5A41F20;
	Thu, 27 Mar 2025 09:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BCADC4CEDD;
	Thu, 27 Mar 2025 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743067597;
	bh=MBw8/ACFWUtiSMTIE+tw97Aq8o3QGA5ONAcZtl4MtsE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=imWLnvkeh4ff21wwqMbBzEN0A/wC4ZedyIkhfVbmHCKnlFhCyUmfDzE9bBfhNE/+Y
	 rZHTf3a65ro0+017bvzEkspZPccDX7dibZ1pNRlz7CGzUmLycp4dDzkOU/chHBQn+w
	 cb2VcVVa3dnEAKlRSHT7BQ/AQwnJ2ILO+DCRn/DTxOdI0lB83BjUPXptcxW54vdC28
	 /JilObvrgqpZL/TdA4ESgc5LClJ+5eGiu1qyKWZgvIAGjIFqtmZ+7Ppni3CwSPnjZW
	 qAWzjY8yONIRMhjYLSKnX0fabbF5+15hZHsrWOJUe2iO0lTgvWyNUGRfb7QG/ZaALd
	 efpeRDhUWyhuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6699CC3600B;
	Thu, 27 Mar 2025 09:26:37 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/2] Pinctrl: add amlogic a5 pinctrl node
Date: Thu, 27 Mar 2025 17:26:34 +0800
Message-Id: <20250327-a5-pinctrl-v1-0-49320349c463@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMoZ5WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0ML3URT3YLMvOSSohzdNONks2SzxESDVPM0JaCGgqLUtMwKsGHRsbW
 1AJ39vfxcAAAA
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743067595; l=623;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=MBw8/ACFWUtiSMTIE+tw97Aq8o3QGA5ONAcZtl4MtsE=;
 b=2r8IzIYkQPHPdhntWxW+/CTIGjNovPpbnjAweo/oqs2razhgvAfjqxIzYJhjniWECQa0hhn1+
 d8AovbPfI/BCiMloXLY3NdsgKc3BCiIgUxgK+PgkMHoxiEKYL2KDlDr
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_022639_306227_B44DA0FD 
X-CRM114-Status: UNSURE (   6.12  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add A5 pinctrl compatible string and device node.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (2):
      dt-bindings: pinctl: amlogic,pinctrl-a4: Add compatible string for A5
      dts: arm64: amlogic: add a5 pinctrl node

 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       |  9 ++-
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        | 90 ++++++++++++++++++++++
 2 files changed, 97 insertions(+), 2 deletions(-)
---
base-commit: 73a143e436311183186ab4b365a84c662f2c9651
change-id: 20250318-a5-pinctrl-f3c6c6aa0e7f

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



