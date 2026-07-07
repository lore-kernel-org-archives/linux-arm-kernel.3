Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BEDC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 21:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+9xNDgwRjoYynAhldZbYuclfEP/ZyuKBV2opsp2eP7s=; b=orDC/XXIpDUf83EcyI2uRMIh8h
	rqM23YIgriBT7hMakvr+GvK8resugI1dF6To9HqKbyUOZjCKi/8ecNO/jdxoM5V39f7uROS2apaBG
	SIBOloI3MUV1YdjyudA4ZbPojtf9HHe84RbZ1WBeHWc9FEH+eB/QVeqMD5KfVToYj842oU3nOpH0U
	RUjhXpUkbuZADsfCwyaYjzL5is9wUnX5cZvs4EJUd47055msCy1WnmuCs3AWt7cMhcMCemhQpcgrY
	7ybokmdu7uTq2a5rk33E+tpvxeONw535VUgfQtR4Jxtj8VydIjMgjIeI+RmxmICMaNTwEXGdCutjc
	3LNUCw6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whD21-0000000FtuI-07AF;
	Tue, 07 Jul 2026 21:08:41 +0000
Received: from mail.nic.cz ([2001:1488:800:400::400])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whD1y-0000000FttN-4AKC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 21:08:40 +0000
Received: from sil.horo (n1-65-243.nat.suchdol.net [89.22.65.243])
	by mail.nic.cz (Postfix) with ESMTPSA id 85DD41C061A;
	Tue,  7 Jul 2026 23:08:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nic.cz; s=default;
	t=1783458512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+9xNDgwRjoYynAhldZbYuclfEP/ZyuKBV2opsp2eP7s=;
	b=eUqwuUDyhoIdF5E54+lKVoeiRidwSl/ZSwD/nrlWr5gToBFyqD08PVFAzp3sXVyGHvVDvs
	hGvzLjrBfO6cCe+ixkmkWIVj0tfysgZaw7aqyIuzoPqBsWhzAfWQZW0VtGKCUHHrWMF3RB
	gsuwcsF4Bhzr9L9ZShiyG0QA0ke1OLk=
Authentication-Results: mail.nic.cz;
	auth=pass smtp.auth=tomas.macholda@nic.cz smtp.mailfrom=tomas.macholda@nic.cz
From: =?UTF-8?q?Tom=C3=A1=C5=A1=20Macholda?= <tomas.macholda@nic.cz>
To: Gregory Clement <gregory.clement@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Tom=C3=A1=C5=A1=20Macholda?= <tomas.macholda@nic.cz>
Subject: [PATCH mvebu-dt64] arm64: dts: turris-mox: fix usb3 phys
Date: Tue,  7 Jul 2026 23:08:29 +0200
Message-ID: <20260707210830.3708-1-tomas.macholda@nic.cz>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.17 / 16.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.77)[subject];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[bootlin.com,lunn.ch,gmail.com];
	RCVD_COUNT_ZERO(0.00)[0];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:57069, ipnet:89.22.64.0/19, country:CZ];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	LOCAL_OUTBOUND(0.00)[];
	DKIM_SIGNED(0.00)[nic.cz:s=default];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: mail
X-Rspamd-Queue-Id: 85DD41C061A
X-Spamd-Bar: +++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_140839_243922_530F5C8C 
X-CRM114-Status: UNSURE (   9.69  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

After commit 00e6d608fe80b0f6 ("arm64: dts: marvell: armada-37xx: swap
PHYs' order in USB3 controller node") swapped USB3 PHY order, USB
initialization breaks on Turris MOX.

This regression was exposed by commit 91ddf6f722084383 ("phy: marvell:
mvebu-a3700-utmi: fix incorrect USB2_PHY_CTRL register access") which
made USB2 devices not work at all.

Fix the issue by explicitly adding all USB3 PHYs and PHY names to
Turris MOX device-tree.

Fixes: 7109d817db2e ("arm64: dts: marvell: add DTS for Turris Mox")
Signed-off-by: Tomáš Macholda <tomas.macholda@nic.cz>
---
 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
index f4d73c8b1a6d..bd00e7df87c6 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
@@ -290,7 +290,8 @@ connector {
 
 &usb3 {
 	status = "okay";
-	phys = <&comphy2 0>;
+	phys = <&usb2_utmi_otg_phy>, <&comphy2 0>;
+	phy-names = "usb2-phy", "usb3-phy";
 };
 
 &mdio {
-- 
2.54.0


