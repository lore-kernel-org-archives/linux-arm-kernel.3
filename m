Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AACE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 09:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KgtALxJqBWoQB4v1+ibC8c5vtvvbQuSbp6eJ9TpCs4o=; b=eZBfaYX5byfsrpUXxdcz60b1rz
	MYgpA7JbEtrbKfX1Gbd24Vo+uH6BiYt4dEMNyk+O6hMFX/B4Igb8zeS2LoqpS8gHFYC/c+j3yfAjk
	aAjkC4SCUsiv2K1fqfDpRWgXbTBwqBrTgtiTtNYbYIoC1J+r0fUTFa9MwFpYqYE8EnAYqvRAaJulX
	drIJ5TYUHe+Mo/NxW5E2t0MRHl1UeT62HRyBmK1VMmnwSZJ4GvJopnXEohwA9N95pO8irXHXQjmTh
	fgc2dfaQfSKFwxRbAuIW2w/iUGcSbFJZyh28+qiempKoB2wofYKM6psLwk4bQfxxKUj++qiQK6gw0
	acWl6P7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSYqS-00000006yHy-49YY;
	Tue, 31 Dec 2024 09:47:24 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSYo0-00000006xeC-35yj;
	Tue, 31 Dec 2024 09:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=KgtALxJqBWoQB4v1+ibC8c5vtvvbQuSbp6eJ9TpCs4o=;
	b=p6SMH6CRyG46D1iaJalUPdckQsBULJUgmM857QpPXRSGSKbX6bCwGcmzq+wk0O
	5yLGIphuAfDHIkWFQa7dJqWoikY2BFlY1zbsFd68bTU2CYMYfsOtxdfaSm/167HM
	3pwy6+h/jNUahP74w7a/MlyqGvVU/DmaCrxN6PX+5RszM=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3v8P6vHNnCZWrCw--.29543S2;
	Tue, 31 Dec 2024 17:44:29 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: krzk+dt@kernel.org,
	mripard@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 0/3] Add HDMI support for rk3576
Date: Tue, 31 Dec 2024 17:44:16 +0800
Message-ID: <20241231094425.253398-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3v8P6vHNnCZWrCw--.29543S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFW3Kr4UZr1UWF4UKr13twb_yoW3Zrb_K3
	4Sq3s8ur18uF1Yya47tw4xWa93tay2gFZ5GF48K3ZrJFWkJF48Xrn3JrWYqa4rZF1YkFnr
	Gr4YqFy8CanIyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbySotUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqR7GXmdztQzPNgAAs7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_014453_163518_41D0C948 
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

From: Andy Yan <andy.yan@rock-chips.com>


RK3576 HDMI TX Controller is very similar to that of RK3588, but with
some control bits for IO and interrupts status scattered across different
GRF.

PATCH 1/3 is add platform ctrl callback for IO setting and interrupts
status handing.
PATCH 2/3 ~ 3/3 are add support for rk3576

Changes in v2:
- Fix compilation warning: unused variable ‘val’ [-Wunused-variable]

Andy Yan (3):
  drm/rockchip: dw_hdmi_qp: Add platform ctrl callback
  dt-bindings: display: rockchip: Add rk3576 hdmi controller
  drm/rockchip: Add basic RK3576 HDMI output support

 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |   1 +
 .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 225 +++++++++++++++---
 2 files changed, 196 insertions(+), 30 deletions(-)

-- 
2.34.1


