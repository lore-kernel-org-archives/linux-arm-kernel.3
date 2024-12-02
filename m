Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D410D7831A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 13:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgnNY1XGUhWbZAxftEEOpG8eFu+AvTvB89t+IC5SzMU=; b=LnqQh/oPG0Yb1odejlV0L76qyX
	s5d0Df1xfnVgQaY+kh0Wwx2n12DxN90EZ3bp5DUBmE9hd78twoBnxU2abq/flm4h4FXqoGejxFKeA
	Qzh0bzCfXnt4pJu6zXrO0OsGddhsERq+kciryDRxw9mO1b3Ojm1/iwxArdbNwiyTa0GlLIdEL3VjZ
	jCoWjjnSQ5W1nvTyuvtx/V+XIixp9s2ccsxxQH59jyokS3kvuVhDzB4NcAHBWFLUyFydhHIUkiifN
	g9B3Zzjdw5tjxOa/uuN1JD+bwRboXrrLDidrh5ACVyH1IoaFDfQaP2kVLha7l3lUfhuB9lME9RTFx
	hGWfaHhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6B4-00000006BRC-3NIs;
	Mon, 02 Dec 2024 13:09:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6A2-00000006BFl-3XqV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 13:08:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1338D5C6794;
	Mon,  2 Dec 2024 13:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 842AEC4CEE3;
	Mon,  2 Dec 2024 13:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733144901;
	bh=cXYTMS1lyw5zl7xOiAP9Dpko8FpjZMGOckLkVavurEY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cpOC24Xg4W2ndtFkgwlm2AeF9Yv90uBvHYCBgOEVjUSZoXYzT15uHj4BRFhtcBvpG
	 PyJWebaESQNK8jDU4t5yhDnx7uKrxjWLU96//NUXRfcJV9LXtcuP1q4heINdpaAuLT
	 hjEFXKRJP6m14j9WvSPX0TPJm1QYXJ4EFY+dOB097McQLMYqt4CHui5rfZcoXPtWFd
	 5ubXky7WfPDUAxPQyNRk8m4jzKRNh0mE5Zvzq1hncqxUJKrf1tAfL07wn/oraJfZCx
	 EGcNscCJmdNaKvRRf0y4h8ktQdn8iJaHgfnfEa9N0JaKKFm6lYnoH2GCH7rr4IrX2/
	 UhLTom6hIMyUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA05D7831B;
	Mon,  2 Dec 2024 13:08:21 +0000 (UTC)
From: Thomas Antoine via B4 Relay <devnull+t.antoine.uclouvain.be@kernel.org>
Date: Mon, 02 Dec 2024 14:07:18 +0100
Subject: [PATCH 4/4] arm64: dts: exynos: gs101-oriole: enable Maxim
 max77759 fuel gauge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-b4-gs101_max77759_fg-v1-4-98d2fa7bfe30@uclouvain.be>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
In-Reply-To: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Thomas Antoine <t.antoine@uclouvain.be>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733144859; l=1033;
 i=t.antoine@uclouvain.be; s=20241202; h=from:subject:message-id;
 bh=C6G2HNmCWsR7T7ZeSn//curscN+6Mz2Xd6Jnx+k56sQ=;
 b=fA9D6CBCX7gFNZtMJUgL0dFcwNCYI4mlMT8MAW2SwI7p3XgJFaWYEPyx7u68on+520i20JHid
 sicaCn2SzJGABlQm0g5TkuRvsBAZOKtxj5LMxDQNSbhwKrusQCJaTxs
X-Developer-Key: i=t.antoine@uclouvain.be; a=ed25519;
 pk=sw7UYl31W1LTpgWRiX4xIF5x6ok7YWZ6XZnHqy/d3dY=
X-Endpoint-Received: by B4 Relay for t.antoine@uclouvain.be/20241202 with
 auth_id=289
X-Original-From: Thomas Antoine <t.antoine@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_050822_930859_39678A47 
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
Reply-To: t.antoine@uclouvain.be
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Thomas Antoine <t.antoine@uclouvain.be>

Add the node for the max77759 fuel gauge as a slave of the i2c.

The fuel gauge has been tested and seems to give coherent results.
Manual activation of the charger via i2cset shows that the sign of
the current does indicate charging/discharging status.

Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
---
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
index 387fb779bd29ea3812331a7951f03b181c5fe659..4c45dd6fd0173889234b7b04d7abb4b382c7706c 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
+++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
@@ -90,6 +90,13 @@ eeprom: eeprom@50 {
 &hsi2c_12 {
 	status = "okay";
 	/* TODO: add the devices once drivers exist */
+
+	fuel-gauge@36 {
+		compatible = "maxim,max77759-fg";
+		reg = <0x36>;
+		reg-names = "m5";
+	};
+
 };
 
 &pinctrl_far_alive {

-- 
2.47.1



