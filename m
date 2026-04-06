Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7770FFB5164
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 22:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e+deuk9HJHmm4GfV1lNuEcq28B7GQyr4EKky13KWcBY=; b=EqIspJ46FD980vemsSYw2wHrQd
	CsfKan83n9otoJURrrcZ1fMNGDBDQqtUfEmXi4r1WN07OUsot6sdX3UMe22EAu3Sk2TeI0XyRGICe
	Vn7nJuF396N2g02BrZgip9gsrx0W7puenVb9pV0DsBc+5lZtd5awL+VYgXqt7ImKecJbBW+zpkC6/
	ZYCTMCExY3gn2eZcbgNOxsCvz9ldrc1wCBoFKuDCZHVyqowcXK+6qeyszqTO9kZqA0Z4BhKwmQRn+
	2wMyGr7QU/NTNMh8Ga0jUh9KeuHnyanjihbRKc2E3aOzRemXMqV+d58UiPBZqa786w8sxhF97slHs
	GG5MtJOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9s4J-00000005YDf-471N;
	Mon, 06 Apr 2026 22:05:16 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9s4H-00000005YDM-36fk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 22:05:14 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-8cd71fb9f06so282955585a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 15:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775513112; x=1776117912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e+deuk9HJHmm4GfV1lNuEcq28B7GQyr4EKky13KWcBY=;
        b=jz6WfBKQK4b2TuPUpX0uLhsenTIkBVT9tvQTMDkd7vNK4rkFBB6OQPnV3Jz62EVmGd
         xFY1jfv5ihP9w4bXrFYyrVgSzvXr1PP954pm4Mqns909w4e0uJ2P+U0qqXmnUcFJd7hh
         coGSWWPmba5IK7Jk7vC+1XIvy829gNx5RianIVAKXw5oTxUuQk3iYZBc56doUrpjapW7
         zaXjOVwoThPwlYqwsYDf1pWawDWINRjPXFhue/MM3Hr4PPxeLxFeb8kD1B97ofnu//tA
         pNCLtPnsD0Le4zbArmJ0FT5Pec0MUNJnvB3KyC31C4J39bTjmFu3p/7qQ3CPLvOp+VF9
         agUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775513112; x=1776117912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+deuk9HJHmm4GfV1lNuEcq28B7GQyr4EKky13KWcBY=;
        b=rn8PDKHdCnx+PIHvbWLQURgOTMWHxeV3d3+3ZZNmlLwvmcy5QChF8o+tJGNbpbqyBn
         1efp0yD1W5gwjkm1m6Sjx8tLmetjnQwca+yP7DU9xXyt5oPC0cnP1hmxnj/afq+SLkIS
         U5V8i/IyUP71kFj8CdQfjsEQl/BqHwhOFasmM2etEDu1G6DAz4ihKyx1hBIC0lqxxaY/
         XB6oBW7ZL3tPN0pkG1PAJCxCMVTRsDIPewho/UnTeQwiD6ugu/Rcv45Aynr0VCxxSi4U
         QXBwiAJYkmkHGhN+aabdk9FUnEcnFcafpWPCzo0bHyS1rPRXXi9K//NDtzS6NaQzZTcR
         wWcQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6a1uCZ2mFuyhMlxOYEPxPhxe/ioFHK35WibV+GyEDxuPNXrAfu9dkI4Q47XMBnkcRZyCBse8vFFDEhtuWOYm5@lists.infradead.org
X-Gm-Message-State: AOJu0YxQrQrLwJQPqfrEMV4XTAJZzKiTQQijdBvXvxRm0bNl4dmWqKk1
	PLl9oYuAtBBrtc2Jq28sP+mIAj8hGDvqkg3ZK66xwuS5bDePoRZLUxZ/
X-Gm-Gg: AeBDievOI2gX5FLfZHQF7waVs4bKrvk3bkCAdVHKTQlYEwJQAazZXlcmS/WKXfSHlnD
	eZNPrOit34u7inSX6Yl1VQ5u3ONJ8b1hBEebxqKRaE2O0skvJtiD6MVJcSQJ/ZXSYxtDRm3cPdQ
	XRTEanAmNtvsOKXDkC+u6K/N7fnEXtpfkDP4x8KSgjpqugNHnjOMhFXs1dnftV6k73Q6FCMoC/2
	j2EJxsX6vGv7Sp7nV9TTyjAvpD1pYRdFSJh4u/KRwVHHpl9Y62PPjjwlA5jqZZ5B5eF49unlvTF
	FBNQ3YvDQb0att5i4o4dncaNq2auHKDqmI9ynAsoDBQoj2UmX+TTN9hcyiUky82mFUmOmmOPGii
	u3ocnDiAUVHQaxkxHnZ7IUMUVSg4AaoCS4TrApYFdDTE3ynqBL3Vkf8HcyYWxsLM4FtTTWgtUfJ
	FVFCIz/bCeyu/eNOOGVBxzp5yiBwsx1VBvZqmHnlDW8Wb1BRzGJto9MFw=
X-Received: by 2002:a05:620a:4003:b0:8d6:bd01:a684 with SMTP id af79cd13be357-8d6bd01b434mr1091538685a.7.1775513111721;
        Mon, 06 Apr 2026 15:05:11 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a806cd69sm1157670085a.29.2026.04.06.15.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 15:05:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: R6300v2: fix USB3
Date: Mon,  6 Apr 2026 15:04:53 -0700
Message-ID: <20260406220453.101185-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_150513_788060_86AA7686 
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

USB3 needs GPIO to be pulled HIGH in order to function. Add vcc-gpio to
do so.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
index 77396730bdd3..55f0d9e90d5f 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-netgear-r6300-v2.dts
@@ -86,3 +86,7 @@ &spi_nor {
 &usb3_phy {
 	status = "okay";
 };
+
+&usb3 {
+	vcc-gpio = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+};
-- 
2.53.0


