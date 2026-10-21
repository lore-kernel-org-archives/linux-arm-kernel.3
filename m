Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7691606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 17:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SIc4WLpP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=WdKEpe/M;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=DW7hxfy0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zyXSnCfTEpnOWhw29g/QqZpDVx5J0zovKESBV3rbdb4=; b=SIc4WLpPdU38py3RB5954ExDDH
	3XaBfPLvoWHyuCQ3gPkjxHMZ3O26pNKBfaHqVUTVOJlVdqc+6SJfs5VVUMTxexVw468DMNLAcLtF+
	xYYZcREoZH5aah00jPMjLwoyvRWWWELsfCvAMTALdXIrjRqq23UT3/bGnsc74fgZq3qz6RYgt68GG
	Mm0wv6FpLC3apa0o7RU5q0H2o4V0cSbxDfrcEnBTxlBiqiJ7KnRESqwob6yyC+n2S1xfBRt6kOiEP
	42qWHhZdZ8/XVwZs1XBoKpuDGW+rL/tKvRWbNPH23QcaGS+i5qb6tdywiiN5pN7/iu92y3kDiZJOk
	CJeLmMmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJa7E-0000000CYE9-17mK;
	Wed, 21 Oct 2026 17:28:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJa7B-0000000CYBV-1Fkm;
	Wed, 21 Oct 2026 17:28:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zyXSnCfTEpnOWhw29g/QqZpDVx5J0zovKESBV3rbdb4=; b=WdKEpe/M0WZ2PX6m2UVKO15uf9
	nohnK/3Tluh9B2zaG12KzGSuTY7PwgtKiD2ij6kUh1y/gPPLT9QXghCO0gx+ORsQxYsDNWkjpEu8r
	BMxPq3dxeiaDj/jaWwlU+xxWjwyTBg4wthPP2tqYCDOraxCmygNcUyU1FzHytZRc1s89JdPZM/Jb1
	sJOTd8hDea25/5zoZcb7/dCRn7suU3ONbN+euH+1GejHTVT04dqffWuUTC9dOLb3TqKu6w+uNnEeN
	QkNatqyoqlBB9wNu9h1O2ZuW7bKKRT9XbqmouFJkUbJePubEoLPwItC9ti47DiKtwcpAr11o7u27z
	EBUixu+w==;
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJa78-000000064uP-1bJe;
	Wed, 21 Oct 2026 17:28:36 +0000
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 2A884C0003E5;
	Wed, 21 Oct 2026 10:28:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 2A884C0003E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1792603713;
	bh=dHCSdMsKqyCCI6GLMa/Jp4jpFOGO85lAaVNk+lmmcVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DW7hxfy0ofs1btHVKM726OVnB2rSKN1VroBvKVgv/qpcubeKZWhtxeMCXl6sk/E/o
	 xu3uKJIMz/5ye8udxYsDFGH1OZtovNNq7SzswI8U0TaHDJyTxANJcnbJszD+kc/xqT
	 PXApdyECN0+q/RuhHmvKQmVbVDgnov6VP5zZzzMU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id BCFADAEA3;
	Wed, 21 Oct 2026 13:28:31 -0400 (EDT)
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
Subject: [PATCH 7/9] usb: host: ehci-platform: Set the FIFO threshold on NSP
Date: Wed, 21 Oct 2026 10:28:16 -0700
Message-ID: <20261021172819.668120-8-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021172819.668120-1-florian.fainelli@broadcom.com>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_182834_654403_325D7B2D 
X-CRM114-Status: GOOD (  14.20  )
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

The NSP SDK programs the EHCI INSNREG01 FIFO threshold to 0x00800040.
This is the same setting already applied by ehci-platform for the
brcm,xgs-iproc-ehci compatible to avoid problems with large transfers.

Apply the existing workaround to the NSP compatible as well.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/usb/host/ehci-platform.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-platform.c b/drivers/usb/host/ehci-platform.c
index f61f095cedab..9b7188d9c288 100644
--- a/drivers/usb/host/ehci-platform.c
+++ b/drivers/usb/host/ehci-platform.c
@@ -77,7 +77,8 @@ static int ehci_platform_reset(struct usb_hcd *hcd)
 	if (pdata->no_io_watchdog)
 		ehci->need_io_watchdog = 0;
 
-	if (of_device_is_compatible(pdev->dev.of_node, "brcm,xgs-iproc-ehci"))
+	if (of_device_is_compatible(pdev->dev.of_node, "brcm,xgs-iproc-ehci") ||
+	    of_device_is_compatible(pdev->dev.of_node, "brcm,nsp-ehci"))
 		ehci_writel(ehci, BCM_USB_FIFO_THRESHOLD,
 			    &ehci->regs->brcm_insnreg[1]);
 
-- 
2.53.0


