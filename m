Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6BDC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFprhQeNmmCYEp+8aOLRLch/0cM3jigib4motf9TPiA=; b=4ORxH/YvAfkXFHTZvKldzDfIco
	mramENG0ULqU9oAfalOcgrrMB79ze77Gk704h3sYattqa6nImrSvQ7SxZXsnaq5jWYxGicZFH16ev
	8LA4H4WJekoHFwxRV6uNz6njdQ7IaCwEfB7Q00evTP8PrhN3kdPgSTMc2Sg3LwGN7lgIjjE0fjFN2
	7lV5th0tCV8XNHUo4izNwoc9NhqWLc8uFQvviRG8La1MWNKVYqp+MdbelyE/icZrNvRSHaaq5hOAK
	woGYgaJ3FXJjtnm5K1XTsqxcmtpe7zCsfkcixvJ1C+Z3PunrMMDxYX/nvnaAj5Z2zy/zBAgrExceQ
	0+z8JGtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thS8s-0000000HGW3-3kta;
	Mon, 10 Feb 2025 11:39:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRsZ-0000000HCNj-3xZi;
	Mon, 10 Feb 2025 11:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739186586;
	bh=2TfBb8YkHBjUcd2qbTj06jtJqA74ipyI1dLzWmzyRp4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eQ4nxJESKZB4J0JFkg5Nk8KYNqeTOzP+Sf8VljtKSgz/vbFYNKynyDTvsGRDBIe/K
	 NH0EcNQ8rHXCiiHdMgXvClbJABoqnKs+kaTOg2raVeJI/NbsXC7V/OHMk4LMWpTjdr
	 /IqGJgFtoXI5JyzztBVldciULs31BkopnpoJR0vT6klju0S1HxyasgIYuLIAusPwvm
	 tBIfg0GkaJQwf453X/lQxlHqGu2gqV4Y+ohZ6Ec23Vig626spJpLuLFLG6QyRrTnI6
	 o5BQJCZr/Jky0L5WT8E1vc5U0aRGGIPVGpZT9ZOhGQTLUiIP4IFUNOQ0C+CcwbOn1d
	 ZNfkne9lGJwnQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF3F417E09F6;
	Mon, 10 Feb 2025 12:23:04 +0100 (CET)
Message-ID: <2fd97b1e-6546-4f43-bc60-15a812e66467@collabora.com>
Date: Mon, 10 Feb 2025 12:23:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 27/34] drm/mediatek: mtk_hdmi: Cleanup function
 mtk_hdmi_resume()
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "jie.qiu@mediatek.com" <jie.qiu@mediatek.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?UTF-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?= <TommyYL.Chen@mediatek.com>,
 =?UTF-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?= <Ives.Chenjh@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "junzhi.zhao@mediatek.com" <junzhi.zhao@mediatek.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
 <20250113145232.227674-28-angelogioacchino.delregno@collabora.com>
 <f25eaced46e18a54896f20ae1c42ed6894da5e18.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <f25eaced46e18a54896f20ae1c42ed6894da5e18.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_032308_172919_40F7230C 
X-CRM114-Status: GOOD (  14.93  )
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

Il 07/02/25 07:04, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Mon, 2025-01-13 at 15:52 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Remove the error print in case of mtk_hdmi_clk_enable_audio()
>> failures: since the APIs will already print on their own, having
>> one in there is redundant.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 9 +--------
>>   1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index 40eea5c125d2..c5431f160fe4 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> @@ -1703,15 +1703,8 @@ static __maybe_unused int mtk_hdmi_suspend(struct device *dev)
>>   static __maybe_unused int mtk_hdmi_resume(struct device *dev)
>>   {
>>          struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>> -       int ret = 0;
>>
>> -       ret = mtk_hdmi_clk_enable_audio(hdmi);
> 
> I do not find where to print the error message, could you provide where would print the error message?
> 

It's handled in drivers/base/power/main.c - upon failure, a pm_dev_err() will be
executed, printing an error message stating that this (or any other) driver has
failed resuming.

Cheers,
Angelo

> Regards,
> CK
> 
>> -       if (ret) {
>> -               dev_err(dev, "hdmi resume failed!\n");
>> -               return ret;
>> -       }
>> -
>> -       return 0;
>> +       return mtk_hdmi_clk_enable_audio(hdmi);
>>   }
>>
>>   static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops, mtk_hdmi_suspend, mtk_hdmi_resume);
>> --
>> 2.47.0
>>
> 


