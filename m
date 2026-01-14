Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A414D3CC82
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 22:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idrg9qUp0V6eEJcxTZc7qybustOZ6P1PM5AjVYkUscY=; b=LLJ13SZmCKQp1VEQiwaLz32TJe
	SRWLgBQLQFMopG4ZVXJ0vVcqMixpYexdbCBub3Q96OyolxFICJVDUD06f9TNqL0uZRzOcUsxNBuLO
	574B/MupfTwmjfxaSJNMp9kq6fhcFtWRB5xmFVvp+PTdI4x9zhbyHqha9cTstU00ELl2CUNf53vb1
	l5D9t2VgUu/lZfnsplXbQXXWSxD2cUVdpt0ced0BnZkhKZnfvjCtJYc2IPzb3xRgFzUz0wQsbZRiB
	7XwrgkYjcbjQlyMLkIcqfvj1j+ma59Z7woIThmHEwRj5H9BA4W+GOXwLYZ2+5YhPCx7In1wGWCaIX
	NoWDHFPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9fZ-0000000AypW-280w;
	Wed, 14 Jan 2026 22:48:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9fQ-0000000Ayk0-3DuK;
	Wed, 14 Jan 2026 22:48:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C48944107;
	Wed, 14 Jan 2026 22:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E1C1C16AAE;
	Wed, 14 Jan 2026 22:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768430923;
	bh=ByL/BpUhaSUXyfwxXMTfBTOdM+/wU89KWHVWit3IeZ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RJpqSSvQtjxgls4t1y1SVdTX+PkoJFOqW6xZzddKtUPymI7eooPuoprfPMhzZJMZG
	 l6OhGrStfqvnORQMWD0KZjkPf+qMH5ywpeebiigHkB9f7H+2299Ub+6fUOTmKO4Cuj
	 EiDrGVTI7i+dlfSa8j1aOsFEPSpS/G8hvZJ/AETKECd7KHdJBo864lKIZzR6YYIZcc
	 q2/q10Cx7LNaKFPOJZghxm+JzuLFq79/p5yEJDvxIx6ZzJPwWaNjVLWS+K9J6swOLF
	 28JuwvwVRFeeuokVi3cOUBSxEYtZszurU7NFiucIWcfm3LtTTL1jbHOndeEGeJ8GN8
	 BVMJW3IktqiJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E64DD3CC82;
	Wed, 14 Jan 2026 22:48:43 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Wed, 14 Jan 2026 23:48:36 +0100
Subject: [PATCH 1/2] arm64: dts: amlogic: Enable the npu node on Radxa Zero
 2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-1-8b5cdf328fde@pardini.net>
References: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
In-Reply-To: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=698; i=ricardo@pardini.net;
 h=from:subject:message-id;
 bh=eqdmMp6peidn3J71/h9AkydpMOUtj1mRqpWe52feB/s=;
 b=owEBbQGS/pANAwAIATteP+Oex+3pAcsmYgBpaB1KmaU5bBjHFVtHlQhR+8JD0BxN6RL1k4sP5
 pT7lMOYuIiJATMEAAEIAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCaWgdSgAKCRA7Xj/jnsft
 6T9zB/4sWp2MYpPyk50RQWXJ4TUCNsIX3h+AVX/rZKZ3m2cQtlN5RZLgg9WWc8KuRrxv+SwJxkf
 IefNO+MBh3Kg5nwI7Qjd6cPhIPN19r7zMtpyxpnqA17SSsDvkX+Z2LazVfSnMqq44a5VbrBGLPG
 NODCO/yFwkHSBEXLSeCtFl17WGxFJC7zZDQQrP2JkpeepmeayNSfSiYxhpa9LELUCMBYvV8nLyK
 VCo+gr4BEh5DUXAblkt4ySzT6J5utQXzciKNt4oY071YZ+ga09PPZKgxWaisWAKKIOGH/JGII4n
 GjvFSzc3xNPbcEaVMUomsn5wO19pKLCfEpBFL89p64xrwO5C
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_144844_862504_404854E7 
X-CRM114-Status: UNSURE (   8.43  )
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
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ricardo Pardini <ricardo@pardini.net>

The Zero2 is also an A311D just like the VIM3, enable its npu.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
index 1e5c6f9849456..a37776d22b09e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
@@ -394,6 +394,10 @@ &pwm_AO_cd {
 	status = "okay";
 };
 
+&npu {
+	status = "okay";
+};
+
 &saradc {
 	status = "okay";
 	vref-supply = <&vddao_1v8>;

-- 
2.52.0



