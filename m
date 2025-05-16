Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE12C54754
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=si+6so3E4lQIUUBkcJ18BhMSwUXfb7BiWBnbg3/5fd0=; b=g3Bo78EjpJ8Md1UU8fvDED0SSs
	ya9ItA5XUUW1YJ8dIukviZfIdTtYAyfpsT3/hSpKEp2HQse9YnrSD4/ivXlhSalyTBo8iOg83ubTo
	GLRPekPxGI/fyi6L7ioE5P3v32bOboIjVVjYJhaq71g9gQ4Nl36x5wE7Dq0pPLQ2HbW8T9LfpANnv
	6GE0wUGozTf3w/5ym1tpij8kkp2tx0BqgbjhzS/3t8zqbhCjhO7nadIf4D7YRuCdua+oBrG6hog3/
	Aq9Ej77f9dRAOYEa03YeDowjdO6KIfDIUvKVSzQtNKLbqGeUzumkog7B6hDa5LnY5DvGDSFgZu21P
	i+vhxF3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFyGH-000000043qb-1Pf9;
	Fri, 16 May 2025 16:50:17 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxvS-00000004194-3RNK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 16:28:48 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1747412921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=si+6so3E4lQIUUBkcJ18BhMSwUXfb7BiWBnbg3/5fd0=;
	b=yHS+a95qmmToOInVPx43MXnz71HkBxazS2EVN3QCqAB0iN4/QnfGlNV+yPE5CUQ3Z5KfM3
	0vacidYJGsvGiH8WMJWpiXP7RIrU7sknI8OMomAHDWeh7ZBHAzxOxI32gD7Uq6cizqImFq
	J9qwOCJK3UOXvCZtLQqLTcWCxd2u/hpa0G9sRYsUWlSbvEikc7zIAq0d4QTURwb8HPQWTv
	kk8q6/BfvPjgk+PjIza3pDNGwyY+58i8zzypQRgxo25qkmkVWYJqW9pUh6KZwsBJ6QyrF5
	bqdlnuRnGvobNk8N9weVsZWTsvfTuJI8ydpAMCRhw71j0v7ydoorCwC85VWY8w==
Content-Type: multipart/signed;
 boundary=2a1f0776b31dfb19db50a4c0755eae34fad21a6c0baa4ca8dc5831fba976;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 16 May 2025 18:28:27 +0200
Message-Id: <D9XQ6FEVLTFF.6FEVFO840FYQ@cknow.org>
Cc: <linux-phy@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] phy: phy-rockchip-samsung-hdptx: Fix PHY PLL output
 50.25MHz error
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>, "Algea Cao"
 <algea.cao@rock-chips.com>, <vkoul@kernel.org>, <kishon@kernel.org>,
 <heiko@sntech.de>, <andy.yan@rock-chips.com>
References: <20250427095124.3354439-1-algea.cao@rock-chips.com>
 <D9XP2BH2CU02.1R9E1GSXQD9JB@cknow.org>
 <9e29ef0e-c373-4f48-8f37-7111987d2dd0@collabora.com>
In-Reply-To: <9e29ef0e-c373-4f48-8f37-7111987d2dd0@collabora.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_092847_070593_22624D61 
X-CRM114-Status: GOOD (  17.79  )
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

--2a1f0776b31dfb19db50a4c0755eae34fad21a6c0baa4ca8dc5831fba976
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Cristian,=20

On Fri May 16, 2025 at 6:02 PM CEST, Cristian Ciocaltea wrote:
> On 5/16/25 6:36 PM, Diederik de Haas wrote:
>> On Sun Apr 27, 2025 at 11:51 AM CEST, Algea Cao wrote:
>>> When using HDMI PLL frequency division coefficient at 50.25MHz
>>> that is calculated by rk_hdptx_phy_clk_pll_calc(), it fails to
>>> get PHY LANE lock. Although the calculated values are within the
>>> allowable range of PHY PLL configuration.
>>>
>>> In order to fix the PHY LANE lock error and provide the expected
>>> 50.25MHz output, manually compute the required PHY PLL frequency
>>> division coefficient and add it to ropll_tmds_cfg configuration
>>> table.
>>>
>>> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
>>> Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>
>>> ---
>>>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/driver=
s/phy/rockchip/phy-rockchip-samsung-hdptx.c
>>> index fe7c05748356..77236f012a1f 100644
>>> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>>> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>>> @@ -476,6 +476,8 @@ static const struct ropll_config ropll_tmds_cfg[] =
=3D {
>>>  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>>>  	{ 650000, 162, 162, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 54, 0, 16, 4, 1,
>>>  	  1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>>> +	{ 502500, 84, 84, 1, 1, 7, 1, 1, 1, 1, 1, 1, 1, 11, 1, 4, 5,
>>> +	  4, 11, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>>>  	{ 337500, 0x70, 0x70, 1, 1, 0xf, 1, 1, 1, 1, 1, 1, 1, 0x2, 0, 0x01, 5=
,
>>>  	  1, 1, 1, 0, 0x20, 0x0c, 1, 0x0e, 0, 0, },
>>>  	{ 400000, 100, 100, 1, 1, 11, 1, 1, 0, 1, 0, 1, 1, 0x9, 0, 0x05, 0,
>>=20
>> I found this patch in the 'fixes' branch in linux-phy:
>> https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/commit=
/?h=3Dfixes&id=3Df9475055b11c0c70979bd1667a76b2ebae638eb7
>>=20
>> In the 'next' branch in linux-phy, I found this commit:
>> 0edf9d2bb9b4 ("phy: rockchip: samsung-hdptx: Avoid Hz<->hHz unit convers=
ion overhead")
>> https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/commit=
/?h=3Dnext&id=3D0edf9d2bb9b4ba7566dfdc7605883e04575129d9
>>=20
>> Where the values in ropll_tmds_cfg are converted from hHz to Hz and the
>> data type changes from u32 to unsigned long long.
>> But AFAICT it does NOT convert this '502500' value, which IIUC means
>> most values are in Hz, while this one is in hHz.
>>=20
>> Am I missing something or should this new value also be converted?
>
> Yeah, the conversion is necessary. FWIW, this has been already fixed by
> Stephen Rothwell in linux-next, while Vinod will handle it before
> sending the PR:
>
> https://lore.kernel.org/all/aCXEOGUDcnaoGKWW@vaman/

Excellent. Thanks for the explanation :-)

Cheers,
  Diederik

--2a1f0776b31dfb19db50a4c0755eae34fad21a6c0baa4ca8dc5831fba976
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaCdnsgAKCRDXblvOeH7b
bvW7AQDSfcraP5FPLqmJrWKe64CLK6ifVw5O8f7Yi2FT8tSXhgEAw6hnZJ9JTDyD
/GjaqlgnqB5uiJH+H0E1H+TWSuLztQU=
=hAWm
-----END PGP SIGNATURE-----

--2a1f0776b31dfb19db50a4c0755eae34fad21a6c0baa4ca8dc5831fba976--

