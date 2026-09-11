Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11735C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 23:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUDYRA+elxh8m3+YuX4zLBX8SlbUvqG/ZGp7B+YZHjQ=; b=aRBKn6y4VhpYg9JKsPzKVLDOOd
	E6Wtmu4aUxVPWaECRRecpsYOeUNj6DD2lym6yw/b+xzp8rBXgUqtWgRQiyqhTrUWxw/pBTfoqGueQ
	bujcS9eofG8dyV4zqaQaeFjodGoNC0nx4zExIBaC1zY3WRJF1leir8bTP8PROckgiWwJ0OHwaBbGN
	i2V/8PDWGtFuVlvPjgMi4OJtFRJwafu0KSEpXGl4G2WY41Ixj/tcTEKrKfVOTpTekiyFBOgcPgC+X
	r66vp59gn13MT2Jc0kr354LEmRY1HCOwIehP9GJa/04ab3L5kUM5kg4r8P1Y+FRHYrb0N3FckfdMd
	3FCf9bOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5An6-00000000N31-0vP1;
	Fri, 11 Sep 2026 23:36:20 +0000
Received: from mail-pj1-x1064.google.com ([2607:f8b0:4864:20::1064])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Amk-00000000MmG-3Gtx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 23:36:00 +0000
Received: by mail-pj1-x1064.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so2291089a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169758; x=1789774558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VUDYRA+elxh8m3+YuX4zLBX8SlbUvqG/ZGp7B+YZHjQ=;
        b=KOMoA5zxyHZzZQyN7bxwogA4iqc4iVlOhugQb2G5UCvFvU2XM/fKqlJy2JUdNP4DGC
         o2Vnk04HIqqXdyqMWRtSq3WroPF2ZDjCf4lGbSR23tQe/MVp/osf5JoEjgaSA8msGvCk
         z529TvXZ26TkvRuub3g+C07mEMZkxGakMBzlNCa/D9e1UVoiM++gXSaQcWHjrgaQHqoA
         wxEOQ7RKYjS8rOKsw641yKk8VOzg7JlZUIfz6drIRYDda2RVCpd7PICwl4NOmun8qgdW
         zic/bGiWfBkewvTr+bhS68RnZbYDSyBn5Wu94fzuhbVaohmtnfwaIBwmjsRxjVDI9ymU
         Z3/g==
X-Forwarded-Encrypted: i=1; AKwUvBzRFXuINqeITwabqzfvlvQYuNKEW6EX+F907bq4oKXn3RIRXM2fBI+B+/BVvFkLt7DaBY/FdJqNMPa6b207mTW7@lists.infradead.org
X-Gm-Message-State: AFuF++nxQElLDBGjCSbZrcjafjhaC9iGqpknNeFBw/q0zKG4CxX49Vjx
	mKG/wmbBkUzc5YNlXuQugMgS3biHLPjHK0wFk4YvWxM9EE+/Fa9ybAhmbWpt8FNYrl2eg+cRedR
	SVbIKA2uGGaCBYBLyv44g7FuK+59DdhCdDNhv5uomM8SYOak6LIGuPCYmHHwd/0NAwQqan6uG9x
	9phtIHSvZLCXwblSCG3jDN0Zv5OPlnYZ8TL4q0Cjr1bFhREgWXdDJK+1RxLPxzDZEn1fQ+CZr0T
	onVnvKzsCyfsxeLoxvlHHHGoUPo4+E=
X-Gm-Gg: AYBFou3BpxuvxjSgSnfZHN6uIxF1LxQqLum+PRVNZHLKCFy4hMj4SzXKW5nLX1GLC0v
	hb+RopwdbVKv6I9URuwpg3nMe8zoF6g5r7X+0C+KSzu3Nw+jxa27qinHy63ChYHOOsuzIiXpg1o
	S7ZUR/8EX84W7lwmXyiCWZXDLNKVcwjM4FQMeVADNTpEQ5+WNRKCKCUsxXuRSJmrwY6eehkkh8+
	zVcbjt93bJg1maKL9nM6htvqT3vnBnMCr2sM3+BPPIESZINa51VVb1/6bQTGb3J2r3yfAK3rTDb
	oFQEgVE+dPLi9BpmYT3cZQNgX4FR7BenHv4Q3/F0ODUDRbLAZSuyJvNjOLZmh5/uhA2h8tnd1QC
	Ua77kvyadZtIvgHZkh8McXQ6xmjyDOaYfS+EpCLzJxD1Be4aBUIzbeN/HRoYrohGN/M06w1pQW0
	oQYHbjXLWNHNFSP2YOUtGgUgH7EQlZalX5WRzz
X-Received: by 2002:a17:90b:3602:b0:39d:a614:a77f with SMTP id 98e67ed59e1d1-39da614ac2cmr3284670a91.13.1789169757770;
        Fri, 11 Sep 2026 16:35:57 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-14.dlp.protect.broadcom.com. [144.49.247.14])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-33bb81175dcsm20818eec.29.2026.09.11.16.35.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:35:57 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91055aae7f4so47615776d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169756; x=1789774556; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUDYRA+elxh8m3+YuX4zLBX8SlbUvqG/ZGp7B+YZHjQ=;
        b=L5nXg6mR7AIDeIXIJxlRaZHPIomjBiCTnF3F5YMJnXCHmkQQvMAg5Kft8s0BAUSult
         HCAYbhDPcofMaaMNM8vI7+gqLmrfy9ubOGpVJlGrSoi9RS1sL5P/JWDdeH+nHb07K0uH
         eElRidiDHSu3kiqDSuaAHs3v1cEQzfadqAVC8=
X-Forwarded-Encrypted: i=1; AKwUvBzF09AGu6d4iRH+asBhvkESKezR4r5V8og0EMK0sJyLst/ypdy8/qkrD00btrIejZSrxQfDyMCspgD8xuDaquie@lists.infradead.org
X-Received: by 2002:a05:6214:2b09:b0:8e9:51b7:2d49 with SMTP id 6a1803df08f44-912028a08bdmr150317646d6.2.1789169756341;
        Fri, 11 Sep 2026 16:35:56 -0700 (PDT)
X-Received: by 2002:a05:6214:2b09:b0:8e9:51b7:2d49 with SMTP id 6a1803df08f44-912028a08bdmr150317256d6.2.1789169755927;
        Fri, 11 Sep 2026 16:35:55 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:35:54 -0700 (PDT)
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
Subject: [PATCH 05/13] PCI: brcmstb: Declare and assign quirk OB_WIN_MAXSZ_128MB
Date: Fri, 11 Sep 2026 19:35:30 -0400
Message-Id: <20260911233541.1650895-6-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911233541.1650895-1-james.quinlan@broadcom.com>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_163559_301908_F1DF1C7E 
X-CRM114-Status: GOOD (  14.47  )
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

Even though only BMIPs chips have this quirk, it is more uniform and
readable to define this specific quirk where each outbound window is must
be <= SZ_128M.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 71ddd8a760af..401898d04d52 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -290,6 +290,8 @@ struct inbound_win {
 #define CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN		BIT(0)
 /* The outbound windows must be within the 0-4GB region */
 #define CFG_QUIRK_OB_WIN_32BIT_ADDR		BIT(1)
+/* Each of the outbound windows size must be <= SZ_128M */
+#define CFG_QUIRK_OB_WIN_MAXSZ_128MB		BIT(2)
 
 /* FLAGS */
 #define BFLAG(pcie, flag)			((pcie)->cfg->flags & CFG_FLG_ ## flag)
@@ -1294,11 +1296,11 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 			return -EINVAL;
 		}
 
-		if (is_bmips(pcie)) {
+		if (BQUIRK(pcie, OB_WIN_MAXSZ_128MB)) {
 			u64 start = res->start;
 			unsigned int j, nwins = resource_size(res) / SZ_128M;
 
-			/* bmips PCIe outbound windows have a 128MB max size */
+			/* PCIe outbound windows have a 128MB max size */
 			if (nwins > BRCM_NUM_PCIE_OUT_WINS)
 				nwins = BRCM_NUM_PCIE_OUT_WINS;
 			for (j = 0; j < nwins; j++, start += SZ_128M)
@@ -1997,7 +1999,8 @@ static const struct pcie_cfg_data bcm7425_cfg = {
 	.perst_set	= brcm_pcie_perst_set_generic,
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.num_inbound_wins = 3,
-	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR,
+	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR
+		| CFG_QUIRK_OB_WIN_MAXSZ_128MB,
 };
 
 static const struct pcie_cfg_data bcm7435_cfg = {
@@ -2006,7 +2009,8 @@ static const struct pcie_cfg_data bcm7435_cfg = {
 	.perst_set	= brcm_pcie_perst_set_generic,
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.num_inbound_wins = 3,
-	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR,
+	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR
+		| CFG_QUIRK_OB_WIN_MAXSZ_128MB,
 };
 
 static const struct pcie_cfg_data bcm7216_cfg = {
-- 
2.34.1


