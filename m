Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1DBC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pulCHBNmHSLCMLUfuycAkgDBmy2iXM7iw4tKHzxTz4I=; b=Ybxza7+EUvjWH+RdzT7l5pNlFK
	oFsfvuTV8EU9CNQK8jqhMaOzpZX3udZoduXwTIeH7VLN1K4MTSG/ag6mEW8AUFgc9aY9e+sSV59a6
	ScTLR/eWyNVuvJpD4UTQBkGnYJRf2cgJDkIzqLVdnmjR3HA/xJmYJCe+M68yNmC3QSdU5Xu14Y2wB
	6/VThFBU4QpRICptzRTdy+7QEY3XrdfYm+AoPb1HLhg1QLRmBM6oz/dwlwpYJimimWpqMAxyEl/9P
	vKJdCWTAqJYcnGFfyYr6IqCH2V+vyW0eugN2PWZenZhklmJyfAjLPPufFtoA0b/Yyu7P5Clf/OCl4
	EL2xVKcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3dRP-00000007WB1-2VG1;
	Mon, 07 Sep 2026 17:47:35 +0000
Received: from smtp.forwardemail.net ([2a02:6ea0:d71e::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3dRM-00000007WAW-2iCG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 17:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineageos.org;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-2eefaa527c; t=1788803248;
 bh=pulCHBNmHSLCMLUfuycAkgDBmy2iXM7iw4tKHzxTz4I=;
 b=wfpKBPEyc9kgAhnxYkBPpUcRSWSFnVRMRR6h1aoI4f+a7MhUrS3dTO4EtTYVlavZuP7CicQSw
 7y1YZkoQxc1BJIoKJo2xEU81NbWaw+JGmXxWWFJF6wa6O/1O9rG2Fce0ydMTUyPcNOTqLuWR8os
 2NdeouD/liO2x55zOfh1SSk=
X-Forward-Email-ID: 6a9ef8afe1a2da1fc80b68a4
X-Forward-Email-Sender: rfc822; tturner@lineageos.org,
 smtp.forwardemail.net, 121.127.44.73
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <45014ba7-e213-4624-be45-78e88c1b52a0@lineageos.org>
Date: Mon, 7 Sep 2026 18:47:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: exynos: Add GPU/Mali Bifrost node to
 Exynos850
To: Alexey Klimov <alexey.klimov@linaro.org>, semen.protsenko@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas_turner@talktalk.net
References: <20260905170914.1640-1-tturner@lineageos.org>
 <20260905170914.1640-3-tturner@lineageos.org>
 <DL8NQGNAVSYK.18TYE03LPQSW5@linaro.org>
Content-Language: en-GB
From: Thomas Turner <tturner@lineageos.org>
In-Reply-To: <DL8NQGNAVSYK.18TYE03LPQSW5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_104732_820044_7C0DFC48 
X-CRM114-Status: GOOD (  25.80  )
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

Hi Alexey,

On 07/09/2026 01:28, Alexey Klimov wrote:
> On Sat Sep 5, 2026 at 6:09 PM BST, Thomas Turner wrote:
>> Add nodes for GPU (Mali Bifrost) to Exynos850. Does not provide support
>> for temperature throttling, DVFS, power domains, governor support,
> 
> One of the sensors exposed via ACPM is "linked" to the GPU/G3D as far as
> I know. The driver part was sent already and three sensors work there
> (two cpu clusters and GPU).
> 
> I've never tested yet the DVFS of G3D via ACPM. Maybe it is worth a try
> on A21s. But it should work the same way as clusters clocks.
> 

I have had a little look at your ACPM stuff currently staged, looks like 
some really good work, would be cool to see if we could get dvfs working 
via acpm at some point :D.

>> boosting and voltage control. Once PMIC is properly implemented, support
>> will hopefully increase. However, the panfrost driver probes, the
>> Mali-G52 GPU initializes and the core clock is set-up.
>>
>> Testing for this patch was done on a device not currently supported by
>> linux, the Galaxy A21s. After enabling this node for that device
>> locally, I was able to test and confirm basic GPU functionality. As of
>> now, this patch has no users which have tested GPU capabilities and so
>> the node has been set to "disabled".
>>
>> Here are some logs I pulled:
>>
>> panfrost 11500000.gpu: clock rate = 377000000
>> panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x0 status 0x0
>> panfrost 11500000.gpu: features: 00000000,00000df7, issues: 00000000,00000400
>> panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
>> panfrost 11500000.gpu: shader_present=0x1 l2_present=0x1
>> panfrost 11500000.gpu: [drm] Using Transparent Hugepage
>> [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 0
>>
>> OpenGL core profile vendor: Mesa
>> OpenGL core profile renderer: Mali-G52 MC1 (Panfrost)
>> OpenGL core profile version: 3.1 (Core Profile) Mesa 26.1.6
>> OpenGL core profile shading language version: 1.40
>> OpenGL compatibility profile vendor: Mesa
>> OpenGL compatibility profile renderer: Mali-G52 MC1 (Panfrost)
>> OpenGL compatibility profile version: 3.1 (Core Profile) Mesa 26.1.6
>> OpenGL compatibility profile shading language version: 1.40
>> OpenGL ES profile vendor: Mesa
>> OpenGL ES profile renderer: Mali-G52 MC1 (Panfrost)
>> OpenGL ES profile version: OpenGL ES 3.1 Mesa 26.1.6
>> OpenGL ES profile shading language version: OpenGL ES GLSL ES 3.10
>>
>> Signed-off-by: Thomas Turner <tturner@lineageos.org>
> 
> So, I've got A21s and installed pmOS to test all that.
> My logs are slightly different but graphics is definitely alive:
> [    0.200787] [drm] Initialized simpledrm 1.0.0 for fa000000.framebuffer on minor 0
> [    0.215130] Console: switching to colour frame buffer device 90x100
> [    0.225540] simple-framebuffer fa000000.framebuffer: [drm] fb0: simpledrmdrmfb frame buffer device
> [    0.226134] panfrost 11500000.gpu: clock rate = 377000000
> [    0.230960] panfrost 11500000.gpu: mali-g52 id 0x7212 major 0x0 minor 0x0 status 0x0
> [    0.230981] panfrost 11500000.gpu: features: 00000000,00000df7, issues: 00000000,00000400
> [    0.230991] panfrost 11500000.gpu: Features: L2:0x07100206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> [    0.231002] panfrost 11500000.gpu: shader_present=0x1 l2_present=0x1
> [    0.232329] panfrost 11500000.gpu: [drm] Using Transparent Hugepage
> [    0.232726] [drm] Initialized panfrost 1.6.0 for 11500000.gpu on minor 1
> 
> Also, when this is applied with status="okay" on Winlink board then
> panfrost itself seems to be alive and drm initialises despite missing
> regulator as indicated in my other email in v2 of this series, hence:

Alright cool, just for the records we have tested this series on the 
A21s both with and without proper regulators and GPU seems to work fine 
with dummy regs.

> Reviewed-and-tested-by: Alexey Klimov <alexey.klimov@linaro.org>
> 

Cheers, will give this version a few days to stew then I will add this 
onto v4.

> Thanks for working on this.
> Best regareds,
> Alexey

I really appreciate all of the testing and insight you have provided in 
the last few messages, now that we have Samsung E850s booting I hope to 
expand support across the whole SoC :D.

Cheers,
Tom

