Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F647CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/+HU1QYQZmhqORfdmiy8w2qez1W1MQHoWlaTLfNyCo=; b=0rITm6yV85fPO3FdlaMhttqc0/
	Hy/9SKixCg9DRaNupTk6RfqzQdxqZvKLsIocL8v9Aba5EP2lOe6E4n57rEdYnW8zH4nkv7twcnfBU
	tCDvHb1jMK8u2IUVpie7yBtmotTTkhJHIokSy8M0tNFPZVIJid1kFYiJJPH18sykSPkmHUSm1o+mm
	V72rn6UTpT4TvMPPbP5lYgWIRZvRkJ5LO8eGkpuwrAl0POew/m423MSMdVj8CE8ed0BUuMuHK4aPR
	13i0CtyJY79f6KHNAKHufNy8z3tR7T+VLwGz10IBFycPFSAkyEguGVQtSuc05oPpz1V89o6mSwxSM
	GOCklrwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCno-0000000FrJn-3PIa;
	Tue, 05 May 2026 10:14:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnn-0000000FrGm-16XP
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 10:14:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=U/+HU1QYQZmhqORfdmiy8w2qez1W1MQHoWlaTLfNyCo=; b=IBUF2ODafnm91uITt0U/DkxF04
	NJIM5BWWo7gVovb5B0jYKRkZbs0GCAFaTxu+/ZzYcYRRU06Y4PC6uI4YcHQCnRFFArR6yDORnlw+0
	MsjOPMV/MFAvl92gIWONx4cW1Q02Lyln+9Edb76JizytE17XgVwjVPC5uyhNlgwBg2fEyVQWHbbwY
	CcBIrktb7QfaA5JqYHZ+UImqnjCP9RDVleqkRQ9snLlsX0FKJ/4rZyzRI9LHyeiA1M9XLHUDZ9kBL
	lXxS1usztTqFJJ7AiX6Bl/IAmk82/wdNUFmXWfxmgs4grT3YJZ1RO92V7+eqZwTHHK4gs3Fr0UfXb
	aNItTkwg==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCni-0000000D9ak-0KOt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:14:54 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-82f8893bff3so2341812b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976088; x=1778580888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/+HU1QYQZmhqORfdmiy8w2qez1W1MQHoWlaTLfNyCo=;
        b=DOgWaQ24Mmz7emzVeO5PNmmfTUgSn6UGIlFzhanqXT0bR3p0StrYeGfRJzvaDpm+FX
         EBf1KZm4BB2PvdiRMqjbct5ehTaCUVcqosf1g639dhfk0ckT4mLF4Dx0YY2cvIZwKOYi
         L006C4Isw6E0bnY5UJocnB+ZYLRWF4aDtRVwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976088; x=1778580888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U/+HU1QYQZmhqORfdmiy8w2qez1W1MQHoWlaTLfNyCo=;
        b=oy0HT4QyDNfpkcLi1wnjfoCh/DvGwawu1IxD/f+URtggPo29QqWphpc7m5tlYilgrf
         mMy2epiZjPeHS3h5r7M2v2URMubz+JHZoj1mCtI1mskgHtqHDc+Rj1m+QIj1NKWFrKN+
         5jCfSBu54uTkrFRTUmkxdUjaQ0nFiQ2pOElA40lY8MhiwFszd4ZZScrGIbY2m49iiso0
         +L3ZTHgp3uoSScpZuD4rTW3vm+8nHD7thHsa5VYlrvi/w/foWC9vJhltSo1W8uYbhpPg
         ZSdceF3+vxMIVRZgFfs5uu7m4UpNAv8VjEzs7MfQn0B1Yi11YTxFRoQQ5PzjlHy37LpD
         +VVg==
X-Forwarded-Encrypted: i=1; AFNElJ8c+xTmCqdMcHB6kQY2TaU30obGJMGNyyvME1n1Gcf2mdCMt2NSkvAWKFjyQ4peGatoCP1NeCYesGVST8ZQAxH9@lists.infradead.org
X-Gm-Message-State: AOJu0YzP2E0R55PUkL0Cbn0GFFmhKGSay/QLWlVIaVDKIAuEai/WG6Rw
	dYCtlXzxQ714rxPnphO6EUDSUYRO9EcEmDkGpBSl1ckfIkp6ef9fOnp7osOwRNm50Q==
X-Gm-Gg: AeBDieti6q3/TAR+AdzQb7gDyZ3cAlTqriOk9wamtxfhq+pmzJRDXdGxRQExu14qBxf
	gAAQqUigx9+sm3s7/60qByT1SMgMHFQt/RPQzJ+JTEKu+gJRbYWHplH684nGKgEo0uf/psQQm6/
	0k9FRtvB9j7xRJ0Ape3aN4CCV02Lh910YjRLJqFqnAyyiDMBOnErB5dq4jwBo53IexgwGw8FYnF
	joOC6DFg1EHFC9XkvfqAQ7fQiQNUCNB+0afy9bTK4vvnEaFurEi5Hi4xauzgdecQiRPu8Uud6lu
	3aN81Kx9IXKMAeO3uxW6QUa9sjhmn1ln5KOLaBC7u19UNWJhAIsVJNSXu61YR/oK2x7kwAG1Z3r
	v6p+ZY8FeTaBmpibp2fPPMQf+nnyOwfjcNtmXVN36VBNXyr1uAy3kLm9fu+jsqjvBDSl/Qbq5q+
	9hH6KdCjuzPCP67KGUUUwaE8G78jOpphbxSeyOQEKWJQ/gr/Oi36jXxeke13lVIdhRnzas6aAeR
	ymWF7HaVUDnsqYOpSGfJiEdi2FDBQ==
X-Received: by 2002:a05:6a00:1956:b0:82f:5c3f:94c6 with SMTP id d2e1a72fcca58-8352d26b9f5mr12659407b3a.28.1777976088522;
        Tue, 05 May 2026 03:14:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:47 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/16] arm64: dts: mediatek: mt8195-cherry: Add MT6315 PMIC supplies
Date: Tue,  5 May 2026 18:14:00 +0800
Message-ID: <20260505101408.1796563-11-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111450_225399_7100DD82 
X-CRM114-Status: GOOD (  12.28  )
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

The MT8195 Cherry design has two MT6315 PMICs. One has 4 outputs ganged
together; the other has 2 outputs ganged together, and the other two
unused.

Add supplies for these two PMICs. Since the outputs are ganged together,
just add the supply for the first one.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved supplies to PMIC top level node
- Added all supplies

All supplies are connected, but since the regulators are ganged
together, only one regulator node is present.
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 0b9fedac842c..cf9855618494 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1472,6 +1472,10 @@ &spmi {
 	mt6315@6 {
 		compatible = "mediatek,mt6315-regulator";
 		reg = <0x6 SPMI_USID>;
+		pvdd1-supply = <&pp4200_z2>;
+		pvdd2-supply = <&pp4200_z2>;
+		pvdd3-supply = <&pp4200_z2>;
+		pvdd4-supply = <&pp4200_z2>;
 
 		regulators {
 			mt6315_6_vbuck1: vbuck1 {
@@ -1489,6 +1493,10 @@ mt6315_6_vbuck1: vbuck1 {
 	mt6315@7 {
 		compatible = "mediatek,mt6315-regulator";
 		reg = <0x7 SPMI_USID>;
+		pvdd1-supply = <&pp4200_z2>;
+		pvdd2-supply = <&pp4200_z2>;
+		pvdd3-supply = <&pp4200_z2>;
+		pvdd4-supply = <&pp4200_z2>;
 
 		regulators {
 			mt6315_7_vbuck1: vbuck1 {
-- 
2.54.0.545.g6539524ca2-goog


