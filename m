Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1D5CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 06:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VbeJlFIwdLrEO1dRUQbP8rGuG2DEV6y4QjSsQ5MvRbM=; b=Z5yayxDEDLYFHO
	6ckgidxQ8HzJsH1fIMmMhtAg4NUWJPD2kMNQPesKUapA2N6N8jacljwGn13WXzXFzKnkSZbanc4Q4
	oVvfW8k74STl5Hbg+fNFMp5eTMgA9lHQkxoGI2yDLZEdhRNIRlUyf6di2fCxV/DKr3ilALlaFtgtf
	BW3zmStQNNh2JRlNEc5MMQLRk79Y38k74Mjsu3iZtsnDtZiJ9w4EXBz3SMxGnCnUO0/VBm5H6bpZa
	XPfZIK2LaPyyj8jOW4dMXa3Eh5z5Jnl3QnCkJe8C/8TH6/pBdkxKTAU7QInieQ1LzUlet9b24GwFO
	wy08c+FkGgCqKAbcFEng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVt0-0000000C8AR-1TUo;
	Tue, 13 Oct 2026 06:21:18 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVsw-0000000C89K-2vxx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 06:21:16 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 1FE5D202012;
	Tue, 13 Oct 2026 08:21:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791872472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VbeJlFIwdLrEO1dRUQbP8rGuG2DEV6y4QjSsQ5MvRbM=;
	b=GvqGh0lBiTZLBXY5ObZNzem/IlCdbzhKLL8DAvdB9AOThXf9JfiI33NHEhRCOsgcHF+9kk
	irSpbXog8peW/yUFgYeo7jlG6zVangvc4gZDER7AP3bgr99OP+WWmIIND12woweDqIlCl1
	VIeABUl0UMHUWG47bBfB81ehmAUwIRPYquMnIWxwlYBCEswD0rsQJJmGaFKok4x9vAv2/o
	cPvCl7IdhfozgyytepeH27SotiV/VW86aHcmG2YVVL1bf/yYi9UNjqSf+i4KKr+lGEnpwN
	Mug42FUfQUkTOPhtIU0Q4YA6h5g9Hd/169bIpCoLa/bFLWOSHQoXuLVK7jc7sw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791872472; a=rsa-sha256;
	cv=none;
	b=cceafrQp1a6Q5qc2mKvI2wFjQLVY/gdPSPeEo11S7jO3BmWwfVE9814E/PwFXtKUzbLUN2
	IOUjFIp5GBycQHMOxmR9TXViXEMM3LULFDFuCk4pqZ2AQGzBDK1nI6u9mKXSDmNYKTAxht
	CbYP2TUMM20ITaLLoiepNkdYURpxoP+ZqlBuGuel8eSa/wJagxIAhKEaXfQfckR5Nn6srA
	gzxPjWMsjnqbCARrm8hb1T4HQeBT2CWblFyP2Va2JeQbsf8ZBC1fnf1O2N9hjhILvft9nd
	RR53YtIYBRypTKCa5aNzFwKYMLCloSQFZZ0+j1NYcMw2UoG7VRew5v2VSJ4twg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791872472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VbeJlFIwdLrEO1dRUQbP8rGuG2DEV6y4QjSsQ5MvRbM=;
	b=Wz8kc7OmJoZA5J+1BeqL9gGXQeYUnMVJHkegGRnvq734wICiCWxzQztEPxpk+C8Y1aKJcH
	VmsGI5EOqqLSSXjhfaEt/+7NngiDXjp+R+GLBgIdY1IThOnEkDmoavfc5CUhDKayAKLMpq
	46bRVyeK6+j7ibybRngoKLJCJYtu0Dycq+YUHoKuuRxBqFhc2Wxsd1zqSyNtwFPSULRJP6
	FmHQMXl6KYyQo4tVSzErq/ZbbnVHtOfJ0Q+Kpa1KFDAvd/fpS7dTYWtAvHZPH8zUGGvNFp
	vQ/xw3MxYmdRSnjxUpFfdtthuJTyL0iP+AJFIyjkBbqriLsW7Pwx94fjzKDruQ==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v11 0/4] arm64: dts: imx8mp-skov: add new 7" variant
Date: Tue, 13 Oct 2026 08:21:07 +0200
Message-Id: <20261013-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v11-0-b97ad841598b@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/53Tu27DIBQG4FeJmEt1uEOmVl06duhWdcAYElLFt
 nxTqijvXuxKTaSykAUJ9Os7XA5nNPg++gFtN2fU+zkOsW3ShJCHDXJ72+w8jnVaQBSoBEYFnhU
 GPLZddDgeT/rY4eGrnXE9Dvgwje3k9ljFJo2srlzFBVhmHEpc1/sQT2utD/T2/P7yij5/l4epO
 ng3LmWW4D4OY9t/r3uayRovrz6TFCRAhagpk5yZp843u2ns2yaeHmu/1p7pVedUFeg0BT2tlAm
 OJpxkdXbVFZACnaVgrXhQngVNDcvq/FaXBTpf9ODAaU2VA5rVxY1edDMiBaUK1grvoQoyq8t7d
 ZmCweqgSDqBkCGrq3v1JeistsC5JFLarK6vumYlr6rXnvGSCS5oZfMdaf50AqALdLP0OwnWQBC
 MBJfVCdzwhJZ8J0hJMCC9UFxL+78nL5fLDzxkydNPBAAA
X-Change-ID: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3897;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=g1eNySreq6U83Gzfb6zsIDQEONDViRpveiiRk0O0Y3w=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9bZs9c/7bPsXXwt0W19t2TVvQAHqfj9hpssCy5fmpou9
 yDxtdexjlIWBjEuBlkxRRaVhRV8oh4fPCOniXDBzGFlAhnCwMUpABPRVGX4zc75htUpvvYvx4wk
 hT/b3Ccd3LPynkDRGfMb4Ut8rmmelGdk+HUl8Ete0ezSG0sf3fjVkj7xUbaAGb//N2uXjQJiKm4
 eDAA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_232114_947008_87267394 
X-CRM114-Status: UNSURE (   9.50  )
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

Add a new board variant for the Skov i.MX8MP based family of boards.

This variant uses a different 7" panel than the existing ones.
As the already upstream boards and this new one are almost identical,
convert the other device trees to a base devicetree and apply the touch
controllers and panels via overlays.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v11:
- remove code-style fix from overlay-conversion patch
- change patch subject
- Link to v10: https://patch.msgid.link/20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de

Changes in v10:
- rebase onto imx-dt64-7.4
- rearrange binding and code patches
- Link to v9: https://patch.msgid.link/20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de

Changes in v9:
- fix dtbscheck error
- squash new compatible into 7" devicetree patch
- Link to v8: https://patch.msgid.link/20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de

Changes in v8:
- add #address-cells and #size-cells to i2c2
- fix touchscreen resolution
- add missing binding includes
- Link to v7: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-0-ca8a0446166a@pengutronix.de

Changes in v7:
- address more of sashikos rightful feedback
- Link to v6: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v6-0-fa8f71dfc56f@pengutronix.de

Changes in v6:
- address sashikos rightful feedback
- Link to v5: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-0-67faa5ee0bf6@pengutronix.de

Changes in v5:
- convert to overlays
- Link to v4: https://patch.msgid.link/20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-0-dfc0c8827c02@pengutronix.de

Changes in v4:
- fix Makefile sort order
- add touchscreen fallback compatible
- fix lvds_bridge comment
- Link to v3: https://patch.msgid.link/20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de

Changes in v3:
- rebase to v7.2-rc1
- Link to v2: https://patch.msgid.link/20260427-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v2-0-e2b79fc24391@pengutronix.de

Changes in v2:
- rebase to v7.1-rc1
- Link to v1: https://patch.msgid.link/20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Søren Andersen <san@skov.dk>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org

---
Steffen Trumtrar (4):
      arm64: dts: freescale: imx8mp: skov: fix sort order
      dt-bindings: arm: fsl: add compatibles for Skov i.MX8MP boards
      arm64: dts: imx8mp-skov-revc: convert jutouch and tian to overlays
      arm64: dts: imx8mp-skov: support new 7inch panel board

 Documentation/devicetree/bindings/arm/fsl.yaml     |  2 +
 arch/arm64/boot/dts/freescale/Makefile             | 10 ++-
 .../imx8mp-skov-revc-jutouch-jt070tm041.dtso       | 38 ++++++++++
 .../imx8mp-skov-revc-jutouch-jt101tm023.dtso       | 38 ++++++++++
 .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts | 81 ----------------------
 .../freescale/imx8mp-skov-revc-tian-g07017.dtso    | 40 +++++++++++
 ...h-jt101tm023.dts => imx8mp-skov-revc-touch.dts} | 24 ++-----
 7 files changed, 134 insertions(+), 99 deletions(-)
---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>


