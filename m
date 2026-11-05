Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9774606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ngqIBIN5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=c+WVPKii;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wx5f4ulu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RwjIT0DqDPAYZ6NuHVGHzHM6/S203rMIqUTfEYiNenQ=; b=ngqIBIN5C5Rs9D
	fbtXiMj/guDl5YK09i6Y+tMmqLZMfKJTMQaj11mG2KIegdtb5EwdauXF1dwwbPug0nfUFr6Gk301D
	YZTpJiL482IFrD6scr7DPgAoCaeHo1eD8dd/V7NTqPabw3tIQu756DdYCc3DVFdW/6btLhOMoK1Qt
	/wKiraa+bzW6dm/Slv7fduWq0MSTA6FOCAeaSv2w5Q+nLZQzWt121NTuWPWIooQMhd7COQ5y+9w7i
	X2OQ8yzUT6O4uR0lYFUZpWCrH8pqD8MaO6NFrQQOUKVpinjcoOXiMeg99pE4EhffN5EO97+V1ZdEY
	G7jPg2Dnic0uhbN57HGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2fC-0000000AErE-2Pzq;
	Thu, 05 Nov 2026 18:58:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d2-0000000ADXO-33LS
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 18:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RwjIT0DqDPAYZ6NuHVGHzHM6/S203rMIqUTfEYiNenQ=; b=c+WVPKiilTTqCSyPW/8roCcL05
	YNx5XyVt48WrHPE6CR+/QmLNqrpO7LO/096oNbBshz8vlnuhDncVpLaI8/OmF2Jpqxfew1jRz4SQH
	wBtE4aQ8ggJ3CWMPZmyHo1vOwXgqCw+MwKP1j5iYKhkPxj5tH+2m9Qj3tWljT8dYS2UZ5noN2SI/2
	tApfnQvyBMWEtFPCUGl9N4EbYtmf4jmb6Zod6wsudZS1q1IouBXbVzFIqATEkkt9P54NOweDTRfIC
	8bVFE7wBhgzFO3YsAb58o2bpc0Lzn9hAV8Y/iiptxeGxYA3bzH0APkfVoCuLaUQFnBVh7NPDiE9fV
	QxBMLXjQ==;
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d0-00000003R3X-0i8U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:56:03 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6de1fd5f572so1017653eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 10:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904960; x=1794509760; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwjIT0DqDPAYZ6NuHVGHzHM6/S203rMIqUTfEYiNenQ=;
        b=wx5f4uluR5D6MegIA3iZWUgPeQ41xvWlnMB2loJ7Z5NVnOBac7+XfoS/DZQgeug3ID
         T6Y4Hv1Kx1LePoNIPMoRAEzraNOz9uQONmvD6MdqoC1t6h0j4GjVXOyWFaDsWnQkKa7P
         utWMOtQLhUKA6VN3zivt2JRaBMjBeYuQ0L6rDSK2IQMikn3ADLsynpLIbLSuSOv/o8U5
         IpmS5jijoYeBsEPtVKMmT1GLBwXlW+V3d+5z26mAMI0V8hZsXxLjDZMNJ6rJkPIR7Gla
         byEAileb6MEsaacL8FYh1XS25wH2vjUPIbw5+e5BOOMIcS40jDEMP61/WoNGjG0y1yKg
         ECKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904960; x=1794509760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwjIT0DqDPAYZ6NuHVGHzHM6/S203rMIqUTfEYiNenQ=;
        b=vhdsdqIYFa7xoBrjF/cs9NERFqF7E1H1Dry1Op/dsuHV4VtBmN3jLG1D9W1ibrhGeY
         Ooc4nHZAb4P8g0XGBrMxMn9O3bZck0AyMuR7lkC7NUkWcUI0bEEc+QigDk+zKwcF+IVJ
         R9ZgyDByV7wMtDz1WiI2+ikfmFe3PA/ZbMFwJWmkFTqF2CDJxkbxwP5ijUxBHZTiTxyv
         g+yphuD1VnOmxr+1umkw9dFnj0uGs/dCp3TYKhNEvbIFMhzqyIuWKeWbJ0nw/eTs0hw9
         X+/YQ6pTwAyA04sw+I4Rw8ZPRbcfJiGoO2mJsUVr6ZlcVfkwxL4DCVEqDPzERdYGUNsf
         0XYw==
X-Forwarded-Encrypted: i=1; AKwUvByIohtd5ImnZa3kZG/JaNYoJzIalhhampDssA/UHu1XDT71adlOdwShhCDjGxHaAcyB6jWvsWwmdMIfN6SbMKA/@lists.infradead.org
X-Gm-Message-State: APuU4Z8hZQ9LBrZeVzuNTy60Cyh10gZSz/qmkbtm1U3iBij6U6235Ozq
	2lzDODhRSpA3e3Wo/guCNGxKVNbBcV8G5XOUiYhp5sX0AhscOWhzO3J1
X-Gm-Gg: AYBFou16xx5aHxsZwSQQxA0c0A8k9jXXJSj+zOOlztPnAz1VrvSF3gVH0jd35klyrg1
	/9LZl5Fo110Cz+C+9PMxGjHVwIeDXdGadr4+H6yiwv3doAvcxpvP4RCzN+jNFkWbeBKc2wBg1Hh
	N46hx91NlMCRrG1F4OqelbKw/gyR9WvJ0u5QW0TKjQz9awQm9tVzr2v3SW5Mgxgidp4Z7nQJcT4
	7WF6nIrYek+PM2H7bMAD1cDVVKbUOPXyFxKnS8cayHw9uLNdOJS28CRyrS7tnzsOUh3y6UL1kzE
	jkgiqZVGMsxPDStHTtw9+hmmENsNBsvMEwkV+2ml6cLIUpPn0FHX0qxApZC7V0Dc66V+4nQg81D
	0OzTLSCaZufiOyIyht3CkPHuFVTKi1LTn+fozSkRksY3XUyAcWGSpuWVQC1N8BM3Ujlltrzbs3E
	gz+Dyp5T63gCs3RrwnWbSqCSRgXQMwcT3tm2CW1MhEgMWzmYqNxFvQEcV1ekdB7hbUzTSUNxDHz
	SJGGCVeYERzxpL9i/EaJHezwhTSazOnO9gu4FR2zgNhib5bTDcYpWVxBUW8SJJJC/kf71BANWC5
	dIkl3B4x2CWXEbsgB9wKvoWtv2HC0iOWrcoijoB0rHKRtTU2tedYxoWw9VoY/JzergnFUrOKwSa
	kSRyF22AYqdHL46N2mlQYptmfXK3wqk3QiuupGUUUc9v3LJn+UaHU7q7FSujNY19cyOOsVzBL6I
	0cc/zLRSNHgTop6aSM0hnynN0O18zBCXamDKW5RnpRLCSulYlcI2OR
X-Received: by 2002:a05:6820:160f:b0:70b:9b1f:e8a2 with SMTP id 006d021491bc7-716e73de95bmr322359eaf.3.1793904960035;
        Thu, 05 Nov 2026 10:56:00 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:34 -0700
Subject: [PATCH v10 18/26] mtd: rawnand: sunxi: skip unavailable NAND child
 nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-18-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_185602_212391_BA4F8C07 
X-CRM114-Status: GOOD (  14.56  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sunxi_nand_chips_init() scans every child of the controller node,
including those marked disabled or reserved. Neither the chip setup nor
the NAND scan path checks availability, so these children are still
probed and registered. If an unavailable child describes an absent chip,
its scan failure can also prevent the other chips from being used.

Iterate over available children so unavailable nodes are skipped before
claiming their chip selects or issuing NAND commands. Keep the scoped
iterator so node references are released on both normal and error exits.

Fixes: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 636a04f49418..3de9ed6795fe 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -2771,7 +2771,7 @@ static int sunxi_nand_chips_init(struct device *dev, struct sunxi_nfc *nfc)
 	struct device_node *np = dev->of_node;
 	int ret;
 
-	for_each_child_of_node_scoped(np, nand_np) {
+	for_each_available_child_of_node_scoped(np, nand_np) {
 		ret = sunxi_nand_chip_init(dev, nfc, nand_np);
 		if (ret) {
 			sunxi_nand_chips_cleanup(nfc);

-- 
2.53.0


