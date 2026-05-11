Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EC2CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQpLcQG/miDIpEHm9CEm6fihUq+I3/Kzf++kBEexALI=; b=y+M017ebCPYy2i5cZZ6vwI8EQQ
	x7ADX3HBxKOcWHIrbiYxz13f3s9NoKQX/uW9iKPEq1s5Ui+yxYMwIj96ICwwhtkS/232Lz4L4y25d
	ILjGgyFSLIa9zOFL2u5v9DMm/j5GBaVLazSwHbS62EznkvMB+rKoI1p9h5NS+hPLyV1HcSkaMBAXe
	JZkO1VugUdZCPJ31mcf9hzSp2D9i7Ulpnjg+8rDQG22Vie/cRf08wX5o0sZGD3+Q/D2kld/43Qufr
	WYKh+rfGIAChoWDdZ4LdcW8o3mlgk+QyvsevXyDJnSXAikjVRfNN/7NejOYBBav67UwPu6FJPKA6H
	sNl3pnnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMtS-0000000Curp-1Pcx;
	Mon, 11 May 2026 09:25:42 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMtI-0000000Cuka-3E8m;
	Mon, 11 May 2026 09:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778491530;
	bh=aLvBg8yakBBMO6jq6pG8SoxUD30ySkKq3+Kw9lSTjlw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nYYFs+JYZ7yl0vgORaPPmITEPFJc9Ey/HOy94txswRMCib3V8Oa6QC//hS6w8/X4Z
	 RK0Rb4qKgLtjFsKjjcPbZu2xpGZj41eV2rSa6A56habCn7DBX01c+FVI8GiqsVf9PG
	 mfifi16uj9LZMrDCzE4mRwUyelZ0vB1gP7PCAMvhWhoKzQrPuA6tKEN96hY55tL0BR
	 QgMtjQ2ou717SLBBzXKwCXmCrPS2FdyONMDRmIJxUPo8TW99pcvVUdlWMxLDwxUMo+
	 e+Uzmxah+DjDET66i0R1L+mvSGLUOx/wdS3kzSvmkpqVNIJQLjS2e9TCHMwNnpRC07
	 yFAq9HieUtrPg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B79B17E139E;
	Mon, 11 May 2026 11:25:29 +0200 (CEST)
Message-ID: <37cbdf51-46c7-4cc2-a213-74dfdd604cb1@collabora.com>
Date: Mon, 11 May 2026 11:25:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] dt-bindings: input: mediatek,pmic-keys: Add MT6365
 support
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-input@vger.kernel.org, linux-iio@vger.kernel.org
References: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
 <20260429-mediatek-genio-mt6365-cleanup-v1-3-6f43838be92f@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260429-mediatek-genio-mt6365-cleanup-v1-3-6f43838be92f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_022533_046847_60360A16 
X-CRM114-Status: UNSURE (   7.04  )
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

On 4/29/26 11:44, Louis-Alexis Eyraud wrote:
> Add compatible string for the pmic keys block found on the MT6365 PMIC,
> that is compatible with the one found in MT6359.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



