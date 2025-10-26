Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A655CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 18:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7knLhnUchA+ati7SLm2q26i7FYnluYm8NgHElvQxLQY=; b=lfFGXmhVHm1SvDD2iqD3I/qvym
	ZFDIPVc2yulAnJuevbQrzNntX5PDYs+YY+RJw3Efr0sZykAoyqhxSCMRwf7nSQpy67aTr38PhzZXk
	1Ut3tj9TwRCUd2lMw+BJLtble1cij+K0Ob+x24ckQZYWIHHJyBjkPfMcLoo+Ft+b2pRKa2OduakNu
	dhOXQgiXIVeRJT2yH/K0dE8wA17AHhHooTiImFRFPFlr8rWJr1dIhq7Hka1IpKrXuRz7LTddCrqA0
	Px6n9Y+/OT/m/lIDeees0ogz/5vt0+H4MthAwIzO+evx3UYaNhmAzi42zOKLK0dFBJh8BUszGZHEO
	dNdrwFbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD5TB-0000000Cd8v-1Xcy;
	Sun, 26 Oct 2025 18:27:57 +0000
Received: from smtp1.ms.mff.cuni.cz ([2001:718:1e03:801::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD5T7-0000000Cd6p-31zQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 18:27:55 +0000
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1761503218; x=1762803218;
	bh=7knLhnUchA+ati7SLm2q26i7FYnluYm8NgHElvQxLQY=; h=From;
	b=U9uYyCo3Qg/GydPmzPlED9CyjKKdXcUc35kpn52nE7y6TscLMF+VEAz6TZWes6jH4
	 L9cOqoFF529RgOpxl7KjyS0dfbwmIOpw4hrMt4T1vcX2mh1JXOU9teaPc9fOIPv2Ht
	 yXb2d8mlo9sEElwGi2JppgXe2ZYcgJ+NyZPlaV4Cyp6SgxEzetZRiAPzRdHZ0FvPIq
	 7f9i/uUwnfsU1FuJtc864OFxIGnT8gV4qFkBz9rOQIC9G6A0iRa+bFIfKXkuWw1PoT
	 TDJqU9jQor4eo4q5L0Kyg+Rjgexp2jDTOG5ki3E2h3rBp+pwdtOQ96Yx1pnKRd4moD
	 J7gjGItfzLJCw==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 59QIQueO043052
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 26 Oct 2025 19:26:58 +0100 (CET)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Brian Norris <briannorris@chromium.org>,
        Francesco Dolcini <francesco@dolcini.it>,
        Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
        linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mmc@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Karel Balej <balejk@matfyz.cz>, Jeff Chen <jeff.chen_1@nxp.com>,
        Peng Fan <peng.fan@nxp.com>
Subject: [DONOTAPPLY RFC PATCH v2 1/4] dt-bindings: mwifiex: document use with the SD8777 chipset
Date: Sun, 26 Oct 2025 19:20:38 +0100
Message-ID: <20251026182602.26464-2-balejk@matfyz.cz>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026182602.26464-1-balejk@matfyz.cz>
References: <20251026182602.26464-1-balejk@matfyz.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_112754_058384_C9E5C267 
X-CRM114-Status: UNSURE (   8.15  )
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

Document the corresponding compatible string for the use of this driver
with the Marvell SD8777 wireless chipset.

Signed-off-by: Karel Balej <balejk@matfyz.cz>
---
 .../devicetree/bindings/net/wireless/marvell,sd8787.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
index 930b700b73d0..d31ff38f57d1 100644
--- a/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/marvell,sd8787.yaml
@@ -18,6 +18,7 @@ description:
 properties:
   compatible:
     enum:
+      - marvell,sd8777
       - marvell,sd8787
       - marvell,sd8897
       - marvell,sd8978
-- 
2.51.1


