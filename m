Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950BDE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 09:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fMmN/0yiMfhbJSH4AmpSSetc0I0qJgPJ4YmEEtWTlTY=; b=v4mJtl7vAst3cW
	BF3zNF/PG+KGUGW+nApHWdaXdcpTUfEUBHBcEqYmackVgCSj7emfr2ov6GpMVZFIM9nj8W7LCDkvd
	n1jXkRdIcVi2/MXt2S3hWYijxg+ZpV+igfxjYkOPb92mn1zCaF9J+5ZretA9w7n+0JXu/F9ivZcwk
	9kHJbP3OAbUZ0aKRXDAIyb2wQFGXuge00j64QUvm6OA9ZeeuItjZspQ106HPH+xisE1/afWchzq9T
	L2H5NgHHDX7ikEiEr44mKgIJPlR0hD/2cnjqYfMDWU5S6lraKftWouqlTNlgGwIqoqKHHea74bFQv
	j9VqE6yoGkEsbH5UsvZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwfg-0000000AvAI-2QkP;
	Tue, 10 Dec 2024 09:36:48 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwbs-0000000AtvP-2lU4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 09:32:54 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tKwbr-00011S-Dh
	for linux-arm-kernel@lists.infradead.org; Tue, 10 Dec 2024 10:32:51 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tKwbq-002fJT-1R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 10:32:51 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id DEDF038A542
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 09:32:50 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id 5601D38A530;
	Tue, 10 Dec 2024 09:32:49 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 03d2ec73;
	Tue, 10 Dec 2024 09:32:48 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [PATCH stm32-next 0/2] ARM: dts: stm32: lxa-fairytux2: add
 gen{1,2} boards
Date: Tue, 10 Dec 2024 10:32:26 +0100
Message-Id: <20241210-lxa-fairytux-v1-0-9aea01cdb83e@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKoKWGcC/x3MTQqAIBBA4avErBvwJ4i6SrSQHGugLNTCiO6et
 PwW7z0QKTBF6KsHAl0cefcFsq5gWoyfCdkWgxKqkUoKXLNBZzjc6cxIrRZd21lttYOSHIEc538
 3QEybVugpJxjf9wMafIQVagAAAA==
X-Change-ID: 20241210-lxa-fairytux-e730979d3d3f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=HKiruRlQ8GHPPhhFC5ESR04Rr/ImqoZPslgdTnFndnk=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnWAq1AGU1iR460N/LjDVUHpWI3w+EBI35VdzKf
 PM2WBLZsg6JATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZ1gKtQAKCRAoOKI+ei28
 b2GgB/sFExtFNFhwSfWjXlZxiBjMv07cQGhZOibWg9XfyOemOkjwBlOQbOjy8E/aNkUVNqKEo3Y
 dBVqILOuuE29FIriIHR05MNLeu6o6hu0feLq2QvOTs09S5xqMtBoCPMtO47NAnc8zYRTxz+YV0J
 +WRNNdQf71yzewgHgVq+6JLgXqqve0/YX9/Mav7/1SvVPY76+sV7qKc3c8typFC6FYvRAnkYU+D
 7fqcjMYxjzmcqHAcJoIsRcC5+7Qlo6eBPOz9zM/RS8kbsAB44lpoKigUDjqZuWK4GIzfzEUC7AZ
 LWVbINtO2I2u2LlR+TUtOl7r5Ph651mbwXVz+QcEHUZA/ZEX
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_013252_703597_7C61114D 
X-CRM114-Status: GOOD (  10.33  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello,

this series adds support for the Linux Automation GmbH FairyTux2
boards generation 1 and 2.

The FairyTux2 is a small Linux device based on an Octavo Systems
OSD32MP153c SiP, that occupies just two slots on a DIN rail.

regards,
Marc

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
Leonard Göhrs (2):
      dt-bindings: arm: stm32: add compatible strings for Linux Automation GmbH LXA FairyTux 2
      ARM: dts: stm32: lxa-fairytux2: add Linux Automation GmbH FairyTux 2

 .../devicetree/bindings/arm/stm32/stm32.yaml       |   2 +
 arch/arm/boot/dts/st/Makefile                      |   2 +
 .../boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dts | 101 ++++++
 .../boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dts | 146 ++++++++
 .../arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 394 +++++++++++++++++++++
 5 files changed, 645 insertions(+)
---
base-commit: 08d312c944095df2b73e9959c2bb16073820ecdd
change-id: 20241210-lxa-fairytux-e730979d3d3f

Best regards,
-- 
Marc Kleine-Budde <mkl@pengutronix.de>



