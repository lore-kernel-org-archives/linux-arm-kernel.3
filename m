Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655F5606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a/CD3QW/;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GoSAMvt5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=; b=a/CD3QW/0p4iD4
	YM92z55PXcOKUX8sCdP2dBqdDmCTMkMGMp3omF3/043vWTBV931Us6J7ZhbrtfdJGWuHFUls5aIfo
	dI8Y3L9ajtnp1rwlJHGH8VgU7RVaR/eM2k50VJf8yirI9xuTX1R5o5f53i3efkxw9VOj7W9tPurxD
	GL8fZm9M2i1g4CyaUptEXiF3O1v66n+df0YeLEQ/X4t8LGmRFmuWv0MyGRUc4IBtHltIA+Vt5uowa
	FlzJlSFT8xrABVyMZ2sr/r4LTZCzwcLi+hMOYHTNGZd7mhWWlEGrGVCYJCkuEsKoG1/ij3ERQqLiK
	/bHjvZ0LUw/w/zC9+X7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiLd-000000053Pz-1PEs;
	Tue, 27 Oct 2026 14:40:21 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiLV-000000053K9-1YdH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 14:40:15 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48e47347279so1949636f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793112011; x=1793716811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
        b=GoSAMvt5JtwMFfr7qwt2J/hqI382mvD1oYDAgdHRVHhF7LrgCPFmtLGK7876hs98mk
         EZXI/IcKT1+sMa2URxyaLl+ZQpFlMJ1Zk9pg5+WEjMWwSbfMAgxKBNefo7QIp8U3KINw
         hCEKNvMTUX2gN9gJXFNTAhQkbDkxdmR+/d+roOAEeNv5rh4LlgZwBcWGxHCz2pqCO5FU
         HCH9C+gOT1ME58Qng6xkCJOodiTdkcJc2CvOQKeiYIXYsM28eOh5dxHbOo4tRODncII1
         PJnKSN6+5dka/ZDFCJQjBEGKeb+ZF2GviRCQ8ZiLEDtk1Tr6nWDQEbZaaPH1c8xvsG2w
         7Qyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112011; x=1793716811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ssGW1Dqn9NQO094E/8Ttr3abz77jsGgzbaDPU8z6CLQ=;
        b=f5lXeJtPyeC4Wih239gKCeYhB7goNkytyMvix70mQcvCT8jU+HG0uIdigRy43TMZip
         KNwlr5TSSrtMtPsnoUuZg35jHs6VUwz8tpZAoru3Ggfy3IyMUlb5nlMpmJPH+0hsOeyk
         5/VC6u2AtOk7SvDQhyWziGMtkZat3XwMadDh32ngzS4YH6xtd+kdTclDqqzMW0+6losK
         hNxk2sX+652S1ma0InkcDSP4lQbHGczeOZZEx9j9ItqgKuV7KrsWTvzgFB786JxkoUeR
         HDDD7GD1mUxr0rBsAtSRXI81Nglf37nKZihvcRUntkvU/8dhNifp3xMd8xhMxEzQTqK0
         aVQw==
X-Forwarded-Encrypted: i=1; AKwUvBzfTrWh75W8DmdFwBf+6nev3pihqg2l1MYts2lC0toTex8vF/Bj9eZdjlWkN7yqLxNbQmuMr2KTjcidALoque1g@lists.infradead.org
X-Gm-Message-State: AFq9FYJR38i3/AYAnsB9BOn5HxAk+d3AYN9qOfimdNVkHeVRmX0GZmgw
	QE9jg5Y/i3dvTJW5wboKBDajrU8Ex40vIt1kWfIuO1syXP1qDLo8Ya3X
X-Gm-Gg: AYBFou0hJ8MB1xbQU+CoepM8kDBtvu7XNS/uAxEE0wFw6pDZW4QT8GvTW2B4p98WQAa
	gEbPktnQu17jBC0WRzgU6HxsCk2IjICZjftiN3oGGRl+l/g3IqsuaYzIjrhOMnlibx2Le1PF5E4
	EZYDO/0JRTDE0MoSkpR2zeZFJE8DE/S8v6itkDa+pijOXyBZuWZsrlhmWw0sc/799fz4sLs7b6y
	HRPG1pP8zF4wHbfAv/CPRkMw4WUUim/SkO+RxxqTVaiH23jLbEDBBi7F528Sy10GnbgRbg7FPOE
	mmsxsNkmZA1ufaARxiT8uA23YakmGa4Am8+HANsGGRmPGBnN5IZItBdPbrbVdFoUyroZRpAUQfV
	yxz5pBNNKAa1ReUnhMc4WCUJyqzasaSQ3+zQHJGNYSNAh2dFh4KsTm+FUvhkPyj785rX562mPd+
	Tf1s6H798epNwUYoJvgw/qWBVIs30hWRM2lXHeEaz9MMrqKXRMFEArevf2sNfHLksnjGqkWPd+b
	l5GR758xolljMBlmEMqRp8WaAf0ETH3/MsPkz/QfCGJEV115t7NIuiaIUzuliDHI4KWWmnI6vW0
	QZdxRb4iNnKggwSkcoi+Y39yJLsSWj/iZu67a/QJxhA1RAFRqy9/TKjilCGI
X-Received: by 2002:a05:6000:26d0:b0:487:91e:d8ed with SMTP id ffacd0b85a97d-48e3eb2ceedmr18881590f8f.2.1793112011312;
        Tue, 27 Oct 2026 07:40:11 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23354151f8f.25.2026.10.27.07.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:40:10 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 2/2] mmc: mtk-sd: Add Airoha AN7581 MMC compatible
Date: Tue, 27 Oct 2026 15:40:01 +0100
Message-ID: <20261027144002.10606-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027144002.10606-1-ansuelsmth@gmail.com>
References: <20261027144002.10606-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_074013_418477_6FDF4932 
X-CRM114-Status: GOOD (  11.70  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add dedicated compatible for Airoha AN7581 SoC that implement a dedicated
MMC controller based on MT7988 with the difference of having a single clock
controlling it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mmc/host/mtk-sd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 5b160fdad3f0..736cff2783e2 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -713,6 +713,7 @@ static const struct mtk_mmc_compatible mt8196_compat = {
 };
 
 static const struct of_device_id msdc_of_ids[] = {
+	{ .compatible = "airoha,an7581-mmc", .data = &mt7986_compat},
 	{ .compatible = "mediatek,mt2701-mmc", .data = &mt2701_compat},
 	{ .compatible = "mediatek,mt2712-mmc", .data = &mt2712_compat},
 	{ .compatible = "mediatek,mt6779-mmc", .data = &mt6779_compat},
-- 
2.55.0


