Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114FEE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 18:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4FFKwdu36dVSCfxWPUIZ2u7fpvMo74aah0GmlN+FSs0=; b=u2JhN4DNAUHMkyssAflmp+U8OQ
	1WeajWV09EGLhA/Yr8BkjOgFiwVSE+UWGPoMtKEEOgFdY4plOeLUPru9Y82rAibTYA9+FNZcas4qb
	/onIxFarBZ34nEflrBx/VYKZy5u79WOCCT//7hKKKflLZJbDut8hHQJvNdbjFm1WuXSfgoWWNegSe
	Xb+whLiAoSd4/i3AxA5fu1CgAuW0TW4JfgwHfaMHGdDe0DqMjBZQjkj9nyd9TR8ACZ0UTBNXJZp5B
	HqrCeU2nmQ2En0NCXa+CFfiDHd9OX3Fx2lBegeurMuta3OrrYLTQAdMhMEq3yAAlcmcVViN4FiLA7
	AmfxNImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJdMf-00000002TOe-28xq;
	Fri, 06 Dec 2024 18:47:45 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJdLd-00000002TA1-1866
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 18:46:42 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=CO+ewPu6hxhOmX+DSiZ97pHVlSW8y+r+3GxOdGG9VfQ8g3aw8DH1/fF5zT8Z3jESECqFFayeFEIdmeqXZ52rHMdGd/NB6kAyWCQdItVaQEFUmesvLJ59ru0xkbXoLTIAjCWCTX11IJKQYNUmNvHex8r1kRG4XZoRx6QQfcEjXtMhCFJWe7/py6NWXRQiZIW5As8fMSj44fxhGzTK/F989rF9zqQVBgK1mlfmypYk3aQ1A/f9oLi+4v892O5Yf8lfIherfErg1ZQf8WpP882gGAwlg+dxWchihr1kmjBdeyYGdQnTxAF5N2S8psCdHHnO+2wiU02FQpO9JXS7nLf6Cw==; s=purelymail2; d=purelymail.com; v=1; bh=WP8InOQ9Bbn59T6AiwUBks4Oi7aCTtKBhK4NRZz+94s=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1358913524;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 06 Dec 2024 18:46:21 +0000 (UTC)
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v6 1/4] dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
Date: Fri,  6 Dec 2024 18:46:06 +0000
Message-ID: <20241206184609.2437-2-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206184609.2437-1-umer.uddin@mentallysanemainliners.org>
References: <20241206184609.2437-1-umer.uddin@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_104641_445493_2772E070 
X-CRM114-Status: UNSURE (   7.36  )
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

Add devicetree bindings for Samsung Galaxy S20 5G
and Samsung Galaxy S20 board.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.y=
aml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 168e77375..fab29f95d 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -241,6 +241,8 @@ properties:
           - enum:
               - samsung,c1s                     # Samsung Galaxy Note20 5G=
 (SM-N981B)
               - samsung,r8s                     # Samsung Galaxy S20 FE (S=
M-G780F)
+              - samsung,x1s                     # Samsung Galaxy S20 5G (S=
M-G981B)
+              - samsung,x1slte                  # Samsung Galaxy S20 (SM-G=
980F)
           - const: samsung,exynos990
=20
       - description: Exynos Auto v9 based boards
--=20
2.47.1


