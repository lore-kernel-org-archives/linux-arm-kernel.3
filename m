Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE850D132A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 10:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luT0fEdE8F0M63sq0XrgrjQ0+CCcuFTG1WLmfHvKEKc=; b=tYTAuAm6zN7DGn+BgLkaACsH6j
	QSr/7MZqZQfYdWurnH6vdqZ60pWe9+nikLyI3zJ44er43gIenZsCyRSMotq8D9WXXv0xivdfBoJmi
	t+rVi8I8ZH8nDsvV/Ju9/3rpDCMiU66fVv2iRklVgEMkL3WSNmG4/W8F8ZyPi/JzLGYMvs6WewKl2
	DWZ84cLB8qzQTph53dAeXRUvAw1YL2TgH7sia93Y+DsHjZRhK3l9WW6MXI0rT5chyoShgkICWt8ib
	t81skSkszP+48jtIIxk7e7rPpq2kfpwhcvTxIO9xXeBTBxjrH6zTi7oLApPaO5GiObcQ8+dx1eszx
	bcDDosMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7uAH-0000000DIRC-3ja5;
	Mon, 04 Nov 2024 10:18:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7u2S-0000000DGtK-3fo1;
	Mon, 04 Nov 2024 10:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730715022;
	bh=CSYjP+K7N5aRJn2h9T1DLvgtC+RNWp28+4aFe4h0Gn0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Gup59pohQBT87OEkR5N8zLsA21IUm3/nZ31/e8b9Gm5d8/0gp0PrTlddgvji0g/ca
	 MUtnC7m9mzuAR5vBYqZmakEh36t7ir8FmcwCnWuTnFdK0p6z7qweKw752JX524A5or
	 IIBTAz07Yu/M3tP4fXOw50OpiNAYey0ijh5oNH0VXXGPKcL/lxXEzcOhgp3ZIJzz/S
	 cwXbwycmL8LzKq90PhVE5Wxm4KICsveUJ9EJX63Ga3sZ/T+P8D4N5vDej1fsio5CBE
	 2cNUv87uL9d/dh335U/lT1RQZFbjZkhTkWxL8MIp7KB5N6ZZeTrawBlx9c9V2QFJbD
	 2J20lFU39klgQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 352C217E14EF;
	Mon,  4 Nov 2024 11:10:22 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 Macpaul Lin <macpaul@gmail.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-usb@vger.kernel.org, Chris-qj chen <chris-qj.chen@mediatek.com>
In-Reply-To: <20241029064647.13370-1-macpaul.lin@mediatek.com>
References: <20241029064647.13370-1-macpaul.lin@mediatek.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt6358: fix dtbs_check error
Message-Id: <173071502217.114014.11522421669609196627.b4-ty@collabora.com>
Date: Mon, 04 Nov 2024 11:10:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_021025_130414_FF4A8982 
X-CRM114-Status: UNSURE (   7.36  )
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

On Tue, 29 Oct 2024 14:46:47 +0800, Macpaul Lin wrote:
> Fix DTBS check errors for 'mt6358codec' and 'mt6358regulator':
> 
> Error message is:
> pmic: 'mt6358codec' and 'mt6358regulator' does not match any of the
> regexes: 'pinctrl-[0-9]+'.
> Rename these two device node to generic 'audio-codec' and 'regulators'.
> 
> [...]

Applied to v6.12-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt6358: fix dtbs_check error
      commit: 76ab2ae0ab9ebb2d70e6ee8a9f59911621192c37

Cheers,
Angelo



