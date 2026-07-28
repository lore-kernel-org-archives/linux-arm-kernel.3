Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3851CC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X7kVZ0mJLOYQp+d7PO8ovbgmt8irgv+Etv5I27cBg0I=; b=PluaioUv22DKucpR9KqltqVPtP
	BTQy1y2nMYWtFdebOsJTdZBobW/S+t9wAysghKAmkQxX9Ank7/QecOtU79hq356MBECn92aSyBicS
	SAz1crE2DjXM0IuZgR8f4jrEIE6NNLvKjdjplk9B1PZwMC5y9QNSr1yzkLLE4/NKoidY06JwWnTui
	nZXgWWSY3QE55Nw2zYDpWeQmBSu7ANynTCAttXmsMZHthnn+Qh5071zfs4SKQixpyl4gtHAtw9wci
	0zJHO7YQDjsz5TyAa4eMmr/9z8c7JQv9f4jd4/cJaVECCzsMqimuSgsVfq1H5ZJK/S352G2Z4Bo3Z
	rSc9W5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wois4-00000005VtI-1KWb;
	Tue, 28 Jul 2026 14:33:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wois1-00000005VsO-12HY;
	Tue, 28 Jul 2026 14:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785249202;
	bh=4gKRc3lsPC3rb1kRaCZgNakY0yCL33pRhb9WZBRIPM8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ngSbIkhOyFiMhpkd3SX1Hg9cxgLQorJEE6BB1iTxRXJFWMfk/nBgyreb8ZnLWxO2+
	 kn+ZqtiP03ykjWbV20aiFjaAOwAinSr28bBrLHTSiNnJXNlCd+OE7nemylGwVkQIBF
	 srRcf20J7cmkgJFt+yhX12gVEm/1GkIpkpLEdAMH0a+ubUi+DFl5a/ezjYDTBSzhO/
	 FvhQkhWtBa3hMgHHQZeN2eIGUgaBPo39DAv0gkGfgbhvmrHiZfiMKJRyCOoj9VzY44
	 q5DPSdNRcZ7kA3OM8jtNFqssBVaSMPUlTJwgRQ2wXheQJ2Ux3jaraEUagJlyHtTYkD
	 Ao81oWyuEJB6A==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 89A0D17E0114;
	Tue, 28 Jul 2026 16:33:21 +0200 (CEST)
Message-ID: <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com>
Date: Tue, 28 Jul 2026 16:33:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: wens@kernel.org, Brian Masney <bmasney@redhat.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 YoungJoon Lee <getfeus@gmail.com>
References: <20260728091804.382753-1-wenst@chromium.org>
 <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_073325_445102_7E0A0B7C 
X-CRM114-Status: GOOD (  15.68  )
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

On 7/28/26 15:13, Chen-Yu Tsai wrote:
> On Tue, Jul 28, 2026 at 9:10 PM Brian Masney <bmasney@redhat.com> wrote:
>>
>> Hi Chen-Yu,
>>
>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
>>> Hi everyone,
>>>
>>> This is v4 of my MT8173 PowerVR GPU support series.
>>>
>>> This time around Mesa was ready for basic testing, using both vulkanmark
>>> and glmark2-es2-drm (with Zink). Details below.
>>>
>>> Changes since v3 (all in the clk driver patch):
>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
>>> - Added missing of_node_put() in remove function
>>>
>>> Changes since v2 (all in the clk driver patch):
>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
>>>    - Needed since the driver implements PM domains using the generic PM
>>>      domain library, which also depends on PM
>>>    - Fixes build breakage (kernel test robot)
>>> - Fixed "RST_DELAY_CNT" name (Brian)
>>> - Dropped unused mfg_desc (Brian)
>>> - Added check of clk_prepare_enable()'s return value in
>>>    clk_mt8173_mfgtop_power_on() (Brian)
>>> - Saved error value for return in IS_ERR(data->clk_26m) branch
>>>    (Dan Carpenter / kernel test robot w/ smatch)
>>>
>>> Changes since v1:
>>> - Adapted to changed DT bindings
>>> - Dropped driver change
>>> - Use same power domain for "a" and "b" GPU power domains
>>>
>>>
>>> This series enables the PowerVR GPU found in the MT8173 SoC, found in
>>> some Chromebooks.
>>
>> I'm making a pull for Stephen for the clk changes. Should patches 1,2,4
>> go through the clk tree? Patches 3,5 go through the DRM tree?
> 
> Only patches 1 and 2 should go through the clock tree.
> 
> Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pick up
> DT binding patches. Otherwise I can push patch 3 through drm-misc.
> 

Not sure if I can really take the DRM bindings patch through soc.

I will take the devicetree ones exactly right now, even though it's going to
give warnings.

I trust that you'll make the binding get into linux-next before it's too late.

Cheers,
Angelo

