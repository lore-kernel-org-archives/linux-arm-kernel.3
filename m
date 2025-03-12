Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2FCC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 09:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHuCru4QHXqB2mgYvDq44oAwbOQyDAtraRq+g+1pboI=; b=Q9MNsAgeUEnsLWuVOOu1nkt7I8
	8UZD5QFSNruQIRPRpUpR6Zmu6JpkPSMBzfw6U8Yv+MeXPTEGG1w2WiK64oSBfxq4Jlm84o6KCg3MS
	GyZERs3QEgNRK2tKEFuXJXmcUkYsKlzcTD+xFb+a2WZri3dNHxLW36mvJnAo8cJHWvKT4sJHxtYzt
	8kFG5BqrwWPzU01YK5llC5txYsxeWDNX3sNYcS0N7B8sg8YmiIv93X/MA492LjR2Qj730IAYwuXz3
	ykjnPCCx+YRjHVJ0mXPYKiGhvHYcfgHmMpNt1CduzTwoO+3ATHSF04XOfIa1kCx2fQpbYIcL6TRSr
	rXBFUFyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsI7t-00000007uY2-2PzW;
	Wed, 12 Mar 2025 09:11:45 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsI6E-00000007uHl-339f;
	Wed, 12 Mar 2025 09:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pHuCru4QHXqB2mgYvDq44oAwbOQyDAtraRq+g+1pboI=; b=ERTwtiOCIj3j9CarcXXRXrdwuP
	EpNIw145j2Xe+T2gXM5n0PMpASp9n12VZF6X7wZBRwaERBwYvVbVsR9AylP1Aex+H35rLaz2abJu6
	O7ri+i6hJ6mSNxxm9XPtGzCwxYKM34GM8SKyaMoKXH03heHl8VdwDcQWSot+mI5p0CNA=;
Received: from p5b206ef1.dip0.t-ipconnect.de ([91.32.110.241] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1tsI60-00GAxl-2Z;
	Wed, 12 Mar 2025 10:09:48 +0100
Message-ID: <1c46870f-965b-4f70-a01b-adbcd60c2876@nbd.name>
Date: Wed, 12 Mar 2025 10:09:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mt76: mt7915: wed: find rx token by physical address
To: Ping-Ke Shih <pkshih@realtek.com>, Shengyu Qu <wiagn233@outlook.com>,
 "lorenzo@kernel.org" <lorenzo@kernel.org>,
 "ryder.lee@mediatek.com" <ryder.lee@mediatek.com>,
 "shayne.chen@mediatek.com" <shayne.chen@mediatek.com>,
 "sean.wang@mediatek.com" <sean.wang@mediatek.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Cc: "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>
References: <TYCPR01MB8437EE1595CD4AB581C006E898C62@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <TYCPR01MB843726907C170CFE2D3EB7BE98D12@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <e144d2ffe9924d81a7b60f38cdcf516a@realtek.com>
From: Felix Fietkau <nbd@nbd.name>
Content-Language: en-US
Autocrypt: addr=nbd@nbd.name; keydata=
 xsDiBEah5CcRBADIY7pu4LIv3jBlyQ/2u87iIZGe6f0f8pyB4UjzfJNXhJb8JylYYRzIOSxh
 ExKsdLCnJqsG1PY1mqTtoG8sONpwsHr2oJ4itjcGHfn5NJSUGTbtbbxLro13tHkGFCoCr4Z5
 Pv+XRgiANSpYlIigiMbOkide6wbggQK32tC20QxUIwCg4k6dtV/4kwEeiOUfErq00TVqIiEE
 AKcUi4taOuh/PQWx/Ujjl/P1LfJXqLKRPa8PwD4j2yjoc9l+7LptSxJThL9KSu6gtXQjcoR2
 vCK0OeYJhgO4kYMI78h1TSaxmtImEAnjFPYJYVsxrhay92jisYc7z5R/76AaELfF6RCjjGeP
 wdalulG+erWju710Bif7E1yjYVWeA/9Wd1lsOmx6uwwYgNqoFtcAunDaMKi9xVQW18FsUusM
 TdRvTZLBpoUAy+MajAL+R73TwLq3LnKpIcCwftyQXK5pEDKq57OhxJVv1Q8XkA9Dn1SBOjNB
 l25vJDFAT9ntp9THeDD2fv15yk4EKpWhu4H00/YX8KkhFsrtUs69+vZQwc0cRmVsaXggRmll
 dGthdSA8bmJkQG5iZC5uYW1lPsJgBBMRAgAgBQJGoeQnAhsjBgsJCAcDAgQVAggDBBYCAwEC
 HgECF4AACgkQ130UHQKnbvXsvgCgjsAIIOsY7xZ8VcSm7NABpi91yTMAniMMmH7FRenEAYMa
 VrwYTIThkTlQzsFNBEah5FQQCACMIep/hTzgPZ9HbCTKm9xN4bZX0JjrqjFem1Nxf3MBM5vN
 CYGBn8F4sGIzPmLhl4xFeq3k5irVg/YvxSDbQN6NJv8o+tP6zsMeWX2JjtV0P4aDIN1pK2/w
 VxcicArw0VYdv2ZCarccFBgH2a6GjswqlCqVM3gNIMI8ikzenKcso8YErGGiKYeMEZLwHaxE
 Y7mTPuOTrWL8uWWRL5mVjhZEVvDez6em/OYvzBwbkhImrryF29e3Po2cfY2n7EKjjr3/141K
 DHBBdgXlPNfDwROnA5ugjjEBjwkwBQqPpDA7AYPvpHh5vLbZnVGu5CwG7NAsrb2isRmjYoqk
 wu++3117AAMFB/9S0Sj7qFFQcD4laADVsabTpNNpaV4wAgVTRHKV/kC9luItzwDnUcsZUPdQ
 f3MueRJ3jIHU0UmRBG3uQftqbZJj3ikhnfvyLmkCNe+/hXhPu9sGvXyi2D4vszICvc1KL4RD
 aLSrOsROx22eZ26KqcW4ny7+va2FnvjsZgI8h4sDmaLzKczVRIiLITiMpLFEU/VoSv0m1F4B
 FtRgoiyjFzigWG0MsTdAN6FJzGh4mWWGIlE7o5JraNhnTd+yTUIPtw3ym6l8P+gbvfoZida0
 TspgwBWLnXQvP5EDvlZnNaKa/3oBes6z0QdaSOwZCRA3QSLHBwtgUsrT6RxRSweLrcabwkkE
 GBECAAkFAkah5FQCGwwACgkQ130UHQKnbvW2GgCeMncXpbbWNT2AtoAYICrKyX5R3iMAoMhw
 cL98efvrjdstUfTCP2pfetyN
In-Reply-To: <e144d2ffe9924d81a7b60f38cdcf516a@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_021002_842363_526D5A43 
X-CRM114-Status: GOOD (  24.70  )
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

On 12.03.25 02:41, Ping-Ke Shih wrote:
> Shengyu Qu <wiagn233@outlook.com> wrote:
>> 
>> Hi Shih,
>> 
>> Can you also give this patch a review? Seems I also need to convert to
>> reverse Xmas tree order for this patch, will do it in next version.
> 
> Yes. Please do it.
> 
>> 
>> Best regards,
>> Shengyu
>> 
>> 在 2025/2/22 19:38, Shengyu Qu 写道:
>> > The token id in RxDMAD may be incorrect when it is not the last frame
>> > due to WED HW bug. Lookup correct token id by physical address in sdp0.
>> >
>> > Downstream patch link:
>> https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/737340322ab22b138fd200e02
>> 0d61ffdbe3e36a9/autobuild/autobuild_5.4_mac80211_release/mt7988_wifi7_mac80211_mlo/package/kernel/mt76
>> /patches/0062-mtk-wifi-mt76-mt7915-wed-find-rx-token-by-physical-a.patch
>> >
>> > Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
>> > Signed-off-by: Shengyu Qu <wiagn233@outlook.com>
>> > ---
>> >   drivers/net/wireless/mediatek/mt76/dma.c | 25 +++++++++++++++++++++++-
>> >   1 file changed, 24 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
>> > index 844af16ee551..5bf63014263c 100644
>> > --- a/drivers/net/wireless/mediatek/mt76/dma.c
>> > +++ b/drivers/net/wireless/mediatek/mt76/dma.c
>> > @@ -444,9 +444,32 @@ mt76_dma_get_buf(struct mt76_dev *dev, struct mt76_queue *q, int idx,
>> >   	mt76_dma_should_drop_buf(drop, ctrl, buf1, desc_info);
>> >
>> >   	if (mt76_queue_is_wed_rx(q)) {
>> > +		u32 id, find = 0;
>> >   		u32 token = FIELD_GET(MT_DMA_CTL_TOKEN, buf1);
>> > -		struct mt76_txwi_cache *t = mt76_rx_token_release(dev, token);
>> > +		struct mt76_txwi_cache *t;
>> > +
>> > +		if (*more) {
> 
> Because of scope, should define 'find' (or 'found'?) as bool here.
> 
>> > +			spin_lock_bh(&dev->rx_token_lock);
>> > +
>> > +			idr_for_each_entry(&dev->rx_token, t, id) {
> 
> idr_find() can only get a pointer associated with the ID. Not sure if it can
> have a reverse way -- get ID from pointer. With sequential search in data path,
> cost is higher.
> 
> Maybe you can consider to build association between argument 'idx' and
> pointer/token by another patch.
> 
> But logic is okay to me.

Adding to that, it matters how frequently the token ID is incorrect. If 
the token ID is correct most of the time, then it's worth optimizing for 
that as the default case. In that case you should avoid the extra idr 
scan if the pointer for the provided token id already matches.

- Felix

