Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15912F9935C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aEbrFsJj0eo8PUR7FWifsqr6r+MI/gtXK8se7qkEf9o=; b=L/m34+d5Oioe46wR0JB2sAMe+Q
	/Qw7QMpY+hSRos9x2D7b8+zm3sq6tRxJHoLxZ+5YVdOTkkjlMrA81JHv+WJihfllVUCxlYFXdomm9
	F1RYBRCeyhJcH5AIUW/g32K2vHQqlNLNsCVm8Dh3I3wEKjbKNf9+QWIDxQsWJ2+yJ+pWo4m5YZpB0
	OllYWiOYGsM+N1qExhqY3vPBvKZRQ11GoORoaz5MkhFWVM4F0PUM6V1zQXeKNlaiazLxKjkm/jmZi
	0m8YWrOPFIua7w+240Xa5ScPd0bm/jKxEtqMO+qato/qU8RVhNEl3Jau5dnqRxe/Fwor+4MhkcLBI
	0fBMB90w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqFA-0000000BLhl-3RtV;
	Thu, 23 Apr 2026 09:21:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqF8-0000000BLfD-3PbY;
	Thu, 23 Apr 2026 09:21:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BB5960052;
	Thu, 23 Apr 2026 09:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4BD3FC2BCAF;
	Thu, 23 Apr 2026 09:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776936064;
	bh=J5L1A2jbbo0SMdIEzOxqGDDsrZHiKwYymWv6/n3eMPs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LxAFHLA4i/whD+n0I1NcjfbQiud7deOB+zxNfqYicZYYKnmVAo/FqbtT6CTiQISJ2
	 kHa9gwZV1h04DWyI5FISfN2lDLvqkv6QN/4K7sOP1tINuy0zvjLjAlpPYHCZckyPRK
	 53TXLDUOza69ahyHuHJj9S3a2gmdVe/o8i0wzSjpsAdMGNysZ5H99cRIEMIqvXtz5S
	 T/t0aLUQIuVDmISDPiQQhaxYSL9u99TuU0c2ZcfminJnFy+xa/8l77UDpRIQPF8wMs
	 ZRE0qSUeg2AtkVpaqWpAGN57LdxpiOrnWdilPXsIQv0Kmd2WpbNFANx+r8Zd7U2W7b
	 cK8AAbCsQLFfA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3910DF9934C;
	Thu, 23 Apr 2026 09:21:04 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v4 0/2] basic devicetree support for Amlogic A9
Date: Thu, 23 Apr 2026 09:20:53 +0000
Message-Id: <20260423-a9-baisc-dts-v4-0-c26b480a068c@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHXk6WkC/3XPTQ6CMBCG4auQrq2ZDn/FlfcwLtqhhSZCDSVEQ
 7i7hY2KcflN8rzJzCyYwZnATsnMBjO54HwfR3ZIGLWqbwx3ddwMAQtAyLmquFYuEK/HwElrbdC
 AsBJYJPfBWPfYcpdr3K0Lox+eW30S6/VPaBIcuECBOitslavyrLqbbxwdyXdsTU34wVHuOEael
 Zms6pxIKPnL0zdPId3xdOXaooD4CuT0zZdleQHZnAXgKAEAAA==
X-Change-ID: 20260205-a9-baisc-dts-cbbbe2e01f80
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776936062; l=1483;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=J5L1A2jbbo0SMdIEzOxqGDDsrZHiKwYymWv6/n3eMPs=;
 b=MMB+BaVniSUyZKdSGxjqC0+QARageSMqnZG67niJuAY6OQmXCEfsmCh/0soeIxzjkXY1sPihL
 mK7TYOWPD74CAavjMWq4lIXY1y23HbjGva2d3NvS34N9uZrEiO+a8zT
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
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

Add the new A9 SoC/board device tree and related bindings.

Since the serial submission has removed this patch as a separate patch.
The dtb check needs to be relied upon for serial submission mereged, or
check failed, when run "make ARCH=arm64 dtbs_check W=1".

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v4:
- Rebase code, modfiy size of gic reg, and drop cpu_mask for timer node due to GICv3.
- Link to v3: https://lore.kernel.org/r/20260303-a9-baisc-dts-v3-0-4bf21001f05c@amlogic.com

Changes in v3:
- Remove serial bindings from this patches and will send it independently.
- Link to v2: https://lore.kernel.org/r/20260228-a9-baisc-dts-v2-0-47489d5cc1a8@amlogic.com

Changes in v2:
- Move default interrupt-parent into dtsi.
- Link to v1: https://lore.kernel.org/r/20260205-a9-baisc-dts-v1-0-1212b46f95a7@amlogic.com

---
Xianwei Zhao (2):
      dt-bindings: arm: amlogic: add A311Y3 support
      arm64: dts: add support for A9 based Amlogic BY401

 Documentation/devicetree/bindings/arm/amlogic.yaml |   6 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../boot/dts/amlogic/amlogic-a9-a311y3-by401.dts   |  40 +++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        | 128 +++++++++++++++++++++
 4 files changed, 175 insertions(+)
---
base-commit: 8b379d5e9eb7933c73e77e768d95f11ef2833c26
change-id: 20260205-a9-baisc-dts-cbbbe2e01f80

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



