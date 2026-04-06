Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E13FE9D839
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 05:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/UXt3bPhf3gAi60w6VgErdTxugJQUy11Kvsg7OmDUi4=; b=ofcKfsx5ednvfQBAEauj6Zqrp0
	jQkld26wA1CwsRUA4CGyZtuNPbbME0nCFZXN0QOPwTkaskpGoyiMnwXCbtkXPsncEZoKKf9nGF3aZ
	QFS7OWszsty/coY345gcHNOsRJhMd5ftv5wcNuuXYQgJ+dwdkL9PzLdVVXNVD9clZAqpl5ZatDvUx
	kRj18FSelOlDi8ppofxGu0Z/VB2A2YrQ4A/7qgYJB2oBp71XkOmnXxK7uUVL1eRQ2iE3La1QTkt2e
	cg7o1IJ8AZJ3p/bzn+OOW1zJL/dU1vIk6B8L0H72qZyMJDnsMhdh7Gomraobe78wvnawlvFu/nXTi
	txwLRsOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9cKd-00000004nYU-1OMB;
	Mon, 06 Apr 2026 05:17:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9cKa-00000004nWo-1auF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 05:17:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FD0243998;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA9C4C4CEF7;
	Mon,  6 Apr 2026 05:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775452618;
	bh=Mgy1duuWt0vR+mviueizCgI5vS8MuDmlLDbmB0xbpMk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OXYTN+AnGs/YdVN6DJem8778RfBGXNCC9Kaq1ij+hKGvY8xxIf8FM9TBg14VIsswH
	 iNMx1Q1AaxBmwXgNqHxggZbWhq1oCz8R7UqR9p3HwJvMOHb+hnE/csi/t+S1y1xOoD
	 IhQ8IxhkTNAzODSGPMEkw6uw9Iv789NATipDjD9UvlleGZPBvLYKNaIczwog+Jz13c
	 w+zpGcq0zmY0gPzn3xSmDSCZCFL3Doie9pU2nK+F+v+mW9DeV6XqG0zERslFhRO9OI
	 Was+j7CMyazusPShytxygf4ehfjRwbmnnenFfaQlEaNy26jLA8Kw/phlhN7izabL3I
	 5wsEHNMfO6doA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B85E9D818;
	Mon,  6 Apr 2026 05:16:58 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Subject: [PATCH v2 0/4] Describe more hardware of the HTC One (M8)
Date: Mon, 06 Apr 2026 01:16:56 -0400
Message-Id: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMhB02kC/32NMQ6DMAxFr4I8NygJIEqn3qNiSIkBD0Blo6gVy
 t3rcoBufv7fzwcIMqHArTiAMZHQtir4SwHDHNYJDUVl8NY3ztrWLFcTdzEhRtq1q9OgWefCGHw
 NevZiHOl9Kh+98kyyb/w5PyT32/6RJWesaarYhmfVdDW29wVLEUIuN56gzzl/AfqKz4izAAAA
X-Change-ID: 20251007-m8-dts-additions-ac20291afa24
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Messier <alex@me.ssier.org>, 
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-leds@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775452618; l=1221;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=Mgy1duuWt0vR+mviueizCgI5vS8MuDmlLDbmB0xbpMk=;
 b=3Tt0iAZ6E7HTSlxgNIYL/SaG2UX02aKjPrgvG5Vsw6RtmW2qn6Lj9foVwxIs2s4rY7huMh71e
 27OECyK4cxNBxK3B+fvfm1ZVQ0JhBS9e58EuwJbHEOEtT+wOjrGpKJX
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_221700_493360_322478AF 
X-CRM114-Status: UNSURE (   8.76  )
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
Reply-To: alex@me.ssier.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add hardware description for these parts of the HTC One (M8):

 - Notification LEDs
 - Bluetooth
 - NFC
 - Touchscreen

Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
Changes in v2:
- Rebased on top of 7.0-rc6
- In patch 1, change color of one LED from amber to orange.
- In patch 1, use a multicolor LED to represent the logical grouping
  of the LEDs.
- In patches 2 and 4, note in the commit message the usage of same
  I2C bus frequency as the downstream kernel.
- In patch 3, gather Reviewed-by tag from Konrad Dybcio.
- Link to v1: https://lore.kernel.org/r/20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org

---
Alexandre Messier (4):
      ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
      ARM: dts: qcom: msm8974pro-htc-m8: add NFC support
      ARM: dts: qcom: msm8974pro-htc-m8: add Bluetooth pins
      ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen

 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 94 ++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 4 deletions(-)
---
base-commit: 7aaa8047eafd0bd628065b15757d9b48c5f9c07d
change-id: 20251007-m8-dts-additions-ac20291afa24

Best regards,
-- 
Alexandre Messier <alex@me.ssier.org>



