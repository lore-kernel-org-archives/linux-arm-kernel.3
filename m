Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD50C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 12:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JnawuQ2x/o6rFMG2kyBxxSvC4FZLLhQSJtf3J4LCED4=; b=Z3f9maARsjsp5xK7b14JId3nLv
	ol6C5DoLPeLExbBHD8Q2dh2GVNGlnb73Z9cUOZbQPdJ1PsjZy4Z5M7myyuenaVbZ+cHiA6k+8A/+Z
	UF7rqF6S8LGw4Ie2W4mvXL703+m15fuaBiNC6CKc8fA1GCEKl2KQlZhhjG8feOokP42CVPdUYlLTI
	u7IVceZ9taY1enyVcIKOK3v0cV3HDNJO2gzqZl7kBXuweQa1hhfMHyFvfOGaBx3Pq17U5L6wFPidU
	feHkp9VvHEtcuV/jKdr3O6WZF/betfA98n9FdPJJEpXCq7Stxpe9RMXCX8nx7HVW8KmQvZZ7n2GGk
	1pFkkQAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAple-00000001xC0-3YeS;
	Fri, 02 May 2025 12:45:26 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uApji-00000001wkQ-1RKh;
	Fri, 02 May 2025 12:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746189804;
	bh=miKYsAgcz+q2XvZ4Cs30fspOBVQgxjgsR9aXuexv4qs=;
	h=From:Date:Subject:To:Cc:From;
	b=kiwMpLqNuk97bJJM3h4OAExIQos7f7C/MfrlltGlrWZgXq4KxwP/9OayX3xzTGSYA
	 p3FCIG9n+CCE4LYnV2rJnU3sFuDD43RNyJ9mQL3qtJ9+AdL94KgdXJbi1JFWiOIPLZ
	 pGWl7V6+T5+sC6CJ6vltJXy1yIAs/WzmC6gjEynYUHFxh/5sdgyM8T0mbPTlEVcxnv
	 ePbls8y6vG7h7v4AYTNtLKbc9XihGNVCQfcT1GvUyHl9JJLpR7HG/7osrDKBcwZ/Us
	 mnn6NDC5uJe3c3s05+6XFmQ4hnQpeMxIA7jnOKHuDA6BRiXZZm4D5h80oUkkA5iFfD
	 0nbAUak3+JrGg==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5531F17E0649;
	Fri,  2 May 2025 14:43:22 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 02 May 2025 08:42:56 -0400
Subject: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: Disable
 unused backlight
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250502-genio-1200-disable-backlight-lcd1-v1-1-c021d2c9e48e@collabora.com>
X-B4-Tracking: v=1; b=H4sIAM+9FGgC/x3NPQrDMAxA4asEzRVIIl56ldDBP4ojYpxil1IIu
 XtMx29574SuzbTDczqh6de6HXWAHxPEzdesaGkYhMSRI8Gs1Q5kIcJk3YeiGHzci+XtgyUmxsC
 kK80ye8cwOu+mq/3+j+V1XTfUTrmfcwAAAA==
X-Change-ID: 20250502-genio-1200-disable-backlight-lcd1-b10ef0424a51
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_054326_570901_11C42B25 
X-CRM114-Status: UNSURE (   8.88  )
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

The builtin panel on the Genio 1200 EVK board uses the backlight_lcm0
node for its backlight. Though the backlight_lcd1 is currently left
enabled, it is unused, and its pwm input, disp_pwm1, is disabled, so it
fails probe. Disable this unused node.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index dc884e2e95c70309407798e6a51b595e441e6369..be5e5f339e811728e91b1ffec45ada25f9b0208b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -106,6 +106,7 @@ backlight_lcd1: backlight-lcd1 {
 		brightness-levels = <0 1023>;
 		num-interpolated-steps = <1023>;
 		default-brightness-level = <576>;
+		status = "disabled";
 	};
 
 	can_clk: can-clk {

---
base-commit: 37ff6e9a2ce321b7932d3987701757fb4d87b0e6
change-id: 20250502-genio-1200-disable-backlight-lcd1-b10ef0424a51

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


