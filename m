Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B21CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rEf+QF8cDPXceBxP70Jj9VU95LyjIJ2Vip/589+YH0Y=; b=Xn+q3RV75sd6/NiBdxHSTdh5Wd
	GlFupiPBlrwXXmiWJvouKewmSar2j+MuO0GLiz+iVVViqtRcDvfOLgwHvcpzzWtmmy3lfyKfhGoUM
	i70aFScunTDeXou0iBRFIc8E96DQva9SjT27+BiQulikyMpj8qNxRtkm/6yCVzLrsCHVN7XztRbfg
	TM6p7KUBbzB2ps2RuVhkBHXF3Gdy7eMEDXkijNrmJCkUE35RQQcrdreu10+q2gpmZIkiBg1xPhJy6
	ezfXbRbctk1Lt0SBDaRLkzN4r4raARReJwd08UKu/rVCg6eAtkJR2XPlVjSS2Yaa1Ve0S/q+6rljr
	mqlmF7eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZIX-00000000Sqb-0fPT;
	Wed, 06 May 2026 10:16:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZIV-00000000Spn-1SCK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 06 May 2026 10:16:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=rEf+QF8cDPXceBxP70Jj9VU95LyjIJ2Vip/589+YH0Y=; b=KJDoEETdzXzJ6+r002hngF8yYH
	oCU46fWl4u3V5pqAGfs2fqT+AV3UqQus+KHBddyrGE2zWb9ri1kFTYme+LO2nFQ6eE0jDALsrlrvk
	3SO8bN7/7xVu7+JvEmldeKXAS5d8e2tg2iLtZAeUeKC4MuGnCQIjvgYQ7H0wNWdOplPW84+A/kV2H
	kV6dWzLgHZBtWcy9zzCyK6NE5D5/geoggzysZu2/ei8aEVxVboXqzMrVwsdBgukcZPE58HZAvBnQg
	HJwAMpCBSTzsVwA5ZoTSBnUMUPSmTkFnFIvG7pLjMfla8bDQAqO6Pwkbt/6YqBWryZEuKHqmv8SFE
	gErlBO/g==;
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZIR-00000001COb-2Fp5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 10:16:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rEf+QF8cDPXceBxP70Jj9VU95LyjIJ2Vip/589+YH0Y=; b=mDlVWEVKgngZzTseLTMNbUGwZk
	JyfwRYdjdkrPCByRvn8ok9fCz2Z4vrI/uooCaY5lC8tvRPQdhVdR5N3MBDymQUEFE/9+BHhw3cisr
	BbjllNP5PRX1k6hFKIVqo8ifRUnsT8CVnmnV0WQGE8u3ebPo47J2cW45gmdI/DUtNf65s9hsofi9d
	vv16b5E+gZvmLNkeu8/O/1zKQF9whPX6BY5wSEkjt5+lGOUFRCAxTeNG+dxRMkIoyzw/XuCn8tJlt
	qKU9Yg+T+wW68Tyt2/BDqvlrg/7EKe8ozNPJf6CxxzQ644173UGFUgBwF92xTyle/Av6lnQUXyCSN
	ILhCCwog==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wKZI1-0000000DXxR-23bm;
	Wed, 06 May 2026 12:15:37 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Wed, 06 May 2026 12:14:31 +0200
Subject: [PATCH v3] arm: dts: allwinner: t113s: enable watchdog for reboot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-t113-mangopi-reboot-hang-v3-1-fa15a360a520@mmpsystems.pl>
X-B4-Tracking: v=1; b=H4sIAIYU+2kC/43NQQ7CIBAF0Ks0rMXA0FbrynsYF5QOlkQKAUJsm
 t5d2pVxYVz+mT9vFhIxGIzkUi0kYDbRuKkEcaiIGuX0QGqGkgkwaFnNgSbOBbVl47yhAXvnEt2
 KVHWyG1CfAaEn5dwH1Oa107d7yaOJyYV5/5T5Nv0DzZxy2jAGSssWmVJXa32cY0Ibj/5JNjjDB
 wbNDwwKpgdRC2AnWff4ja3r+gYyYodzEQEAAA==
X-Change-ID: 20260412-t113-mangopi-reboot-hang-c9a9def82e2b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778062495; l=1217;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=RIZFKu0YFjj7EBH23MsJ7RM+THIvDb3yzeXZZe8JlHI=;
 b=Whfd5bW+3yqgekFwmeFvDl+NjTsUzrNampq+WZUHFRgq+FAdlYA32aSD9DkVyGflXx1DsaczL
 SeR9q64rPuQAWKaX77Gc3odTlstSzKbsJ6syBCCFSWF9qoXwxttEdj8
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_111604_051482_0CA70A33 
X-CRM114-Status: UNSURE (   8.48  )
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

Reboot hangs on T113s boards because no restart handler is
available.

Enable the SoC watchdog whose driver registers a restart handler.

Tested on LCPI-PC-T113/F113.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
Changes in v3:
- Fix referencing the node
- Link to v2: https://lore.kernel.org/r/20260425-t113-mangopi-reboot-hang-v2-1-fd343207a4be@mmpsystems.pl

Changes in v2:
- Moved watchdog enablement to SoC level dts following Jernej's
  suggestion
- Link to v1: https://lore.kernel.org/r/20260412-t113-mangopi-reboot-hang-v1-1-5002cfa6e0cc@mmpsystems.pl
---
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
index 424f4a2487e2..3ca0897353be 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
@@ -90,3 +90,7 @@ cpu-crit {
 		};
 	};
 };
+
+&wdt {
+	status = "okay";
+};

---
base-commit: 74fe02ce122a6103f207d29fafc8b3a53de6abaf
change-id: 20260412-t113-mangopi-reboot-hang-c9a9def82e2b

Best regards,
--  
Michal Piekos <michal.piekos@mmpsystems.pl>


