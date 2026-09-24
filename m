Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C4CC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 17:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poRJPGt/tQVP3cq5GkCmpkVOZhsjuIUoSdSevhNUZGA=; b=unCfVSPztpGrjzLKxVApCdsWeR
	s5T3Tcue63QlcX9oeD0rehxm6MmtaKFBOy5G26R9yZqBf66vSXOak007lh0Hk7n2An+BA2pAa7rtF
	BmAiD1A2P0tUUCcKDEiXQa8LRQxN579xp+63EcG+Wma7YsPnC2qRP+PoQMJPtP0dxhP1mdKG3YZoU
	YB6Tj9dRZ8Jmxx6fRXVq6o5ODUEugUVBbL0C4D3xBAVH2F+cubNEBHWhJiYjrmNZfQDP8wYXotCoJ
	rJmu5VbSHBYC5vpwfCNa88PLOpQTAcINljmyeUTvEI1IpwcgJ4oAidsj+SlcLtEg4tEpFdc6D0whn
	gyzqj2jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nDM-0000000BijY-18qO;
	Thu, 24 Sep 2026 17:26:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nD0-0000000BicK-1eKh;
	Thu, 24 Sep 2026 17:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=poRJPGt/tQVP3cq5GkCmpkVOZhsjuIUoSdSevhNUZGA=; b=MJvVtw7Xcun7DwimBPf1n5JvaA
	xbFEtfgrdPqrykCSjqXXWivTqj/DeN/AMWKTuzeteXPw6vOhmzcOOYvDarlxI/fAUnWb2QqRfJ2xp
	/CHxr2TVewXGAgxCe5p5/QI+QrTIeIZG4BIIy9cb17FFiLhnCqrMegSZW5Ut86XytnXGaqyH6fyuz
	re5aKYtLS0AgpMHL591MVjoifpdNg6IUhviMjy729R9DHhz0XOP/doSg2WtWm42FZkbPhsWWyvkwy
	X+aQWNIfMUBNa1SXGrQOdzOAIknJHg+GA31rQ3Jd/1Mv5iAOPOLp6hekVgoMg1n7qdNQ7weg/TBEp
	rsFS1yiQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9nCx-0000000GF5T-0o6M;
	Thu, 24 Sep 2026 17:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790270762;
	bh=u1NJ7iPwSqksBo4kmNU/fQeqoWOdC3qmPcDydleD2LU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lHbVv4zv9hQNuIRolAcDt91A1GCx2qvhwkFqutQXOx5pJq+QYe5OZ5oP9wm0kIAbn
	 33iWLGLQ/m+M2vzft3CtzD00TCcpYCB6VU4ejyEXQm8tGfqNOrJsuiv41Mvj/V2Cdw
	 Pn07p6gd9y30eZIaZIUXOdXpmk4qIj1F/XRIYCNtAuzE+5+xZ03zpLZcLUs9prplK6
	 JF+MOXysx6BzryhQtaU75jwSv0EdwgdTI7YtVaAuls1agbqM1fm8voK9BUIGDe11n/
	 4CLouBX3lT25HNNu3dhqJU6GVcbUyKL7rubPWWgSjD5vmqutggb6oNWw/Ew/IJbGOO
	 fpDe/mkEoyMuA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EA9C417E01C5;
	Thu, 24 Sep 2026 19:26:01 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9C546480030; Thu, 24 Sep 2026 19:26:01 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 24 Sep 2026 19:25:39 +0200
Subject: [PATCH v16 3/6] usb: dwc3: core: add post PHY registration hook
 for platform glue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-3-126a2e9133c3@collabora.com>
References: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
In-Reply-To: <20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2142;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=u1NJ7iPwSqksBo4kmNU/fQeqoWOdC3qmPcDydleD2LU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq1XSkON1+jmuTK8OfIgRNDAlr6KqJaBZGik
 m2R1yxjthjG1IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqtV0pAAoJENju1/PI
 O/qa/HQP/As0Dsr4N2pVwEZniLcMcFD+RyyXakRIoCRSTqYU6wsXPX2v2PbWBikGmSK8B2iyXqF
 hLwH+i6G+fwwhiDUWyU2woeffRAPerWm2MlGukNr2JwD94BGTc4IGuqibmda75fX9Q1Ss33t9Eg
 U/tIBijn+c52wSEpqYi+PF1Zijhw4htYOZETdJw/i+bJ79Y7ppKXS/xkjE9558C66macodD5d/+
 nzb19n5cItJSbcHb6BGQCShpgn3dj3McOagSe+HVXVDbdNVr/kFlbaV1pVkYg92QrZlUAhb2O9C
 MK0E/QBE3z8Di/+LHFmWc2R0qjpK/v9FQVlhhepR/nbjP0DLlTlWW68M7zcNZOIcFOKhB2IAeUg
 /NqVfKsKXZryAPTdLI1ZKpXD1xScOROMXSufbGmXRA/ObvZJi4H0zmVtAUuI3UJY8AZRtiSi3ED
 CpJnWwj9nxI03Y+QX6vgtG+9lyMQ+UQd9kruPyip5EbwZKMtD26kSLot1isnXuoZm87JBNtV/rA
 wBNCdRRPc0TcQwMWOZKkUJY7aMt3jo05pP9kp9HT2iS402VmM3xOvE0vOTTg07kAT9iXDJ+EDOO
 a1Mb3l45PWmqA7iZP6o5/nK29ZrHkRPsL+RGTp2EmyGMgaNIAxAjgCKEGt766MJQENEDFdVj+L0
 xsUyBT74fbynZG5b2HHcoNQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_182607_456350_D2FE7063 
X-CRM114-Status: GOOD (  13.32  )
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
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
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


