Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE87D29DE2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 08:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8LOIbk1j/ExJ4WgejtdIwCyYoP80/IjJqkd8MVp4A4=; b=MXkOiw9vyMgXIR9xC+qJwxvLKW
	uHuaQX/xoc3DpByuAGNMU+6SoKTgURtfXW0dpPUcQPUKbzbz5QDaSWllYgGvXQqw9xg5mLucCLY9U
	KXbsLLkG3aF0BFLJt+Uzf/a+96JKYU+LxEYnfZ4Vs9GD3NdcxZrHOmPwJbtEi82OzDoGGG1yBNYSw
	B8J+6wIiB/e4O4RGP7XA2nENq43k2ip6BMoFpnZyrpUXsAFsqAgExCl2moBW5UPedsE7cGKcMZFZp
	U0TwS0TX/wjEfq0ayeTeNT/bwac30i2BptpN+Wxz3lTsvMbY9UWTOj+Z5U7fTdgSfPkfuMOaA1hiZ
	P+47QBKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZe7-00000006iz1-1JlG;
	Tue, 13 Jan 2026 08:20:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfZe4-00000006ixQ-1Uu9;
	Tue, 13 Jan 2026 08:20:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA22E600BB;
	Tue, 13 Jan 2026 08:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA57C19421;
	Tue, 13 Jan 2026 08:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768292455;
	bh=VmVG7HfN5qM50MKrD1A4HpIQKCxv/1GewT37Y8s+F+w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IcUSfcg4T8FMsg7QJyUnAGZmUSwK7RSpWVbYrJkY/Tsszor0yphie34k2/7NPLxaF
	 UdgAN5EmixALyfmlEfZUjLOcf+xY+nF7Jm6wv1i39GL4yRWY9h4iFNNwyou6M8+RR/
	 dQmHJ/gQKUELpkmBeXsZBHkT2sT3N+Bj3Cmxko0sQ+uCWvYAQVexvOGMKdsOQCBJv1
	 MdQWSl7jusDlhn0wHzr2CEG1mpspkLBvjgMeoOjLIdutw7EZfVhHuP46Q69i1g+CnE
	 XChzBk7C1IIiz7tG8R2g5BcFNuo6wBPRlDj+zpq+WOgNma0TyqPCmQsn+lisYvrZc1
	 6BJZM7dv1HYdg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 13 Jan 2026 09:20:28 +0100
Subject: [PATCH net-next v2 2/2] net: airoha: npu: Add en7581-npu-7996
 compatible string
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-airoha-npu-firmware-name-v2-2-28cb3d230206@kernel.org>
References: <20260113-airoha-npu-firmware-name-v2-0-28cb3d230206@kernel.org>
In-Reply-To: <20260113-airoha-npu-firmware-name-v2-0-28cb3d230206@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
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

Introduce "airoha,en7581-npu-7996" compatible string in order to
specify different firmware binaries if the EN7581 SoC is running MT7996
(Eagle) chipset.
This is a preliminary patch to enable MT76 NPU offloading for MT7996
(Eagle) chipset since it requires different binaries with respect to
the ones used for MT7992 on the EN7581 SoC.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 22f72c146065998d5450477f664ed308b1569aa3..0032a4801bca066f75f60154e6df0b41d11b899f 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -16,6 +16,8 @@
 
 #define NPU_EN7581_FIRMWARE_DATA		"airoha/en7581_npu_data.bin"
 #define NPU_EN7581_FIRMWARE_RV32		"airoha/en7581_npu_rv32.bin"
+#define NPU_EN7581_7996_FIRMWARE_DATA		"airoha/en7581_MT7996_npu_data.bin"
+#define NPU_EN7581_7996_FIRMWARE_RV32		"airoha/en7581_MT7996_npu_rv32.bin"
 #define NPU_AN7583_FIRMWARE_DATA		"airoha/an7583_npu_data.bin"
 #define NPU_AN7583_FIRMWARE_RV32		"airoha/an7583_npu_rv32.bin"
 #define NPU_EN7581_FIRMWARE_RV32_MAX_SIZE	0x200000
@@ -624,6 +626,17 @@ static const struct airoha_npu_soc_data en7581_npu_soc_data = {
 	},
 };
 
+static const struct airoha_npu_soc_data en7581_7996_npu_soc_data = {
+	.fw_rv32 = {
+		.name = NPU_EN7581_7996_FIRMWARE_RV32,
+		.max_size = NPU_EN7581_FIRMWARE_RV32_MAX_SIZE,
+	},
+	.fw_data = {
+		.name = NPU_EN7581_7996_FIRMWARE_DATA,
+		.max_size = NPU_EN7581_FIRMWARE_DATA_MAX_SIZE,
+	},
+};
+
 static const struct airoha_npu_soc_data an7583_npu_soc_data = {
 	.fw_rv32 = {
 		.name = NPU_AN7583_FIRMWARE_RV32,
@@ -637,6 +650,7 @@ static const struct airoha_npu_soc_data an7583_npu_soc_data = {
 
 static const struct of_device_id of_airoha_npu_match[] = {
 	{ .compatible = "airoha,en7581-npu", .data = &en7581_npu_soc_data },
+	{ .compatible = "airoha,en7581-npu-7996", .data = &en7581_7996_npu_soc_data },
 	{ .compatible = "airoha,an7583-npu", .data = &an7583_npu_soc_data },
 	{ /* sentinel */ }
 };
@@ -782,6 +796,8 @@ module_platform_driver(airoha_npu_driver);
 
 MODULE_FIRMWARE(NPU_EN7581_FIRMWARE_DATA);
 MODULE_FIRMWARE(NPU_EN7581_FIRMWARE_RV32);
+MODULE_FIRMWARE(NPU_EN7581_7996_FIRMWARE_DATA);
+MODULE_FIRMWARE(NPU_EN7581_7996_FIRMWARE_RV32);
 MODULE_FIRMWARE(NPU_AN7583_FIRMWARE_DATA);
 MODULE_FIRMWARE(NPU_AN7583_FIRMWARE_RV32);
 MODULE_LICENSE("GPL");

-- 
2.52.0


