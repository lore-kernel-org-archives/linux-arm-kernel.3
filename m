Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76B0C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 19:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cmyu/AALd+CLLHUAUOEgsycpvTvhYWOAGBvBiIKKJb8=; b=cM+7IVb2HA8Ud6GIUQvFKfY0qW
	Y5v0iBSg88+DTfDM1rw495F/KvQfaTrgnADMWdv4AuaR1Jdhhs2jEz7Gvlh3CHqmXKFohXM/cvRAC
	2MXRxamKgtIwXhzT/W0WmkioeEy+YO0C9YD6No4Z9nalrDXDPc+d43lM5QBDypjkt0a/YFmrnUKf/
	RIG6UHJRfp1YEdm6CrDxgcc1EfOYvzLIl3+CfDJNxgrloVKS0sMm5qMQHH2UY9IkA/Kj4EOTxEB1T
	guYebSxXc3yHaOewr7E9zkVWe3GmWvzhPVXajlI4OpZPIViNHe8tQh75+TibXjhUusMygSyRcUIWp
	6wjSGwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtsHj-0000000Er7M-1yG9;
	Tue, 11 Aug 2026 19:37:15 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtsHf-0000000Er4D-1gUm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 19:37:12 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4997581cdc1so1288645e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 12:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786477029; x=1787081829; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cmyu/AALd+CLLHUAUOEgsycpvTvhYWOAGBvBiIKKJb8=;
        b=M5IWKu5NWSTCy9NwPqh38HDGlwuFkS+4Tf0tfHnWJVxKqGyYum9kLRDjQPD4/0JLXO
         KofMWStxVcyfojhVUDWcScNItGjGeXKWldyLb2RqwkcQoulXOwda5Ny8UFj5Sum5Vq8c
         uE7ZDbUSe7auxnwJi1Qd4MuJhEDl83CdCCx7T5zCq08srkvl1TUc49Z4adm+lZKciva8
         EQ0a32G316xlmix2Nu9W/IJvbDNSQvo4EGAb/i042nAbEF3Qt9wG844MWMyo/z28VN4Y
         9EqQaKtAtPHaq/kNfgbyFV7ILCkILZDdUU1T8Am8PP3KYeWDvlDYs8jNHKeOspAV659Z
         nRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786477029; x=1787081829;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cmyu/AALd+CLLHUAUOEgsycpvTvhYWOAGBvBiIKKJb8=;
        b=SUCR0dr8UEud5RtWuBf0TgbCGAvc28OmlliRCtyJXcNXPwxh0pMi3Zudg1Sm3o+rHg
         QZaTuc2LA8JiR/VgPuh+O+ncH1492d8FRl3ob/d4/KFZrLCedFKQjl2pA4lBPrzxpG2D
         o/YOWB955VxkBNNMezUf6cm3NetppxYxVehqzcye2ke7+84qvqJYcGohcFgQjX9TD1zx
         yOIImo0r8Pqs0x2A8QmOGUtCBsxJNdtASdgzxjeK6QX+t4d8LveDrNBLWRDJhy7Nd1VC
         nOTMe2Cgyg+dVc/9F6UTU/uofdkkFdN3DHGS8XDOxcdxPPzD3spcqIvNV0GrNWwpAqKe
         YlyA==
X-Forwarded-Encrypted: i=1; AHgh+RqiaotUxxbeG2JVHH00ENEKhNDTbTViCVBD72lmjY/p3YbS9+uAYtilKi0iEf6MOKvOIQCv69EINtf75H9HwFL0@lists.infradead.org
X-Gm-Message-State: AOJu0YwBtVK1hfgaKtkBSNvpPXLHPlkKo5qAjy+e/oevCFpUHBLa12rp
	nM6ygH1nIMs7S+25EKqmm9sJ5KboFY7QcKsObWm+x5rPv8VL8nNqBE/N
X-Gm-Gg: AR+sD13xi3S+ycz7GPEfHbsHHfGExytQC7pvxa6tClBuRXjipMfcOIzqtCQyoQApUm1
	J340HJAKve4Rd1LaU4+NXHndYluvJjSN72o34VpRnWGE86STwKSSWKqrAuGGAXWhO07ZL9CXfyA
	OrsJk6+g/uM0HXrFBMEqKSHpolGGFRWx/QbJp2jnKJBtg+nnuV5cep2mx8VnAkF9DoVdCkIBO4h
	6W1X3UYROmOHfLFmdT1Ce2c4Qa/dh1wMBvTApASEEwXr+Gi3skW1WVQcK+unQfWtxAYfwHmU8pU
	G2Py/IbuZM/vmm08gf/WMwEgMsTHebKaznG/SHdr6BF6vUUEKkl9hPcxfM3WliRKYPs7oyfeQzL
	E3NcA/5CLfnwebaOkP6+vab1Thro7przPf/g00FOsy1hd5m3xetLxN6/LRAyz69cI/va0Ath1vE
	E8NMEQnVD+cztcqmOvKBHkfhPYL0SvRm9yObdZhaQEPPhVUDz4dyESA3EVQPXSX+kLUV7QnZVOZ
	KKpkvVfc1+7hFU6CqKMpQsfYI8+fA==
X-Received: by 2002:a05:600c:c490:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-499784559a0mr94570785e9.8.1786477029607;
        Tue, 11 Aug 2026 12:37:09 -0700 (PDT)
Received: from localhost.localdomain.pl ([89.151.31.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b15b807sm10130285e9.7.2026.08.11.12.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 12:37:09 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 RFC 2/2] ARM: dts: BCM5301X: change Luxul XWR-3150 CPU port from 5 do 8
Date: Tue, 11 Aug 2026 21:36:58 +0200
Message-ID: <20260811193658.14304-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260811193658.14304-1-zajec5@gmail.com>
References: <20260811193658.14304-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_123711_459623_F179AD3A 
X-CRM114-Status: GOOD (  18.08  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Northstar devices have 3 CPU ports (each connected to a different
Ethernet interface). This design was meant for dual IMP setups when
WAN traffic goes to port 5 and LAN traffic goes to port 8.

For practical reasons we label only one of those ports as "cpu" (the
rest remains disabled). It's because of Linux behaviour (and it's
probably a bad thing since DT shouldn't "care" that that).

So far the choice of "cpu" port was based on how vendor decided to setup
given device originally: which of three Ethernet interfaces got MAC
assigned and which port was used by vendor original firmware.

Most vendors decided to use CPU port 5 & relevant Ethernet interface.
The problem is that only switch port 8 provides full functionality.

Change the choice of "cpu" port to 8 and make the third Ethernet
interface (connected to port 8) use MAC designed for the first Ethernet
interface (connected to port 5). This makes Linux use switch in a
feature full way.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
This seems to be a slight abuse of DT. Instead of describing hardware we
make it steer Linux into using a more appropriate switch port. This
isn't strictly a setback on its own. It's a change from one choice to
another.

I'm not sure about that MAC however. We say that the third Ethernet
interface should use MAC that was designed for the first one.

Is all of that acceptable?

 .../arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
index 8e487f60a2cc..7969f0f331b5 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
@@ -81,6 +81,11 @@ &gmac0 {
 	nvmem-cell-names = "mac-address";
 };
 
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
 &pcie_bridge0 {
 	wifi@0,0 {
 		compatible = "brcm,bcm4366-fmac", "brcm,bcm4329-fmac";
@@ -136,7 +141,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -144,7 +149,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
-- 
2.51.0


