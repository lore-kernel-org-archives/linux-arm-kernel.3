Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5874CDDE64
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81rgeuPwS+fbp38mlTpqzkWLyfJK+ro7UUiFz1b8Xic=; b=1MP56w2CArRqcyzZh8awcP0fTe
	XQZLydrWEQIbu9GphXWwOrtnhCa6Ozyn0o2eZWsxxaP2NcGdUuqlwA12OvXRoUOxJtYqZNmcNo2d7
	tWbpKTv+sHSwtA/vcsUMhrzL4SjQFm+zuv+FCcrrvBBfULdEVHfnTEpxUJ32K03GkFtSMaPeuwI7H
	ayBH3eMfQ9QntRHpUFJCCA/zDrNggyowkx3P+qBM9dtC4IcsLrk7jXQASqDg0nBuEFB1qzy1Lq8SF
	QMxVLc3kyKvcoPqg0DcxV3g9jp71nnIg3sq8c/ECkan1PJihwCJeV5avixXzZ/b4OjvmXpCwxj0x5
	xAIpld1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Z3G-0000000E3yk-3VNQ;
	Wed, 23 Oct 2024 10:57:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Yn6-0000000E171-2o3Z;
	Wed, 23 Oct 2024 10:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729680033;
	bh=o50zMYvyJy94Jo4WMf29VGc2u3pKkDKne85GzsktI+Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A4NdIEmREsvf6ijIpkWkHLbM0fdtVXxn1xmR1Lw51BoK2AgDxfEzUJu7H7bEHDO5T
	 XYEr7dRd8WIXjEdZ5UnB8yHS4oxXfK6/+ZhzoD8dOwpESty9yE9Y1sYoN6Adn6NpZm
	 vfhxKOVo83mtTCtPV6nBpYGFnrRgVOUB7FsJ9wjT05E1hOEwVMIvVVBvzxSzXcu/u2
	 xeKP7aYBqSecehjt234ecBWnKqwjmnj9iWNH/NtyB21Z1gEu+EhAc2YDXwUrY2lVlp
	 18qUM82u30evUOV1AoYDBcCKUSEAQApxJNjDLlU4IFc9jQPneo/ucXZkNiQhfZvVL0
	 u0RxpQVHb7uvg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 11C2917E14EA;
	Wed, 23 Oct 2024 12:40:33 +0200 (CEST)
Message-ID: <9b12aaec-504c-4e3a-a606-240341d8e0d3@collabora.com>
Date: Wed, 23 Oct 2024 12:40:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: mediatek-regulator-coupler: Fix comment
To: Fei Shao <fshao@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20241023102059.512352-1-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241023102059.512352-1-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_034036_926924_929394A5 
X-CRM114-Status: GOOD (  22.49  )
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

Il 23/10/24 12:19, Fei Shao ha scritto:
> Fix two minor issues in the comments.
> 
> 1. We balance VSRAM voltage based on the target VGPU voltage, so the
>     comment likely refers to VGPU.

Function `mediatek_regulator_balance_voltage()` refers, as stated in the comment
located at the top of its signature, to "GPU<->SRAM" voltages relationships.

So, we're taking into consideration only two regulators:
                   VGPU and VSRAM

The first comment says:
"If we're asked to set a voltage (implicit: to VGPU) less than VSRAM min_uV[...]"

...so, I think that you've misunderstood what the comment says :-)

> 2. .attach_regulator() returns 0 on success and 1 if the regulator is
>     not suitable. The context suggests a successful return value (0).

The comment is on top of a "refuse" or "error" case - one that wants to return 1
and not zero.

Besides, it clearly states:
"The regulator core will keep walking through the list of couplers when any
  .attach_regulator() callback returns 1"

...which is definitely true.

drivers/regulator/core.c
function `regulator_find_coupler()`:

	list_for_each_entry_reverse(coupler, &regulator_coupler_list, list) {
		err = coupler->attach_regulator(coupler, rdev);
		[.....]
		if (err < 0)
			return ERR_PTR(err);

		if (err == 1)
			continue;

		break;
	}

Is that clear now?

Cheers,
Angelo

> 
> Fixes: c200774a6df4 ("soc: mediatek: Introduce mediatek-regulator-coupler driver")
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
>   drivers/soc/mediatek/mtk-regulator-coupler.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-regulator-coupler.c b/drivers/soc/mediatek/mtk-regulator-coupler.c
> index 0b6a2884145e..16df12d1c2e0 100644
> --- a/drivers/soc/mediatek/mtk-regulator-coupler.c
> +++ b/drivers/soc/mediatek/mtk-regulator-coupler.c
> @@ -74,7 +74,7 @@ static int mediatek_regulator_balance_voltage(struct regulator_coupler *coupler,
>   		return ret;
>   
>   	/*
> -	 * If we're asked to set a voltage less than VSRAM min_uV, set
> +	 * If we're asked to set a voltage less than VGPU min_uV, set
>   	 * the minimum allowed voltage on VSRAM, as in this case it is
>   	 * safe to ignore the max_spread parameter.
>   	 */
> @@ -108,7 +108,7 @@ static int mediatek_regulator_attach(struct regulator_coupler *coupler,
>   	 * this means that this is surely not a GPU<->SRAM couple: in that
>   	 * case, we may want to use another coupler implementation, if any,
>   	 * or the generic one: the regulator core will keep walking through
> -	 * the list of couplers when any .attach_regulator() cb returns 1.
> +	 * the list of couplers when any .attach_regulator() cb returns 0.
>   	 */
>   	if (rdev->coupling_desc.n_coupled > 2)
>   		return 1;



