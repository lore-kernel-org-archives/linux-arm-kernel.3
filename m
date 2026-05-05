Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E931ECD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+weT3KNEWHRZNkAbVSTMGJxpE357XP50uaxJaJN6zaQ=; b=dgClh33KcwYzNS24HfqfJ3jUPl
	kZwYuvrhPErGp6wBwdyfyDl7aqrQQGkdq703SujoRA1djxTbNy/ae8LMWtXBxjNBa0KBl7VX7OuUD
	TTBOHuOpZtrJXuAgsLhPndtBEEUNE7fzOcJ+d4QofpoUOFCS++OxoNr88FyafIg6bj0HcQVocRWR8
	yGvRr2ZfC8aOK1al0S3H1fnseU/QDxQiHEIf8z6zNz7usY3XNRCzBaOV6pbXyREseu/JiUS0tz38l
	JAoAZ0m8F8sRXGYLF1zzi+Hx225RxJgcgUNXdA0TibUVhGmngZHHx+L7LFeIMw+8okU4pj1akkhKY
	1jGILRNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDUW-0000000Fxtu-425j;
	Tue, 05 May 2026 10:59:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDUV-0000000FxtN-0VAX;
	Tue, 05 May 2026 10:59:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+weT3KNEWHRZNkAbVSTMGJxpE357XP50uaxJaJN6zaQ=; b=LsU7dSXOoMP8t7eyEP2L9RuZ41
	QaCDLNddbXXnKsLk54etBw5N9pwpuGhmDQgD8ZHOOH9atbwfzksJABZ6ParTldvjTLSO+d7B6tuPK
	iyi5SEvzQHSEwc6FwEHiEe76rhUwbBytRUSDb2uxtUmClJixbaJKdgpAUy71+GFNNYvtAWybZLOgk
	isjTqleza+y3TvcX8s/DCdNTjo8uXf+Vo4/cxEul6xKEcmsiEV6SsDjZs4yTjhySBbHkDjPXS3buB
	RmP0fI534CkyAJxPCibeoEvHw7Zx0eG0onx4moFbQ6XOYib2Mnjx8T75CpWwJg/lET1XFyizEUJNk
	lmqPT+mA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDUS-0000000DHxd-01ag;
	Tue, 05 May 2026 10:59:01 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 645AwcMuB1171994, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1777978718; bh=+weT3KNEWHRZNkAbVSTMGJxpE357XP50uaxJaJN6zaQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=BSAwxvNnxeKq53eNbASK9q+fR0UVjwn053a9HQEJnofJaGi6PsbHM7JBGwxw0MnRA
	 4YeEd7dIj3+ECjtk09LkoBgdAxv1fxnsOcw/UlW0XZ/UHh0LaQ4U79HkqSUrBN1o0V
	 mqfh6z2j3SqYnpD2PHb19kZN9EdaKRCNyw8ktE/TCFZouPqWfejeVYYHxyLcV/uDl4
	 b3ooxEghLByozK0BBQOGA9xp07UKGwCHTt5G6Fw5CiV334esHKWHuGrL/bOglwzzKr
	 hltxjeYshh1MctPBPk4qRks+i3ySyCCA9OnS7Tyv3nkMlSn3OMGOkG+SB/Hu6D655I
	 cYqWn3m1UE5kA==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.27/5.94) with ESMTPS id 645AwcMuB1171994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 May 2026 18:58:38 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 5 May 2026 18:58:38 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 5 May 2026 18:58:38 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <soc@kernel.org>
CC: <james.tai@realtek.com>, <eleanor.lin@realtek.com>, <afaerber@suse.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        Linus Walleij
	<linusw@kernel.org>
Subject: [PATCH 2/3] arm64: dts: realtek: Add pinctrl support for RTD1625
Date: Tue, 5 May 2026 18:58:36 +0800
Message-ID: <20260505105838.1014771-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260505103955.1010130-1-eleanor.lin@realtek.com>
References: <20260505103955.1010130-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_115900_438303_9BE5B658 
X-CRM114-Status: UNSURE (   8.62  )
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

Add the pinctrl nodes for the Realtek RTD1625 SoC.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 arch/arm64/boot/dts/realtek/kent.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
index ae006ce24420..8d4293cd4c03 100644
--- a/arch/arm64/boot/dts/realtek/kent.dtsi
+++ b/arch/arm64/boot/dts/realtek/kent.dtsi
@@ -150,6 +150,26 @@ uart0: serial@7800 {
 				reg-shift = <2>;
 				status = "disabled";
 			};
+
+			iso_pinctrl: pinctrl@4e000 {
+				compatible = "realtek,rtd1625-iso-pinctrl";
+				reg = <0x4e000 0x1a4>;
+			};
+
+			main2_pinctrl: pinctrl@4f200 {
+				compatible = "realtek,rtd1625-main2-pinctrl";
+				reg = <0x4f200 0x50>;
+			};
+
+			isom_pinctrl: pinctrl@146200 {
+				compatible = "realtek,rtd1625-isom-pinctrl";
+				reg = <0x146200 0x34>;
+			};
+
+			ve4_pinctrl: pinctrl@14e000 {
+				compatible = "realtek,rtd1625-ve4-pinctrl";
+				reg = <0x14e000 0x84>;
+			};
 		};
 
 		gic: interrupt-controller@ff100000 {
-- 
2.34.1


