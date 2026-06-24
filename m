Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6A8CDE009
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 15:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3ICOxUwoN4NbcwcBNbAh5dF46PtklAQM35NDfsjQxA=; b=m8Wjvrbss23X3cTNsl9iBveirB
	hA7fxpXM0fIQ75Gkozr5N42T0mmHdTOgb+3HdR8ZwhIL3PL1+FGeDw8iewMprT9TiqllW/noeWGuT
	6hrIaD57VyOqttQ+xZ9t1XuRL13owyrm4bses7S1XnsgghsEG2cE2MsGFWgfb9kpX0EF4gZYrk2Zy
	95Q0qKRw9QtHP+PHdDoRmEoD5jNWnAPGo0CfG+69vd2eNKDen97YSsE7iSs3vOv7dDXzT4VOQHaiS
	/Bv7QfNZeu99RO0DeeWkw0KL73zNgBIxo71crhx3XvPKxyNviDvEFD5MWbMNP8FPRckbt/DNB7TkR
	1/BNUKdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPnc-000000082D9-19qQ;
	Wed, 24 Jun 2026 15:46:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPna-000000082Bk-2anO;
	Wed, 24 Jun 2026 15:45:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F173043F47;
	Wed, 24 Jun 2026 15:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC51EC2BCB7;
	Wed, 24 Jun 2026 15:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782315956;
	bh=36brmetKtrVC79sVumiN9i3JG3kddwy0+O20pABEssQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gY1VQqs71jWWgmWiq5CNFJh/CXJFDBOKXz0IMNPjlkFgfN3TB5vF4WBm752mLgMYB
	 dGrFkva8j1DBuoIcHTf480ottQ5HWXlKGOIXnWtLtnpFp4aJSnnWN67tAI748YCJNV
	 PT3aLIwpLtqr1UNmWd9M+ICYJ8eH4HT2uJpB/+Jn+A05JKMo4KJoyd1dUR7EGVQOQC
	 PLqBRKgAPQdbAxAWd1WIg3mHUB0ABqpZ70af5zq+44l21MIwMJHxjHkY2NRgprg4kw
	 7FgVtILTFCvVKmy/r6E+ZDOdthIUdZguYCpXHI8BNzS5GXUsI+m1Bk7HQpOvlKUn9Q
	 h/3Osrhj5nuow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55C8CDE001;
	Wed, 24 Jun 2026 15:45:56 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Date: Wed, 24 Jun 2026 17:45:53 +0200
Subject: [PATCH v2 1/2] arm64: dts: mediatek: mt8395-radxa-nio-12l: Drop
 redundant i2c2 drive-strength
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-nio-12l-add-i2c-40-pin-v2-1-cf3707a6aaf1@pardini.net>
References: <20260624-nio-12l-add-i2c-40-pin-v2-0-cf3707a6aaf1@pardini.net>
In-Reply-To: <20260624-nio-12l-add-i2c-40-pin-v2-0-cf3707a6aaf1@pardini.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1206;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=m5Cx5Z1IWJ++CWhQ3mc1twTHRBYJFzAA/qKlYFYZhuo=;
 b=owGbwMvMwMFoHWf/eN7xty8ZT6slMWRZ/97sedvCKo+7fEqerwwrv/y/74Kpf9LvCH5jtBLrf
 TlRQ1G2k9GfhYGRg8FSTJFljYQyz7f1r07d8eiYDDOIlQlkirRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOgYM3BxCsBUF1Wz/5UT4fJ//z+5RmDX9y9Lxe6xd7jsqgg74CyyLfDv5ylaiVc7cj7l+17
 s5BHST/nfK7Hnr9/Fxls+F5f5V07unKFkGruGbWqS2aHl+9Z4KQg+dmCo2FdWGHZq0qU5rBKfN3
 rlnym4pWBjHrldYaJWiqTr7VWZtwNuZASpTr3RzmZrKuHkrjHdwezHpg67pj3GF/ezRj181i3EJ
 3TnQaLl5oLTVTc7n7A/Tn7lzOn2yWtyyfFzMx/yaAT/sLaevWDxg/VvbS0n9/NOKtxux3pt95XZ
 3+LzD9dG7vQuNam576un5iYWdnG/5v60ekPnhTbnm2TfiQjeeh6qJ/HyQLksz6XWBdOfdCqa2r2
 fXXZNBwA=
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
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
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ricardo Pardini <ricardo@pardini.net>

The i2c2_pins node specifies both drive-strength (mA, standard driving)
and drive-strength-microamp (uA, advanced driving). These are mutually
exclusive: the generic pinconf parser logs "cannot have multiple drive
strength properties" at boot, and on MediaTek the advanced driving enable
bit makes the uA value authoritative, leaving the mA value dead.

Drop the redundant drive-strength, keeping only drive-strength-microamp,
matching i2c4_pins.

Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
Assisted-by: Claude:claude-opus-4-8 # vs Sashiko review of upcoming i2c3
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index bf91305e8e4a5..589a5f07d5dde 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -784,7 +784,6 @@ pins-bus {
 			pinmux = <PINMUX_GPIO12__FUNC_SDA2>,
 				 <PINMUX_GPIO13__FUNC_SCL2>;
 			bias-pull-up = <1000>;
-			drive-strength = <6>;
 			drive-strength-microamp = <1000>;
 		};
 	};

-- 
2.54.0



