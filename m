Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57657CD37AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 07:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ElRWP4rJQXxON89Z9zzFfyL0M5BL6rlFlNmqQWWeF8=; b=rDy6JukthPwoNOQVZMpnMO0WB7
	YVD7Ls2Adj8mTFqQS0GYOyo3rBJYUIBBhhRYNv7HDqxLSOfhHmrgL+BPatPvDHaFTAvwff0q8/r/a
	WL0skF0ufpY9yTkdWTL/JjQpAmP3nbO7JkEIIw9kTcyY8CRmtk6y4zMzNwwYsH8tBLMcA36dl3b/k
	tKEBpug9X0FUTP+WBvF3VBiIV/+xdpVrGBDu8mtdZNdex9stI73tVID/a/JX/tYais2/I1Zywsss6
	q9Tg+lwp1DZ6wUCR00xfydmBfvoHDCCyXo9iNOMzd37643wqUqiW8aDgWNI2ITWXcg6GCMsBdUTS+
	DUCk+LIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFm9-00000005s25-1y1Q;
	Fri, 08 May 2026 07:37:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFm2-00000005rvy-0VFi;
	Fri, 08 May 2026 07:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Sender:Content-ID:Content-Description:In-Reply-To:References;
	bh=+ElRWP4rJQXxON89Z9zzFfyL0M5BL6rlFlNmqQWWeF8=; b=Vo7/y6uJczJWDOO9XCaD3YsTti
	pObPNNMDaXPM9ozRIpkUlFVb4z5hqaO/YPYdzETwFIDF+0RWzQmv96VLQ2spMVNrlkCtggpZunC/M
	wh9TMx1APF2UZqBdK0VCoUcDgoTYU1vHWHwuhbbrGLQTQcuKvyX/LNjqsLR/nWuLJRCYpWF9r945x
	fhP6FBo6b7IJmlGS3e+wzltelLnGcOIPYSst4Ja0C8AaSZXQmQYtjn23Yoh2Sn/wWQixVcopF0tk5
	/p6K0dmjJ2TYB8o5XvOd02r6V6Ne7fXiNZcF2fq3gvb3seN4LZZQty2vp85crAjazzEcYrEMJaB1j
	hdDoBrkw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFlf-00000005bK9-3BfG;
	Fri, 08 May 2026 07:37:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC29C403EC;
	Fri,  8 May 2026 07:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6436C2BCB0;
	Fri,  8 May 2026 07:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778225817;
	bh=A1soFdD0r4US6yDMTZRbjriVCP7JZmrk16cvvRa11AQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=PLFgS0HpeE73xaapfPE9ZIZstV7g1gJbLXd/5wWn037YpvP7EbvHJZfNbhrUodb92
	 SVCtEXcg0qEASex8bNDV7ztUhwyF/Xp1MLGpA5NmTB4CmBhbcs9AokSo7ESHn/xeix
	 fgM+QdkMWl6F/Ehr65c4dPXqhhKA28ayabPG2HrSoRmuRkt6V5CMnupER/aq+8W18t
	 yjBGYkb/o4/Ejp/CAkJHsCZ63+MvTaNRbuCthyh7ZuoeFT3PoQtHgO6HN2VrupLHO8
	 0J6BdxEKNDgEQTHc9GQZUaOPX5Hl7m8OXmAzuCrbp+eldo/cm+r52s0UNZ+lxJKLJA
	 3fwd/1LNb9+bw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E74CD3447;
	Fri,  8 May 2026 07:36:57 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] irqchip: Add GPIO interrupt support for Amlogic A9
Date: Fri, 08 May 2026 07:36:53 +0000
Message-Id: <20260508-a9-gpio-irqchip-v1-0-9dc5f3e022e0@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJWS/WkC/x3MQQqAIBBA0avIrBswKcuuEi1Ep5pNmkIE4t2Tl
 m/xf4FMiSnDIgokejhzuBr6ToA77XUQsm8GJZWWo5zRGjwiB+R0u5Mj+kmrfiBnnPbQqpho5/c
 /rlutHzYDPXxhAAAA
X-Change-ID: 20260508-a9-gpio-irqchip-d76214ec9c6d
To: Thomas Gleixner <tglx@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778225816; l=772;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=A1soFdD0r4US6yDMTZRbjriVCP7JZmrk16cvvRa11AQ=;
 b=PUTdu/0oehvaqyiIMJg5q4YOtOBv59FaV+RpC//iZQ+5aZeSr4vf6dcdVuwfqIsiVqReLzPDw
 OKi3Ww8/M0fBXQg4RCaMvXhk4co7hps3vShnklLRi4S2usQtF9OByqP
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_083705_034074_4BDF5EB5 
X-CRM114-Status: UNSURE (   6.90  )
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

Fix one error about reg address when set irq type for S4.

Add string of bindings and driver to support A9 GPIO interrupt.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (3):
      irqchip/meson-gpio: fix incorrect register address
      dt-bindings: interrupt-controller: Add support for Amlogic A9 SoCs
      irqchip/meson-gpio: Add support for Amlogic A9 SoCs

 .../amlogic,meson-gpio-intc.yaml                   | 21 ++++--
 drivers/irqchip/irq-meson-gpio.c                   | 78 +++++++++++++++++++++-
 2 files changed, 93 insertions(+), 6 deletions(-)
---
base-commit: 8b379d5e9eb7933c73e77e768d95f11ef2833c26
change-id: 20260508-a9-gpio-irqchip-d76214ec9c6d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



