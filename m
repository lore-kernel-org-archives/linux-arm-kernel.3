Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E610606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f5oeG5Mb;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=dvzYI0pq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=; b=f5oeG5MbwsqLqw
	DNFZJbgzWvXdFVeEaa/kGZpDPKxy+g89Y05oohZRkBMgaRz+FrzQiIxwjZS7xtrM7nJkvkKtUmZxh
	/IoxxXZ0m5FacyDmtNGrQHPDCJByOwdtLS9aM+zGQML4R/Y7FK/pgdePsn4kVGt2r/t9yptii5g58
	2/uLz8SC8ikKyuh+k6AYefznY5n5G8NUAEz4sLnNzFC2rMkipNc1dPesBTdv46zUkHsoSWLydtEHF
	NFTHwbHKprmJ5FNsc9qWlWzkpKtCvirP7Yp6isHHWmiGGzKr4Z7DyaO5WHQvq6e9yDIBtsuIxcz71
	tBVkjyLat01VAwjlsXwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQDK-000000039il-1BK5;
	Mon, 26 Oct 2026 19:18:34 +0000
Received: from mail-pg1-x564.google.com ([2607:f8b0:4864:20::564])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQDB-000000039Xq-26zc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:18:27 +0000
Received: by mail-pg1-x564.google.com with SMTP id 41be03b00d2f7-cd623dfe420so2154630a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042303; x=1793647103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
        b=bienbEXkaU/JL2ZrDT4HuACEsq9dwiqFQt6dIr/pQKmVSVFeKR2iH9McKMwdxUAI53
         9wJZ46qlNcsUWIsXod13XCMh1SEKNqIWuhMKYQ8R+jMc1DERY1TzmS8Ll2b63JF/8GIO
         sJ7Eajj7ASX0vHuBct4bATPEsuqx1gyENVEplRDSiVVnOEoHZbSnEUl7mLIv5d9AzhGN
         sRJ+H/H0ty+SLLiTEGxmNQ5mIk+jE3Fo0zfDi/cqm/ymAE49qDA1xxZHRDYvVcqnG4S8
         xdW+OCZbnPABY/e9YpJ9wIPo66Td86Rc0l2pC2UCiL3Zat84iMNfH6308OHBteHHpPsG
         WcGg==
X-Forwarded-Encrypted: i=1; AKwUvByHKXXyk2AIzJ4QvIro4LI22MP+PlzWZjsNvz4zWFRpdi98GUjsMf0klLxWziGQSepwR8uK0vZy4hura4RfvH4B@lists.infradead.org
X-Gm-Message-State: AFq9FYI9bR5UPuNR3QI3XVDXmJj2UiKbGM7soytTaxrNy9g/Q3jVzQls
	92UDTIGR7WCiC0jyQfyoag59gFTzZBt/Lfe6CLmxvqGeIKtgQJTYC/VWay3mLckuzw7wH9KyF2X
	KhuAm0WAWYyGcjFXBqKZc0gP/YyC7bzYKsRPPzDXAbBBh2xlgShU+3eqaUIaV6AmVF4HqvPn4Ns
	0U9kHVDfTm77NkH0jCka7cb7NhpZV/7JQNcgLjF2nFNq0uIW6loxkLVyamJl7Rjhb5vA1SAbmbl
	Y7R9Hv+j157nSf0eruv5pR6zVeLfPTFe7ZUgg==
X-Gm-Gg: AYBFou0fYuE1jmu+4PSPIqnrqUL461FIkGnlZ/JBz9hhtidDjy9rSGxxd+vl0rVb+T0
	BXP7BqiMcozV3Py55BUEs0vOwjyE6BokXI9Eg7g35jApOzhZW5/2AgyeCPepqsydZipRLDAo3Ap
	c4iEh9b90DOEZUZFrWMiWBVqVpcGws4yJ+6AkuiEfmfHPG4i/b5R09m1LDQKTszSskHwELnHKaF
	Dhdzg3XH8khEbp1xb2z1g5k60Sn6Ns0pmGFqQLNb5q5bwCQ490BoxUIivdLNZFO9Hsa6AIEUn7i
	NKcZ1q7WwpdtKF1S4+GOQYdZd5k8q3UI9eUPN4lBKS6+HNZHwpP4oUy7VfFhb1TjYGEewQ3U72D
	T1adMLOszyQm0WBom2zA8LqBpel6ziiZCcAqTzBwXJdqKeKtLZRoWUMe/JAK4AZj3YNjhEUFLVh
	c+qyOgScgi4nwKQ5+qmK95BoEJlAF+ig7bo8sPilum
X-Received: by 2002:a17:90a:a383:b0:3a8:c0cd:57fb with SMTP id 98e67ed59e1d1-3ae378da4a2mr1046952a91.42.1793042302798;
        Mon, 26 Oct 2026 12:18:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae405c32d4sm340759a91.0.2026.10.26.12.18.22
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53635e21ddaso47443101cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042302; x=1793647102; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/JejeyXs+a2BV9S3GP+DdWRq7anNloDPZ8ebf8LoQg=;
        b=dvzYI0pqg6lJgGohU/16PuatElINL4L2WE9kGd/ulRsU/FV6Obr0QJ+zrdcr1fn8C/
         AEw72414ogSHp39K8xmjvPAnx2xCKD8fl7xzvm0EzHkHxXwNV4jpcil5FCKsGYps5jqS
         /3o7+LAXzq6QFU4KpjvpNl+kLBos5aM6lA0RM=
X-Forwarded-Encrypted: i=1; AKwUvBySFPJDVveWR3FIkYQHpTIk14an88DYjH74b/he7lslHjJmYGqdJs5DZiW6vptZukvepUNnzbWri7i4c2RG92q5@lists.infradead.org
X-Received: by 2002:ac8:6546:0:b0:535:a5fa:ee0c with SMTP id d75a77b69052e-5383b66652emr111406541cf.76.1793042301548;
        Mon, 26 Oct 2026 12:18:21 -0700 (PDT)
X-Received: by 2002:ac8:6546:0:b0:535:a5fa:ee0c with SMTP id d75a77b69052e-5383b66652emr111405901cf.76.1793042300941;
        Mon, 26 Oct 2026 12:18:20 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:18 -0700 (PDT)
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
Subject: [PATCH v3 6/6] ARM: dts: broadcom: Enable SATA on BCM958625HR
Date: Mon, 26 Oct 2026 12:16:18 -0700
Message-ID: <20261026191618.3178830-7-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_121825_543798_B40331EC 
X-CRM114-Status: GOOD (  11.22  )
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


