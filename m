Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2638C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 08:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahMwYnzAqR2ccux8pEM9neDBaxqHAvqHao7Hj/i4BgE=; b=GDYyrao2eGwLZpOBjLSdis0l45
	Ghar1ohHOdnUr7MrznkmihFoBySQSPn0mO+lZSJg4NsiVNpGF2ko0LkdeLUcEtsGEYoKhGmn4Nh70
	+BT4mkxpDcHh5mfAYQoPTLN1Q4eUBq8PVa+ypYvrVOiFMX/k7kr5pbiNTQi2AQQYjtr6xBlQ8bKl0
	jCEdM8j1mbtqW/2DxImv2niGXdf7ZD08f9Ua2nO+9IW36r8YUa3vz9R+NOjPmFuUup0yISfbD5J3y
	KhjaIfCKgVPzO2wHwtTZ+PvXj99cIuQWTa5DTz7Ind3z2JpnM6Si6ZuGjw5nZ239bbxYu0R4lOW9M
	DjkEwWMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPH0V-00000009KGm-14wk;
	Wed, 11 Jun 2025 08:40:27 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGou-00000009Giu-2Lzm;
	Wed, 11 Jun 2025 08:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ahMwYnzAqR2ccux8pEM9neDBaxqHAvqHao7Hj/i4BgE=;
	b=cXeBc1fDyuCnOgI1P/kEJBnpW0hvRhbh+DUKSFrRLqp798QPGZtjWM+AleqnS4
	UdkB0yM0B0UpZBk9YL8Rbs0oTRvlDIO1pBFdLatlmPSDattVvdTbGkqcJedj5W18
	NobAAPqqAYTnn4oMeK9oYqLLdhK5J4UYwTCPYMCAaytbY=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgA3180UPkloM8lpAA--.43803S3;
	Wed, 11 Jun 2025 16:28:06 +0800 (CST)
Date: Wed, 11 Jun 2025 16:28:04 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: carlos.song@nxp.com
Cc: miquel.raynal@bootlin.com, Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	conor.culhane@silvaco.com, linux-i3c@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V4 3/3] arm64: dts: imx95: correct i3c node in imx95
Message-ID: <aEk+FEq+Ivj5wfVW@dragon>
References: <20250427083230.3325700-1-carlos.song@nxp.com>
 <20250427083230.3325700-4-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427083230.3325700-4-carlos.song@nxp.com>
X-CM-TRANSID: Ms8vCgA3180UPkloM8lpAA--.43803S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOKsjUUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIBYBZmhJPhYL6gAA35
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_012828_946757_2AE07AEE 
X-CRM114-Status: UNSURE (   5.79  )
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

On Sun, Apr 27, 2025 at 04:32:30PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> I.MX95 I3C only need two clocks so add clock fix. Add "nxp,imx95-i3c"
> compatible string for all imx95 i3c nodes.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

Applied, thanks!


