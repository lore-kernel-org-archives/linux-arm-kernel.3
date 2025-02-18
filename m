Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2DCC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 08:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vx2jMxBGlVU2wfhA0lYQifBqSry905FpjGu/ea4Kn3Q=; b=SSn/0ZuSC/ycEUakyJg7tQFFeb
	CfehyEZwxBuD4vmBBLCZ8dSJibr9flqXygPoVC5XU+kr6mmeev92DE8gtgc5rCgF7uOjywW8BO0nc
	eLna65Toylz8sli/9fMDtZOid25uRcK0moi9T7WQk1+gfOd5qf6xKR4pi0mz9D7Hy8wgWSCNL1frH
	/ojDloXX4AJxJAxfdocr9bFv638t4iK6BhdQhhvFKY+KF4vOkMzQ9THMndL6AHmX4tXGA/4WVd2ks
	O/DZ2SS2aW46dYveAdBv2377feR7PZkfR6VLj8TXamQh74ZismFTC6Biby/ugbWFSyBdRSMYUYpdl
	5xLECJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJOj-00000007NsX-3Ena;
	Tue, 18 Feb 2025 08:56:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJNG-00000007Nae-1gwM;
	Tue, 18 Feb 2025 08:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739868876;
	bh=nBEJjisUo0PMocvrJPXI1lmZXGGqamSU/fT9KlpRkcM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ezqVAXZvjzTrkZ+XNZyqbkY0wB0yXd0VEZgExQ2jPKxIbIrjHfiHb8dmlHi2tsGHY
	 yQT5wPxPOB7pyeW4Ez36SYw28gAAvpoLYNRWJo09tOLmbLKIqJXQvKw2t1PzZOzorl
	 kQ6Vt0QMP/xZ3xj0vxfWZqnB+CAfxFnpFPra9P6EQ7xgDzTWxBSCI87Lris0Jn1Cq0
	 6fCTjpvVlgXEghV2sVL9pzBP9zpjyLLm0AuTTjOCkt9VxLGCWF3rBUzPxrX0R+WWQy
	 TCJTOWgL2VgucTV1bJPRdgscecS0ZjD3xN28vkPFNpKz/ELxRH2CqusiPJMr03GFJZ
	 TwL1nKlTmegtw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C0F8817E0657;
	Tue, 18 Feb 2025 09:54:35 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 Macpaul Lin <macpaul@gmail.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-usb@vger.kernel.org, Sen Chu <sen.chu@mediatek.com>, 
 Chris-qj chen <chris-qj.chen@mediatek.com>
In-Reply-To: <20250217113736.1867808-1-macpaul.lin@mediatek.com>
References: <20250217113736.1867808-1-macpaul.lin@mediatek.com>
Subject: Re: [PATCH v3] arm64: dts: mediatek: mt6359: fix dtbs_check error
 for audio-codec
Message-Id: <173986887570.18173.5945528132983122010.b4-ty@collabora.com>
Date: Tue, 18 Feb 2025 09:54:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_005438_613532_3E0D7AB6 
X-CRM114-Status: UNSURE (   7.33  )
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

On Mon, 17 Feb 2025 19:37:36 +0800, Macpaul Lin wrote:
> This change fixes these dtbs_check errors for audio-codec:
> 1. pmic: 'mt6359codec' does not match any of the regexes: 'pinctrl-[0-9]+'
>  - Replace device node name to generic 'audio-codec'
> 2. pmic: regulators: 'compatible' is a required property
>  - Add 'mediatek,mt6359-codec' to compatible.
> 
> 
> [...]

Applied to v6.14-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt6359: fix dtbs_check error for audio-codec
      commit: 76b35f59bbe66d3eda8a98021bc01f9200131f09

Cheers,
Angelo



