Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14C9C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=doX1iji9W3eouWKgh6HmyhQpB0O/KpNsmBjN/JmlZXc=; b=sR0ICdhqVfRQ2d5cmrKBF852GD
	gJfJmIZgyoZLJ1iAH65v9mP0lkvdkdPeSroAnF+YrRLNzoVMhwh1+etUaVXpqyJooupS4nghR5s6y
	FP74fGjCFu7jAO3AKIqtZgUdKx3Je3m2utc82tTftUuLKqrxLIk0zl3PN3IW+a4bmMRwIeLjdXiOQ
	2OKyIBhgr5mTCeMaLdHp8ei7EmjSrAphKu2sjPOkL+kF80CvZ6XI9+/7qlw3YoqReX5IOeaVZoDwB
	0G2ByXWvESf/jiWTSPnYv0sIm4VVk6tY1PlLg4UO2WaSFkfzXFt+pPMjkMDA5f850Faj5tYK8lu3y
	KslZmTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Uvb-000000078WC-2BWd;
	Tue, 15 Sep 2026 15:18:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UvF-000000078Rs-35kD;
	Tue, 15 Sep 2026 15:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=doX1iji9W3eouWKgh6HmyhQpB0O/KpNsmBjN/JmlZXc=; b=caXWtVRCQEEzvAYqxwntZydiv2
	ObQBmMJCvBvtO8b5li02kq5QHsr1KL9NGJ1Dz3DhWFY4J4W9q/zsLeyqvCqDTcKCdogxq6dIPWvI4
	TZlPUVE2H7fIWFoS0L00x5jEewoW7BHVFvIqSB8RJScHODKEt3cBalr5pRgRXXiLX0KO679YaBO08
	18DjDyji5YMQz4MNbwsijAyTmh0dbK0h1wW9ZDfngehn2qN5Uu20Q4hZQRikT3GtMgeiAUJi6mfw9
	WUCoqxmK/WiWucpk0rZOJbIctyjfUshbhJzXlONOmhEeHzVW4UKrSD8SvOEgYP6DIy6Lrz2qFHpof
	Wj7Swz9Q==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6UvC-00000006vkG-0eFj;
	Tue, 15 Sep 2026 15:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789485488;
	bh=MYz6XguZYRFZ4/3nNJ/XuJ1PYCEYaFIUdFf95sJVHvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HlffO9R0nkIt8kdPbWs85LU4bd1vKP40e/JICj4qRcGgdF5Rx4ROVk4mGXX+8HsZk
	 JjyH3cue1+TtjQIWP8I2RgeVevfIPEDO/uuhXcd5hebdml/DogsWCXDyUCL8FFbYhf
	 S+jWDsElqQW9llGqLYhP62MQmQoeVIHs2u7i6l17RvbONcIsNZCE0d0L2ZzcNHCewj
	 zDGqK0iLoJPChW7QkZaVftU4P0aMLzGxidpm4Tn+tNk6Ccd70UQ3T5Ui6C/9Wp1hPE
	 hC3nXfTvRpyt3HGAtpV+zz7H79M3udazCq7CaRNmbS8bhQZVYU00/a7Lz+PMW7Sd++
	 hKvS3zamxAEUw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0FE1B17E0B0F;
	Tue, 15 Sep 2026 17:18:08 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C0339480030; Tue, 15 Sep 2026 17:18:07 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:17:43 +0200
Subject: [PATCH 3/5] usb: dwc3: core: add post PHY registration hook for
 platform glue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-3-763bb546824e@collabora.com>
References: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
In-Reply-To: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2023;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=MYz6XguZYRFZ4/3nNJ/XuJ1PYCEYaFIUdFf95sJVHvM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpYa/BGNBrdPkstSJPufa+Kj1IefMXRoHk0
 fWH1gVhwkYvxokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqWGvAAoJENju1/PI
 O/qanX0P/iCmrS/h4fj6sLF5rrWdGs5mYFbqm81Q8fMVgHaz5p5xKnTP2PQl8oxyLOayEp53VDm
 Qf1Z4bE1xVKGhhkW5nh/CtPtnF/ZYXuF5SARN8JKafFS1T5pSKlPB5VrOXga8pyoC2JoZJIw6hi
 VYN5w9a5SbWl8gUCdZR3MoOERkwf9LAouV7xv0p2PuEldQRKUSxUzwZw9sjfJTEhv6iYVI7N+Ai
 sfy64yc8KIu5x7dLXrwu558iGQnObiVgWxXopRtf9zKFVWI7GpMux6VlCSG5x2lGaLs6nDlRRHY
 /KWCigOROGHVDRgy4XTiH7LnkdVqOzr1JAYVIA5xIcJmelr/cEOuX7hx0Fe55DMhp7Z42yYdBB4
 Mga6h0iA6PTifQg4fPL9X2JDgHeRlKzSQNxNZMdD+U3mv4H86AdD/Q1aaJz7czxRmEP1/mrcOnj
 oFoOMp45FEttkvlfVZ5LtjtFNJ7ZrRzVpIQP7KPOE1fXk8E7twef2t/EIFPVkGVqQjnB3eWuhSr
 o/QzG9kByhcaXiTxIh3bUjGuQGKno5AdZLJzmRERBW4M9Xqyc9Z52WTCNsM15XO6LmDRO8d2tov
 FUOubk21rcQnYwtrqCLSJ2pagO8Nn4ankvzs/qerljBsMMvjiGC97EFZIUETW67zwBk6x5cD7xP
 uwbJlXkp49MZra9HC8Qkwiw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_161810_527575_990EA8CE 
X-CRM114-Status: GOOD (  13.82  )
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

Add support for custom PHY handling steps in platform glue code
by adding a post registration hook. This will be used for handling
PHY reset notifications on the Rockchip platform.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/core.c | 2 +-
 drivers/usb/dwc3/core.h | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 4b7132887a03..daf5aec07fbf 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1613,7 +1613,7 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
 		}
 	}
 
-	return 0;
+	return dwc3_post_phy_registration(dwc);
 }
 
 static int dwc3_core_init_mode(struct dwc3 *dwc)
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 608daeb7ef10..e9d8df0a298e 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -995,10 +995,12 @@ struct dwc3_scratchpad_array {
  *				need to be passed on to glue layer
  * @pre_set_role: Notify glue of role switch notifications
  * @pre_run_stop: Notify run stop enable/disable information to glue
+ * @post_phy_registration: Called directly after PHY got registered
  */
 struct dwc3_glue_ops {
 	void	(*pre_set_role)(struct dwc3 *dwc, enum usb_role role);
 	void	(*pre_run_stop)(struct dwc3 *dwc, bool is_on);
+	int	(*post_phy_registration)(struct dwc3 *dwc);
 };
 
 /**
@@ -1655,6 +1657,13 @@ static inline void dwc3_pre_run_stop(struct dwc3 *dwc, bool is_on)
 		dwc->glue_ops->pre_run_stop(dwc, is_on);
 }
 
+static inline int dwc3_post_phy_registration(struct dwc3 *dwc)
+{
+	if (dwc->glue_ops && dwc->glue_ops->post_phy_registration)
+		return dwc->glue_ops->post_phy_registration(dwc);
+	return 0;
+}
+
 #if IS_ENABLED(CONFIG_USB_DWC3_HOST) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
 int dwc3_host_init(struct dwc3 *dwc);
 void dwc3_host_exit(struct dwc3 *dwc);

-- 
2.53.0


