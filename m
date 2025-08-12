Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3E0CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 19:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLNl7MI8X4M5cxrMR25hGPEYfSQVqkkWhNzJlEstFA0=; b=RPZrc4SKU9wRwA2nlYxCxNp2bK
	LGGEoOXJW+/pnEK465gGGOJKQHlmWjlmVchtyBu5oiHnkPAPwYAk9YMwXuXZePvlazMdR95I7tRIj
	l9yd0c29RfnTtzOOHWEP6nxyUNTKlla8rLW2uNSfHuLMDEuGG3eU5bdXsB7rwPml4tJDt60Nv3i+z
	VPMONvcBFzNATfRoFyV8+xXOszL/448f83gRolBrBrxwd3sLUWQSyOlSDrvuGFUggM97kdzPPz6tu
	VHVz/rx3x6rOcXKbwekXvSQVCOzeelFMWjwN3R3n1BRUbSHbLbsmFzyD55mNlfRAOGMFwiQX/QIyf
	V0glNVCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulukv-0000000Brkm-14tJ;
	Tue, 12 Aug 2025 19:33:57 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsqm-0000000BaTc-1458
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 17:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1755019909;
 bh=lLNl7MI8X4M5cxrMR25hGPEYfSQVqkkWhNzJlEstFA0=;
 b=c/A+57ABEc86qFRkbT3YxSoUTbk1suErG6+UYUEVudmnMctx2i3e+4mauZi7y5BuVtasDxxmK
 dmkb6agWunYlH+g7vP1xsLY5VxFRnRYHMiW2F8UuAv2hrX+3rXOjXZsnKBLWBWxWBJtiiMCS8Ke
 MBZGTCMeD5YgtZqjk4GCGRMTsJWyZHBke4KsWjqAdZN3qwToof8kme/gPXzu5pT3LSmkcTUBO05
 C9RkclPkmcta6oV9mG95nZEkEPUKIIfo5UHWYcj6VwUBdR9n7fGWmp16/WFg1zg7/5ahC3C1+IA
 mavOTTFDqHfNwJdyjAyvfLvHpKENsPslfoL02B6Eq0kw==
X-Forward-Email-ID: 689b7a6df092412ac2631c2f
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.2.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <efdf8c99-d166-4b78-afc5-d4a6eb5ac046@kwiboo.se>
Date: Tue, 12 Aug 2025 19:31:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Alex Bee <knaerzche@gmail.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <50162371fd54fc976a84fcf57c9b69112a892c46.camel@collabora.com>
 <1dd29158-0660-4254-ac00-1316768d9b82@kwiboo.se>
 <91864a1c047d2bdfce202b070716a694ede47d5e.camel@collabora.com>
 <a66feb89fa02f05b187e5603ffc3b1501ef3cbd5.camel@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <a66feb89fa02f05b187e5603ffc3b1501ef3cbd5.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_103152_477297_D2302FE7 
X-CRM114-Status: GOOD (  10.91  )
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

On 8/12/2025 2:44 PM, Nicolas Dufresne wrote:
> I forgot, 
> 
> Le mardi 12 août 2025 à 08:38 -0400, Nicolas Dufresne a écrit :
>>> JCT-VC-HEVC_V1 on GStreamer-H.265-V4L2SL-Gst1.0:
>>>
>>> - DBLK_D_VIXS_2 (fail)
>>> - DSLICE_A_HHI_5 (fail)
>>> - EXT_A_ericsson_4 (fail)
>>> - PICSIZE_A_Bossen_1 (error)
>>> - PICSIZE_B_Bossen_1 (error)
>>> - PICSIZE_C_Bossen_1 (error)
>>> - PICSIZE_D_Bossen_1 (error)
>>> - SAODBLK_A_MainConcept_4 (fail)
>>> - SAODBLK_B_MainConcept_4 (fail)
>>> - TSUNEQBD_A_MAIN10_Technicolor_2 (error)
> 
> I'me getting the same result if I force a single job in fluster. The test I
> posted was with 2 jobs. Detlev found that the iommu reset is required in more
> cases on RK3588/3576, perhaps the HEVC decoder in older hardware needs the same,
> I will try and report.

Vendor kernel [1] check following bits from RKVDEC_REG_INTERRUPT reg to
decide if a full HW reset should be done.

  err_mask = RKVDEC_BUF_EMPTY_STA
  	   | RKVDEC_BUS_STA
  	   | RKVDEC_COLMV_REF_ERR_STA
  	   | RKVDEC_ERR_STA
  	   | RKVDEC_TIMEOUT_STA;

Adding proper reset support can be rather involved and main reason why
this series does not handle it, better suited for a separate future
series.

Proper HW reset will require e.g. dt-bindings, DT updates, pmu idle
request integration and for rk3328 vendor even moved VPU reset to TF-A.

Doing the iommu detach/attach dance not only on RKVDEC_SOFTRESET_RDY
could possible improve some cases, until full reset can be implemented.

[1] https://github.com/Kwiboo/linux-rockchip/blob/linux-6.1-stan-rkr6.1/drivers/video/rockchip/mpp/mpp_rkvdec.c#L924-L931

Regards,
Jonas

> 
> Nicolas


