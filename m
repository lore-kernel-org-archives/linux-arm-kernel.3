Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF71606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 18:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OnNsS992;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aXJMLxHL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=; b=OnNsS992Ej06tJ
	rtsAXbmkp78ET76AY805fOk0DOGAgDxb7UaghrDop+tC/wMfYJk3RkCcRV09RapjSaAJbc6PU25DQ
	26lT++ZGmTC3MEQUkbY7MPFA7T/8USCU8qXzcDa2ZqOum2GuNPiPUSBLSokfr27y/CtXH4U3QAvRI
	FQHEcfn/1Ic56FM1G2A28IQ5w6t7QGFUUB6fliH9C0dv8lIhakGGHRlZfXtGrqqxhC2X19WmFKytE
	7aOntOV444AVm2lTih7FuDKU9QARdBA8tfVy2Kv4NoIIEjpzEDYJVHswteWkJoYj2aCDR09l0GNKP
	PxAheSCY2p3Azx6EpFdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPSK-000000034rf-3n2i;
	Mon, 26 Oct 2026 18:30:01 +0000
Received: from mail-qv1-xf64.google.com ([2607:f8b0:4864:20::f64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPS0-000000034dG-2E0P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 18:29:41 +0000
Received: by mail-qv1-xf64.google.com with SMTP id 6a1803df08f44-91b54d1e9cdso26964346d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 11:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039379; x=1793644179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
        b=lYC3pyjaiEWqNtXv3Ar/llzb1yOnSsFXb49OLj8tgKkUJcCjtEbzwDkgdtgAmB70tU
         z1r4XEg4zRkz23IbdK2ZZtYQmLv8kw+eW7Spm95RziQFWY5ArA+wnTZ4en4kGc8vEFsm
         j9ZtrGxz0BitCTfhwus8umDrFFOa3nmo6eXgvXgNKqAhCpveyA/+BJ/d6PwiiXOIeFBr
         mpBgyt4kWqQ/V805scb1Tj5zgD5QQBfBdZgUQYt/M3Z6KXU3YlLW9TuM+E5QCfu+JvGZ
         WWk9Qw5l33tSdpHYIv+WfkwGljcRz5rdy9nUbTOgUQPNJSUDcfdEfQpJg8LKS7Ls+2iK
         SxNg==
X-Forwarded-Encrypted: i=1; AKwUvByi/pKWpoxpqX51rfmRCwtDmaW75gR4M3kgTLc9Wx1mDNflpHVuYMGlMPyHkjaU4nyxJvulPZJkWPnJDI1g2y73@lists.infradead.org
X-Gm-Message-State: AFq9FYJySVzBqB+dRKXaEawFJBZB/EF+ou/LFm5MERO8GDCE9y1kRAT4
	1tvbNC8xz0+YfJrFZTGCwUoUPR1MQvFyA/tnNSk4/HhtF94d2i6BdvKCYvQez+CZr1XuMzsFvFT
	2UF0uAgJ5e8Cgk+udv14PsAGCDXUKeiIUT3esC6bHIIIg6Z42lAbJtMA3HiZSkgHeUzeOLS9xQH
	8UJ6RyF8RpwG2qnGE2xRqYLgQJxnoln4ZVF+oaLKSKxI5oFVfgWEtgSriwKqTrC8tZADi/LNnB8
	/Po8Sil7uOhg0Squ3qvl33eJX/epI591+7Guw==
X-Gm-Gg: AYBFou07sMxNp3lO4S5vWFAFTaEEBmQCO4pKrdx0WbL3h+lJY35+SpSEBbT/3SLiy0x
	wlcYbRL3PHB58smaDy+Ml+/BvoObRQm/PJegz0oCoippZN6wxWpoDIuhcTrsBADDnlGWaEjPE3S
	X0u7F293qZ2lUMip0Kd6Z5d19KVxf1F0uJ3Bx0lYXDyF15H0zg4a6pB7WjFZ2G6oZtLr14wpXwC
	7EuoYpeTBFaI5cY9+0qWCLwnvK2y+WaADpFskPhaV9/Z/jHNraRbYkR8OwxyYlUUMqfwxScbDir
	P8G2QbEYnd5QcOzPOVpflbtrN3p1JPahdP49TkoUerjCxIuAyDpAx0ranBhvpfrgEH+sYW3kLq8
	TP0UVeSFIeNgRl7KNVcNEZPFXJ27k1iWcKv1cGLxVjRplrCgn1zIkhAnQHkEkajhKWEoBRe8ntI
	ikLpwKRgWzHH6xkbXvrS8lhEvNxE0vuSKbomQXohHd
X-Received: by 2002:a05:6214:20aa:b0:91b:7601:342b with SMTP id 6a1803df08f44-91c48ebc5damr134319606d6.49.1793039379116;
        Mon, 26 Oct 2026 11:29:39 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91c47c71ce8sm795706d6.41.2026.10.26.11.29.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:39 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so4801761eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 11:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039377; x=1793644177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
        b=aXJMLxHLSXegi3SvBnFjWik+Y6rf0FA6TMH9egdLOO6IeuO7/6ik9vwTMMxIgzlRSy
         0v54E/bHjA4x2XUSOlU06dj/FiuEniNqePJPzjSra15BzVMSCjwOBkkqdFnFA7fgOqx+
         nTjq2VNQFE3OwBKtfWm2MdLK7fw/KSaxsjRZs=
X-Forwarded-Encrypted: i=1; AKwUvBysCfhAE0cJv6sioOzDqj9Deuq04dgxeZ7uRows+bn4lqOpn/ktTm3hOvc/QHwqHcrxZtbXR5gB8qEWu4O+c3BJ@lists.infradead.org
X-Received: by 2002:a05:7301:b0b:b0:365:921:8ce with SMTP id 5a478bee46e88-369e84e8888mr9413470eec.32.1793039376831;
        Mon, 26 Oct 2026 11:29:36 -0700 (PDT)
X-Received: by 2002:a05:7301:b0b:b0:365:921:8ce with SMTP id 5a478bee46e88-369e84e8888mr9413439eec.32.1793039376159;
        Mon, 26 Oct 2026 11:29:36 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:35 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v2 6/6] ARM: dts: broadcom: Enable SATA on BCM958625HR
Date: Mon, 26 Oct 2026 11:28:56 -0700
Message-ID: <20261026182856.3168686-7-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
References: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_112940_582723_2DF13E2D 
X-CRM114-Status: GOOD (  11.03  )
X-Spam-Score: -2.4 (--)
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

Commit 77416ab35f57 ("ARM: dts: NSP: Disable AHCI controller for HR NSP
boards") disabled AHCI after reports of boot hangs. Both SATA PHYs
remain enabled, but the disabled controller leaves the eSATA ports
unavailable.

With explicit IDM clock/reset setup and the corrected shared PHY
register aperture in place, enable the controller on BCM958625HR.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm958625hr.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm958625hr.dts b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
index 53acae385822..f6717ca76aef 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
@@ -184,6 +184,7 @@ partition@700000 {
 
 &sata {
 	/delete-property/ dma-coherent;
+	status = "okay";
 };
 
 &sata_phy0 {
-- 
2.53.0


