Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F355CCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 09:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wX3wSpLeAzO697fsplyurLl9Lt48ZtuYBwgscS8Zd4Y=; b=e4BdWLqY129VinS7HplA1mVuoq
	x6Rp5ao2Y4mQ5LrHg6i5SH1B4YQUWlh9nC+PcXs9ITWQeHZmQhvF6gbu1t9zAMs1jjQ3aa/jE9UtF
	92g6ZCxQUfF/nMSLW3joPhBEdrjWTr3Y+qhevMOk2nmqHMmHckuPTffvFcXoCYAUQGGhHoJO62ssh
	YuTLD9MCinGU70SJXkpf/H/jiUKo+lO/yOrBeZEmDHWbjhAhMSRtC/hF1III5OMX5sH+sLWY08Xbj
	lHN5cnVedARmlq8pbZEDbMXvD+nJ1vwXbkNCT3hTgw+gMZiHNA+oMa3FjpmnslygN3FAufR/vyA3d
	/KIwfRpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvwR-0000000F7eB-3Kvl;
	Thu, 06 Nov 2025 09:06:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvwO-0000000F7dH-3P1u;
	Thu, 06 Nov 2025 09:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762419957;
	bh=eD0rL65tW8KTbO/83c/0IXmvaTMOrDt+ULFQsqK82B0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Z/7D3Ge/ggB5syz3wmbUdcRsuAECjEbwHTdaGWylKj2ZdK23tZU2DB6vIiqSZqcAQ
	 UsjphWouQUYKqrAjPmMCywqjWQkxSINNBgXd1dafQ9Mr7eLhIwulM0AVQkXUl8ZCUf
	 6wkTsaVhy+BqsG+RtQRIXsCwoVCfGCzk1l6CfwBdq807RfSsODFjYh9p6Yq15lJeov
	 W2ZW1JmI9Hr22qzLb9Qc+KMAY9HWq3m1/BYg8VEv6AfhbiAOtLoa3dWgKWjCGh65Ew
	 iHWJ77co8exGRwGYfLc7t1IUot4WHv+uhayC8uKMYBqlamMU5QKlPYd3P/zKVeVGi7
	 Tu/rEkrz8OSCQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C2EB617E1396;
	Thu,  6 Nov 2025 10:05:56 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Frank Wunderlich <linux@fw-web.de>
Cc: Frank Wunderlich <frank-w@public-files.de>, 
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20251105195007.199229-1-linux@fw-web.de>
References: <20251105195007.199229-1-linux@fw-web.de>
Subject: Re: (subset) [PATCH v2 0/5] Add Bananapi R4 Pro support
Message-Id: <176241995673.33143.16010766516310474191.b4-ty@collabora.com>
Date: Thu, 06 Nov 2025 10:05:56 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_010601_455120_FE13887A 
X-CRM114-Status: UNSURE (   7.59  )
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

On Wed, 05 Nov 2025 20:50:00 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> BananaPi R4 Pro is a MT7988A based board which exists in 2 different
> hardware versions:
> 
> - 4E: 4 GB RAM and using internal 2.5G Phy for WAN-Combo
> - 8X: 8 GB RAM and 2x Aeonsemi AS21010P 10G phys
> 
> [...]

Applied to v6.18-next/dts64, thanks!

[2/5] arm64: dts: mediatek: mt7988: Disable 2.5G phy and enable at board layer
      commit: 0e5d9e529383688deccce632c713692e53b31cf6
[3/5] arm64: dts: mediatek: mt7988: Add devicetree for BananaPi R4 Pro
      commit: f397471a6a8c2b621e1fd06430fc528ab3925422
[4/5] arm64: dts: mediatek: mt7988a-bpi-r4-pro: Add PCIe overlays
      commit: dec929e61a42ed5d6717d3ec2b6a7734c2ab825b
[5/5] arm64: dts: mediatek: mt7988a-bpi-r4pro: Add mmc overlays
      commit: a58c368067417f3d89b92ccc18fa0bb610b34349

Cheers,
Angelo



