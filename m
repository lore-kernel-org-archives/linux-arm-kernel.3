Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D59C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pTgJhhKSfWgtlyauDGLv+vZMYoubt2de+/WZsSCVb4=; b=YzjNPNKNOq3HY+XsyxRxAN1oPH
	bWuGFZJWGnS+t+ZTYPvfnPD374KnGvdkI2R6wa5MoH7O5tQvwO5Pa45wEWsvrk9pL+DgWsJjHytdr
	CnR1XTEGYAMpIdTxiNeJjwPi3g66olaYBt3/3xA+1qlca+cnsPMyQhrXSo4Qo7RUHNB+IntbHFljV
	MBPLlEDzH2e7eIZNHXNMEoVO9kIoFKG92ee8Z6OwJPzyfB5X3096b4GJ05qm4V7tfnoIDCU6zIPhN
	4Yp/VuhrI0aYTZfG0gxo/mDSlMFrsb3PYNU7oVL3kQoIIFgktT3Mj6rwgSlQtJkA3yX2Fmwf5yAGA
	iNefF1sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GWA-00000007uyS-2aVZ;
	Tue, 22 Apr 2025 16:30:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7E7j-00000007ORl-16JA;
	Tue, 22 Apr 2025 13:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745330237;
	bh=BLr1Iiik2vEEXPZBT2XxibrJ3gHHLcnn4LfvqfMJQ5k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oe0CVLPRxvOuXTqdrn5jptO2HwBGymkZb3BchyMPPsVVgo6HjlUP3kBCeya+9gkPk
	 2211W/G/IGQFaxLMi5A7dXX5BbWB7/eoD0P6XBJRIKoSGbsPSiCzYeE/Rc0ZwbGObL
	 e4F8cPmPCbtqp1wkFMAbJpp+XXPHRPNjJt3m82ZGs2Flu65zEwo/wC9vn/xvfrMuq2
	 05FWeSS6dfh/nu3rFkGFT1OTouSHZxWBTCEnFrHLnsGs+osoyUgVeE7TG5fCau/mmi
	 Qg/OIKdn+k+HEqqALzYmgqmd9rMI49wwV+qIWC0nUBeB0KlZ7WdDU/m1nTQMJ3+S9u
	 qQbo9uPqrnStA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C8C2817E157E;
	Tue, 22 Apr 2025 15:57:16 +0200 (CEST)
Message-ID: <e9d8c9e2-9d54-411f-85e5-ece70886bdcc@collabora.com>
Date: Tue, 22 Apr 2025 15:57:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: mediatek: mt8186: Add Squirtle
 Chromebooks
To: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-7-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421101248.426929-7-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_065719_475048_C726A71F 
X-CRM114-Status: UNSURE (   7.22  )
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

Il 21/04/25 12:12, Chen-Yu Tsai ha scritto:
> Add a device tree for the MT8186 based Squirtle Chromebooks, also known
> as the Acer Chromebook Spin 311 (R724T). The device is a 2-in-1
> convertible.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




