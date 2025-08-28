Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AECC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 10:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K80fcFHY5a9NMiV6VDmMXpSYx0HJpChBee/Af1LV2E8=; b=iXrpVIQw/8DJRE7Sq5ODHcnNPR
	zHEga48+un64DoPy8K7rw+NY8iLMt7Aaw4R8yZL9RPO4/gm3P2x59aoBmgGUHH/nah2I1AbV385J2
	10nNfACTkmrygkRk10isCecE0ftDoLM4PGo7fVh6xFAkfz2uqWcNABWxZ+9m5WQzxF0WD1ArUveaq
	B8005f0CFflTJq0czB2XyrOHm6q8XO0TAZ7xbhbba45GY6ZFiY+GVZ2Lu20RH+VP1yIY6KlVwbXXC
	VUIIFm172UVLGMztvwvgy4iOzn4YKaaTB6qVqOFU3TI7HVXLOvzrdoAi2MdbTBZYVXz6+LmsrtMBj
	aWSt0Lrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uraFP-00000001ENs-20ev;
	Thu, 28 Aug 2025 10:52:51 +0000
Received: from smtp1.ms.mff.cuni.cz ([2001:718:1e03:801::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZI8-000000012Jq-28kO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 09:51:38 +0000
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1756374648; x=1757674648;
	bh=K80fcFHY5a9NMiV6VDmMXpSYx0HJpChBee/Af1LV2E8=; h=From;
	b=ZGQQ6g3sXjY2uBDKqFvSj9DZUls+aYnNlAbu54TFVxWNN9wVpGMbzDp/fR9whOz0k
	 SaXW13W4DlWwJYiiLssjRjFhM5Hrr6DEpaRzdt299yujkq8RG0XtzEsdAn7aa6aGje
	 9PIgT5zHRk9xK/vv67jMGnct+XEkfgx2ZvnbBGVDXgQZB16pc4m0f4I7puo2HsWBoE
	 wyq7lUhD93T2wMjvbP8BHMghvRJDA1l0zBSBj2vZJ+vsKQ5H3jx9k4geyYTpmb49ub
	 Qtg36lRGUs5IuT7qKiLcTuUqM5+Ej2qaH6TfPtV/OOM2TWb4OSN4Od1r5GkH8DpLGC
	 KvXANzY0ZrBLg==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 57S9oh2W046271
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 11:50:44 +0200 (CEST)
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
Subject: [PATCH v2 0/3] samsung,coreprimevelte enhancements
Date: Thu, 28 Aug 2025 11:49:01 +0200
Message-ID: <20250828095028.24503-1-balejk@matfyz.cz>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_025137_279293_A741AB30 
X-CRM114-Status: UNSURE (   8.40  )
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

v2:
- Drop confusing patch prefix (thanks Krzysztof!).
- Link to v1: https://lore.kernel.org/r/20250824110039.28258-1-balejk@matfyz.cz/

Karel Balej (3):
  arm64: dts: samsung,coreprimevelte: add PMIC
  arm64: dts: samsung,coreprimevelte: add touchscreen
  arm64: dts: samsung,coreprimevelte: add SDIO

 .../mmp/pxa1908-samsung-coreprimevelte.dts    | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)

-- 
2.51.0


