Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E26D46C15
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 00:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ERZOknKRJNeoOk1ZDuqvbo71ptBm09tLRhohA+SADqc=; b=RcN1DmEcsxj03OJzKOY7OAMt9u
	2EFfIq6xCrrCtOCEhIh9OEsqXC8j/PgKAHOnolblaNAD0GwETaBRTRf9PYjSowcyF+Oifjt9hGTa6
	1tsuzvEMGmydlfazFrNMG8dlvnuZktIKQTW7C+bcQlb5mTh8rkb25Z1dapVTTHm+mCG//5M2vU43J
	U3AQN6UwTGQsdXMmVnx3Jki0aMN8f5RkvQNEkyoT0NQ/7cGD95sv+sW2mjz711DDnBrKDePQJ3FGS
	VmzB2JaQn+tJMUyYgZsXOeiRHVwPuzj0x3VUPNQxgptT5hzgLzqQrBycUN/QyXworFWQ/nwdSvIN/
	cAJ0DgUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFts-0000000Gyql-360b;
	Thu, 29 Jan 2026 00:28:44 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFtn-0000000GypW-1vyL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 00:28:42 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-29f102b013fso3687805ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 16:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769646518; x=1770251318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ERZOknKRJNeoOk1ZDuqvbo71ptBm09tLRhohA+SADqc=;
        b=bqg946L0tahrmwlabJdk4iK1fR9V5ZPUo0Bj0lIEVLQW30MvGDMX4HeQD7Kg7fKz0S
         ceuZZFu4niW7yI0eD06n0IYyMbnfQYwmkx58D2wOkkdSV/hgAaEgWbqlUO9nuimEp/2o
         N5mSfpDBwODiHt9qmkAxg6JnFLE2dgwdw8H/s8nGQuUvWxMLavQOsPuMA2n6eYh/Dd5A
         Zy3BJD9JJpsSWN7gRhX3baLKswwcICGXRzNechn1PXJvMG5rpNCckCw9pERUmN1zKRNE
         mUUOVGVwc7+QevrFVr95usY3u1NqaXfKMXVDnDzRX7emFxYHBnKbNuhJKgjRDCmBOVif
         7IMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769646518; x=1770251318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERZOknKRJNeoOk1ZDuqvbo71ptBm09tLRhohA+SADqc=;
        b=AB3KoGNxGeoxRSiijcEAMQuol/EcZNeVgJPhQ9prPFxvRh91xBEdWRrD/AfOX6T96L
         1sWEshlmMQk2u/HHR294T0GvNaFnIGuHA5CciesLptSHdMeEsdFSn56hrSkbFAWBfjRf
         230lx5Rh1hg+jG0lkWAJxe3yNPd5dWlvgr4RmmjhBMH0xrihpK2ngn03ILXeIVYBw/sx
         qmVxvLuzcsnBYPTy/4ZSEU0dy2CWfAgZVZmSMjzTtcu27YjQ2s7+bweQ/8UsvU2Kld4L
         ruMEet9LnarD+REYjW/QLbZLQ4ch9teI+W+ucwm/RL2GDGzsDtsPxOZMxi0AFgp9UH3u
         wkag==
X-Forwarded-Encrypted: i=1; AJvYcCWwfQYIPCpaqXYMP5p2+H0/RHgEsLKYUnGKha2GSqwDKzamgCFoDIjL19I1Ql4OXlOfdx6kQzTVH3iWTSu0TxOT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6vgICkxR2C+6D2NpQGug97xmz1Vy4xgP42TmO4TKZWuxZ+Shy
	x/YQyL7aqBrr12H3lc1PLxO69B7zWZ9CY5oUZoPXoMZypdMYyNUhVRQR
X-Gm-Gg: AZuq6aKyJql1cHL2Dyd7Ym3P7YEpf/UZebyZc3FxQnkhmKmFRaUdzSEV1SKwtgr2Gwf
	4VF4AS498fXSFPQGWRUK4spzOfF48CykvyVKXDfYszo3UVsb2uP3WALHLBPg7AEPclOMogjFl48
	KlpG0+ipYTZR7hVI5w6vpkmCr5m8VURxHs4PM+5BpHZStm92poxtHOKtTvSLfcOJFBsLnDEsRhe
	VfT88uWwYhrRbELjrYzHoyyZMWINIrAd4r+rkl+BsCs6zwcvYebY22anxjKmWCSNlGA6XbYNOM5
	KiPWLa0rLugQN3AskFaHEi/mTCXveAJsXium+20xkLisGvD3sovfYh8WCTWPnp+pwwEVEUfv5ON
	DNZQQ4hdWI6sqzgV/FbZobFTuSOTlYtAYdJn9ZcLQzRBwdGyw2EXjuzxf6F67hfThRs/P4uaZie
	ulm/jA2KvMwxlyxFpU1Vs=
X-Received: by 2002:a17:903:4b4e:b0:2a7:8839:dda1 with SMTP id d9443c01a7336-2a870d60b38mr62916875ad.13.1769646518290;
        Wed, 28 Jan 2026 16:28:38 -0800 (PST)
Received: from localhost.localdomain ([58.29.79.238])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4163b5sm32789055ad.41.2026.01.28.16.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:28:37 -0800 (PST)
From: Lee Yongjun <jun85566@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Yongjun <jun85566@gmail.com>
Subject: [PATCH v2] arm64: dts: broadcom: ns2-svk: Rename at25 node to eeprom
Date: Thu, 29 Jan 2026 09:28:10 +0900
Message-Id: <20260129002810.10261-1-jun85566@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_162839_533894_9720F143 
X-CRM114-Status: GOOD (  13.04  )
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

The AT25 EEPROM node on the Northstar 2 SVK board uses a non-standard
node name, which triggers dtbs_check warnings.

Update the node to follow the dt-schema by renaming the node from
at25@0 to eeprom@0.

Note that other legacy property updates (byte-len, page-size, addr-mode)
are handled by a separate patch.

Signed-off-by: Lee Yongjun <jun85566@gmail.com>
---
Changes in v2:
 - Dropped property updates (size, pagesize, etc) as they are handled by another patch.
 - Renamed the node as requested by the maintainer.

 arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
index 5939d342aec7..ce1b099a8804 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2-svk.dts
@@ -127,7 +127,7 @@ slic@0 {
 &ssp1 {
 	status = "okay";
 
-	at25@0 {
+	eeprom@0 {
 		compatible = "atmel,at25";
 		reg = <0>;
 		spi-max-frequency = <5000000>;
-- 
2.34.1


