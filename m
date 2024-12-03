Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8506AE64A93
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 13:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GrYwoDBPdwhzaEj/TCIQ/EW68kwHvhqNPiInEOsyzDo=; b=Hqsx+Py3JSI13ko3xJKJJSkFwL
	xg/sGzzi3ROoJifunR8H8/0M062Ao3XH5JDQZEaRtN2JYDAi76kg/4uxCenGdPAuBXsqTBgfhkC4H
	kcZys1eui9wnhmAbzTvpeEoGfzpEkak8hFAqwP8BPh9+pYu7+PYLryeGJOYUPbA7ILVduOy+A2Mlp
	aEWGKfDAQkH2hFGDlH184HSFVzk+HiCuRdrX5/TQmZTIRZXujl3Kjfq4ZxpcuwQl/l7hc+xeJE2cq
	3SCJLPRP/Q6wOQRJrZ3SnyywdBOhsagU/RIV3iNfuxS35EMKrdKoIiU7NI76L412PmVecTsLOrN0D
	29iVPz6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISst-00000009bU4-1fWT;
	Tue, 03 Dec 2024 13:24:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISrs-00000009bJi-1XEu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 13:23:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D1E4F5C6D2A;
	Tue,  3 Dec 2024 13:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74229C4CED8;
	Tue,  3 Dec 2024 13:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733232186;
	bh=iZ4QmU3VYs0LDZ8lr0fIemo81foNLGPlwRopsTWq1P0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=GG+N/WIfnow38JRGkOfEUiqgEc8xibKWgESFJaJwR0/r5CeXFZfjHzUPdkXqIVXoZ
	 sSSEQ7mkh31hGjPyo1lXQ0JdWOf5gS/pK7+x21tsqZyBOGzK1xDwtBUEdzPjclGXMk
	 q67bDbgYt8PCuctS91TY55sFkMoZL/N3iXF4eAdedqqd0kCUlL6J7SnW4As8neP9M7
	 LYmT2SClZZbkYnk1DeHDGbkt2m4nuUW2CKjvUIxFjCDm0HvS+iPn1+mdONVT1mn2iP
	 siHZgH2lDRXJ8VBcdmW/odcujw3h1He5t1pFB2mj5ck3JKb6R8Ie0+Kh43UUc8aLDi
	 M79Lh9i6I1xSQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A53BE64A93;
	Tue,  3 Dec 2024 13:23:06 +0000 (UTC)
From: Manojkiran Eda via B4 Relay <devnull+manojkiran.eda.gmail.com@kernel.org>
Date: Tue, 03 Dec 2024 18:52:45 +0530
Subject: [PATCH] ARM: dts: aspeed: Enable video engine for IBM System1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-dts-system1-video-v1-1-008e5e660106@gmail.com>
X-B4-Tracking: v=1; b=H4sIACQGT2cC/x3MMQqAMAxA0atIZgNNtSJeRRzERs1glUZEKd7d4
 viG/xMoR2GFrkgQ+RKVPWRQWcC0jmFhFJ8N1tiarKnQn4r66Mkb4SWedzSmJe/cSK5hyN0ReZb
 7f/bD+36t1tcFYwAAAA==
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Eddie James <eajames@linux.ibm.com>, Ninad Palsule <ninad@linux.ibm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Manojkiran Eda <manojkiran.eda@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733232165; l=1038;
 i=manojkiran.eda@gmail.com; s=20241203; h=from:subject:message-id;
 bh=ejXpM+ALtz0H3f+cLC7p2P7soAQAZRSfhVgLG/KNusk=;
 b=JjpeBLox0ewhPlPyR7prwy4gXMJDMjI5b0bU4tGW8YA3C9sw1giJi/yDs/0TpN8fL4ElkieUV
 1aQ6F65esdRAp5zDtx9n76PrAZNP1uwmNdM+yruTohVCsvcdrDKlH7S
X-Developer-Key: i=manojkiran.eda@gmail.com; a=ed25519;
 pk=54WqHEFtBzlAODOpTWKI2J1uhv/sAk3WQ+lDMxMyKTI=
X-Endpoint-Received: by B4 Relay for manojkiran.eda@gmail.com/20241203 with
 auth_id=292
X-Original-From: Manojkiran Eda <manojkiran.eda@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_052308_451674_90C1B1B2 
X-CRM114-Status: UNSURE (   9.46  )
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
Reply-To: manojkiran.eda@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Manojkiran Eda <manojkiran.eda@gmail.com>

Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
---
This patch enables the aspeed video engine support in ASPEED BMC for
IBM System1. It is crucial for facilitating the BMC's video capture
and redirection capabilities, which are integral to remote management
and KVM (Keyboard-Video-Mouse) over IP functionality.
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index c8597dcded31..bea858b2eee6 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -479,6 +479,10 @@ &lpc_snoop {
 	snoop-ports = <0x80>, <0x81>;
 };
 
+&video {
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 

---
base-commit: f6d73b12ca9fd3b1c29a6a725cd751b972c740cf
change-id: 20241203-dts-system1-video-0081d55a156e

Best regards,
-- 
Manojkiran Eda <manojkiran.eda@gmail.com>



