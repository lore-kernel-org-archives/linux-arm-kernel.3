Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAADFD74958
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 12:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZCQu8PNGzbUydOutittbytVy0ecwKj8suiZ8x5X5G4=; b=hPkXypdHAhT5NxZQFgZL6HLXEu
	ZmHdmW78zFfODqArLNH4IVVa8HGn9SwKwHhECS5Vbzhb8YkZfvzTAGzUnn/0HTTyaLW0xH1hXhZC7
	0GSdmtrQTmgD645NwENEvcqD41LX5Ye+kHX3hW+2uPN8yqCs68ZBY8DuvfqtGhurxC91Ka5ok4uA5
	UrwSTRK68MbketRik1sbvpoywHjTM4iSfM1kRdE5wUBL4kilNOW52NR4p75lAHj4KmZAkzjyTmsnT
	bHeC8FdLiMAnc0luSbv1zxOuSIYv1g5VIYAwD27ixNqysXgknjSGNL5Dmuq0i+5teKbOmqBWI7SQ0
	vjsgMRzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Ugj-00000003bYK-2aR8;
	Thu, 31 Oct 2024 12:54:09 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UPl-00000003Xmj-2J7Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:36:39 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 44144A03F3;
	Thu, 31 Oct 2024 13:36:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=ZZCQu8PNGzbUydOutitt
	bytVy0ecwKj8suiZ8x5X5G4=; b=QCcmYDL6+v9xdH2YXHTS7Zqz/CItscCRXo7A
	U31p5LHGEfDle6PKu1dvjJyOg+Nu3Y6wcj1P2gg5jzB28PH0XQHA7l6rpE0icTpi
	p/Gal6rddtTEREjAqZg0UeU3JBu+XiDeJ8DXx6aQi5YS2y+gJs3nxmTjfnEqas6i
	f+869DVnKhzTwNxJZoeJ9sj9yjXTd0NxLh1scTR2yrXz/6RPEeN7zYV44AbzJVnt
	4Rgnz3NTS0ECoIoYRP+go+slK+Ng7ANLP4iEQosE5GInaKUfJz8PtdiHkozTIVnS
	KucnLC76yvihT9vsdNCvtvNke1a64ORY+8SkMGxr/P4axIuZHHtnfNaa5lgnsDE9
	Phm44+r2xGmUjea+j/J2nXZ0nTaipj1TqUSIUPtdZ8sQzf3884qW/3pd7TXv8rpi
	Q1GOZ7Or71GCg2ZOdCHPCL5UOcaYinW/DrlGPNzAAnXg6Ss/G3eXaJ3zpCLvMcSY
	ygd3dY1D1StnLbu/SHKyGGSOBMc2uqKhcYSDi8HAgAopmi0mFSxqsseSb2y790Qb
	eiZ6zBnuWpuJeu9kz4VM7m3txxq5aEKgiuANX4H1CLhww7v3YgyU3Hmy71s2oVGh
	/N6SY6ZJ9Rm/4Pr+SBbWQDW3HYsedhG4c7z0eK9lGPlIKtwgj7Pq3Mzzq7tsHmhF
	aTDPnqA=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v4 10/10] ARM: dts: suniv: f1c100s: Activate Audio Codec for Lichee Pi Nano
Date: Thu, 31 Oct 2024 13:35:36 +0100
Message-ID: <20241031123538.2582675-10-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031123538.2582675-1-csokas.bence@prolan.hu>
References: <20241031123538.2582675-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730378195;VERSION=7979;MC=2596984542;ID=207190;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855667667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_053637_756967_1B00FD72 
X-CRM114-Status: UNSURE (   7.80  )
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

From: Mesih Kilinc <mesihkilinc@gmail.com>

Allwinner suniv F1C100s now has basic audio codec support. Activate it
for Lichee Pi Nano board.

Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
[ csokas.bence: Moved and fixed conflict ]
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 .../boot/dts/allwinner/suniv-f1c100s-licheepi-nano.dts    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/suniv-f1c100s-licheepi-nano.dts b/arch/arm/boot/dts/allwinner/suniv-f1c100s-licheepi-nano.dts
index 43896723a994..472ded0aafcf 100644
--- a/arch/arm/boot/dts/allwinner/suniv-f1c100s-licheepi-nano.dts
+++ b/arch/arm/boot/dts/allwinner/suniv-f1c100s-licheepi-nano.dts
@@ -62,6 +62,14 @@ &uart0 {
 	status = "okay";
 };
 
+&codec {
+	allwinner,audio-routing =
+		"Headphone", "HP",
+		"Headphone", "HPCOM",
+		"MIC", "Mic";
+	status = "okay";
+};
+
 &usb_otg {
 	dr_mode = "otg";
 	status = "okay";
-- 
2.34.1



