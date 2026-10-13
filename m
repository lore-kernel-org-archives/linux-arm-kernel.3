Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E071DCC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 06:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wlCTTzhEmqwNRCCk2BDRDkJcEczD//wMLoJIXIrJ0M=; b=w2tjL6PJJTIzuujNeTHJd9qNJL
	3jmHNdgwzkxWU2ATFdM5Gz1I6RPEfw3tW8RYcqmCJ6LfTDDRsW/07RPzO7o3yH9PTHoos5n/287PY
	3A5PHjwx7BXJNUKypdrynAUzDlNBZa0I0A0bxlleZaWTaJCIoOLwL2qF94qy4ylplYYeInIPUPYJ4
	Ijrq9ki/j4VvatnCdohUn8NhPwVwCzPtgNl5GJU6E58oUnZ94UyTsEHgSNelTrpF95uqBix9/uvaZ
	yKqCFEeqp2m5xf827PtU23eapTZnSvT+H/fv5VdfO69ExeTCRJJf9FRV+sjBXP/pkxXtqsc9PU5db
	AeNa6e2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVt9-0000000C8Cn-2Sip;
	Tue, 13 Oct 2026 06:21:27 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVsw-0000000C89M-3Pu3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 06:21:17 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id BDAA62021ED;
	Tue, 13 Oct 2026 08:21:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791872473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+wlCTTzhEmqwNRCCk2BDRDkJcEczD//wMLoJIXIrJ0M=;
	b=B9/UeEsmMuN5ZWalyMX4IDLKP7k6gp3ntBuhudM1CXpp2sDRi+5FOrZD/nsu0D1B4WmPJh
	uzOaHFIX1Gt4Qh/jJNFIjXbqPTDSlsW+vLfAlxnSJn/iyXegI1QOMxe7IUfMRYE43JAftY
	KJu8XsDhsz0Lq+rnbqWDR/XsBBnYb2eP8vSUTl/gobR4y6Y5DChAHI6QJ7McPk37uaKXt/
	Pz0Y/Cl1fpGQwqVcZIQFXhNbpj9/ziqNuNIhgMPPRccJVJMK1UZ0O32i42eRYfAtDdDvrN
	541t+UzqwthunHgbZknKUqCPNd+eFruGH5cX+i4xsPAWvcFvoA5L3PBMeOVzOQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791872473; a=rsa-sha256;
	cv=none;
	b=L4iVYsLwas9ejisd/KbU3Z00bTIDdev5ZmaKzKOkZgw2P9jqC+b0pfUFO/10l1NADVaErH
	oYHy+mqsF7MbDSqr6Fzjadj4u9A5pSP8hv4yehYOfL9Pru7giqfUgPVpnt2G/IBIS5/yFV
	Db4WLeL8Z/ePJqbVpQ/qCIkShojI4QLRWjl/h9pGyWO1AWpXV9NFzya09iuTQmn9ZfPd1P
	85B1hy2cl+8Ln5jit9xY6wUhKjwjQkXSjoRJVMBoA5FQOLPGTr8ZEvb3PINAhnXK05oC7S
	KAlQCSG2FGRH3blhumZiu38mWuwjGk5n3UkhUUtDHIhQHLg512/CtWM0Hda0zw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791872473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+wlCTTzhEmqwNRCCk2BDRDkJcEczD//wMLoJIXIrJ0M=;
	b=fEuYkWlaWKe+uQv6nVvfJLaargTTkVJyEE0zcShoJYD/B83iGeQfzP4cbH98r/REa9RKpM
	MfWRMNY5D4LVqUry2bJuTC7CbeKphxI//WFKd+8uxAwxJEHokaLcz4bDPirvRKNq/9RJCA
	xoFupj2yZ1s7HCM+4bgOs1lHxwdf2xIMYzG6dJZ01RfgIOUTvKXM3vN/5GSfeXJiNrb7V8
	QCNCxPlYgMKt31ni5YqGX/I+WMDxfwc2n/vGtSLEbpcONpWEkENWilWcpegu/rwGpK8zB7
	fQJrE1yxGPoNi/ZWNnA7JpKfkEzYHLQ6KQ6/WuBX/3HE2ADC/feOKyqhSREF5Q==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Tue, 13 Oct 2026 08:21:09 +0200
Subject: [PATCH v11 2/4] dt-bindings: arm: fsl: add compatibles for Skov
 i.MX8MP boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-2-b97ad841598b@pengutronix.de>
References: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-0-b97ad841598b@pengutronix.de>
In-Reply-To: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-0-b97ad841598b@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=nZBa6AonUag7BVGD69Cp5RFNERuQJ1C1Cp8onbxhXgg=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9bZs9dt7J/v3iD05XrMFv+rOQd9FrlK7FZavkR+8qVFC
 e83WL393VHKwiDGxSArpsiisrCCT9Tjg2fkNBEumDmsTCBDGLg4BWAia78w/PetvGMYU+Q9j9/J
 5VadOOeko+ucnqatv3/0VPSyJ++rjpozMvRJs7+qzH0+2S+65weTrSSraWDIdIETVaukEp9u0wg
 vZwAA
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_232115_004637_7AEEE5A2 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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

Add a compatible for all revC-based Skov boards with a touch panel.

Also, in preparation for adding a new device tree variant with a
different 7" panel than the already mainline ones, also describe that DT
compatible in the binding.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index cb99fb74805bc..3ff8cd69b0830 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1153,8 +1153,10 @@ properties:
               - skov,imx8mp-skov-revb-mi1010ait-1cp1 # SKOV i.MX8MP climate control with 10.1" panel
               - skov,imx8mp-skov-revc-hdmi # SKOV i.MX8MP climate control without panel
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
+              - skov,imx8mp-skov-revc-jutouch-jt070tm041 # SKOV i.MX8MP climate control with 7" JuTouch panel
               - skov,imx8mp-skov-revc-jutouch-jt101tm023 # SKOV i.MX8MP climate control with 10" JuTouch panel
               - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
+              - skov,imx8mp-skov-revc-touch # SKOV i.MX8MP climate control revision C with touch panel
               - ultratronik,imx8mp-ultra-mach-sbc # Ultratronik SBC i.MX8MP based board
               - ysoft,imx8mp-iota2-lumpy  # Y Soft i.MX8MP IOTA2 Lumpy Board
           - const: fsl,imx8mp

-- 
2.51.0


