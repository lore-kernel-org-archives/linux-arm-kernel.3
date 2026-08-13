Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72211C5DF6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 12:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3VzST7jI+crG+U+3bP9Mjgzj/O1j6+AHiJn91Rlyca0=; b=KyIguzaC1xaUXjR/Fq/0Qk63Ul
	FF0c3HnO9CWraw2nI8Y1S0tuX2YSaxQjs1aX2s9KPyI3fs8tB9xLwTtVgMf2n6OBz75UTpas2KZVN
	Lx+AQ3MWWbUbs2mmHWnWXxzMp1p96Yw/kZhpiaee313nHoMgRwo23N9l6enNjMsL1hpwxL8qId0Rn
	zVi3EqT1MoOXBpLGHtwfUU8lAMQotMB+UMke21p1SnbQY/UuqL46tBqpXL4tNmN/zakai2CAdfAjl
	6qfH25AHsrWnds4hdH49V9bwT3Xxzh8RkDYtOaAzHfdr/78KImrclB5kj003rX2PoaNKfHokoKVEK
	VDPgcSEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuU6N-00000000b9N-0reQ;
	Thu, 13 Aug 2026 12:00:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuU6L-00000000b6W-2Xdg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 12:00:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A1EA44DB3;
	Thu, 13 Aug 2026 12:00:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE39CC2BCC7;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786622401;
	bh=uLvqSnLxFTr/El1MUjQjU5tqTpJ5ohRAn7CKilpJxCg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jIuftnYb97EcU4lSittDbG2omUlz++SJbnX7RSS4N+MRpMbe9WvyOFi3HLds+nZq/
	 zLUH2p4CUOa7XGD5806qyBP69SgNdc4WHL9XFkRkKBZUGn6vDq2umTvYB+xo1CHGPF
	 2CI0C2UZtDHRob/r/JwJr2KsQDBi/muBDDNcGqurEEsxq9NjjS6vkizIJZO3Dgm5fJ
	 bVPTpB6fNie/e0GqiyPwlPbH8plita48zovkKzKd6sApGjPvXeF/AADvV2yo5mqvNA
	 gpm3NtSTgLx5JLphAnAMoxBdcNwRmI5z7pXLevWVsjUG/IKXUeTLfw0RuGKvihBJVL
	 AfW1gACuqQPag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7631DC5DF74;
	Thu, 13 Aug 2026 12:00:00 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Thu, 13 Aug 2026 19:59:45 +0800
Subject: [PATCH v5 15/15] ARM: dts: aspeed: anacapa: Remove redundant vhub
 pinctrl-names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-anacapa-devlop-phase-devicetree-v5-15-c7058f63dc67@gmail.com>
References: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
In-Reply-To: <20260813-anacapa-devlop-phase-devicetree-v5-0-c7058f63dc67@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786622378; l=708;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=wZdptsf5KZoTZdsrUVb6bffHaz43HHnvSy2YjypcUzQ=;
 b=MNt1Xza2YC6AF1CLGYg5+fmVk3XcUzlYvu95056SM6MqhkXzcaRkrr1IQA22bjZap3PORfade
 w/MHSUsshQbCLMjz2y0SW7ThkUYvZHr+3ilQAmi6wMoioflnFU1XQyj
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
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
Reply-To: u8813345@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Colin Huang <u8813345@gmail.com>

Remove the pinctrl-names property from the vhub node since it is
already defined in aspeed-g6.dtsi.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
index d613b5b9d6b0..039b016ae06c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dts
@@ -1106,8 +1106,6 @@ &uhci {
 };
 
 &vhub {
-	pinctrl-names = "default";
-
 	status = "okay";
 };
 

-- 
2.34.1



