Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCF3C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 10:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWsK6/4szkHoVXHrnAm4LALSER2jQ1ghC7Ix2DLbky0=; b=QQQCgtCq5fik2mWcYZnO8Ts7SG
	a7Th1h0XlLeSV8DLYzmF8AGAqx8OHAfs0+OKiu3RyEZMys0m1De8tMlsVYjc3mrnvz2JZK+apMFiT
	rGCQmUw/rAHMbvartLeCCa1keO7rwR9mQ23/gNtK7GkK5p0qQ8Znv28F0fjedx7t6uJTx5BndIyQd
	zo3Jo2CbMF881sititEBRxBWA0GtxcTucTuB/c3OISCoBxKF3WYsM4GFDve97QUWbsE0bBYK3P0zP
	efJJA0k+Kc+PC+J76WencZd/BZITTaVzUD0t8hfJfFlrDMhGY1zHektq5VkR+YwYihzpfqtneaJZF
	Qc6/3eVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPfQL-0000000D25z-0pNB;
	Thu, 12 Jun 2025 10:44:45 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPePG-0000000CptR-0V2K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 09:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=PWsK6/4szkHoVXHrnAm4LALSER2jQ1ghC7Ix2DLbky0=;
	b=gCgCKhQbohyOe0xUCPsJ3o4Ew/mFa7zLgMkmqU0BS9KZaD06obYbyN0WtRyCXQ
	RdKxtQYtBavGjIlWxi3tSqzVWp0Tb1ZBRikMCHdkTfX0e9JdZegrO4h+PgwDcLLC
	vEc/cl7bkv8Y6lRYN4tOAocJ4iuR0/3xVKMRC2NKkkiVI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD31+0yoEpo1rB_AA--.16809S3;
	Thu, 12 Jun 2025 17:39:00 +0800 (CST)
Date: Thu, 12 Jun 2025 17:38:57 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v17 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Message-ID: <aEqgMVHl0C07/dPz@dragon>
References: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
 <20250426-imx-se-if-v17-1-0c85155a50d1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426-imx-se-if-v17-1-0c85155a50d1@nxp.com>
X-CM-TRANSID: Ms8vCgD31+0yoEpo1rB_AA--.16809S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYJPEUUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAR5qZWhKmz8VvgAAs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_023934_494653_46F76FA1 
X-CRM114-Status: UNSURE (   7.49  )
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

On Sat, Apr 26, 2025 at 12:31:32AM +0530, Pankaj Gupta wrote:
> Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
> that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
> - NXP EdgeLock Enclave on i.MX93 & i.MX8ULP
> 
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>

No one cared to give a Reviewed-by on this one?

Shawn


