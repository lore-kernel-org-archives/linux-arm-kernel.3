Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E00FC021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 07:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fUcgyWCk+u8Dn7f+PhxtXY5uOs2pwYWI0aCmIl9K7zM=; b=sh60iP89pBSpcA4bCwEEoueXXe
	Hitc4X7VH7IRBGl6vMgk+ngX65QadByuw+ZpZ6xrE6GHsu3U86FRcscqvJtxfctpelE3SYMNalW3U
	uSIGRV08YxX6K4q4Y/B5TSX6vM3GCV4+65GeD20VVKgOrIUCYhB0r3wp8uhQKfHvYEv9TZFdWrrDZ
	OMo6ozs34JCiFudXnGOvm3vop5RCW46TX/WWyvrNOGUVrbIv2zdeoffz/kmvpGs8E5/3uDD0SPUQI
	Qmd9g9I9myD0Wf3nWDSMNXCpoY/AghnkogZLbksxvptt3LbNJ7og8/Ad/sstw02Jw1UTJ0q9vPyFu
	fZa/Q6wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTT3-0000000A3oR-2FKh;
	Thu, 13 Feb 2025 07:17:01 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTRd-0000000A3aS-0HdY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 07:15:34 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21f49837d36so6176885ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 23:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739430932; x=1740035732; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fUcgyWCk+u8Dn7f+PhxtXY5uOs2pwYWI0aCmIl9K7zM=;
        b=fx+IXpqm7HpfhJW2DGCD2EcEKDzeaWADqzcNRXw4riWGWgzLBiqWMgQ+nLxO0Uo6JT
         C+iYSkm8RJhTGgsXT2ilS/A2bq80nDc1ntFr0OJlf6uzxQfH2HygwpDMe7jqxWkDtOrX
         +3FSoorcWq5VIjr7EQ7EuhL8nqfFuFMIlzojwfxO/48cDDeOipZoS/yMSPvmMLKDbQEB
         BYn81IzUwMUhGieRywnlJW0/3gVNQn+N0vEkwEdYNhlN+ah2IlTwr4vTanEM2IX6qf9u
         vRKCZ3RvZyArwqurXrRytY+K3m4FHJ2hi/RWXFZL/sH0k+S8K+zeQAJ7YaI5MHPmVgqz
         lRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739430932; x=1740035732;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUcgyWCk+u8Dn7f+PhxtXY5uOs2pwYWI0aCmIl9K7zM=;
        b=QvRC/LP28/8bqDalQIl1plkCgViUoawjdSJx2cnqSlRhRX5NdBsSYXWcc9l9Ka2Ke7
         aBqyqo5bIQNIrpeQP5TviL1x5oeNIXbNkuErlBMdb3tYCr73iFBn/WEaU4HGwlhj2M7P
         oKrPhb0fXjwxScD8GEKg8rwda4CVSnUHwCtBrI16RZxepbZMDW71THIga8GtT6FDBAou
         In10FFJtKJfSjZcaPe90JSq/JNcYyXlKyOJPL7Ohv0Tgn0lZCegMPnfLH1PJh5ew3rje
         tbigQqscyPenF5MDGTsqJH1PTfy0A/f61OYkYWYz6DfelDH40cly2kLW3H+55YxFbsts
         MS9A==
X-Forwarded-Encrypted: i=1; AJvYcCXrtPELU7yKeF2Bi+c67T6MwIvvLth0A89Wkvjj34L5zWBbihK4YEkVtnCFRH5Pp5vgTwGBUGiNYsHcZOyf53Xr@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu+8ZowgKiU1/1L0B4rrFw5pI8kIoOaI6dHpYHmn8Ao+iTu+1U
	CdwakSjKj9VrccdmTUt4U5JICKj1A6Hm7kreF20pR8QNVgSXdw6F
X-Gm-Gg: ASbGncsocK27KFgyY80rbJwGG5DcX9jVXygKh1GyOe+tOJ7ypipMxSM009Khs8/CwmV
	Xm0yYiBaXniXnQkO/TNTN7QHY8STNZyn/ijLcg8Hv1ha5OGC6hnO4VWTiCQ+RnjCNysjirKlzv4
	B0/q+9Odqc+Yxdb6SgnCAAzxHwqU4iSXzIoY0YH/VVbGsm+zp/QrUTxT3XW8vCSY0QyLKImX/Rz
	x22myf9UXSbU2+MH0NilY1V82HF9C1QZxaA/p1GEraWYhZpRR67hIjFUnTuZeYHVdu7pSCgggBp
	Nd796OaNCNtrf/QTpWPovRLrtrjdyeP46Z9LxzicNMLORXtvIjeywEuL8ukfrgggjeO6
X-Google-Smtp-Source: AGHT+IESUUVzPXXPdZpzlDh8rry+98kDAJ3u8IwfE9kokPUoqbExS0rk1/6ABl0gHCy/zI3w64Nohg==
X-Received: by 2002:a17:902:d508:b0:215:e685:fa25 with SMTP id d9443c01a7336-220d1eddf52mr33675295ad.20.1739430931635;
        Wed, 12 Feb 2025 23:15:31 -0800 (PST)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55866f9sm6024805ad.230.2025.02.12.23.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 23:15:31 -0800 (PST)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 13 Feb 2025 15:12:58 +0800
Subject: [PATCH] ARM: dts: aspeed: bletchley: remove unused ethernet-phy
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bletchley-dts-fix-v1-1-c953315eb894@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHmbrWcC/x2MQQqAIBAAvxJ7bsGUJPpKdDDdckEsNKII/550n
 IGZFzIlpgxj80KiizPvsULXNmC9iRshu8ogheyF7BQugU7rAz3ozowr36issVqT6wdtoHZHoqr
 /5zSX8gE4Bp75YwAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739430928; l=1236;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=YNhJ633Uu5JY/VB459x1ZUs/aM+9WIpG3XO2+Tor/5o=;
 b=pZ48Hnh2P1YAIok5bEXIzdHYHBpzJ2kH3ypTFBISHRz7bwesAYGD463j93AuFRLNoAxYZOdbC
 2gpTfAfA22jC4TQQXT86BmoPCGX6rap4V5/pWjOcy/76uXjjozbAwUH
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_231533_110227_3E2B85BA 
X-CRM114-Status: GOOD (  10.13  )
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

Remove the unused `ethernet-phy` node and the `phy-handle` property
from the Bletchley device tree. This fixes warnings reported by the
kernel DTB checks.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
This fixes warnings reported by the kernel DTB checks.
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index 5be0e8fd2633..21fafa4b2422 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -52,10 +52,6 @@ tpm@0 {
 		};
 	};
 
-	switchphy: ethernet-phy@0 {
-		// Fixed link
-	};
-
 	front_gpio_leds {
 		compatible = "gpio-leds";
 		sys_log_id {
@@ -285,7 +281,6 @@ vbus_sled6: vbus_sled6 {
 &mac2 {
 	status = "okay";
 	phy-mode = "rgmii";
-	phy-handle = <&switchphy>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rgmii3_default>;
 

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250213-bletchley-dts-fix-3cac66ed586a

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>


