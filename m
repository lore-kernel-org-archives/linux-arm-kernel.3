Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AA7606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nGO2FBCx;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=V32HHTQf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=; b=nGO2FBCxzbHY2a
	wRLOrS0YRVxwsFpPg9Su1QkpdOL4WsiY+aCVSko1787paxlblj6ERJEg8XrSkF9Go4HT5Q/YQUlQa
	RX//OKXI8uE4pDlVGea7WGco4G6xF1Q/CBAwtSLHHywDq22rQAlt7zezPHVNaQ5EJejlprV+vIgk0
	p1gQAtzeMqQFN5GmBju4zy1YXGDrUpR1a2nkHVM0w8AOuXXUqtIDH7w6UAB9kzZxhB3mGT+xYWLnU
	3mX0QYE5vWNwwvPHau9l3VHBDUrwbLVJDeSxRsn2FiRB/l6PKs1wlW/WIRhgmAYGiNqD/9b/bmMHh
	yv1/YotQRLWsBtpDcFyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQCz-000000039QL-1uTm;
	Mon, 26 Oct 2026 19:18:13 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQCt-000000039Lh-2CzU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:18:08 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so2304372a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042286; x=1793647086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
        b=ythaM28OtklwqZU0zCY1+TQM5S1vajj16/DDw9uDW9aZMG6JwJtGv0+bxvAY+BoIO7
         lp9U5pNejAzMIzB2QBN7s9286bclYUZQ1+ZqwHxqKEnQTbD46yD+HiE6quhdYk22+S6B
         AmSP4l6pQEWaBY2Olv6rNC4ad1a5jvXASoie3SqSt38frVsZLbHNGBmAJIcUjRK/kgF6
         8mgB1tAfbYkzwNUms8jGW5SbYltDRfQ4SmaBsgwDvYNsc/FzP4v8/xcAdIfSuX7XVyjw
         rtV+awfYqHHd3mWdgJCd8psKkMR77oO7XazwIv2Z65HUZO328MSfcBd3GF3L+/QtL7eb
         VNHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrS+NBH+DU29X31AQUggIWtcUDrdPQvmgLpFEVW2VfgiEi5acC1LL/ERmtuCg7HVQJ3hOaQn7ozyNGPtbHJgBW@lists.infradead.org
X-Gm-Message-State: AFq9FYK2VGMByBsyNOkR4dd98NYMnA9lOpA0d/OayAvVqEhDUmB/QcEq
	c4npaCRgFGwwNSF0dnWVIxKUalAp+qtL0JUlz8YzreB1tgqgyXMg1y/GH1Zgq+iwg8FVGvqtrFo
	d82WibqQ0oxzTxJMLhjuZp/49eRdh8+jzkQWiztzJ3YocguRnHmOT5Dc0vLxfYGtflLlOsmyLby
	QX5H9HC2v4KPlI1DkX5AnO+2YfSeqmiMXJXN/y6LltfXPYKcdr3THGptc0Y+6ztwXhnwP5ecD5D
	PNsNXyO+n05dcZWUcfl1z7ILamDmtUjiSc=
X-Gm-Gg: AYBFou2liNHqknFqRh3ShrMl/nSSdaVIaiZTQHu/V5RoXJnC6x3O05o1OwIU+4RgOcF
	jJi1Z6sju871eUs+1AEgNl8UZ67wwzIX89k35/zzUMVwn7SPqj5x69ow4Jmf06BlWF4kJ4s837l
	q7AjnR0jf/9tva7r3Bgdx+BH3YJvXvKIk2sCO8rTPQofWxL3xFsrNAQOQCQYsN7wtAGJJAfPyPv
	n9skiP7rDPWXYat0PLzzV3waGg01xyL5htRkd7vVe24SqfF/oo9P6p9BLk8keeZGpGZIAI6tOIt
	xzQRx92wioX1FAnKgySbdaZL2j296rhWjA/EOjngtWK6HBkDB9VpNnj/86OnMUrPnANXQEA/Aai
	tk2ksYlAtlPfQX8HtodJKPexVl9cLbovBTld5ADys4W1tiy0b6KMfdrLePX3ZGLqZSUH/ImjY0l
	bubLvlfLdaJkaXbROKmooVLfFeWG0XRz7BZGE2Chau
X-Received: by 2002:a17:90b:4ac5:b0:3ab:1e1c:837f with SMTP id 98e67ed59e1d1-3adeaf9620emr6185973a91.47.1793042285657;
        Mon, 26 Oct 2026 12:18:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae405c32d4sm340321a91.0.2026.10.26.12.18.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c66913ad0so20217016d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042284; x=1793647084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaqGunwSleeDLPx2z6NkDc6zUunPgMcaEWPlGCr1dr4=;
        b=V32HHTQf2RbO9hoWJmnT90A8UniS8Botka0RNJeHaWoLnEZfRwMwioIrUrn2xPXXPE
         xgqLDAqm/FY66Bv4w84f1O5v5y3hb0PsCwRMW8djADD3XbWUGI1F1S5MosqjkmXOxj7S
         laqv31/0hmzg2EDDhIuHvEq+1XLt9AxWVK2cM=
X-Forwarded-Encrypted: i=1; AKwUvByWln8uMvzrmNb6M9MNjri5N7cID8ACTkSwle12Pz3UubDXCl5CVxq3LebcCbk2I/oEXRZ6tP7l3Tek4j/pp8PB@lists.infradead.org
X-Received: by 2002:a05:6214:5701:b0:914:5769:dcee with SMTP id 6a1803df08f44-91c48e36c9emr119686406d6.17.1793042284488;
        Mon, 26 Oct 2026 12:18:04 -0700 (PDT)
X-Received: by 2002:a05:6214:5701:b0:914:5769:dcee with SMTP id 6a1803df08f44-91c48e36c9emr119685776d6.17.1793042283921;
        Mon, 26 Oct 2026 12:18:03 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:03 -0700 (PDT)
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
Subject: [PATCH v3 1/6] phy: broadcom: brcm-sata: Keep NSP ports in the shared PCB window
Date: Mon, 26 Oct 2026 12:16:13 -0700
Message-ID: <20261026191618.3178830-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_121807_580728_85F837DD 
X-CRM114-Status: GOOD (  14.47  )
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

Northstar Plus has one PCB register aperture for both SATA ports. Its
per-port OOB settings use separate banks, while the PLL registers are
shared.

The 40nm MDIO refactor made all non-40nm platforms use a 0x1000 per-port
stride. NSP previously passed the shared base directly to the helpers.
For port 1, the new stride moves the bank selector from 0x1804033c to
0x1804133c in the AHCI register window, outside the PHY resource, and
prevents the second PHY from being initialized correctly.

Exclude NSP from the per-port aperture offset in both read and write
helpers, preserving its existing bank selection.

Fixes: 0ed41b33882c ("phy: brcm-sata: Correct MDIO operations for 40nm platforms")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/phy/broadcom/phy-brcm-sata.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/broadcom/phy-brcm-sata.c b/drivers/phy/broadcom/phy-brcm-sata.c
index fb69e21a0292..b5fb9dff1ae9 100644
--- a/drivers/phy/broadcom/phy-brcm-sata.c
+++ b/drivers/phy/broadcom/phy-brcm-sata.c
@@ -215,9 +215,10 @@ static void brcm_sata_phy_wr(struct brcm_sata_port *port, u32 bank,
 	void __iomem *pcb_base = priv->phy_base;
 	u32 tmp;
 
+	/* NSP has one shared PCB window; its per-port OOB banks are selected below. */
 	if (priv->version == BRCM_SATA_PHY_STB_40NM)
 		bank += (port->portnum * SATA_PCB_REG_40NM_SPACE_SIZE);
-	else
+	else if (priv->version != BRCM_SATA_PHY_IPROC_NSP)
 		pcb_base += (port->portnum * SATA_PCB_REG_28NM_SPACE_SIZE);
 
 	writel(bank, pcb_base + SATA_PCB_BANK_OFFSET);
@@ -233,7 +234,7 @@ static u32 brcm_sata_phy_rd(struct brcm_sata_port *port, u32 bank, u32 ofs)
 
 	if (priv->version == BRCM_SATA_PHY_STB_40NM)
 		bank += (port->portnum * SATA_PCB_REG_40NM_SPACE_SIZE);
-	else
+	else if (priv->version != BRCM_SATA_PHY_IPROC_NSP)
 		pcb_base += (port->portnum * SATA_PCB_REG_28NM_SPACE_SIZE);
 
 	writel(bank, pcb_base + SATA_PCB_BANK_OFFSET);
-- 
2.53.0


