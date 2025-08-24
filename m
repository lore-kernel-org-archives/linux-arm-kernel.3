Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091B8CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 11:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OGnQkPRlH98mt9wQWfSE8wUVZ07wp60aIMEzez2gDUI=; b=v2FH7EVjjgE/b50qrEKRIV12BY
	z6HwXMrA18j3PtBBOq5Nk4xyZLkGCeywGofR/9dtGGGQ20sbGv5lR9Mf0t3JJayPTdVkzOweFLhQr
	gidAUwesLYTw+VLyxEBhWIE7ThA997XpfJYm6jJlMuaveOr1QgZv/iboWDABBpbPTPkytwmEYDFsM
	C8ABfGh00Coityk/fsocQidKRxeBgc6D6r9+p3P6Ijq+mXOrT89orYYUiDEN8+CqRlsekVeYPh+gu
	tkrxZFSGl4bAyrw2gBpnWiUDt+lVB3dkvemUZAE+dY9ImBg7fnYqqK7Oc78rYAhvjxfjcOu1JimLP
	DtCKAR1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8pd-000000064Q0-3goU;
	Sun, 24 Aug 2025 11:24:17 +0000
Received: from smtp1.ms.mff.cuni.cz ([2001:718:1e03:801::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uq8UF-000000062NU-0LZY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 11:02:14 +0000
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1756033280; x=1757333280;
	bh=OGnQkPRlH98mt9wQWfSE8wUVZ07wp60aIMEzez2gDUI=; h=From;
	b=cc2Z++b4tC2PdEcsyBBvzTrrvTVj6TFMbX1+hZSM+c6Zrd8lPpAKa2ye3AR8DRCfv
	 ff4sqtFeT05XJ3i87t6DFmtLpwcRlx4XfLGASv0M1ur40CI+iPmKyg/rBS6olNLJdX
	 iQn6O4er3Wql4Odf8UbjHEfrOSCckC8Snx5l0LaQ5a18mNo7rMByf4vsroip16yl5n
	 LFXldcORgLRr67oLNiyYIbXw33Sv2JfjRKcBPzCRk/YFSnGb4BHHGhtlbmynGhYw0G
	 NInib4mqILE1vLI2l/83jhpCAeDN3HZplxP+wBPCZiELNm99WklG+auV+4ykDJcDls
	 hJg8uwy93Iyxw==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 57OB1HZD083627
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 24 Aug 2025 13:01:18 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: linux-mmc@vger.kernel.org, ulf.hansson@linaro.org,
        =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Karel Balej <balejk@matfyz.cz>
Subject: [PATCH mmc/next 0/3] samsung,coreprimevelte enhacements
Date: Sun, 24 Aug 2025 12:53:42 +0200
Message-ID: <20250824110039.28258-1-balejk@matfyz.cz>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_040211_716206_43D517F9 
X-CRM114-Status: UNSURE (   7.90  )
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

Hello,

here are a few patches adding some of the stuff that have accumulated
since the support for the samsung,coreprimevelte smartphone was first
introduced and before it made it into the mainline tree.

The patches are based on mmc/next because it contains the new support
for state_uhs in the sdhci-pxav3 driver.

Thank you for having a look!
K. B.

Karel Balej (3):
  arm64: dts: samsung,coreprimevelte: add PMIC
  arm64: dts: samsung,coreprimevelte: add touchscreen
  arm64: dts: samsung,coreprimevelte: add SDIO

 .../mmp/pxa1908-samsung-coreprimevelte.dts    | 185 ++++++++++++++++++
 1 file changed, 185 insertions(+)

-- 
2.50.1


