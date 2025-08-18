Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D200CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 22:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p0L0PUdKrw8pe4MSbmrbkZZGt9wQl65fILz3E6twKNM=; b=j3MNH4WZUzKW8SFrWnEOVXaFT/
	UxWORVxc3gEfGNo1N3fr/1GdiT6o+bfNYjea71/FtnUslVZt+C8nBJHW1h3iKmr2qh5JG1/ZuFbJc
	aY+rskNPS8d7eMHlzVW2axDj6SQuQfHqaZ5aV6axKetCm/0Z2Z7Ds1zltf/wHjGHW6PCSE2YBCwNl
	lmH1AEE+dzpMfDXZOB3BUHtlokGzhvgbC6KWRmp1bqX8I3zyqvmwvDlCxvcZPhSJcZlWwSBDJjH8q
	VYrwdfkt2yxMH3uQcmzkvaFRQqX6qbKHMT9UTismT+ZHp/tZSo6F/vG+k1xJutbUdcCAtr2ohmGBl
	fBu/Op9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo8IQ-00000008pgU-0gaO;
	Mon, 18 Aug 2025 22:25:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo764-00000008h9P-3b7K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 21:08:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD1FD601FF;
	Mon, 18 Aug 2025 21:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D761C4CEEB;
	Mon, 18 Aug 2025 21:08:51 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id 3B3DB1807BB; Mon, 18 Aug 2025 23:08:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Mon, 18 Aug 2025 23:08:04 +0200
Subject: [PATCH] MAINTAINERS: exclude defconfig from ARM64 PORT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250818-arm64-defconfig-v1-1-f589553c3d72@collabora.com>
X-B4-Tracking: v=1; b=H4sIADOWo2gC/x3MQQqAIBBA0avErBNUaoquEi0sR5tFFiNEIN09a
 fkW/xfIJEwZpqaA0M2Zz1Rh2ga23aVIin01WG17PZpROTmwU57CdqbAURm7rhaxIzQD1OoSCvz
 8x3l53w+8fOGiYQAAAA==
X-Change-ID: 20250818-arm64-defconfig-12bb2664e617
To: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=aJz7l7FHXHkaF0nDNQxwlSMNFWvwBnerb1KuVZ1xiOQ=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBoo5ZgAmVP37Tnju4oHv4sKrhNnHv75HvFUxH8W
 V346ULgreeJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaKOWYAAKCRDY7tfzyDv6
 mi18D/9Kw+cUmAxrjOeI48QHiUv4RBU8c0W/8RRLD8HvO4RKreMZSai0VxTenHCYN6SqeKtW/Xe
 1g2JA8rezdb6ZaDYO/SrOFaACoQjAEzJXO8FyrU18g1hopF4/ZBzJ9bXx9sP5BOqYaEfJOt0lp+
 ++FT1TvDE8CftnGRerSR4RbjKeZqTrlG+sRWGRdzedT0OTg1FAHfYNGULwoMZfLtBA9SvyjBcB8
 UVPRkjdwG9MRMXA5FQN1hVsSfAcSPV6W79iDvIpQNgre+Ht7wMVggfsdbG+XVr6it5lBibCYCBo
 i78g1JwH3wYE01KmhSvHdA8XScpxxdmTvgdjsmZgUykE9feJ7tTliINyc+vutLn2WhdjEtXWm4q
 K+iIbpYZlUcw/1M69Y+SECHB3qLdrI7g2yUlVFP7TPLfyJ7pU7Sl4W2mVUvxceQkChEHVNqbb++
 uFlx6HUGN3MqpBSMPc1Ud3P98kTtTFPv9v7SseGFIDKA5q4BgVyflmAXEZAsn3Qpdczf3qWr/WM
 s2fTsUejLh4oU4v1HfGf2J6QqXsAyMGtG8L26o7jd/8EH9lY/Z5QDv6vAy4d5YlYULhnK0ViBlS
 enLu/Ln7WyL+J5FMpWnJgJrvHpY4jtf6FDQ0W/RTWfwQZse6oQULxGhu7L5/r5vA2p8XZACEqBt
 FMcYx+gZR0toDGw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
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

Patches for the arm64 defconfig are supposed to be sent to the
SoC maintainers (e.g. a change in the generic arm64 defconfig
required for Rockchip devices should be send to Heiko Stübner
as he is listed as maintainer for "ARM/Rockchip SoC support")
and not the ARM64 PORT maintainers.

While we cannot easily describe this in MAINTAINERS, we can at
least stop it from giving false information and make it behave
the same way as for the MAINTAINERS file itself (which basically
has the same rules), so that it just outputs the LKML for the
ARM64 defconfig.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index daf520a13bdf6a991c0160a96620f40308c29ee0..b6466a628381bf40ebcf7e3638ec65fabf6ad357 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3667,6 +3667,7 @@ F:	drivers/virt/coco/arm-cca-guest/
 F:	drivers/virt/coco/pkvm-guest/
 F:	tools/testing/selftests/arm64/
 X:	arch/arm64/boot/dts/
+X:	arch/arm64/configs/defconfig
 
 ARROW SPEEDCHIPS XRS7000 SERIES ETHERNET SWITCH DRIVER
 M:	George McCollister <george.mccollister@gmail.com>

---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250818-arm64-defconfig-12bb2664e617

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


