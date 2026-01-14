Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE71D3CC82
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 22:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dNLFdtex+CHTBlK7EsvZAjTQtqaMIXyVz7grMBWmRlo=; b=YwJxrxHYrpD8I7IoNy9LKEkw6m
	Kf99O2ITGqtOhklqYdGDhTTV+8twFPFBmjZgb71Hi6aZjjrcrCWbsAmagLJHtBvNLmn0q09GsoDaT
	du0o8v7lGKhOYcH3PaPmIKvN1O+f6Mc9Rjf/QWgYe69clk2zB7krOkuySubADzzhFzUNaazZsQWPo
	zPkdA6D32nqIbY3ueXbmtr1W1FglSlB90N0yy3RjF9Q94EBC0RyW63GzyPmjItAx2be4mvzgEXnGU
	TPcisHFW363C8wjVaZlukYKjhDRyE/AxV1F+gAwxBk3NKXricPCWzVFijmZdmE5dMgj3F+p8HMPPk
	XRZ/tmXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9fS-0000000AylU-2BAu;
	Wed, 14 Jan 2026 22:48:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9fQ-0000000Ayk3-3lIB;
	Wed, 14 Jan 2026 22:48:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E033C6000A;
	Wed, 14 Jan 2026 22:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48A22C4CEF7;
	Wed, 14 Jan 2026 22:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768430923;
	bh=jMo5ERNKRtgqeiruc+F9jPMXJYYBxN74dlDkfmQDZII=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ThJuIhFB8AX9STOwfCgXyLD7aqcyh0/KsdkFoi9wp7plhLeOZpaDhPEHlnAVu+z+j
	 EixqESdMRvtGjsRDbjc8HJbhq2auuj9vbYheVS6dGPyqvWi0sq7swwOw4J47IMAChW
	 0BqKkYxyHVQqyR1+MOdwT4S6p23rXe+qizuVm5sUCa420qw4ELpzHU4wzT6UGElP9g
	 qOknTGjzn8zs38b+yvFkiN7l/ANSBoJdOfSK2FRnoP10mrrM7M+gINmwunZBedZw2H
	 e/uKxNXI1eYZTb0bwiMMBXDJyVcNcMLHF1AKUmQ0pmg8eIDFDCBpXpmk0E/7P5e9t1
	 dqkbBAXh+J1bw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31284D3CC88;
	Wed, 14 Jan 2026 22:48:43 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Subject: [PATCH 0/2] NPU and i2c3 + FUSB302 addition for Radxa Zero 2
Date: Wed, 14 Jan 2026 23:48:35 +0100
Message-Id: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEMdaGkC/x3NQQqDQAxA0atI1g3MTEfBXqV0kZpoA9UpiYhUv
 HuHLv/m/QNcTMXh1hxgsqlrWWrESwPDi5ZJULk2pJC6EGNGsrnLyKsjze8y6YBGvBN+xUpCYta
 1Eo59aNvcj0/hq0DVPiaj7v/T/XGeP71Rk6t5AAAA
X-Change-ID: 20260114-arm64-dts-amlogic-radxa-zero2-additions-905549fbed3e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=738; i=ricardo@pardini.net;
 h=from:subject:message-id;
 bh=jMo5ERNKRtgqeiruc+F9jPMXJYYBxN74dlDkfmQDZII=;
 b=owEBbQGS/pANAwAIATteP+Oex+3pAcsmYgBpaB1JBGAoliEo92rosUySpTcYh5fjuWErzCmR5
 HppGRKGo4yJATMEAAEIAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCaWgdSQAKCRA7Xj/jnsft
 6RtgB/4l+A3LhNDT4b9cqXMNp5csRFFGWyKfDyPpXympkNaPKRbH2REuAMiE/0+I4iXxIZpORqQ
 JE1Cw9dxQT9yD1M+ZcSswPFin8PKwPZ5GGfulCLXBFXsF9arrByXGMD4mZeBqfRGna7UTcpJpm0
 Wzifn828+izdBYeFmi1TCS7QckWEeU+C2r+Zgu+boyziOgXPRDHEn/HSDiFD63cePM6p+kWzbSo
 BIgswY+uhQZ4AQhpCLJNt9XhRNZLtc9G9KZAMvP49gUFPYO2nHKHMnUql8n3N/rF2UkYOWVdR2x
 qBfS74rdAAEK0Cfj2wSqEP45cqGa5NfeahwW1H+Dyku6xTpz
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
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

This series adds a few things missing from the Radxa Zero 2:

1) NPU (etnaviv), just enable the node, similar to what was done for VIM3
2) i2c3 (also exposed on the 40-pin header) and the FUSB302 at 0x22

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
---
Ricardo Pardini (2):
      arm64: dts: amlogic: Enable the npu node on Radxa Zero 2
      arm64: dts: amlogic: add the type-c controller on Radxa Zero 2

 .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
---
base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
change-id: 20260114-arm64-dts-amlogic-radxa-zero2-additions-905549fbed3e

Best regards,
-- 
Ricardo Pardini <ricardo@pardini.net>



