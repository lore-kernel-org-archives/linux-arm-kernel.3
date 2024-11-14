Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA9FD65C6C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 11:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97buAnNKpjE7K7t8ciNQcmldyfYzzBRNkIIjEo3x2a4=; b=qerB6x5OPsSAOcJUIZEMYqOXkZ
	OyMZYdaY3Tvp/HnQqN8Bei+bpEC5KUEWoK5Upa6UYzr/nfywKcvVDBn2omobuN6E/8CwSnpc3efmO
	191Eqbod/iGgomO2MKc/aeWs3cJsxztVMcYeoErOraWcoBAVsYswplVYV5epydauxE0YGmM90VxTn
	//tbhIFmPupL1kTlo6y/YiSGOgqDk8a9T1L4u0p044cszPd6i9IMoi0YXempyqXSWDfrdZxIz2Wqv
	qTwJ+S2G83FrI/aiSmQaYKypFFCzq2a+VJuHl+d6IlhYCzClsszIaH7hGAr+OeFzoKoQkjCy7rA9T
	u7Ygk8vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXfX-00000009eoZ-2IUq;
	Thu, 14 Nov 2024 11:05:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWsb-00000009Uuv-0faS;
	Thu, 14 Nov 2024 10:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731579310;
	bh=BDRlZ1ycBCD+bjuZg/SwSLSTmoyMuj7OjThlUTsmJHI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EUbp6U8gYbjbmAz90H6csJSmUy+Ed5NAgHo2qxm/riuc1qY/DZBTR7sRCtDeRM5lc
	 lvdeHFmG49a2LZWUuFUOHzPmVpgm0fyFPiyS/4zrw1R1i+C+e0jYsNMPLwoYx9k5Au
	 wCSwd9dC0/59YxZD/RiTh13wTlzOxuyqZj30XAhK4urUs7efoVrBRc0u1oWUAz/66M
	 73n8y9COblMdMhpFw6IVBGen7o397YqPq+2JC+89P/wKfNNUohBF3r8BR7nYFmsHgy
	 NNDrCfkV0Bx16eMx/iCSt6oU4mSDggga5pdZEVwCBi2YRgC/euiaFtNwvrWqpoM2nK
	 7qWImVMBaJ/1w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3F6DC17E35D8;
	Thu, 14 Nov 2024 11:15:10 +0100 (CET)
Message-ID: <d67ead02-8502-4d71-bb5d-38b80c103e3d@collabora.com>
Date: Thu, 14 Nov 2024 11:15:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] media: mediatek: vcodec: add description for vsi
 struct
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241108034019.20064-1-yunfei.dong@mediatek.com>
 <20241108034019.20064-4-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241108034019.20064-4-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_021513_482307_FC4D00C3 
X-CRM114-Status: UNSURE (   7.37  )
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

Il 08/11/24 04:40, Yunfei Dong ha scritto:
> If the video shared information (vsi) is changed accidentally,
> will leading to play h264 bitstream fail if the firmware won't
> be changed at the same time. Marking the shared struct with
> "shared interface with firmware".
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


