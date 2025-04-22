Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46319C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiGCvTHLpmr8XkR8bYlXUNZvSbP6/6H4eoRmvVHs188=; b=LNmtqXN3WWpemg83ZuwXLrporY
	yy2RFuPgC/J395GBicpB1o2UUx+Wc/WpUP4zp6PE2X/WooTqTb0DuWcRKdLlLRuDH49LCI1Bgc7+r
	Wf/kIdJ12XYmTVC/SXpQFOj9K13eMala0nVhsH+HrA3b/zZZXc4tR7340bvi6Ve8JdExLYILnICcM
	iHSceQoFLfouh8apO3ejDMvO/efuwljFFb/j7NXQb24bQIzq1lNJDx7oLbLZgrb7sA42HgYefsEXB
	aPYDWGAiPsTqbIGzFNRDrKif37ceaLL1/2zjAmpoLfVdHmvK7q2Mf9V93sSfe8e3KIVTEf2DHeWcO
	pN5TygUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GSS-00000007uJ2-0Gd4;
	Tue, 22 Apr 2025 16:26:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7E7T-00000007ONr-35NC;
	Tue, 22 Apr 2025 13:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745330222;
	bh=P0PnNjNfw5TonK4bC7HdNBzKGNWZw94cWOwyHMvPVFY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b9Jp1fuJAapiaX2kjyp4dWMOiazs8Kv9ItszrwLVpXIiMlA5nQr7G42j+GjN58P4f
	 uZlXBoJyWbyN4X4lwAGds8Omwc84K4jIsJgdZwilJvbVXNiUwXoasKJNZnAqa9g66m
	 q74ZgOE23mnb/WkeysVBPPUdI+de1eHEHw4DJRuV9YfJTlilZ5/cP3UUvPL9aMchk6
	 0PbKc8UIOcSDUs1wa27K8Ef1GaBp2zNRw8HjHyo24gRGC+PlGxQ9Ipqy/Nnux09Qls
	 bi72io72BGcLU3RRiC6rHdcE75s/1OZLZspwo2XSfsOVPeL7bq01SpuSuFikOW/BjX
	 YO8Xc77SC0KYA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 87AAB17E155C;
	Tue, 22 Apr 2025 15:57:01 +0200 (CEST)
Message-ID: <a201bb4d-1dbc-4f21-b742-18ca3d35e1fa@collabora.com>
Date: Tue, 22 Apr 2025 15:57:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] platform/chrome: of_hw_prober: Support trackpad
 probing on Corsola family
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
 <20250421101248.426929-8-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421101248.426929-8-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_065703_920331_C6A98738 
X-CRM114-Status: UNSURE (   8.26  )
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
> Various MT8186 Corsola Chromebooks (squirtle, steelix and voltorb
> families) have second source trackpads that need to be probed.
> The power supply for these are always on and their reset/enable
> lines are not exposed.
> 
> Add them to the probing list.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



