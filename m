Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11637CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 17:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RkM1BDS2/x2+bcSsEU1uZb+8F4JXoPxZ4spGf76bhh8=; b=nNnbbzrrOu+aVzDBxqlrwFlUVG
	qEys4WtVNIRu9WCBGk6lonTdeVOr1hXvo5D6tLuJ2KXv9rd+uwNLubMLnI/icWnzsQJc62KGQv+5m
	mf49rRmBhJTSFkCpUe8dmgS26ut9AFwkcWfjPr9ecRRM5QDs19r5yn79JG5lBfZ5hQUV7j4tZ9zXJ
	w56OUvCeTiH4G69ukcchQcpBfATs4nIdoCTRUdpTm/fuELD3fNr6PQ8e54iXoKsYNzAohc7cu5GY9
	NSuAlKQwVn8jWsp+XHwC4iuOCK0PZ76EIvgnEMS8uhKbGGM96lKICxmwbC/hnX0DFF9XyJPub+UKk
	DAE55zqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZB0c-0000000Edzz-05M3;
	Mon, 15 Jun 2026 17:22:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZB0Y-0000000Edz1-27qm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 17:22:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490b613a17bso33030335e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 10:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781544116; x=1782148916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RkM1BDS2/x2+bcSsEU1uZb+8F4JXoPxZ4spGf76bhh8=;
        b=S5aRJ9lJs4DS+mHZxm7TGxOEPpRSN6H+SIHdDYZLwmOIG6QflncVFbKiTHfLxu05Or
         zERLrGffBeXxlbzBokhWW4/iq8JyrDvxo4Txk451V4MI7jwLRbqbUSaizf29hoiG2CTf
         jofAiWdbImOxMLRsQDOj8/9KYeZsRUTDX7nVEyqZES1yLC6+ni0V8f6M6R37401oQkO/
         M7ojej5XBGvVX1XDmGuOe1n7EGMtm3ieudLlGTEEUqmBK6VsfHfruD66yZIEufYVGwZG
         HZ67Z6VYTEmLK1ziE+2p02Z/nMG7onTFUGjuin0C3xxiR6y7qcHs3HTCh7PVHBdechTD
         GeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781544116; x=1782148916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkM1BDS2/x2+bcSsEU1uZb+8F4JXoPxZ4spGf76bhh8=;
        b=FuI5X9fXxyD99XZRRDw/0Z7rolnkvx2o4cimd603PLhnTbBoMrp64iu47k/j27FkcJ
         ncHdZ+Nzuj64QVUmKH1ZDCIV/xQYwMDfcwM+QjQardoUGXWOwlh2DYDHkjkdL7nbJA5j
         UdfDD6rA4UMvAFV5wXVo22PS+LqazXk5yiLlFxrE0aJNFEfv0BM7T2JzPRFlMU7Ijno3
         W+KxiGMMQsEwNdXNA30E5nVdh6NQ0dxzdMA24GiJ5SGve9WDUC9dnBNWAQf2g+/WszJY
         LX19MQuVegYaBYHleBA1KKgJjSWBs4b0vYWlXrLnccquCCCs8og3RaOVr49oyTNJYvqx
         rAMw==
X-Forwarded-Encrypted: i=1; AFNElJ/ExtgncMXg2AZNXRG2lXJtloIkjxqY3qnc6sJ8md+JaSdTZE6b2y3iOzeE1l4jcQMH4HuNwA7kabxdiBdKUVSy@lists.infradead.org
X-Gm-Message-State: AOJu0YxSJ3IIXqehyCVFnLOgJxcsHRtQpbp5Z6ejBzQgroq2KZNB7969
	ti1IE+Sj0+PInga5R7fD8AdvkxqTxXFgP57/Z6Cv8m8ufxVM19oae/Uu
X-Gm-Gg: Acq92OGj4+BXs+f4AX7FgusZXVL4YYQ2/0e0ct1FnDSOlwU/6jclIdDVfsGDfE5Oo1s
	iPINPD01vTRzgeAad2kQSxIZyoskryt2YoBqmdXcQpvlRhT1RJVdwHVd7eKR6SCTLcmN5/ZO4ag
	uUi+M9J1Nly4zw/GZg7Q4veNJw12v4p7J6w4ULuerH96cJMercO3hi0z20eJTTb85K+keiS5ok5
	khwoO1nDqGvYY9um0XnPI2vnL2hn/M/n0kc3am3Aw9q6ZWtYS+0Xxne1UmOn75kTL1rURGuPP63
	T4NPJ4x/IzRTWJgQ1eAtE2AiuiGE2eQRfvMpcyvK1v/NgKhZR/yUMqQ8NHCpQMPFzo6jzYvwWpl
	BKRLk9rSKtXaptv5dGjABgE1B0qpfOyseZVaD1cltdiBLVOiR4gMcWyoaYghpuT0bOWh9tg5xHh
	NQ2BaluLTri+y/k6Ep
X-Received: by 2002:a05:600d:8496:20b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-4922ffaedfbmr1209555e9.22.1781544116287;
        Mon, 15 Jun 2026 10:21:56 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa9f2c0sm6870805e9.15.2026.06.15.10.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:21:55 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND] arm64: dts: mediatek: mt8516: remove cpu3 armpll clock-name
Date: Mon, 15 Jun 2026 19:21:00 +0200
Message-ID: <20260615172105.3758-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_102158_571613_6FF6002F 
X-CRM114-Status: GOOD (  12.31  )
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

The armpll clock in cpu3 clock-names property comes from MediaTek sources,
but it's unused in the kernel and not populated in the clocks property.
Let's remove it and align the node with other cpu nodes of the same SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index b5e753759465..596f673a0d88 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -95,7 +95,7 @@ cpu3: cpu@3 {
 				<&CPU_SLEEP_0_0 &CPU_SLEEP_0_0 &CPU_SLEEP_0_0>;
 			clocks = <&infracfg CLK_IFR_MUX1_SEL>,
 				 <&topckgen CLK_TOP_MAINPLL_D2>;
-			clock-names = "cpu", "intermediate", "armpll";
+			clock-names = "cpu", "intermediate";
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
-- 
2.43.0


