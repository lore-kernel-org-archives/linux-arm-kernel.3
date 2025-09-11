Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42482CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 01:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3gOQobAEWqrV+LkJ+Gu41Zy/G5CF74YMZ/R1K637H0=; b=QQyzH6JmWPKKtYs6nD8vyYpmdR
	LuGhrPB2VwuB7z76lRG/KruvNLGzWt+NFMBh8UqspjvnFvwaPgnXH0HESqwg7VmAIP7YVFmv5/Fjj
	RH0ILORI96j4nU8PsOtVIVU2v2DF5oaghtzTTzQQzrMerYX4ChKfZAFhp7m9NmGU1Tc2pGy2tyibB
	+jOQeHsvXVgJK02/whsOGtr+U8lCaLhD/w48XWurJ+4POb4D44+uYZW0vjk2qPEiwXckXdUGEIYuT
	Qr1CVZ9fZjqaEpx6EQ6I8GMch9KXoS30w7VE3LpFA9j6IZaNdmOdPK2YKQ4H/AhhZGY7w0SMgD7zb
	1qgvhD8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWTX-00000000FQS-0jFB;
	Thu, 11 Sep 2025 01:51:51 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWTU-00000000FMx-3lKS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 01:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=A3gOQobAEWqrV+LkJ+Gu41Zy/G5CF74YMZ/R1K637H0=;
	b=PvVI6CX7zrc6SmuiytFNyZtN1EFexELhvMIVXIHPCtvcNn9yWNnn5a6pVrYEdh
	bAAi6JiVPKnaV8XXcUUeG5VR3BjB9rA4uUxzXicUC6/YPU4sGUBX0ALnJAJRPRBn
	gYifKf+PHc09NEyHsE1VuPZKjXiVXbgUKDwT5x2wahdns=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3n94pK8JoLltOBA--.48607S3;
	Thu, 11 Sep 2025 09:51:39 +0800 (CST)
Date: Thu, 11 Sep 2025 09:51:37 +0800
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
Subject: Re: [PATCH v3 3/3] arm64: dts: add description for solidrun imx8mp
 hummingboard variants
Message-ID: <aMIrKYBPF2kMctIE@dragon>
References: <20250823-imx8mp-sr-som-v3-0-a18a21fbebf0@solid-run.com>
 <20250823-imx8mp-sr-som-v3-3-a18a21fbebf0@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823-imx8mp-sr-som-v3-3-a18a21fbebf0@solid-run.com>
X-CM-TRANSID: Mc8vCgD3n94pK8JoLltOBA--.48607S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruFy7tw4rKw1fuF4kGF1fCrg_yoWfurX_Xw
	n5Wa1UX3y8KryfXw4rAw45CFyI9w1DWr18Wr1rtryxX3yS9wnIvrZFq34F9F15XrW7JFn2
	gw13KFyIkryxujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb9NVDUUUUU==
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIAufBWjCKyt+bgAA3L
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_185149_333759_4BED4D57 
X-CRM114-Status: UNSURE (   8.77  )
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

On Sat, Aug 23, 2025 at 05:28:23PM +0300, Josua Mayer wrote:
> Add descriptions for the SolidRun i.MX8M Plus System on Module based
> HummingBoard product-line. They share a common designed based on the
> "Pulse" version, defined by various assembly options.
> 
> The HummingBoard Pulse features:
> - 2x RJ45 Ethernet
> - 2x USB-3.0 Type A
> - HDMI connector
> - mini-HDMI connector
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0/3.0 interfaces
> - M.2 connector with SIM slot supporting USB-2.0/3.0 interfaces
> - MIPI-CSI Camera Connector (not described without specific camera)
> - 3.5mm Analog Stereo Out / Microphone In Headphone Jack
> - RTC with backup battery
> 
> The variants Mate and Ripple are reduced versions of Pulse.
> 
> The HummingBoard Pro extends Pulse with PCI-E on M.2 connector.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>

It doesn't apply to imx/dt64 branch.

Shawn


