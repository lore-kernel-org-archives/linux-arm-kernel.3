Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D211A606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 21:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WO3jC8rz;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=C9uuRTcv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=; b=WO3jC8rzwsRMaM
	aXdbR6EHutiUq1QgqTXPN38bgg/DDK4wL5u90Y0aQhnLO43OAwHPMlZvH7WHBe0Z/3+cD3UrXSrvk
	kYt3FjTBFgIK5AD+WHwW6rUgMp/4rac6b9XFUGs+bls5XKJMIxmus0Nfs0ZdpZKnOG5UXlj8YkJ0Y
	uIyc8TxI2Qnis3oXzA8EV/n56AwanE1385hmQI5UWmD+NdhoVK+Wx+Q0V5MA2G0Ljkx1WOljQswbi
	JGDQ8eNSD5gV6IGpZdoBHR46nCCMIqrKVMvNo3MoDmC/vIRtm8+Atzc/3J9Vf2tduSr5MxpXASmW7
	A/pf7++MRXRCgTMbv7tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXdX-0000000APxG-0780;
	Thu, 29 Oct 2026 21:26:15 +0000
Received: from mail-ua1-x964.google.com ([2607:f8b0:4864:20::964])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXd3-0000000APb0-3My6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 21:25:47 +0000
Received: by mail-ua1-x964.google.com with SMTP id a1e0cc1a2514c-9906c3fc88cso18507241.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 14:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309144; x=1793913944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
        b=dxj5BFe0iOvAC9Vese+8XVqwvEA5XZZdonQK5k42bAF1Hp4FAtnHK05/voNdxVFD4Q
         D/ctPaASJV9qFR0asdjduqeL1krlwc/dRJn9hzLfjIY1hNB52mfZ1mg4qWrR17ytfZoh
         JDNaI5mnhL3FalgfT1bIN6vKmn3hRL/nmUHnoZB9D37o7QQb94aP2+IQLU9rGHQoY+3U
         YVfWvIrYyR/On7i0kkew3Mq4uqMOCH9mMbkAVZhUP+QHHsmuVxpt+SHfLK3G2Cwu0rFo
         o6yTxM1U66KR+eqbOBPJzHG71kxNMMRW7ZaGk86P/jPBd+VSEZZh76FCzpxLM/CwpJxn
         S3eA==
X-Forwarded-Encrypted: i=1; AKwUvBw2JkdAh7es/0nzEIxTh3U3eDO6dkqFP1oOkqX9eRduKo5vSTqTMi3BF5A3X9z55zJpw1NLpt2ciKCN3LnNc4fB@lists.infradead.org
X-Gm-Message-State: AFq9FYL1EH7wH8kgFLKfx448rJ+SAh0LsI8LC/QfPOkGsR+59vNFwjDm
	H1o6LBBXOOsD04FIFuneWg8cHqq4H8iJNF7lcn87PFPZ+eLQg+YTIiYCFUk78ZY/D0OjBnswtli
	VJk7HYJLUsFLRvXJ2zIhes/atskemnYf4c1yAEl+oxh5dwRXkoj4jqNqQPb9XEdCnDSfUaynB67
	fa8SBtT9FoHMc03feFys6L2+N1zIcgp4A8QZ/Jb7LgQdui+WVsLAYxiCLid7iNFBQmd3/ZF1dBo
	p8ybKbT9+Oe5SFecywUaGRUzIL4zyANhEGigw==
X-Gm-Gg: AYBFou0bzw5U5qOOm3o9jX6lTFh0BgGreQQ3lGOgrIzk4l3o/UYgfp2X5Xs6fKr7/DU
	CstmiCIAiD40yIRps/tfPu3aCyGW/3hXpKI+a48XFacNf6FbFxTMSw+hIzAewfgXXdt/nzk5+bF
	ASPK58Pv+8d29Lj+4GFfoV2DTMjQ+pAAIHOTVK2/D5aARpANzD/DVnZjXOGiSkJfqNpxOzWrFER
	OOmXiWScKwSHv4mMHVJWnCTekFDJqJTTwJifITkoXtzUu8lN9VTotFJoAq+qWd2uLoTNtluy2G3
	hEJe5ltAmLzF61LuXiC3TTdldUPZnB9YIDsgpswxsgSR0ZG+yFcF+12xEKLOtje7fc8Wt9FBDmV
	lpp6Q/32LrJfKxxixDVLOjenfZXBnygKonZau/GcRe7h7ys+zxYCVOnn29MBcfnU/B5DPccZWUH
	mI3h9Lwf2It+focaSSMJc/WuLrKxoz8RshHarnm7E5
X-Received: by 2002:a05:6102:370c:b0:7cc:7801:b317 with SMTP id ada2fe7eead31-7d072615418mr289265137.9.1793309142279;
        Thu, 29 Oct 2026 14:25:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-992ee48e728sm5241.16.2026.10.29.14.25.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53664602c7fso58317171cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 14:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309141; x=1793913941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
        b=C9uuRTcv3PQQmOv/G2dcZ1QgWMEHak6/f/dIx47I6YoHbt1TMFq3dQ9orEEWf7rJQE
         7akyGwgkQEQxnw8/iSEnlWbfW9NkZkGeivVr4a876EWArSkga8McYhmD0GdtytAbE6vP
         tBX4RYze7IVQccpLfArXoO2NEn9MTlbTBhBps=
X-Forwarded-Encrypted: i=1; AKwUvBwKg3xlWF9EQJFSKhTMuJ2tYsVWLcQdwBcDyKsUS3/4s3WuNlkKDEnauQUk9psKtfspMlIqwzT2QIQJMflVgoth@lists.infradead.org
X-Received: by 2002:ac8:5dd1:0:b0:536:7cc1:4b6b with SMTP id d75a77b69052e-542b6d60c04mr5567301cf.27.1793309141411;
        Thu, 29 Oct 2026 14:25:41 -0700 (PDT)
X-Received: by 2002:ac8:5dd1:0:b0:536:7cc1:4b6b with SMTP id d75a77b69052e-542b6d60c04mr5566901cf.27.1793309140847;
        Thu, 29 Oct 2026 14:25:40 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:40 -0700 (PDT)
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
Subject: [PATCH v4 6/6] ARM: dts: broadcom: Enable SATA on BCM958625HR
Date: Thu, 29 Oct 2026 14:25:13 -0700
Message-ID: <20261029212513.4126083-7-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_142545_843704_EE7099EC 
X-CRM114-Status: GOOD (  10.75  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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


