Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7A5FED3F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 17:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkKZ2bo8WTebQf/qv5s/W2z2t3gkUOPR75h0FzNhfxk=; b=0eHYyMGDHRPRMiXzLHubpGi4A0
	ClLWxAlR5cwfzyAGiLkdz7ssOEeBSGNbISDtIndx4r7SeZSjcHz6WbnBe96pfr/IdIJFsDewL12xX
	afGKVyKQMdxKXk49tV8Hyv3+hSnNBo1hJ8bQlNrSmIZ4GHW66SbWpp2qM2EUQ6Gf6LZsiRTXlH+Kn
	FTxOt2vLcdkZlHsGmiSK7MjbQoKDgaSp1iREx+c4k1ypUx3xr8TvM9An1bboOcVudp9HuUehdFSRX
	L+KSXircMCreDnwEL9IX06lcltyZB96ErByLhoVpln1SQEZSI72BV6tOATjWPEFC+ghlCL9xI3NdU
	6RFfxpkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJws-0000000DZGm-3jwg;
	Fri, 24 Apr 2026 17:04:14 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJwq-0000000DZG5-2xGR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 17:04:14 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABD1D1A96;
	Fri, 24 Apr 2026 19:02:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777050147;
	bh=H5tHFyISA/0brrNnyaE2kzW6wQFAU93vXx+COSGJ2Qw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XiAHcg/NYff3donuXTxSvj6CvLhyxI2BBomH4dXRaejocQyrdW7dv7FtdpgHaZF2n
	 nET9x2w9HxMtb50x46PRDFf8rgWRFM+gEK8h7iTqsLD/ZXzE3fKbHbemOoeXal04c1
	 sLLz4bAF2drrLzX/PlU3F2Yc8iDiFqYHpilDPpRE=
Message-ID: <cb19eafe-6c25-4a2a-bd31-9fb280837623@ideasonboard.com>
Date: Fri, 24 Apr 2026 20:04:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] arm64: dts: ti: beagley-ai: Enable HDMI display and
 audio
To: Robert Nelson <robertcnelson@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Andrew Davis <afd@ti.com>
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
 <20260420-beagley-ai-display-v1-15-f628543dfd14@ideasonboard.com>
 <CAOCHtYjJgqomKreDxLUiVbUtpeh36f0bL-jA6P-6rsoJrweshQ@mail.gmail.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <CAOCHtYjJgqomKreDxLUiVbUtpeh36f0bL-jA6P-6rsoJrweshQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_100412_885719_1D03B04C 
X-CRM114-Status: UNSURE (   8.63  )
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

Hi,

On 24/04/2026 19:16, Robert Nelson wrote:
> On Mon, Apr 20, 2026 at 8:04 AM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>>
>> From: Andrew Davis <afd@ti.com>
>>
>> Enable HDMI support for BeagleY-AI platform. The display controller used is
>> TIDSS and the HDMI bridge used is IT66122.
>>
>> Based on DT by: Robert Nelson <robertcnelson@gmail.com>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> [tomi.valkeinen: cosmetic fixes]
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Tested-by: Robert Nelson <robertcnelson@gmail.com>
> 
> Thank you for getting the display back end working on j722s family!
What displays did you test? I don't have OLDI panel...

  Tomi


