Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B873CD4F41
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 10:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5BPOQJ0znU3/GO+SnUcWdFOdPAQKn5ET8agZZ9+aIM=; b=J322eFu7HFC0icNerUNwhfqpOR
	hYTfAJ8oJ0V8Sea58L48IJUUsNiHrNg4CbxjIbNKFr4c0TvBQeGCEhVYcdIOOPSvPoxootjKUbRuS
	THTcTmnAR81TScMPzrK1nKjeuAUPMeXtj1QoiPd9jsgGIqwNFCN633t04Ug02oUbH39yQWH86YjRZ
	Di2k3+37etpfXIke3x1rd5rNa/2I1a0qDV/8pptJ6vKgLlhUIqKM4TkRfmsSge6MitSBWOJuJlAOJ
	CrK6d+Lj4mUwi0NuSYC0KQQvxd1CcemBQvBN9dEB6fKJpWUZiPRsS6nnqkufisw7IzfiVicvUIdtU
	PJ0UZzkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74s-00000002EWU-3Lai;
	Wed, 13 May 2026 10:44:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74r-00000002ETj-0h8k;
	Wed, 13 May 2026 10:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=o5BPOQJ0znU3/GO+SnUcWdFOdPAQKn5ET8agZZ9+aIM=; b=lhBXLUvuei4bIQzgAFV96ioGq6
	Di+XmUR00ljRc0szsJr3CmkmiuwYwH8UfvmI/ft/pbaHT3efKYHq9iS4g7CSmfYdsmL3VGQWDQD+c
	MaJTEWX+9UblC8Q3vwwqrVhAImpoWwFKEeAR9Wqrq61w6081FYPZRjkXyUYv7yEK0bKc5oPKsrl+M
	8M8q+eUEU7zd+36SIQETIcqA55JJQXUBL5sQCzPfyObCNksAsdSxqcbjVnHA7d/h4PPc4DogH3NLm
	wKt5XDI/XoPLwAhXgVzMPEzpvRjRO7jxlYrs42J14jdJdwsyHEblokwQhekPuJXvE5I6Yc/GvlRf9
	Bix4lDoA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN74n-0000000HBNk-1WIf;
	Wed, 13 May 2026 10:44:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 528C0442CA;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EF2BC2BCF5;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778669066;
	bh=D5pKwkGTYVUDViuNvaK69HYxWd8+FsaP+xhOfkL+fcw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JQB4xHLYSZJtHr6Sb0Nm1y93yeG6NYoOTQ6Wyti7ZSKt4osOvbnZL0tEh5Oj0dkbH
	 2iNLTckRxXWi1UFiyex4YgSsrxsTHTwKo30DtiaTiwX/uVleKdHl/o0zDcBw4znmux
	 Oc7LITIphVO1753TxP6OxQgrvbuGaV7KbyjJO1Z37W+nZ1xJo/NnOSC7nbHSalZO/p
	 NzrTtj9uCj2Nraf85ZL2wNjUvoJ0H/EIM9E9Ar9hkC65ehAtmYpVYtReGMAX45IKcN
	 OYDgPfREz5f9YzALLewmeal3spIrzlI9IgGtfWTRFnjeNeO06dEDHhNVywAunjw1vm
	 cSHZjS6Th+68g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F31CD4F39;
	Wed, 13 May 2026 10:44:26 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Wed, 13 May 2026 12:43:54 +0200
Subject: [PATCH v2 2/3] arm64: dts: amlogic: t7: khadas-vim4: reorder root
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-add-kvim4-sysled-v2-2-3ec9779e8875@aliel.fr>
References: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
In-Reply-To: <20260513-add-kvim4-sysled-v2-0-3ec9779e8875@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=3G/s+tL1aEZqmNnatksprjAgR3heihJkkWRnLe3A2sA=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQxZLGNv1+I0r086/u3rve8enBxNKzk5j6ttW4f/N6P3zC
 sufopyFHaUsDGJcDLJiiiz9cy1PvLt89MzXPeopMHNYmUCGMHBxCsBE4rYwMqzYztjWVZ20+8XC
 VWesIuae+2tocXK3j+Fqz798R9coHF/N8D/yQNV77SCOUwGTPq49bTTHY8HTmOQJNzSlZ3DUulq
 ZqrADAA==
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_114430_228521_2DBDFD25 
X-CRM114-Status: UNSURE (   7.85  )
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
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

Move the xtal-clk node to restore alphabetical ordering.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 .../boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts     | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 69d6118ba57e7..fd1b983354a01 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -45,13 +45,6 @@ secmon_reserved_bl32: secmon@5300000 {
 		};
 	};
 
-	xtal: xtal-clk {
-		compatible = "fixed-clock";
-		clock-frequency = <24000000>;
-		clock-output-names = "xtal";
-		#clock-cells = <0>;
-	};
-
 	dc_in: regulator-dc-in {
 		compatible = "regulator-fixed";
 		regulator-name = "DC_IN";
@@ -155,6 +148,13 @@ wifi32k: wifi32k {
 		clock-frequency = <32768>;
 			pwms = <&pwm_ab 0 30518 0>;
 	};
+
+	xtal: xtal-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "xtal";
+		#clock-cells = <0>;
+	};
 };
 
 &pwm_ab {

-- 
2.49.0



