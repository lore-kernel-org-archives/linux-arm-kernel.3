Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1A7FD8741
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LmcQWcTpui/IS83jy38IVoTuQN9QElDGWF7h4ph+PX0=; b=mJM7TksYccwBfkDFeN9vOIlQCy
	5KVYTIX/C3kAvZVgqNFeu0fnK5RJ3FZ0/hMQubH7r6jQ+sYcyhu5YqJWx9tpljjYbFvtiUQtkVaNh
	aGgvyq7EDmvHCe6GKK/hmjBqw3hSnIeEWbBkE2horewoR/nV6vwEl08HxCHsH5jEc2+JZK3MR/UJQ
	aSNHnMkEsFSRVE67ytZBJuTjf/t2R++VRLItO112untXj5XlycQFLw7Hc6S7/mkqztfJsptx5j3Wo
	5jB1NRm2DJ4PzMIfQJgJ/cWwpJ0dW6yFRBavXy+TzTUaqEd7ybR4sgTmJ/yFX3KrHu6hSaC7Y6y7H
	cARIjGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2Z-00000006F7q-3blP;
	Tue, 17 Mar 2026 11:56:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2Z-00000006F7L-27bD;
	Tue, 17 Mar 2026 11:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LmcQWcTpui/IS83jy38IVoTuQN9QElDGWF7h4ph+PX0=; b=jA66khrXG1JfaRuLe0f6xMuOOB
	p/yBjDQl6OlxWMXr6emv8Sg3T50ycUAgwH6SPACMluj+b/qac+OGR9Gp2YKeLfKfkER2CmqkBIzFG
	Ja4VPxpnNlUa3WkWGQk0baCnl9GM9lsFASggawd0lpRJ37newSUR0f4XLrLnHWMZWeoT7IkflntQa
	nQKzeuKFEgZOW250TC/5PWIzrSJtJpeIqn/XHsCdZQROvqzrm1ZUj3hVZasz+BUUdt0rOnnU6vy+4
	Y0eR6RcMvNC//L/fHAbe/u9YYJGB2uYDNH9v+5Kg9YPrIy4+ZUZQJp3XIRTvYgbdJpmKnhYDyBtyz
	FZhpr+Zg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2T2V-00000008ta7-2qpT;
	Tue, 17 Mar 2026 11:56:50 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62HBsBryD3851622, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773748451; bh=LmcQWcTpui/IS83jy38IVoTuQN9QElDGWF7h4ph+PX0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=qbgO9yzCkcfA2EjlD81g71Xx8XE3t0P8tk94sCgMWO7ukxLFz82vkCcK8FsU0A/l0
	 flBPBQnCpb7OtpjqH6hPojOeNTYCM8UXr9sgpWJY/yYWUqGRKe+C2MU7i4xGnJ3Ajw
	 uUIDv2A2puI+kS+6yuJ5NqxLXRQaViaIQ0AsD+DO5AtiDkhpn6A+2Y257Q1R+6xchu
	 duRO9BA6Bi4gIM4ev5uuPP9Sh2LYoa4ubsYvC9HkbYT0gjYwOLJnmxNvywWAggv6Iq
	 NSeNMXP8NxRiHP2xT/EDYoWRTl4dC6aENRlwbbS5Ew+gz9dKRPcFlz9sQ+RPpfcydi
	 u1iApzvr0Qqrg==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62HBsBryD3851622
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2026 19:54:11 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 17 Mar 2026 19:54:11 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 17 Mar 2026 19:54:11 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS05.realtek.com.tw
 (10.21.1.55) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 17 Mar 2026 19:54:11 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <afaerber@suse.com>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <james.tai@realtek.com>,
        <cy.huang@realtek.com>, <stanley_chang@realtek.com>,
        <eleanor.lin@realtek.com>, <tychang@realtek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v4 1/8] pinctrl: realtek: Fix function signature for config argument
Date: Tue, 17 Mar 2026 19:54:03 +0800
Message-ID: <20260317115411.2154365-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260317115411.2154365-1-eleanor.lin@realtek.com>
References: <20260317115411.2154365-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_115648_260321_C067272D 
X-CRM114-Status: GOOD (  10.85  )
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

The argument originates from pinconf_to_config_argument(), which returns a
u32. Therefore, the arg parameter should be an unsigned int instead of enum
pin_config_param.

Fixes: e99ce78030db ("pinctrl: realtek: Add common pinctrl driver for Realtek DHC RTD SoCs")
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
Changes in v4:
- This is a new patch.
---
 drivers/pinctrl/realtek/pinctrl-rtd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 60dfb39bc986..16cee851393e 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -280,7 +280,7 @@ static const struct rtd_pin_sconfig_desc *rtd_pinctrl_find_sconfig(struct rtd_pi
 static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 				unsigned int pinnr,
 				enum pin_config_param param,
-				enum pin_config_param arg)
+				unsigned int arg)
 {
 	const struct rtd_pin_config_desc *config_desc;
 	const struct rtd_pin_sconfig_desc *sconfig_desc;
-- 
2.34.1


