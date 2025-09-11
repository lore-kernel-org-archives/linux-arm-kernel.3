Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA9ECAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 01:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUI/i+ja9oevYg1fVVK/IyksXCQlyryj3w/XBV25Te8=; b=bF101pL2foZzQkxzxPeQcfX1m4
	kMs8urG7oYy/ZDDDUBp9/kQpwPMI9zTp31+/9EZNUUu9TSP+fjbOZOVnhYs0aejxncIhct/RQhWXR
	m0Be9j+06jOzF9Z2xS8VsTox8ddOLUU9Mw7V9A5uK51L8l+OKsq8x3DuhjHauHQmOwZCb6274rbsV
	uAI/A+bNVR/5R48slS3/7JNMJq8dq4/9OVgdHDtHUoqhe8A0VoFSbwh+XQwUKXhtNjhhFXyb4vbzR
	ZbOQ30av378twXd73fvY60mQmd+DLJGUmWtwLy+OTR0fW0cIMpPylM20dWDkT/u/ASm+aY9J7Mz9E
	cm1ee3yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWSd-00000000EzH-2E2A;
	Thu, 11 Sep 2025 01:50:55 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWSa-00000000ExS-1deg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 01:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ZUI/i+ja9oevYg1fVVK/IyksXCQlyryj3w/XBV25Te8=;
	b=O76U9ZV2uADWd+6J6/mpLppDnBErAY1qsuLBqi/9SqqnLNQsucrZTE+bYVIJmV
	JEGmRiYB2qeBPxw2h88ujedrxhmq02Ap6++IENga7E7tXIO0Vkb1C0qgNi/jxvr7
	Ohc7zYFtqfRIURZNcKRVK2OdT/EHLyPhplRO+A6ExuyGc=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnnyjwKsJoColfBA--.14977S3;
	Thu, 11 Sep 2025 09:50:42 +0800 (CST)
Date: Thu, 11 Sep 2025 09:50:40 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: fsl: Add bindings for SolidRun
 i.MX8MP SoM and boards
Message-ID: <aMIq8FAJ3f6irsX0@dragon>
References: <20250823-imx8mp-sr-som-v3-0-a18a21fbebf0@solid-run.com>
 <20250823-imx8mp-sr-som-v3-1-a18a21fbebf0@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823-imx8mp-sr-som-v3-1-a18a21fbebf0@solid-run.com>
X-CM-TRANSID: Ms8vCgDnnyjwKsJoColfBA--.14977S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUw5l1UUUUU
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhKR9mjCKvKOowAA3I
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_185052_799698_BFD8B584 
X-CRM114-Status: UNSURE (   7.23  )
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

On Sat, Aug 23, 2025 at 05:28:21PM +0300, Josua Mayer wrote:
> Add bindings for SolidRun i.MX8M Plus System on Module based boards:
> 
> - CuBox-M is a complete produc with enclosure including the SoM
> - HummingBoard Mate/Pro/Pulse/Ripple are evaluation boards with common
>   design but different available interfaces.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied, thanks!


