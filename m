Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7117C02196
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usgSqRfES1Gzj42d5clZFSs6dxStdYKZxMssEmW/wH0=; b=lx/pKQw1jlvVecGs5LBGPrhJOR
	iz++PO8B5cxxZLF1sydAgRnKGeM4Xe5tQVeroDTqb9BmpLxLh25Po/L+ALDwj3TAnuMy2wS8KmKkN
	dNsHLPSq5t9/pYep29dKJ6K3co6t2dJ707kMndaJcXsq43dsoJGsEKpY8x7H1IyneZHbis/z5VxCp
	HBPFgcyFap4C/ImU0p15WTbbof1HNy4rzMYE4L+fUP+mkUXXRs7SJb9lgaEIneU93/skpynU8afQV
	eevKW6MbQg40ztmW0jLH8Sw7+IzVFN3LLzk5ThpCM3wHJLDvvNkI5HVpu0THdHVH+itcJ0bR7gS7S
	JywcAJLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0Na-00000006C78-2o28;
	Thu, 06 Feb 2025 11:49:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzkW-000000064ib-0eeU;
	Thu, 06 Feb 2025 11:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738840126;
	bh=8lSiNbk0Ww5hds1Fb3dZ9RfxdJ4VHhcD9zA3wffpAzc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=G5EI84RKQU9mWu/p6S/vIjWZmyqLD4Xupzx0ar7iVdROE1VvLMXGGOd0xsIR1LAvv
	 XDbzVoi2Onc7kIRCHPkOuT6d6z8qxdbH/4VK7JuSA/aGmb464xhKAZ/1sPmptuZ01U
	 cCpvBIhFUE+6opryBpXfawlCOrEkJ8BT9yotozS06fcYAmbi9JpMV/9IB4ZfKL4qCt
	 wfEQY1GcGWNLuf0F2EMxS9iRazSQ1/H+g8Q8Cyw1yrcspRKycVJ14qxSimYZBu8var
	 UbjWN+QuH/lxw+cVlHHYYFG/1AmAzb3ymjnayW/vlrKr5HxpZrgm/vPAaC3vtNQtA5
	 TitYAycOsF1rQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0998E17E1411;
	Thu,  6 Feb 2025 12:08:45 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20250206-dts_mt8370-genio-510-v3-0-5ca5c3257a4c@collabora.com>
References: <20250206-dts_mt8370-genio-510-v3-0-5ca5c3257a4c@collabora.com>
Subject: Re: [PATCH v3 0/4] Add support for Mediatek Genio 510 EVK board
Message-Id: <173884012597.110657.15653298981143162594.b4-ty@collabora.com>
Date: Thu, 06 Feb 2025 12:08:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_030848_347801_4CC7B1C9 
X-CRM114-Status: GOOD (  10.27  )
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

On Thu, 06 Feb 2025 11:38:07 +0100, Louis-Alexis Eyraud wrote:
> This patchset adds the basic support of the Mediatek Genio 510 EVK
> board, based on the Mediatek MT8370 SoC.
> 
> It adds a device-tree file for the board (mt8370-genio-510-evk.dtb)
> and an include file for the SoC (mt8370.dtsi), in order to be able to
> boot. As the board is very close to the Genio 700 EVK board, an include file
> (mt8390-genio-common.dtsi) is also created to factorize the common
> definitions.
> 
> [...]

Applied to v6.14-next/dts64, thanks!

[1/4] dt-bindings: arm: mediatek: add mt8370-evk board
      commit: a11256de6296fd8e0122ebe067bbaa936b7fef12
[2/4] arm64: dts: mediatek: add support for MT8370 SoC
      commit: 49b07ed22e3707a120c1f4a11be9560d9d712e31
[3/4] arm64: dts: mediatek: mt8390-genio-700-evk: Move common parts to dtsi
      commit: e9a4cfe83fe27a82b92cfd6870ce1e71e414fd6e
[4/4] arm64: dts: mediatek: add device-tree for Genio 510 EVK board
      commit: 3ac908716b8297d3ba6c6010104065517ec341a8

Cheers,
Angelo



