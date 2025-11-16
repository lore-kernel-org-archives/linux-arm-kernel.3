Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3067CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 03:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95kFSsLKyE4ALNC5FIjf+7ESIXBQpMSorE7EunEryYI=; b=5G18ZA33JZ6E7RcYH8dzolyu2J
	9O2Ni1Rahh1tgbmOPEQ+gJ5moH5V1MBzqA7DqKRVPqz0gWwKq2pJpVZ48LpcybNM9fd4pSi2vm3hk
	m9NSmeQTJK66RU8I5NKFlKwxiUB5J1rs4TtM+1TVkNu9lnDR/P9eq85vZ7KmbRmwxMHJ9zuCDuuNv
	3e7BpDOnLzISUPbQGo/7qXC5RPBWTqeVceqlwiYI8Ocb2bCORnLEIN6YuLcgVd9dbXIO/esSNKYK3
	VyVrp1wf8YLfWFtm1dqPt4GJjwqdxloRbCUGiOH8AJjuWyzyFRhyas89eWdHARUlpmwqgx4bdKNIW
	7v7Ytvwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKTnQ-0000000EKud-0zzv;
	Sun, 16 Nov 2025 03:51:24 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKTnN-0000000EKuG-2IrA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 03:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=95kFSsLKyE4ALNC5FIjf+7ESIXBQpMSorE7EunEryYI=;
	b=fSwfVd6notXp0m5r0Dq8cVrJOOuYLd6b2UJZuvYz5mnJGxTELZm0MvmdjRAhv+
	tSxORf1Qcx/0zNLFrlLusMJMG3sChZJsnf9hlvtOE9dNhdwm+cQ+MPykuBC/JcYe
	cqGfqv/oL5Ox3jc7XmZG65g8VjnvHDbp26btXRsV7I3DI=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDndQ2kSRlp1YYSAg--.50067S3;
	Sun, 16 Nov 2025 11:48:55 +0800 (CST)
Date: Sun, 16 Nov 2025 11:48:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 6/7] arm64: dts: imx8mp: Add hdmi parallel audio
 interface node
Message-ID: <aRlJpAUV9nfl2Afv@dragon>
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
 <20250923053001.2678596-7-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923053001.2678596-7-shengjiu.wang@nxp.com>
X-CM-TRANSID: M88vCgDndQ2kSRlp1YYSAg--.50067S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUeXo7DUUUU
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiOAccgWkZSafRNQAA3Y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_195122_118450_05DDE321 
X-CRM114-Status: UNSURE (   5.69  )
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

On Tue, Sep 23, 2025 at 01:30:00PM +0800, Shengjiu Wang wrote:
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
> Audio Subsystem to the HDMI TX Controller.
> 
> Shrink register map size of hdmi_pvi to avoid overlapped hdmi_pai device.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!


