Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B29E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2JhcIr9803BVJXb3xfI/ml4iC6pG75GP694UqxH9TA=; b=3dMmSiUFLhDWoHiTScW45SVasf
	6AGICZhrVR1FL8LZ2p4tSFeg22TDqBjza+y9Rf/rOxwGN2hjiJguTsH/lQHJeLKLCVqoJ6DKcCb6O
	R97jcM/+eDXgmTdYZPtkwH2AQqCMiUROAiIgJRMr6rGar0shJmBNalWmGg/9zr1xTYuGQ28rkoNnd
	cK7F5yWXclUKLNmd3rcoA/zeF3MhMgMEN0YPoOEDRdvJplls98ohagEMVUBKOmt9aPTNltd4G3Hvv
	MwQMUq6ES9YHkWsbZUuog5AcNBE2wgrFpJBHWy9CkFqYHc3NmXgi0lYe/6mydbPRACaR57xXZJXoo
	WpOEygsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvkP-0000000GyW8-3Wvn;
	Wed, 18 Dec 2024 15:14:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvjG-0000000GyFt-0EAk;
	Wed, 18 Dec 2024 15:12:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734534767;
	bh=/WpAFEF2F//sHkizT2Rkt9wmQRdw0Tc769M5Q7NH2Dw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N1zSb1NHDcwcImQKkK83d7SaYQbZ8eq6iwR4QFs1Ej1e7qzGO+fiIay3UHVzKMvLR
	 SyrLlrBr+wIOpIEr1LJYA0Ps4cfi8Ul7yvoZTXB/6uBrbCi+il25h0iXOnBA2vgHCE
	 aod8nZ/Mi9QTMSp2cZfr4NMBM4oGhnU2weBvvGYqlp9Y/zZ0u5QztQYqoPWg4lTT8v
	 9hdh6s3vDmjM+Ft3GkrvQ8MJOpxs4taQhPJDrlQW5b9hr6aaebQraCzXpxxLAZbRlr
	 QDdC4Xc+RHiviMQBrFQQKM8pJGFNJwa+DtT4Jek0LCzw7brmg6luNZQQ52Xe5YBODp
	 fOzcjDefCp4Sw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 43AFB17E377F;
	Wed, 18 Dec 2024 16:12:46 +0100 (CET)
Message-ID: <db89c62e-5346-4e46-b6b3-6cc6b3e5a256@collabora.com>
Date: Wed, 18 Dec 2024 16:12:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: stop selecting foreign drivers
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>
Cc: Maxime Ripard <mripard@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Zimmermann <tzimmermann@suse.de>, Chen-Yu Tsai <wenst@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241218085837.2670434-1-arnd@kernel.org>
 <46f871e3-bb1e-4bee-95f3-2121c6a6eef7@collabora.com>
 <1d8c6f65-5baa-459e-ba34-4e45ca20baf6@app.fastmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <1d8c6f65-5baa-459e-ba34-4e45ca20baf6@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_071250_244717_6E38E35A 
X-CRM114-Status: GOOD (  12.37  )
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

Il 18/12/24 12:44, Arnd Bergmann ha scritto:
> On Wed, Dec 18, 2024, at 11:50, AngeloGioacchino Del Regno wrote:
>> Il 18/12/24 09:58, Arnd Bergmann ha scritto:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The problem is - no PHY no party, it's not going to work without... but
>> I get the
>> reasons behind this change.
>>
>> Are we sure that we can't just add a `depends on PHY_MTK_xxxx` (or extend
>> depends on DRM_MEDIATEK && PHY_MTK_xxx)?
> 
> Doing this wouldn't cause any problems, but it also doesn't
> really help much, you just have to know which devices are
> present and enable all their drivers anyway.
> 
> We used to just select all drivers from arch/arm/mach-*/Kconfig
> on some older platforms, but this was too much of a hassle.
> 
>        Arnd

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


