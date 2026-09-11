Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBDBC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 23:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b2fm0ws0RI4s9RoRTTFvcpWCb6oGc74Nxq3EnwLBIAc=; b=Sj3p4/gE3q/JBBL500fuxsg+SV
	F4vz7pRlf/A4L5mXhd79xghRzYVZWH3MtE3ZMg6wZdW+orW7k0NbseJjH22dxR7RREqrxGs8kyC3a
	1+RS+5uCYNB9mclEIf0yEDRHFaQK+p6TBj6AUCxY5Zzal1798Lwep8n+R2dsCxfDP3CBi84pZNKUN
	70UCYIvZPvBbE6wQ+DXNtzlCiewXzLABYIQ04jDftY49ed14BF1JVp7ZFFdkXP45wyz8Aql+j5L2Y
	/Ryfun66ht2Aj7t3ShAd1W98B3TsBRfRq/FubGyWAmsCwwc2Tn2bHnC3+5mcwMHxfhXwFSp59x2aB
	Kv9KDuWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Ami-00000000Mkm-0Qp1;
	Fri, 11 Sep 2026 23:35:56 +0000
Received: from mail-ua1-x964.google.com ([2607:f8b0:4864:20::964])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Amd-00000000Mhe-1Zus
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 23:35:54 +0000
Received: by mail-ua1-x964.google.com with SMTP id a1e0cc1a2514c-97e76cabd96so597940241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169749; x=1789774549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b2fm0ws0RI4s9RoRTTFvcpWCb6oGc74Nxq3EnwLBIAc=;
        b=GUese9dFtZkJ7F2QdrqqiskUtakSSrReLLDa/uGq3rXSgHZ7ngdNlFY6+xcfEdO20n
         +Fud0VIYsyrDIS0YBe02tl+6SywqwX03rEX4Nk5Zf07g1TOP9BLYokRhp8nOXj77TfZ4
         gp+Z1wAaJT9GYXLxlUTiQAIWHWVt/Q1QaYwXJMObenxbqFFzIvKhboXi5WO36NiF+yIj
         Se9r5Cok8kbr5osUwU+fNDnuAem6bmmkESVyTO4i41jEmVFB1UY5p6pGYXy9P0atlZQg
         7n5G67NlruQL0zagKGV50Slvm2Yb5iOASS2npGN8QiQqIVN0Uq2z/YeiHyXuUpRjOn5M
         XzLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEKYMc2lU5KNaifCkeF/tWk1EUPIa2LgbyRbk6EVl5cFctoZta02nyBehhh39kM170jAqOo5XWdoh28MrT6wYJ@lists.infradead.org
X-Gm-Message-State: AFuF++kRT+ia0D2tZvEiZdUxNVVFgq/tV13fc3BzsDQhkcLbL8/nqiGX
	bW7jayhZdHl3WAECMKKyYz3BioR3xPJq7xwvwakjKd0Ma634ym7rnEO/LOkfUsqwqGgayOOZMuA
	9nIjAACmKss7EdFRrSdxcp/RXVy5KAh3hgMdLFgzW5QYtAY0BHKfY79nckdoAHF47grJt423Q4a
	JY3uWLjN+zOUk7JpWpx8EJpMxKNSeU03qSyonbTIbZQLJEEXZvjEO2qNvyAxFNIGeSYMij8nUR+
	VV+QzOIpFwN/j8qOnd3sLIrLTMUWA8=
X-Gm-Gg: AYBFou24P89uXItUyK512kaj8X8rU+aUMNxYnXIjXjFvTQPWgWP+I5zV7nUH3jm6xIe
	2rZChHCmMdSZZgkFo+/qBdQ30HC/VSs9xZur8249oh3NG+zsEqPUCkY6WWFZ+MZZ24++UGxjNK5
	abcGGcMFRDXK73LVrTQeQSwMihrYDmqL81n6LYohA/fje8dtE35iFwXQlAeXy/OYWr9zmdgBU24
	KVsdbMPimfBLbQGEXZHAmfEn4N8w9lveMB1Kvz2xwAnhdNElgetPduq36aXTHZjq5r2oYLSmaZT
	0Q9s+ksisLzGFDYw+Aq7mxJyk1RWhpC2NccVKqb5jo1oiX2H/a4CCOp9xt4lmVuWYnfNH+2VZK7
	9b6bs1Kjgqb2FQiSI2XmDTSUPZvR2XSnk4bet65a1GJuIsRlRvxM6R+D3ap1p
X-Received: by 2002:a05:6122:4b1b:b0:5bd:af82:fd9e with SMTP id 71dfb90a1353d-5c965eea8f8mr455635e0c.8.1789169748974;
        Fri, 11 Sep 2026 16:35:48 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c846de7270sm1453818e0c.0.2026.09.11.16.35.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:35:48 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939665a1ae6so320382985a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169748; x=1789774548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2fm0ws0RI4s9RoRTTFvcpWCb6oGc74Nxq3EnwLBIAc=;
        b=LOZ5+NlfzYLUu0ogqu6CirZ9pewIkZfE3cX4fy4I3IP5RaGuwwjJntBNuL5vW/Q5rs
         yvz350xF3QUB2fHHwXyeXyljjt1fmfsIkCLVqkJl4F0jOVIGa88brR4PZu3OsgVAc9QQ
         GMATVgtW5wftKVIOX/TKj/8wj93liB0LFPFtc=
X-Forwarded-Encrypted: i=1; AKwUvBzYQWemilRYOj4aW4+bhAfBZJWb7XbEKUxVMbe9tmb/HIWogJJ+o9hOO70iOqBTYPL/x9QTELRzY06JDetX8PAZ@lists.infradead.org
X-Received: by 2002:a05:620a:2982:b0:939:d5f4:ab5d with SMTP id af79cd13be357-93a038b94d6mr83404685a.33.1789169748376;
        Fri, 11 Sep 2026 16:35:48 -0700 (PDT)
X-Received: by 2002:a05:620a:2982:b0:939:d5f4:ab5d with SMTP id af79cd13be357-93a038b94d6mr83401085a.33.1789169747922;
        Fri, 11 Sep 2026 16:35:47 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:35:47 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 01/13] PCI: brcmstb: Remove redundant const specifier for struct fields
Date: Fri, 11 Sep 2026 19:35:26 -0400
Message-Id: <20260911233541.1650895-2-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911233541.1650895-1-james.quinlan@broadcom.com>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_163551_458929_4B7947AA 
X-CRM114-Status: GOOD (  10.70  )
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

All of the variables using this particular structure are declared as const.
There is no reason to declare its individual fields as being const.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 8a0c353d2abf..89aaa19d508a 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -288,9 +288,9 @@ struct inbound_win {
 
 struct pcie_cfg_data {
 	const int *offsets;
-	const enum pcie_soc_base soc_base;
-	const bool has_phy;
-	const u32 quirks;
+	enum pcie_soc_base soc_base;
+	bool has_phy;
+	u32 quirks;
 	u8 num_inbound_wins;
 	int (*perst_set)(struct brcm_pcie *pcie, u32 val);
 	int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
-- 
2.34.1


