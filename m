Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884A1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 10:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIW2XRKLV2QWavQlL34+6v+DQJvyueU3NSYNE4nV8Zw=; b=Q/j+jAIkD2IFxmaJMA0by8nejR
	Z4qSrC4V/ek9dsbZvKYa8NGpG+Opacfhff1ypVEu0X9b9QpuM0dI3aD/2Dmw5TQoD67S93WLa0r70
	Tns+vfqmtmVtW0bNYDX41WFShSMJpotSFU0s5vmeupMQQWe5O27/e5NhfyersozUx39B9IELJ6d/V
	GH6cGIcEuYLc8y7u3w75HxSqbs4VipfFgwWsfOVa3QdFQD6OWcMlnPNiksrCjT4Kmnz3qRAC6viFo
	tPC1EuUGWmmBWn6+aPOJiQD/9j6jAi+Lw3811d2SdllgxWEhcaXvmE6lnVpi+JCLd5+6Z2GQ5VAco
	3ah65CKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIQ4-0000000A8oX-1j2Y;
	Thu, 02 Jan 2025 10:27:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIOt-0000000A8Z0-0wz4;
	Thu, 02 Jan 2025 10:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735813554;
	bh=K1pfxYqXOc52PRosS2j0BYuB9mHwfBtw9u9O1FNSkPk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qffiWESEleKjF2uZCQdtKxqC+Uy8yySJ0NZISO4YqBRdcdETzJTZxdYkVLhvFHrv0
	 UVBu4bUYRyKXIbQHVK4lxrILiikEgDZGT9Nud2AK9TO6KmRGnUuCSwA9ucMEXaw0kn
	 1pQy9IhUSLzARpCIWI+rptSXUFGEtwUG6YP62cCsuJYfJhiE6OQ3TchWChDJ1hVnvs
	 eyp5mC/mcdcW6bBT8Ez8rnEoGlCTwftfEDFWc1w0u2tvRSwbNaDn8KmbjjLESg+fJX
	 F+4lv8SJNkiJfov6SY1ZHiBRVbEvsHrihMJB2oETHrgaLk0DNjdDhT8h1LX1xwMSkw
	 FG3/w1sB9S1rA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64B8917E153D;
	Thu,  2 Jan 2025 11:25:53 +0100 (CET)
Message-ID: <599e27fd-e3fe-4d36-84b9-5742995cad69@collabora.com>
Date: Thu, 2 Jan 2025 11:25:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: mt6392: add mt6392 PMIC dtsi
To: Val Packett <val@packett.cool>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Fabien Parent <parent.f@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
References: <20241226050205.30241-1-val@packett.cool>
 <20241226050205.30241-10-val@packett.cool>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241226050205.30241-10-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_022559_441068_E3636DD5 
X-CRM114-Status: UNSURE (   7.12  )
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
> Add the dts to be included by all boards using the MT6392 PMIC.
> 
> Signed-off-by: Val Packett <val@packett.cool>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


