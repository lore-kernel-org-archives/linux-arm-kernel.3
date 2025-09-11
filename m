Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD24CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 03:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THlvFbB78RIDz28+vysH0ce88JgTgR3a3bl/ZMN0Ldg=; b=JoI3DWRRMBAMju8k1IWlOC89WZ
	648TRLxFU3Bx+sHvYAvmqb3NVFkvpYK6EGWcOFSTzo8/98MyomrwsldgzJEYNut2MkZeceY/qM/Mt
	t1QJuNo11ZfDwm0fNIcC1Z/Ce+oFJmCm++qPsSy+vIFM+PyE/YxU0K3qMyD2cqAGLeHlyrZgedX8c
	Sx8T3n9WxARaS0uYxvWtkIJoYcOEAqHI1fGrqaOYosg0ADO8dk9MqttHhZpuF1/t6OiGzPfPXC0PS
	EWibgl0Buf251OJpKGP87XMwBSP94mApUQi77/OBuGipaoAtDX4b8n4PToV68oZJ/CuqrC0RoXhgE
	u4UIqLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwXte-00000000ZrM-224O;
	Thu, 11 Sep 2025 03:22:54 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwXta-00000000Zqk-42y6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 03:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=THlvFbB78RIDz28+vysH0ce88JgTgR3a3bl/ZMN0Ldg=;
	b=frCjEGxsW1ezgKWmLhsN0TmHjLL2JoC5L+raMBoyUyvnOAOSNStaIaJQGHF9u3
	zurLhWJVjJIDL19H+plKT5YNLLNmV3Zu9IwdertN/JX3hHRrbUpnOg4xPwGS9Fg9
	kkbbhEEmSiIpiv3TQ115gyE+1rAtcDiKciz7UAZ8EhWU8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDn3wx_QMJoV4hgBA--.15626S3;
	Thu, 11 Sep 2025 11:22:41 +0800 (CST)
Date: Thu, 11 Sep 2025 11:22:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Wei Fang <wei.fang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, Frank.Li@nxp.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: add standard PCI device compatible
 string to NETC Timer
Message-ID: <aMJAf_L0AbVfat5m@dragon>
References: <20250904020049.1397308-1-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904020049.1397308-1-wei.fang@nxp.com>
X-CM-TRANSID: Ms8vCgDn3wx_QMJoV4hgBA--.15626S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7jg4UUUUU
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQL6YGjCQIJmVwAA3g
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_202251_369974_E9EE1E9B 
X-CRM114-Status: UNSURE (   8.70  )
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

On Thu, Sep 04, 2025 at 10:00:49AM +0800, Wei Fang wrote:
> PCI devices should have a compatible string based on the vendor and
> device IDs. So add this compatible string to NETC Timer.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


