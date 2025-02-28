Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E66C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 18:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAVrXe2GtKGRikrFQXrI3C0RLbOB/qh3ogtlygvqV5k=; b=pom/hTsV/o1Eh5cirzut3adUR/
	wdBfE01pffh1KQgQAJFwWy3i9mK475+2za7Wy4F8FtE0zQ84nKprhQL1zDQNE8nHeK2HgvptVRfor
	1nuBqyxlJ8RnMHZpZzunltNOd+ZteD9+VzandCKxnfcd5mFcpy+EodX/nR6/popd8D4C0VI1qfC6b
	NVBuXP+qxn23zj7CKY29h1UQ6gXugJI9pbl+729iDOKa0bwlY2b4ETpKvGQV+slHIPKddDhenbMVG
	YauGkfPbNa3tKzTBzXBm636EwTDaGaKSFITi1m4dDISmip2NmWIBenusNQI6ruI3LYTh742/JxL43
	jTYsHlLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to5Js-0000000CCXX-0qIG;
	Fri, 28 Feb 2025 18:42:44 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to54y-0000000C8IM-09AY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 18:27:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0EEB7102901D3;
	Fri, 28 Feb 2025 19:27:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1740767238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pAVrXe2GtKGRikrFQXrI3C0RLbOB/qh3ogtlygvqV5k=;
	b=hHUH7KlExzQk0RFqF9nLQOKxLHnZyylEJBy/0NtE5H2cuq4sBIEFE58S7fHoDYv4gD6zoT
	vcRiv237pxECFs0d98+OLi3wSCCb0COeC83JbjlUQuk4Siq9d0DmORSUkViqCNXBO+mz+b
	24atUBXttB8DKWO8W/znbv0uvrmNLHCfBSBv67Td87Vyi+DBBms690Q/sjiunVFRs/6zyA
	/uJ0iXkQVtM3LhPWq8hLERPFUQm9z1mJ/52BZYAhYvj+WNVpC6KItcrjCW2Ez2g8DuEVat
	qnTuTX2UPguLkzLjPW5f81j0HX5rcWOtqfMBVF2cJiOR/5yQB7uJA8pCW+XqYA==
Message-ID: <1a644a7b-c4b5-483a-9a05-fe326a6ce2b5@denx.de>
Date: Fri, 28 Feb 2025 18:20:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] drm/panthor: Add i.MX95 support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Simona Vetter <simona@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 Sebastian Reichel <sre@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Steven Price <steven.price@arm.com>, imx@lists.linux.dev,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-9-marex@denx.de>
 <20250227201709.2diz57xv2tntw36q@pengutronix.de>
 <8bc7e55d-7a8d-436b-ad6f-f7cb8caa28a0@denx.de>
 <20250228103358.tbcqyrtzzsgacxbm@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250228103358.tbcqyrtzzsgacxbm@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_102720_231328_3442716F 
X-CRM114-Status: GOOD (  15.54  )
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

On 2/28/25 11:33 AM, Marco Felsch wrote:
> On 25-02-27, Marek Vasut wrote:
>> On 2/27/25 9:17 PM, Marco Felsch wrote:
>>
>> [...]
>>
>>>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
>>>> index 06fe46e320738..2504a456d45c4 100644
>>>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
>>>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
>>>> @@ -1591,6 +1591,7 @@ static struct attribute *panthor_attrs[] = {
>>>>    ATTRIBUTE_GROUPS(panthor);
>>>>    static const struct of_device_id dt_match[] = {
>>>> +	{ .compatible = "fsl,imx95-mali" },	/* G310 */
>>> 			  ^
>>> 			 nxp?
>>>
>>> Can we switch to nxp instead?
>> We can ... is that the current recommendation ?
>>
>> Why not stick with fsl , is that deprecated now ?
> 
> Nope I don't think so but I do see patches adding 'nxp' as vendor
> (mostly external chips) and some with 'fsl' (mostly soc internal ip
> cores).
> 
> My hope was that at some point we could switch to 'nxp' only and make
> use of this vendor-prefix. Of course NXP should start with that switch
> but this seems not to happen :/
> 
> It's more a nit but maybe this triggers NXP to make use of the 'nxp'
> vendor-prefix as well once they upstream a new base dtsi.
OK, fixed.

