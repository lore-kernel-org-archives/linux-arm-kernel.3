Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0172CFEE4CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 07:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QaW5bYekYk9X1XetJP4xQ96VXjNZLusUXu+FqrNq4gU=; b=BDf6uyBmf8JCWEWVhj/ShSDFOY
	LYkv9+c6kanCW7lW92NAWohJt6Rzeiup1SEAhcwZ/y/rEMXhiApWc00pnGZ5EgZLXdcrmlNYoYqoD
	pO9V8BNbDVPgiBJ27mRrnSKIa7Psp7VWobyRDcR4OEY1DSqCoRxZDrsrNBDKNemqeD+xj8Y/coaC5
	iCFhEUPAFdTiEXAnoIWXwqeA8R4gAnv1uTMjpVsyj4aDH3bmfmsJFqVJwNAUN/UIexFy8pPq9F04D
	vkapyKFikINpr8/LqUszE6U32rCunpCKXZ7o/ezx9jeWahWYf6ql3ZcA1WQhS2EFUX31nMVFaxl46
	s94z07nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwFC2-00000009dHs-3Ge5;
	Sat, 28 Feb 2026 07:56:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwFC0-00000009dGh-3aCQ;
	Sat, 28 Feb 2026 07:56:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C13ED6001D;
	Sat, 28 Feb 2026 07:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66F6FC116D0;
	Sat, 28 Feb 2026 07:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772265411;
	bh=OVzZ4dnEVWocRNtfND2tDhbl7RIBn27b3hByZQ/BmAw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=rIfcP+q4k78lkohmaSrtESLBqm/EEuKHZhINLPjyN/U0bpfR8XfFSLJY14SIFbYB0
	 bmssZxLBf2jiNzARa1Efp2tWweQ8s5MBagKC/jxxaAvLGJHp5ObVHrkyzeQ6CW3+pb
	 5LXEeW1AQmGrm1v6ACksKjvyCF0srRciycqWHxN6/sATDgKNGtqvgvRqaAa2cCZsud
	 NSofUhGu5UAOX653MuCQwCJ+Llu0CHCxvaarRO9FVaeMyT4uoTWASWjMwIMb36i1L+
	 hdUwM88jvhJ9p1pTwvofklrfWN6/8LtN/xrsonSSVI01aiB1Yqibvu4zsEmfT3wjkR
	 BHmvnT1C4RitQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7D8FEE4CE;
	Sat, 28 Feb 2026 07:56:51 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/3] basic devicetree support for Amlogic A9
Date: Sat, 28 Feb 2026 07:56:13 +0000
Message-Id: <20260228-a9-baisc-dts-v2-0-47489d5cc1a8@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ2fomkC/3XMQQ6CMBCF4auQWTumnQiKK+9hWLRlCpMIJS0hG
 tK7W9m7/F/yvh0SR+EE92qHyJskCXMJOlXgRjMPjNKXBlLUKFI1mhatkeSwXxM6ay0TK+1vCsp
 liezlfXDPrvQoaQ3xc+ib/q1/oE2jQk2a7KXxbW2uDzO9wiDu7MIEXc75C/aCAGGqAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772265409; l=1030;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=OVzZ4dnEVWocRNtfND2tDhbl7RIBn27b3hByZQ/BmAw=;
 b=LfbpQ1fdBBhJoJV0uW17gUrr4WPIh//xfGOnTRXHTvsk/AyKgS9It4f9KiyUA4g2mdNfhkwL+
 0vq6Q+WUSJ8DPR+KgC0bP5bGvdXPEQt2jdehos09j0lQ8nh42iP5zI+
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

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Move default interrupt-parent into dtsi.
- Link to v1: https://lore.kernel.org/r/20260205-a9-baisc-dts-v1-0-1212b46f95a7@amlogic.com

---
Xianwei Zhao (3):
      dt-bindings: arm: amlogic: add A311Y3 support
      dt-bindings: serial: amlogic,meson-uart: Add compatible string for A9
      arm64: dts: add support for A9 based Amlogic BY401

 Documentation/devicetree/bindings/arm/amlogic.yaml |   6 +
 .../bindings/serial/amlogic,meson-uart.yaml        |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../boot/dts/amlogic/amlogic-a9-a311y3-by401.dts   |  40 +++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        | 129 +++++++++++++++++++++
 5 files changed, 177 insertions(+)
---
base-commit: e3194dfb772304a1b7ca3bcfccacefec3468b7bf
change-id: 20260205-a9-baisc-dts-cbbbe2e01f80

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



