Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B46AC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZQt89naWNf2L7OpBLgsofo4c+4U/0IJEon7GDnqm3U=; b=ohzrcKoH+1UkdX/qny59ZPcPqS
	kWykQDRLYshAP/K2BdMrtJGGARTxWOn209wrGYIp9Q7G6ohYEXZvL2HNZgaEI5NGhdUKs4Da7oofd
	l6VlPB8aY2M+o45oUc/GzS4QU5KHn1gw3MLzTrBomLPlinmPVF7zgd7psRwBGv0/xBNrHcF8zvndD
	Yy0dgMdL4QRw2gujHlWpbJBM5H4vdeY9QQF4NKWTEQb9Fs7x68PBh5xLGj2lDsBfiD+f4RL9MHItV
	Cx/HPo7WSJIsgxiNGNq2zRx29rMSbHDkYYXCEzFbcxEQMvaCnIXyZywvfpDHl5QbVbqN08opfDUZP
	msFN0eVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlo1d-00000006o2R-2fc6;
	Mon, 20 Jul 2026 13:27:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlo1b-00000006o1l-1sDp;
	Mon, 20 Jul 2026 13:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784554032;
	bh=5miUtceH7EkaTGDhqxpZugrO4o05sy5fiYaqxmWb1w0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HQM0sKz+XYpSU/sZ6EC7nF8oDHXBiRNCpZPABC56U5ilYJAZ47sxxMfXIDdksNKWh
	 hJXV1ZE7O978ptTBR5m8cyRYOzbx8UuWKkNuTWN5w00XBTYyPwu7kQz93w4m4nQO2h
	 EnzCvTA1xDpsC/RMv9J+as/7B6LSWNuI4Jb6lZJTjtbpQ/q4E7VM3bc7KihwRTPq/J
	 2OmBXxvjGO7dlDLujPv3Lgym9YDi9IvvBUMs5cmAKP1CVDWfkva6B2MfM/ctdX14wh
	 k20kEZNcXkZqZLnqjuMFxBdGCkO4A+1C6oaelbY0qBuh27UCYxmQWBoDjxge+I/iOU
	 wn6o1504mPnjg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 43D3C17E003B;
	Mon, 20 Jul 2026 15:27:12 +0200 (CEST)
Message-ID: <4fa4fb82-2118-4ddf-9b8c-510b58835b5f@collabora.com>
Date: Mon, 20 Jul 2026 15:27:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: soc: mediatek: pwrap: Add compatible for
 MT6589 SoC
To: Akari Tsuyukusa <akkun11.open@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: "open list:MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS"
 <linux-pm@vger.kernel.org>,
 "open list:MULTIFUNCTION DEVICES (MFD)" <mfd@lists.linux.dev>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <20260716171733.300885-1-akkun11.open@gmail.com>
 <20260716171733.300885-2-akkun11.open@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260716171733.300885-2-akkun11.open@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_062715_645640_4F62499E 
X-CRM114-Status: GOOD (  14.03  )
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

On 7/16/26 19:17, Akari Tsuyukusa wrote:
> Add compatible string for MediaTek MT6589 PWRAP.
> Also update the description since MT6589 has pwrap bridge.
> 
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>   .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml     | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> index e7c4a3984c60..a487ed39e6cb 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> @@ -19,8 +19,8 @@ description:
>   
>     IP Pairing
>   
> -  On MT8135 the pins of some SoC internal peripherals can be on the PMIC.
> -  The signals of these pins are routed over the SPI bus using the pwrap
> +  On MT6589 and MT8135, the pins of some SoC internal peripherals can be on the

Soon, this will become

"On MT6589, MT8135, MT1234, MT3456, MT...." :-)

So, perhaps, it's a better idea if we say:

"In some SoCs, some of the internal peripherals may be accessible only
through the PMIC.
The signals of these pins are routed (blahblah)"

Cheers,
Angelo


