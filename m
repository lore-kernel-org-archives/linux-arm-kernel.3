Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58D4CF6BE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 02:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qb8uAaSr/dOJ8AUuVyRs5SXXHNQB2WI6jiZ2nQSHUgA=; b=AJr9r5JPW2k3o8dazH1tj/b+mA
	DyLvt/+FjdYlGF7XV4JfhVB0NyrNmGBVLc9vKDMQQ4iYMtDHlFOGYgSn4nagYHet2pX4dufH404ux
	8qbu4lOoRp1xzMoCTl5ri2Oq5KmHbqiwI2m0nHRT0XHpT/gdIZWKrcMr8+21j7RTqCsW+Ms4AtrLW
	b34Egs4xhPfBsKqYewjCQHCktAke4daI2qM4KUagurUERKoq2VgIZLsUMmcSFlTzCmuw7IA5efmQM
	RFRKDpiHmvERP3BrsfUiOVEE9K7odF1oomQDdXa7IJM8ivtxCn9SFiUu6ZomlIoUB0kSyenflPjav
	KroBS/aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ0L-0000000E2YL-3tjl;
	Wed, 07 Jan 2026 02:10:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdJ06-0000000E2It-30g6;
	Wed, 07 Jan 2026 02:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BEBE60141;
	Wed,  7 Jan 2026 02:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA63C16AAE;
	Wed,  7 Jan 2026 02:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767751817;
	bh=x8y5mq9j/NBdl6c/kAmCG7lugm3IDOX4HRJJ+rv28WY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SfwoJ4CMlQjS94Rx5TyfivRbMZNM0+nn0hj+uz9onSb60cu316TCVl65lK0N2VFSp
	 pdUutTeE8ynGSP7bOe8tAKjROyw6u6hbpcd6MEv3wUIFPeYJ7YspxbvuAkQx7QiEJ1
	 uayQfOB0Iyf64hIyhSgARy+s/vijR8XR98tIlecTvDE/w1cDm5b5R5UwH9lhdJcbbs
	 kYA+XisuXmkb/utqSRfrSbk3NA/QwYXG0c9RQlQU41gxwm1TeG5toEjm9YfTZkiW+r
	 416ZQFBG66iZ6KXHHD3SlDtX3nBJxMl9T1Ps/lOsdkzKrtVgYAMJTKPyRIqQZ0c9Gr
	 AxEtwtCc4kDCg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 06 Jan 2026 20:09:50 -0600
Subject: [PATCH 11/13] arm64: dts: broadcom: northstar2: Drop unused and
 undocumented "brcm,pcie-ob-oarr-size" properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-dt-dtbs-broadcom-fixes-v1-11-ba45874e4553@kernel.org>
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
In-Reply-To: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
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

The "brcm,pcie-ob-oarr-size" property is unused and undocumented, so drop
them.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
index c9bf77b3566e..a187c8e788dd 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
@@ -154,7 +154,6 @@ pcie0: pcie@20020000 {
 		ranges = <0x83000000 0 0x00000000 0 0x00000000 0 0x20000000>;
 
 		brcm,pcie-ob;
-		brcm,pcie-ob-oarr-size;
 		brcm,pcie-ob-axi-offset = <0x00000000>;
 
 		status = "disabled";
@@ -184,7 +183,6 @@ pcie4: pcie@50020000 {
 		ranges = <0x83000000 0 0x00000000 0 0x30000000 0 0x20000000>;
 
 		brcm,pcie-ob;
-		brcm,pcie-ob-oarr-size;
 		brcm,pcie-ob-axi-offset = <0x30000000>;
 
 		status = "disabled";

-- 
2.51.0


