Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B6FC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/F0m5YSoTE5fSuE6te1ou9Js3r688ZIYywnzlXzkVyg=; b=3MJExQ8Zm59/5Gw9cmdX0eQlNI
	0lxVaCKQI7YzKrTlA9lX4jIfaInpIzyUw9/JTyQiyV4YP4yC441Et4O/ZegjO5D9M9Ps14ijLkipj
	ppUOG+bNCsDepwlrfMvf0oFnSokgG3j4uBA/Nv9VUOLhQTARW424tR2u4fgtJHCuU8jkwDVVekmoK
	R5hVem2NrG7OREQ4kgrA7YSqra4he+myGkA9ji8SpR504jN2o+Jc9WwOFg7F3lX7pbDOIaM9to5LR
	+h3j8YnOJpNjo8NpL6wKSrvoXH+LpCLvn1KIUDZwALVbWouZoQl/TUnmo2dm+8V31H/MP3KEodNiC
	FilmEQpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwOO-0000000EOaa-3BSS;
	Wed, 15 Jul 2026 09:59:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwOM-0000000EOaD-1PEg;
	Wed, 15 Jul 2026 09:59:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784109540;
	bh=A0P83uQz8I3cpMmpwBvFRnuqr2Xe0F0qmqvYylHFg6o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IRPqg0sA1xSsSZQ8f7VHmUKzJdLsuS1PyKjMse96nXIdRp+/5rkSL+JYaLUXUNnOs
	 7dJ0EhAafV594ZrIYCgF7rwy/jnpcWA1i2FG0rb6DLrb6LWMpi2Zy5qQdughkMSeZr
	 NoLGP/uNCYzTkgIHVQZbiWaLIHqWPClFPfr6T8gwslmJZPtiERX+xWflsmSAAKAAfr
	 RyLoS5Hx0J1YysadOlI/tWOOCIygUIBMxrLiuGCsYw8L/xrgdoqDbWpwNOjNSXOZcw
	 v7UbfSfz9sLztcOqAmc8oRFXVZUwOdoTMISVyBk+RGsrHo3Siwu+VX4NVyAADujK6e
	 aEY11kbp7bgQQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 834EF17E0928;
	Wed, 15 Jul 2026 11:58:59 +0200 (CEST)
Message-ID: <d3932209-04cc-40bc-9bb1-f31c365e93ca@collabora.com>
Date: Wed, 15 Jul 2026 11:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: power: Add MediaTek MT6858 power domain
 controller
To: nikolai.burov@jolla.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ulf Hansson <ulfh@kernel.org>
Cc: Matthias Brugger <mbrugger@suse.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 Nikolai Burov <nikolai.burov+review@abscue.de>
References: <20260714-mt6858-pmdomain-v1-0-4f09bbb822e0@jolla.com>
 <20260714-mt6858-pmdomain-v1-1-4f09bbb822e0@jolla.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260714-mt6858-pmdomain-v1-1-4f09bbb822e0@jolla.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_025902_534689_8A4F69FA 
X-CRM114-Status: UNSURE (   7.11  )
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

On 7/14/26 15:43, Nikolai Burov via B4 Relay wrote:
> From: Nikolai Burov <nikolai.burov@jolla.com>
> 
> Add a new compatible and document bindings for the power domain
> controller of the MT6858 SoC.
> 
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


