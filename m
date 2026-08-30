Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E639CC61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 14:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zxBB/u3wj75hw+P+JmPxQieitUfUOK9Cjkxvdu4yQ2s=; b=Q/ZcCqQmZh6mOu
	6sA4b9L6uy5l2wiPZS0xgFN0ptLTsZwZW/2uiSYbLUhIDS+cY57xLUGcepvhnEpibC3g+p9N4oq2t
	1aSJrndN5NASkjo8YOQxk624GdQ4/1C1gryAPnPWbiCTVvNIy11MSeMKhg8R1YzEqoiC84uj1T7UH
	EOhiH9a9/mXZaMz58jrusvj+VpsJXbGQpgbtzR0fcGCN8NjYswj44vRopxUK+U9BRGxXHicofxN6X
	RrlWx/9sgnEwhg/bsOmJ2z/xbN+YUmswEIv5vu/cuGQovOnICN80Bcf+ptqixx4lRHCcyQL4eBcyk
	MhpQsz0suLkIGFpGRIVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0gQe-00000007nDY-05c6;
	Sun, 30 Aug 2026 14:22:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0gQT-00000007n90-2Z5A
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 14:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 11A59600AE;
	Sun, 30 Aug 2026 14:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7F14C2BCC7;
	Sun, 30 Aug 2026 14:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788099744;
	bh=M157gAg3aXNBMLpJR2h8e9GqFXRRpGln0DE/YBYm+4E=;
	h=From:Subject:Date:To:Cc:From;
	b=SOwPg9rt0CQ6UjQrPArkOQ5P0HKGGnT+hGK/xxiASmlgTwiLC//tqFkIn48qhnFrc
	 iqIlqKp4ofH11zDcAIOooVARBDhj4C6aLxI6tgOszbqh5VRvbzRxTxYBIqfY10GcmD
	 YsYrV5CzgopekhoN1/sjAcHT6DN065ag16ICTR/G9pOywujvrJS1tIhzR2SZNGjm37
	 zXejyS4Vw9VeicxmOCZLn0ymKe15Rz6yhpqoqo16j+ZqjX3JAudX1Dbmuuy1CpkHJ8
	 JU3hjXPzY1W1pvyz6CmoO7jeqGqO+qhy3MGmkqqIP91Ob8nMOPSuzr6EDab2Hb3D8b
	 4qg8X2iEHqg2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3FF3C61DB9;
	Sun, 30 Aug 2026 14:22:24 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH 0/3] arm64: dts: apple: Fix cpus node indentation
Date: Sun, 30 Aug 2026 16:22:06 +0200
Message-Id: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0Q5EMBCF4VeRud5JqgTdV9m4aBmMCE0HkYh3V
 +vyy8l/ThAKTALf5IRAOwsvc0T6SaAZ7NwTchsNWulCVZlCl6P1fiJsV8GODxLUrjS5sanVnYE
 Y+kD/IXa/+rVsbqRmfZ7gum4zGuGsdgAAAA==
X-Change-ID: 20260830-b4-apple-dts-fixes-2b7949a1a2f9
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=735; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=M157gAg3aXNBMLpJR2h8e9GqFXRRpGln0DE/YBYm+4E=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9YUmzmcy1WeiCR9Kd5qVp2tkdp03Y1H9GuC1A0VhwVMB
 VttFU51lLIwiHExyIopsmzfb2/65OEbwaWbLr2HmcPKBDKEgYtTACay4Asjw0OectuLx0SFxBd8
 vDSHQ7So7qqhd3jS+rdH8xrfhD3tPsrI8N6ZSSzsB5O+nn3ex+0LgmaVri0QS9oos3DNw//XtrX
 78gEA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

Hi,

Just a small series to drop a spurious space in our dts file. No
functional changes.

Best,

Sven

Signed-off-by: Sven Peter <sven@kernel.org>
---
Sven Peter (3):
      arm64: dts: apple: t602x: Fix cpus node indentation
      arm64: dts: apple: t6030: Fix cpus node indentation
      arm64: dts: apple: t6032: Fix cpus node indentation

 arch/arm64/boot/dts/apple/t602x-common.dtsi | 2 +-
 arch/arm64/boot/dts/apple/t6030.dtsi        | 2 +-
 arch/arm64/boot/dts/apple/t6032.dtsi        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
change-id: 20260830-b4-apple-dts-fixes-2b7949a1a2f9

Best regards,
--  
Sven Peter <sven@kernel.org>



