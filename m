Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49703E7BD91
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFYPjT1oER8aVW4w/Ttv6s9L2KEX8ciBcqWqO845oTg=; b=GeeYyrfuoJ+RaPRkSUsZkNrgp5
	DXcQpgcsqnzgBpKnvPV6j1US1Rjn3/vdZPQqJkc1XRmRE0YwYdUpaNeR6/a7HDJVwzVjpPuIL1wMy
	Yn0kASCK/s5HKk/vNUt7tplk0g3WlYUykRBfdGj5Rxva4VuAz+7AJmlmW5pJ11BfJ93Ei8mf87xfO
	JjeAWI7mnzrEr9lq2DoGNlTASJeT1rLaJtKN78V8uyG5E1F9NLw9Sa4URbzImEvZhNgf91U22G/8R
	8oXs+cN7L/CWUmbsBkXSHuPIXld5H4bxLAmRHt7tPivU+kv6jERYZpiPXULQSVjS64EpM8QWtBXW9
	h2n/cIWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrx1z-00000006TBU-0uSJ;
	Mon, 16 Feb 2026 11:44:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrx1v-00000006TB3-48zw;
	Mon, 16 Feb 2026 11:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771242280;
	bh=cu8/rfZAwHGNFPOMT8MxH3IqWdIyzUah7YlWDu37IxE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eRPA2HOQM+6DtScBDl9XtcTG04wHi9jhz3LMG2HRkeZ6xyfa6oQwzk3Sp+5l0XHsP
	 PEFPa4FtysBK/1B3+HOrlSyMHj8wnRMmv/KSQUkrNsdwPPorSDqhkBdnBbCroHRnC4
	 WCcH+xRao8KFze3dMwjFAW75Thejbiji11VjoZManBBUNV4ZJJyC6R93gFZ92D4mya
	 f+abblQopcHSVdgSb4IQzIQoTQiCdo/sepqZ51X7NPpcdcSy5lVA7HrOQxZ4Kf06hm
	 MArUOlfzyLod+l8UJ8/QlKGFM6TY/J47ZIkChwAC9S/OAqnxPASYGqvhsoQMwpLy2H
	 dfiBFXS/H0RTg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 53BF817E0E67;
	Mon, 16 Feb 2026 12:44:40 +0100 (CET)
Message-ID: <523c7b99-33a7-410d-8efb-b7bb2f2f416d@collabora.com>
Date: Mon, 16 Feb 2026 12:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except mt8196
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Adam Ford <aford173@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260215100302.136719-1-work@onurozkan.dev>
 <20260215100302.136719-2-work@onurozkan.dev>
 <CAHCN7xJJgLxPSf0QJ9nvY4Z3BguDmYJtpeprT+obD5DgA8rOgQ@mail.gmail.com>
 <20260216104423.6b5bcc96@fedora>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260216104423.6b5bcc96@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_034444_225325_2716DA32 
X-CRM114-Status: GOOD (  26.54  )
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

Il 16/02/26 10:44, Boris Brezillon ha scritto:
> Hello Adam,
> 
> On Sun, 15 Feb 2026 16:21:34 -0600
> Adam Ford <aford173@gmail.com> wrote:
> 
>> On Sun, Feb 15, 2026 at 4:04 AM Onur Özkan <work@onurozkan.dev> wrote:
>>>
>>> If sram-supply is missing, Panthor falls back to a
>>> dummy regulator with a warning. This implicit behavior
>>> hides missing DT wiring behind regulator core fallback.
>>>
>>> Make SRAM handling explicit: require sram-supply for all
>>> Panthor compatibles except mt8196-mali where GPU supplies
>>> are intentionally managed outside Panthor and DT does not
>>> model sram-supply for that compatible.
>>>
>>> This keeps DT power modeling explicit and avoids relying on
>>> dummy-regulator fallback.
>>>
>>> Link: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
>>> Signed-off-by: Onur Özkan <work@onurozkan.dev>
>>> ---
>>>   drivers/gpu/drm/panthor/panthor_devfreq.c | 13 +++++++++----
>>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
>>> index 2249b41ca4af..5f6075f18fe3 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
>>> @@ -206,12 +206,17 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>>>           * But without knowing if it's beneficial or not (in term of power
>>>           * consumption), or how much it slows down the suspend/resume steps,
>>>           * let's just keep regulators enabled for the device lifetime.
>>> +        *
>>> +        * Treat sram-supply as mandatory except for mt8196-mali. It manages
>>> +        * SRAM outside Panthor so this driver must not require direct control
>>> +        * over it.
>>>           */
>>> -       ret = devm_regulator_get_enable_optional(dev, "sram");
>>> -       if (ret && ret != -ENODEV) {
>>> -               if (ret != -EPROBE_DEFER)
>>> +       if (!of_device_is_compatible(dev->of_node, "mediatek,mt8196-mali")) {
>>
>> I wonder if a more generic device tree flag would be better here.
> 
> No, we don't want it as a separate DT flag. This is all stuff we can
> hide behind the compat, and every bit we add to the DT we don't
> strictly need turns out to be a liability in the long run in general.
> 
>> What happens if others do the same as Mediatek or Mediatek decides to
>> do this with more processors and this list grows?
> 
> That's what panthor_soc_data is for: you can attach per-compat
> properties without polluting the DT with more stuff that can be
> directly inferred from the compatible.
> 
>> It seems like a
>> panthor binding might be useful to prevent future bloat.
> 
> It's actually the opposite, the more we add to the DT, the trickier it
> gets to maintain, because we tend to get those things wrong (is the
> SRAM really not needed on mt8196, or is this just a workaround to hide
> the fact the PM is deferred to some FW?).
> 

MT8196 has three supplies: core, stack, sram.

For example, the Google Rauru Chromebooks use those:

        core-supply = <&mt6373_vbuck7>;
        stack-supply = <&mt6316dp_vbuck0>;
        sram-supply = <&mt6316kp_vbuck1>;

As of now (in our midstream trees), these supplies are declared in the gpufreq
node (the performance domain controller), and required to be on whenever GPUEB
interaction is needed, other than whenever the GPU itself is, well, needed to
be powered.

As of the current model, these supplies are getting powered on and off along
with the MFG power domain.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c#n1005

I'm not sure what happens if we also add those to the GPU node... for this, I'm
adding Nicolas to the Ccs, as he is the one who developed support for EB.

Cheers,
Angelo

> Regards,
> 
> Boris



