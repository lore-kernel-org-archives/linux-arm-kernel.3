Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C300C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 02:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwIQVsJa3bKVMiFSZ+kPNaDWDdjE00ekRDJBwDGVRHQ=; b=iBOOSsARQYJ982BRbzQ3rWy8n3
	qN5XL7I8idNhskIANbraCF8x+Wo5WfyUX5YfbwbCaMJKopMjQTTEE1uKdToz68VxOhp3jcl1bf0si
	ZPNEvfLelFeYObwUFxXLHdZYwR8gWoBU7yLaiwu0365ST6+OjeRTDPzkxftBPXFoHwao5f+OC9vb3
	0hk0VzXVNid93FJTTStQLiE24RElc+IHO+BbyxYbPE8NM2/A+PhwCOl0VM+BJK8FqqQtjBsmIMiDK
	DG0UoNXt588sevcpoF2G0X9y4MABlnnzfqVUvTWgDvZSnMVEJqzDxHbwzS3WFdnhX9dbFMI/wKkZW
	FdSnlPGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuhck-00000001r6r-2RcM;
	Fri, 14 Aug 2026 02:26:22 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuhcV-00000001qw7-0d4r;
	Fri, 14 Aug 2026 02:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1786674335;
	bh=zwIQVsJa3bKVMiFSZ+kPNaDWDdjE00ekRDJBwDGVRHQ=;
	h=From:To:Subject:Date:Message-Id;
	b=BxlejEfZpiHpBD13kqh95waqcwroRvlN0Hz1hOeuKkIcVmMrDR4MEM8Gg+89e1M5L
	 W/2fmz4MobI9hEItALRdKp2gKr4EKO4t4+o9Z6jFpS9r+Ty7P27NFtMhMhfhEqpmb9
	 iaIBy3TykWCxqFPZXDe1HYoRzVkY0QGSNHKf2Xok=
X-QQ-mid: esmtpgz13t1786674326tbdf7c49c
X-QQ-Originating-IP: b3yIyDj93Zk6Fw5hzBP5dySljjYsCy8cXF5fAZrH/yE=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 14 Aug 2026 10:25:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7240023971590159997
From: Chaoyi Chen <kernel@airkyi.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 4/4] MAINTAINERS: accel/rocket: Add rockchip mail list for rocket
Date: Fri, 14 Aug 2026 10:24:53 +0800
Message-Id: <20260814022453.437-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260814022453.437-1-kernel@airkyi.com>
References: <20260814022453.437-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OE1h366RMh4bPIWp9FHW6/AyL21r43hkn7NAzLdL/UoB/ZlYxeaJpgBe
	jsmaXS+sgNe0JQ+ktXJK+DapnfYapIM8J7P5e3OPctWLYAti++KpBE6pJb7kl3tXGQAhiVf
	zhYkFdXNLhvWJTHYq+68z/DTy+R9Jqh2KTouquLFmP23/uJVu5dmlx5O/HV/IpcnQk3B1F6
	hPwpYHjYHciJeCbGnKQrBZBLIC0OobpUjU8GWHsGW+1SVUuGbVBxCT5l75s6DUwjitXgm4r
	DyRRGtTQ+jYvmfld5drhgavFWEnnLIPaL2pn6GUzZjuO8mmOKJNYyv/8jLB7o3jDN2/VyWD
	vM6IFkYmt9/Mbei0dOwwzbtYTL7tRS22NLKbJ71q+sRiz5OHAExzzFeBTqtPOsBpyijwkJ/
	ACgfnCVPIe1Qa4hu+TC3lrg4w8ZId0uDhBpjb2Sjl2+7x3n5KVNftlo5xcZRXCC/APEVedW
	M/UIpAc0yGfj2n8s8kGALfteq36TI3TeaHKdjVS1DAO5jgdgfdOm0JU+iMsQajlTyUJhnqP
	sixjDoq0sIIRcxmCt2TVNNqmMXq6xJcvaT/emRnIYKimf/88Jlnw4E6x+WaTipt2IN9SB7z
	qG+jOyyG/yJQhiDPorbqRBIHOH62kS6JznEN5fTlNrkz4reCff2Osi035wpwBHeHJD2DfK8
	FpMc0cyRN72K1MwGsHPi65DRq7s3spGgyMUKjjB1dKxRruHhQhozTvI2lxEojBSvZi0QUq6
	S/aG0yawPQHN8JO2LzTBFkIgoDSEAI3mhXN7SXbQI8eDrwOXCbU7x7iSvFClUXgGI9hfQuq
	GDTieul7ZVYpUF0qg1WorYi7ZN/HrhTwJmzvAYgTr2D0mtp5u+nZdvcnHW0fwHyGoyKJ1qw
	bpxC4Fxd5FLU44gAw6EYz9V9Zwj3fJVS0WTSdUeFS1jWjm7eiXp1XY9EhunHFbHNts5XgO+
	1EoVSu6m2JN5nS90NJfMfcz+lT/vtMj8xMY8wXSDP/MQLgw2pfaM34z7yt9hrgGjn3hHcBu
	QNeVWI4HWqdOeZHuTyi4ufGGs/2vC2QGNTX1gNQDV5mHLxpsF+
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_192611_675912_2DB7C664 
X-CRM114-Status: UNSURE (   8.09  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The rocket is a DRM accel driver for the Rockchip NPU. Add the Rockchip
mailing listso that changes can be tracked.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a8b0fd665ce..388ec1758ce7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7942,6 +7942,7 @@ F:	include/uapi/drm/ivpu_accel.h
 DRM ACCEL DRIVER FOR ROCKCHIP NPU
 M:	Tomeu Vizoso <tomeu@tomeuvizoso.net>
 L:	dri-devel@lists.freedesktop.org
+L:	linux-rockchip@lists.infradead.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/accel/rocket/
-- 
2.53.0


