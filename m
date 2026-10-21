Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9FE606A338
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 17:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Md/l4PWP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=A32DBIdr;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=khv1zKk8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzbg2zxNg9TMlTzssEP+a2X6U+i+DC/oc+2adV0rwBw=; b=Md/l4PWPAIN3FPTxT/4Oaeof8y
	jVVVB7ro5T8zBqw5p05rQt/wYsf3T0oKWJLWuP+cqBKwx34JajT4oYT8e9Zso77OletutVwcMDTo1
	pWaZV51k7VOQgdX850ViTzLEuqjwrtXWH7N7CaReo0hI4O4zLl76Uoi9pYolr+wHKoB/da2aysbrx
	s1A7ILcz1fX6KU5LUnnYrej+IlMTBB2EFoH19+H3K560NIlx9nHwo7JcuCcIA+Tu9+PVIEgRj0s6L
	gRnA/qiv9k2Yv+iYja3rEOtHqXDQBDzrlUpQIHCpPLAPXTkxtYtJymz61PDws7z8HPJEEbKaHMsad
	1apH/wCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJa7E-0000000CYDR-0DWS;
	Wed, 21 Oct 2026 17:28:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJa79-0000000CYAo-3A7k;
	Wed, 21 Oct 2026 17:28:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dzbg2zxNg9TMlTzssEP+a2X6U+i+DC/oc+2adV0rwBw=; b=A32DBIdrlDhIye5FsgLAdIdfkf
	wCCsPTO2mIG7Egir5UzqX1WcWVbK2YDHWP9dIgJGnbmT8YbR94A64C0jwa/Me24r71qE1+rrgp6Pj
	QYksXk6ef3qQKGr06LVXhOMzwN9pE+r2Z0ltTGO88ZSjYBz92rNTTV3aHi2Pbj0/kTggNjwyMl/Ww
	HyJxEeMwygK+KspV5ixqDmpuVuRuIdCr7lNqGU3hIqpJ4Y/C++1Qx+H6T0keQoLfeA4Fq3m0f7zYp
	6kXY16xjpk4Py4BGB1yUQ4K/ZRYH18+y50bpiEMvHFWoIuKaHQOGvGH6VAfMNV0fTITlEmNed8sV+
	ehpB7y2Q==;
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJa76-000000064tz-3Whd;
	Wed, 21 Oct 2026 17:28:34 +0000
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 99FA5C0003E3;
	Wed, 21 Oct 2026 10:28:31 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 99FA5C0003E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1792603711;
	bh=mF4gui/hs6R4l2uxd1JaFeVQL1X3LWEiSwJpnujsdW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=khv1zKk8stqHXizhingF94HJhdnUtHqv58PX1v25j6cQ171ay5Zm/YleJckLCW13t
	 FRZtSEqPjGJk1drnM92w8NChiVxjfmGSyn/ZdfVoJgiv5+f/+aTpf8FLLs8KiHDoEF
	 ERSbFdsmCA2qJm2wEXQEUmv7Al4jywgmLhQzwhNo=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id 385BAAEA2;
	Wed, 21 Oct 2026 13:28:30 -0400 (EDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 6/9] dt-bindings: usb: generic-ehci: Add the NSP compatible
Date: Wed, 21 Oct 2026 10:28:15 -0700
Message-ID: <20261021172819.668120-7-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021172819.668120-1-florian.fainelli@broadcom.com>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_182833_063521_DDD38DFB 
X-CRM114-Status: GOOD (  11.48  )
X-Spam-Score: -1.2 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Describe the EHCI controller in Broadcom Northstar Plus SoCs with a
SoC-specific compatible. It needs the same FIFO threshold programming
as other iProc EHCI controllers, which generic-ehci alone cannot select.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index ae9fb70d0212..6462772b51dc 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -48,6 +48,7 @@ properties:
               - brcm,bcm7420-ehci
               - brcm,bcm7425-ehci
               - brcm,bcm7435-ehci
+              - brcm,nsp-ehci
               - hpe,gxp-ehci
               - ibm,476gtr-ehci
               - nxp,lpc1850-ehci
-- 
2.53.0


