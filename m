Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77D9CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 18:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJyoScP3L0tXwrXGIs53mFTcbXE9LFahzkC4XIeXmdE=; b=DMhD+3IDlme7o8Ut0jI6hK9vGO
	RVYe7k3buYRQrOkXltVCZLS/D30PndocIUpDr0GC70EOk22DblGt2SRGqW77rolvFNQ31e7tFOWlb
	4q91xZBE7VU4D5jIP8C4zJ0BMvbJrm5KE11ViVil0rjGxgGyq69pr/Zewzcl/+CiPv4D9omu6q7Po
	3YmC+pFC1btGQYkqpzR2x3j3rxkziJwLUYzdjvAWD03JZnX3ubnYJz3pcBulpNNSiOT7ZP/M0i7GJ
	L6FVqU5fkYOpBP8cgxwKXYOIz/G2SfBShxg/tci7RmKLVHLdZbsw2EjsjKG9WOpZNdI4oART+Z4Y7
	agmkibCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU7R1-0000000BfEt-18Nz;
	Mon, 01 Jun 2026 18:32:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU7Qy-0000000BfES-3VFe;
	Mon, 01 Jun 2026 18:32:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780338737;
	bh=hpq52y1SFKvP7WMQOqSolNHHdSm1wNX+AFlAGowAD0E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WXJjJ/v9Cd3CyRPzXPVakcZvERIdBp2wqqt3zG22edYccFsvq8cf8YK71rw1OudMB
	 Nggt6lirooaIEKdF/jwbJNiEA1pnyY6tqe/31kqFxX2exmoVSZzNrErQpO8GJh+YBt
	 mOkfWsprWfpiFWNAGYG9r8rDRlToUnoH6t9vfoO4zQFHdk22bhwTOMdLuNd/S9FQ7b
	 0oBiRurFIx9dGmruG2wEXJ1tzyCVNoAniCpCxXHsfU1JznywktZWWYsvGjN+3q2idb
	 fqc/HUcDjVmBX3Q3o1jmI5ZXbBstHZfQR1iL/RkZpj4yZbu0yt3fuYWhkHUjfm51ot
	 CF0HbfvCXEcPg==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 259B617E05B8;
	Mon,  1 Jun 2026 20:32:17 +0200 (CEST)
Message-ID: <d8d7362f-4f62-44ca-895f-15f804f53b0a@collabora.com>
Date: Mon, 1 Jun 2026 21:32:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] YUV support for VOP2 background color
To: Andy Yan <andyshrk@163.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260524-vop2-bg-yuv-v1-0-dcb6a52923f5@collabora.com>
 <8061cc0.a9f1.19e836d8cf0.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <8061cc0.a9f1.19e836d8cf0.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_113221_058650_3CA3BB6E 
X-CRM114-Status: GOOD (  10.36  )
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

Hi Andy,

On 6/1/26 4:44 PM, Andy Yan wrote:
> 
> Hello Cristian,
> 
> At 2026-05-25 00:27:27, "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com> wrote:
>> Since commit bec7cbfa7d4f ("drm/rockchip: vop2: Support setting custom
>> background color") the VOP2 display controller allows configuring the
>> background color of each video output port.
>>
>> However, this is currently limited to RGB formats.  When operating in
>> YUV overlay mode, the color must be programmed using YUV format.
>>
>> Add the necessary RGB-to-YCbCr conversion logic, covering all color
>> spaces supported by the display controller: BT601L, BT601F, BT709L and
>> BT2020L.
>>
> 
> 
> Do you currently have a branch that makes dw-hdmi-qp output in YUV mode ?

Yes, please check [1] which is based on a subset of Nicolas' color format
series. 

Note I've also submitted a new revision [2] to handle the conversion from V4L2
colorspace to vop_csc_format (already included in [1]).

Quick test:

# Switch to YUV444
$ modetest -M rockchip -P 34@82:1920x1080+960+540 -w 82:BACKGROUND_COLOR:18446462598732840960 -w 85:'color format':2

# Switch to RGB
$ modetest -M rockchip -P 34@82:1920x1080+960+540 -w 82:BACKGROUND_COLOR:18446462598732840960 -w 85:'color format':1

Regards,
Cristian

[1] https://gitlab.collabora.com/cristicc/linux-next/-/commits/rk3588-yuv420
[2] https://lore.kernel.org/all/20260601-vop2-bg-yuv-v2-0-e5aef1d16fec@collabora.com/

