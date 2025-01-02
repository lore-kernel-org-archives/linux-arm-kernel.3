Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1023E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 10:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IO0oTfS4vBZGmIhiB0p9L9QahoWxIwPb27v0EA0QHc=; b=aNVIkixC4G2K/GhNtvbTdRf+6J
	0QOkwZZNlem1qGRKWMnk3oGQPQF7BFon5b1kk+gDhSwkGqKBIj7LOz4SQCGhHhW8dLpYO6QVRP862
	IXSdlpgEqdeOTnRhAtL9Wgon0Tf2oeY62NyjOZDG+4HYIctuVXItcTSNOk1gX8fydgVxWP7q7fMO4
	8tHzSlx/KBJdlH1HovIps6os3zhytnykCSzlnJH18DykKLbYs7kiy6DHZwkS8r4OHRwQvTXpbYoRL
	uEofWZUrrNbM2xvHnVYY2EC8ryi1F0AEneW9EI4MqBbhEjQTNt+lxdeiCQ86UTQqguNNeTJqP0K4H
	ekpowKjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIUi-0000000A9Vw-2zgA;
	Thu, 02 Jan 2025 10:32:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIOy-0000000A8aK-1c6s;
	Thu, 02 Jan 2025 10:26:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735813563;
	bh=0tYrz61oD1++DkdZhfVjk2QczHG0iMWOdbWTNRwVrHY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FbicFpRbKW3WZvBLtVT/loRE+7JT+98Wcrb6L0RBrJljDdNB+LFi6qxcqVw3erYFq
	 j+aHc9ezA/YqxC+pDt8S5cM4oUx/rsKflPEq9G4TkbUWyCuwfLqGZr/V7a62S79QX4
	 6MluNSu5Kviv9NLCVq7yU10UKokRYD4LscEjbCtVmEkJ4nyNlXDyfiGjFBzbOvnutY
	 jv+lS8NNuQkchkCD0xPcM4yZQJ82Ja8FP/+7WEgm3YBfwAOkcF5DQXlgEkuHryrosz
	 bwXo1YC7i5Ohve/0LvlrFlEpWhFqst9q5Yy4XuwCZc9zyYmNjKyW8WZvUAlI4gzTBX
	 qAbpo1ahXh+hA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C872717E1552;
	Thu,  2 Jan 2025 11:26:01 +0100 (CET)
Message-ID: <9a3a8ec5-a0fa-4e27-a5dc-b1c041686dd8@collabora.com>
Date: Thu, 2 Jan 2025 11:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] mfd: mt6397: Add support for MT6392 pmic
To: Val Packett <val@packett.cool>
Cc: Fabien Parent <parent.f@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
References: <20241226050205.30241-1-val@packett.cool>
 <20241226050205.30241-5-val@packett.cool>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241226050205.30241-5-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_022604_585444_5F14C1CE 
X-CRM114-Status: UNSURE (   8.01  )
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

Il 26/12/24 05:58, Val Packett ha scritto:
> From: Fabien Parent <parent.f@gmail.com>
> 
> Update the MT6397 MFD driver to support the MT6392 PMIC.
> 
> Signed-off-by: Fabien Parent <parent.f@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


