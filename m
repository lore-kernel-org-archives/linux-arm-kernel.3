Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF11C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 05:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68i6nZgeVAEVlthJvzDNRrc3GqZTagQDZ3jgb9satyw=; b=DQwNbFMh3mqdAoN+75pswB1QCB
	GtKv6f1mf4aFnTq5bMOza7b3ZE26mAYDv4szQWODUv+h4+RH4Q0ZLhtsrdAy05tajXdt3XhpfeSI2
	SNiZottnwrHAKglDNbDh5nzlqDaxy6n0hc6vTjuhiAceo9YPOk4fXg7W4F+6hdx9tmf4J+NyowW8A
	YKD3NjfGrhsMdc9BDXjJs0TbJHWhancBI68HwpMmurfrBX4JiDx3nC9mlAs1J9seNiZtSvN2dPu0v
	1j0OXM4ny738ai4obb/3ZtrvtvViNyN0HG494RTzFIBkt+KmbAUFFCDqWbca51rqPLoJOUyX+RIyB
	LCr9wnkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkFvu-00000006ouF-19eo;
	Tue, 18 Feb 2025 05:14:10 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkFuR-00000006ol6-0f6T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 05:12:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=68i6nZgeVAEVlthJvzDNRrc3GqZTagQDZ3jgb9satyw=;
	b=Qk4UTYh6UlVaXdNFDvLqCLE/9H15fDwguI+YL4sZxWr7lZUBnU5RMmxiGMmj50
	72ksoqJZOqG0fnZkUzYDglznOmshaR8+xMg7xuf2to+KKCHfRsLKwE2SjkxZ+vT7
	pd4VPhdaWUNGRvcQ/fzcFobQogLybc7fLA31CBNwe8hnE=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDHg+GVFrRnzEwjCQ--.17496S3;
	Tue, 18 Feb 2025 13:11:51 +0800 (CST)
Date: Tue, 18 Feb 2025 13:11:49 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Frank Li <Frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	"open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 00/10] arm64: dts: imx8mp-skov: flesh out device trees
Message-ID: <Z7QWlbkoTz5VZle+@dragon>
References: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
X-CM-TRANSID: M88vCgDHg+GVFrRnzEwjCQ--.17496S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFWxZr1UAw43uF4xAw13urg_yoW3XFc_ur
	12qa48JwsrGan3Aw1qgw1qqryj9w1UC3yUXFW3WrZYgw1fZw15ArykX34rWFy8AF1akr4D
	AF4UX3WkXFW5ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU87UUUUUUUU==
X-Originating-IP: [114.218.218.231]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBz3ZWe0EhkQVQAAsX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_211239_556200_7AEA873C 
X-CRM114-Status: UNSURE (   6.71  )
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

On Mon, Jan 06, 2025 at 05:06:35PM +0100, Ahmad Fatoum wrote:
> Ahmad Fatoum (5):
>       arm64: dts: imx8mp-skov: correct PMIC board limits
>       arm64: dts: imx8mp-skov: operate CPU at 850 mV by default
>       arm64: dts: imx8mp-skov: use I2C5 for DDC
>       dt-bindings: display/lvds-codec: add ti,sn65lvds822

Applied all except this bindings change which I assume display or DT folks
will pick up.

Shawn

>       arm64: dts: imx8mp-skov: configure uart1 for RS485
> 
> Oleksij Rempel (5):
>       arm64: dts: imx8mp-skov: describe HDMI display pipeline
>       arm64: dts: imx8mp-skov: describe LVDS display pipeline
>       arm64: dts: imx8mp-skov: describe mains fail detection
>       arm64: dts: imx8mp-skov: fix phy-mode
>       arm64: dts: imx8mp-skov: increase I2C clock frequency for RTC


