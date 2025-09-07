Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78048CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 14:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdoZWJ29lkU0+qhvf74LNyzbowJt2tUetslIJtxxnAM=; b=CNq2fIdx2NMFLAXUZ+OU8oEUAU
	BkATlRmn0FFczVg21XzFyAoeWgI9UNYCqY0lIl4TF/DYDF6JcUDKw4AgE3yuRMF97Um3Uet/+TY2r
	JvvQGJkp0ciP8gYchQ7em59SwKUMzsDVo1uKYh42hhe/AtnuNKzMSQGiePEC375X1ohoEQdcBoRcH
	zcjdNButn5H+CacS0hvvdei/7zfuKnF0H8tbXphN7dD/gt4Y/fxR6XMvftNdI/Tg67N493cT29nMS
	1mov0qH5VYqDM9gcwt3HuB22FINCFK2szeJhjqZaxTmQALVniVxmKAQ5WHgjaiSJM47zWc/9ot2Y2
	uflMJRmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvFwg-0000000BNyM-0ONN;
	Sun, 07 Sep 2025 14:00:42 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvFtq-0000000BN6u-1kuM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Sep 2025 13:57:48 +0000
DKIM-Signature: a=rsa-sha256; bh=BdoZWJ29lkU0+qhvf74LNyzbowJt2tUetslIJtxxnAM=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1757253367; v=1; x=1757685367;
 b=UWsNEYuxlHUp51TD3k0DoN6xbqLQb0AWhjQ8IIiVxZnXrDt7SpzjDEYcH/XhHbpYZ2nH8U0M
 DVHjIWf8qUbT0GfYXGVkgjSVbntuHgT34wiaey9/4Og+qd4gBVtnWp7m+dhtU6ABR7eRPY8ObVm
 oDM3/BdNwdlhte03Own41kZCXzbX9c2n/3dtXKxAkC9QOywg1M0KvSpw37wa5C1E/NYRnoktnvF
 O+lR3DUW23lsHPx7b66CXKjxLSJ7kORFAEJRjNO1aqWgI8roaVV1VgUWE66bILue5jrcMMjUANV
 FE69R29QkYk1ZeWJSb0VUHmaPh8FtJJiyUzpwGM4WjORQ==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 4ac8fad6; Sun, 07 Sep 2025 15:56:07 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Sun, 07 Sep 2025 15:55:22 +0200
Subject: [PATCH 9/9] arm64: dts: marvell: samsung,coreprimevelte: Add USB
 connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250907-pxa1908-dts-v1-9-da776eb29e45@dujemihanovic.xyz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=925; i=duje@dujemihanovic.xyz;
 s=20240706; h=from:subject:message-id;
 bh=UoJNCWjZnaplQXJr+hNjiSMuZ5Y1BK5iXqLcT0rH1m0=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBl7+95xqgUkRkfqvDDcYsM06Ym84j/uwPWrhe3/CL/fY
 Nv3xeV+RykLgxgXg6yYIkvuf8drvJ9Ftm7PXmYAM4eVCWQIAxenAEwkcBIjw+qtDr1PTvVWitXt
 3Pop7ZTvxaYetrobr5Uk3ts3drW6XGb4X/fIxuCtyhJGS+u6Y35fJ5WbCqT9MNW5GRM1r+TILns
 VPgA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_065747_355773_21E5FC6B 
X-CRM114-Status: UNSURE (   8.46  )
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

Add a node for the micro-USB connector found on the board.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index b3741389e2ae056714ff4235b972bc72b5560455..7c96eaa33b1ef0176811f3b4d915ce1a69cc690b 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -68,6 +68,12 @@ muic: extcon@14 {
 			reg = <0x14>;
 			interrupt-parent = <&gpio>;
 			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+
+			usb_con: connector {
+				compatible = "usb-b-connector";
+				label = "micro-USB";
+				type = "micro";
+			};
 		};
 	};
 

-- 
2.51.0


