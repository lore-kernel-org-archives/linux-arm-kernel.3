Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A574CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 14:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oukDpaS+uQqfcVkvyqZdLUiFXATfOVv8cluQMdiSVWE=; b=HkWhX/KEnOgNOS7NMMUjB5p4ri
	IMAKlO/2fPtFHjb4SogNQFIooR2JKqMEx+in7RpBVo3zvAWFsBytfg6keg345qI7AzmA6PDYNMoaZ
	GqmM+YLv75O/6sacmgehdvCf4snF+uf3mdgpSqQROxfoG7MwSJMgG++NadS/v0UkxBy7UkD2hF9Lk
	iAVX+HGaFJSg0gu+BJ8BdkZY6yUpMeXyc+pMFFoPos/CDlFWxN0nJr5sokLs+CsmN8e15HXIZF7L0
	1Ndbipq5/tFDszAlwIx0NrcWXeaIu5ABO4BdKvca41o0F+kMAzOjdh89vABilx6hopOP71OEWvTqp
	aQgIH20w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvGDR-0000000BRh1-2XYd;
	Sun, 07 Sep 2025 14:18:01 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvFua-0000000BN6x-1US1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 13:58:33 +0000
DKIM-Signature: a=rsa-sha256; bh=oukDpaS+uQqfcVkvyqZdLUiFXATfOVv8cluQMdiSVWE=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1757253360; v=1; x=1757685360;
 b=jVmUZxFOgn0W2IlJ7J9Y/4aN5e0+IN/0d/LXnysY+M8LCLjBpDXgQihbKnwlFy/zFxO1qKA8
 kZ+613p+Lq86p/VoHnFD/yLMA5HxY0oqhERRmSZ1v4jijPmOxlpuj2N+TzZgPtFGHwyiXzV1dlk
 WNxUY8P57kmTOoyU9OXQJolbdr24wbHNDKLW3kirXK/3/LdvpRsoeLU/KRbxsf+gb/OXyEg8j/n
 mKzBr1g0bDk6fouio1IV6cS542lEoGBf79qAO6CiwqKgXfcg6d8ALbQcqvdEAXUzO2lo/njUEOK
 ulf5UCPf2jjMXMUCTIagHNZgoXa9iF9fnVscZJxXPc3fA==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id b2549ea8; Sun, 07 Sep 2025 15:56:00 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Sun, 07 Sep 2025 15:55:14 +0200
Subject: [PATCH 1/9] arm64: dts: marvell: samsung,coreprimevelte: Add
 backlight
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250907-pxa1908-dts-v1-1-da776eb29e45@dujemihanovic.xyz>
References: <20250907-pxa1908-dts-v1-0-da776eb29e45@dujemihanovic.xyz>
In-Reply-To: <20250907-pxa1908-dts-v1-0-da776eb29e45@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=duje@dujemihanovic.xyz;
 s=20240706; h=from:subject:message-id;
 bh=3n1cVAjfm4iMd5ytnRCe0bLiwYBnKiHaKl8qPthmrxY=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBl7+949Koj3se+zmrD72+kNXZPyJW4ruaZ7ukbGuXx72
 7tyfvGpjlIWBjEuBlkxRZbc/47XeD+LbN2evcwAZg4rE8gQBi5OAZjIszWMDBuk982uPM+7nP1G
 oFPJ9VutD7vXfdUzLnt7/9uk9toVgUUM/ytzWeafPvL870ne7mC3p45KBeHdK39bf+O+U/kxL/f
 NOU4A
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_065832_546201_5851991A 
X-CRM114-Status: UNSURE (   8.58  )
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

Add a node for the KTD2801 backlight chip found on the board.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index 47a4f01a7077bfafe2cc50d0e59c37685ec9c2e9..b9628b1f59f2f749804799e3d9faa48e3036e81a 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -115,6 +115,12 @@ key-voldown {
 			gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	backlight {
+		compatible = "kinetic,ktd2801";
+		ctrl-gpios = <&gpio 97 GPIO_ACTIVE_HIGH>;
+		max-brightness = <210>;
+	};
 };
 
 &smmu {

-- 
2.51.0


