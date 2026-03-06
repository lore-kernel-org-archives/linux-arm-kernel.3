Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F7EF01808
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5rvWd0k2xpP7GL97y96percGRFgA2G16AsJIxxaO0g=; b=0Aud4RdyAUWK7U8ERJfdOORgXK
	GIvvAJ87htRmIGen4ntvy19uxqeAGJr3yFH2Ciswt1GXZPlQcFrg0xu+81RoLBK8feyfvyUoQJ08H
	1vIoDBFsxgEWnQU+dOoRZqrJuVRJsRrubORWNiAiMLOcJ1LsOsv02LwrCIdlzBWYI+Pt7O4F95lYQ
	9RkL3tFV2mk0jTtnLZp7JP27L/2D/xkkCzu1/i//d1LeznqNjX5TBWSOqaU4+9f8R9v+TUndu7rVl
	R2DN4zqsX4m1ZR7od7dZbfRiHCuve9+8r8e+FEdnl58+cWGwl9xNFfK/YObUgq5Me4nwaZKFMqB6R
	kAbrRADQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1v-00000003BdO-20f9;
	Fri, 06 Mar 2026 07:55:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1q-00000003BaZ-2a49;
	Fri, 06 Mar 2026 07:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=l5rvWd0k2xpP7GL97y96percGRFgA2G16AsJIxxaO0g=; b=GjtBXs59Wv26YlZzdcxXESTljF
	J/M1Lh1WSufbbsewfct8Ayj2qHgG/G296UsMFw7E6Lz+LqeGp2Uk8EWPIjL1RtMgYoEOT5nSzOfdO
	dYun2PfvFM2p21aobKE6vnbvo0VKENPHEey4YcMbTk72AlGQzUTovY4dBIkX/ACqNn6o3q23c/Kb9
	5tj5QNytHNVUhIIAA3KZn5hRjXZ8XcJNNf1VNj68Q04zYmEcGfxcECoi23CITmz2iMHfHBpDcZdfC
	4bo5wTKVPpFBUh535Fx1EYHol0pCmIfiMuzVepkxoLr93JTigwHpTmmMMy6mlb9RKT+A1bLwV6+vu
	epq7vUVQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1m-00000008EKx-1N7Y;
	Fri, 06 Mar 2026 07:55:21 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qj9wB2977150, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783565; bh=l5rvWd0k2xpP7GL97y96percGRFgA2G16AsJIxxaO0g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=Fl+14SCUX4qeSoxNLeKvmSeIiXqa5YjA9AScfEspNMUm5alqg9IVd/foQd0gvbEit
	 iRv7HxH95NZ8lZG8ZRCs6Hnm9nMwsv3rYqUzbiFN0HnBp7B8Cvl+ODjHC7YAhr+sGq
	 /kejLo04/CTNlEj7Pj2gH848rV80yrz/ql5SSQ/qKggQn8Umb0+VnUbTFe28WP3Sig
	 FB/3R7km+PWcFFfEhw05HE0yYmBM2iD+S3cqRARYAlzafrN987UeXVKt2LasCRdsJp
	 4bYHKX8q4yEY6VtBuJIov5NoqsIEahMqUvu253EmxAXpnCwPoZcBFTCFZT54m2ZxZ7
	 5V1algWrM4+pQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qj9wB2977150
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:45 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:45 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 15:52:45 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <bartosz.golaszewski@oss.qualcomm.com>,
        <afaerber@suse.com>
CC: <james.tai@realtek.com>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <tychang@realtek.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v2 02/14] pinctrl: realtek: Fix return value and silence log for unsupported configs
Date: Fri, 6 Mar 2026 15:52:32 +0800
Message-ID: <20260306075244.1170399-3-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260306075244.1170399-1-eleanor.lin@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_075519_141162_7E52FBEA 
X-CRM114-Status: GOOD (  11.42  )
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

From: Tzuyi Chang <tychang@realtek.com>

Treating unsupported configurations as errors causes upper layers (like the
GPIO subsystem) to interpret optional features as hard failures, aborting
operations or printing unnecessary error logs.

For example, during gpiod_get(), the GPIO framework attempts to set
PIN_CONFIG_PERSIST_STATE. Since this driver does not support it, false
error reports are generated in dmesg.

Fix this by returning -ENOTSUPP and demoting the log level to dev_dbg.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v2:
- Add Bartosz's Reviewed-by tag.

 drivers/pinctrl/realtek/pinctrl-rtd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index eafa0d7bb19d..41e7f5c2bf74 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -456,8 +456,8 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 		break;
 
 	default:
-		dev_err(data->dev, "unsupported pinconf: %d\n", (u32)param);
-		return -EINVAL;
+		dev_dbg(data->dev, "unsupported pinconf: %d\n", (u32)param);
+		return -ENOTSUPP;
 	}
 
 	ret = regmap_update_bits(data->regmap_pinctrl, reg_off, mask, val);
-- 
2.34.1


