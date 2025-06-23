Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1D4C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 10:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wu/SyywuiRlisW0aW7lLo+PYhMmhT/4RFRE8xEbDjuQ=; b=N43Fo7/vKb1Iulh5dhrel33xuf
	LCEiOWQtJJbdtSjTcD5dE/XVmUdi8zwxaii212A75Qg0ocTj9r2883fRMPK1t1rf/3NVqktL6rCNI
	16nUVk26vQJiNRRtdiS8gzkDAztUbDEwrWbTGiGPk64aMFiVof/DZbo/RmwTo+QIv0rC3CU9Q2BtX
	x+Pjd9Pi46ObtiVGNelN3FV4cXduPrKgTHZLn14kXjmkTXHGcbG1B8eKAxFYSOzZZ1w5WXj/kAa6A
	CdkXp4aJwvzJe2QQT3Bz+Rzf23Pg8djsmIEI86c9J+lGr5jGq1tNzpkDCpcppPep4Ah18zEEB2TB5
	FXdyg5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeqJ-00000002S9B-2Y3F;
	Mon, 23 Jun 2025 10:56:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdym-00000002GsQ-1dRY;
	Mon, 23 Jun 2025 10:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wu/SyywuiRlisW0aW7lLo+PYhMmhT/4RFRE8xEbDjuQ=; b=BNogiDU6/T90iqHKLkjUCMJP+Z
	jg08CWAZ4bvwbHq7yp2UtcA5yGLHWTBQft64oxs3EeTGdKCiUiOjaYpANb9c5t/NJ1ENP4a3G8+o4
	EGYG//9HzJ7Ggq1nkxJ+DAN9obHmr+/ROxAAzrO5zwrSKmg4h+SCNr5A8sHNMHj8yJh5ebRIAgpy3
	6JK2e7dlR6lfhcrBAFA/m7s0XnBV7E7v597m/wHKkNC/raQOHqJA8VHF3labl1TjqJkbWq3STazNa
	Lup7fr2QOM4UNvS10y1vHDCG/B71MfQA6doTsAp/JvOIgy1ZpRdhbqduUuWdWia94h1BcSfRoE2yN
	TJwCLBOg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdyj-00000005B5Y-2bVE;
	Mon, 23 Jun 2025 10:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750672839;
	bh=azGXJdCm5N9ox1CX4W1ejM3eFCxe8pQ98riu47qRbvM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CqVdI0rgmn2em9VHynK5GO6uxLO1OEuYOYS1cr8UcReWhkjNCKzELFdE9QGTSAOqa
	 UopxqvWO4ycokOttWfoyGsNu8suJ9vOi98oA7hWKP/s153HkB5WFB/xyVKelFlqgG8
	 h4to9kqPyl1/Ca2wX6FW9/YmnvPVhQkjEI5N4Z6pwT9NS76MykJ+FqPVGl0rjVfzE7
	 JeADfqzPxPsLa7qsG6O7BytRBs1Imn5AvqamwC0yWSzBH7sHpB9Htu3T9RzLDb7UiL
	 5neeP8qw0r/DJSsJnmvjg8/Gwp+0mEn55cEgFPUY6l5+3G9fS/V+PCeGY+9qqHOpvj
	 8RbrFBDVWKMXw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AC07917E06BF;
	Mon, 23 Jun 2025 12:00:38 +0200 (CEST)
Message-ID: <d3d92eb4-b42b-4bb5-ad98-8b1da324507f@collabora.com>
Date: Mon, 23 Jun 2025 12:00:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: NULL pointer exception in drivers/memory/mtk-smi.c
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>
References: <allge3h2abtjfj77idsnwccurxi2jnbcv6qcxar5f5m3jjmpvs@a4mmfghdhtv4>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <allge3h2abtjfj77idsnwccurxi2jnbcv6qcxar5f5m3jjmpvs@a4mmfghdhtv4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_110041_912287_7B73B7D7 
X-CRM114-Status: GOOD (  12.03  )
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

Il 17/06/25 17:18, Uwe Kleine-König ha scritto:
> Hello,
> 
> on a 6.16-rc2 kernel running on an mt8365-evk I occasionally hit the
> following during boot:
> 
> [    6.304796] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> [    6.305069] platform 1400d000.rdma: Adding to iommu group 0
> [    6.305924] Mem abort info:
> [    6.307867]   ESR = 0x0000000096000004
> [    6.309032]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    6.309731]   SET = 0, FnV = 0
> [    6.310126]   EA = 0, S1PTW = 0
> [    6.310189] platform 14016000.rdma: Adding to iommu group 0
> [    6.310532]   FSC = 0x04: level 0 translation fault
> [    6.312001] Data abort info:
> [    6.312144] mtk-iommu 10205000.iommu: bound 14003000.larb (ops mtk_smi_larb_component_ops)
> [    6.312381]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    6.313433] mtk-iommu 10205000.iommu: bound 17010000.larb (ops mtk_smi_larb_component_ops)
> [    6.314112]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    6.315156] mtk-iommu 10205000.iommu: bound 15001000.larb (ops mtk_smi_larb_component_ops)
> [    6.315812]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    6.315822] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000046fde000
> [    6.315829] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
> [    6.315846] Internal error: Oops: 0000000096000004 [#1]  SMP
> [    6.315852] Modules linked in: mediatek_drm(+) drm_dma_helper drm_display_helper drm_client_lib drm_kms_helper mt8365_mt6357
> [    6.316909] mtk-iommu 10205000.iommu: bound 16010000.larb (ops mtk_smi_larb_component_ops)
> [    6.317563]  mtk_mmsys mtk_mutex
> [    6.318471] probe of 10205000.iommu returned 0 after 19235 usecs
> [    6.319221]  mtk_cmdq_helper snd_soc_mt8365_pcm snd_soc_mtk_common snd_soc_mt6357 pwm_mediatek
> [    6.324638] CPU: 1 UID: 0 PID: 112 Comm: (udev-worker) Not tainted 6.16.0-rc2-00015-g44a5ab7a7958-dirty #27 PREEMPT
> [    6.325964] Hardware name: MediaTek MT8365 Open Platform EVK (DT)
> [    6.326732] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    6.327563] probe of 11201000.usb:connector returned 517 after 6627 usecs
> [    6.327609] pc : mtk_smi_larb_config_port_gen2_general+0x9c/0x1e8
> [    6.329228] lr : mtk_smi_larb_resume+0x90/0xd8
> [    6.329792] sp : ffff80008219b650
> [    6.330210] x29: ffff80008219b660 x28: ffff80008219bc20 x27: ffff000002fd6938
> [    6.331112] x26: 0000000000000000 x25: 0000000000000000 x24: ffff800080f9b8d8
> [    6.332015] x23: ffff000005aa8e90 x22: 0000000000000003 x21: ffff000002fd6810
> [    6.332918] x20: ffff000002fd6810 x19: ffff000005aa8e80 x18: 00000000ffffffff
> [    6.333821] x17: 74706164612d6c76 x16: 6f2d707369642d6b x15: 6574616964656d2f
> [    6.334723] x14: ffff800081b8b0c0 x13: 6c766f2d70736964 x12: 2d6b657461696465
> [    6.335626] x11: 766972643d4d4554 x10: ffff800081c8bc7c x9 : 0000000000000004
> [    6.336528] x8 : ffff80008219b578 x7 : ffff80008219b630 x6 : 0000000000000004
> [    6.337430] x5 : ffff80008219b5b8 x4 : ffff800080f9b8d8 x3 : 0000000000000000
> [    6.338333] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
> [    6.339236] Call trace:
> [    6.339546]  mtk_smi_larb_config_port_gen2_general+0x9c/0x1e8 (P)
> [    6.340318]  mtk_smi_larb_resume+0x90/0xd8
> [    6.340838]  pm_generic_runtime_resume+0x2c/0x44
> [    6.341426]  __genpd_runtime_resume+0x30/0x7c
> [    6.341979]  genpd_runtime_resume+0xd8/0x288
> [    6.342522]  __rpm_callback+0x48/0x1dc
> [    6.343001]  rpm_callback+0x74/0x80
> [    6.343445]  rpm_resume+0x468/0x63c
> [    6.343889]  __pm_runtime_resume+0x4c/0x90
> [    6.344410]  pm_runtime_get_suppliers+0x60/0x8c
> [    6.344985]  __driver_probe_device+0x48/0x12c
> [    6.345539]  driver_probe_device+0xd8/0x15c
> [    6.346070]  __driver_attach+0x94/0x19c
> [    6.346558]  bus_for_each_dev+0x78/0xd4
> [    6.347046]  driver_attach+0x24/0x30
> [    6.347501]  bus_add_driver+0xe4/0x208
> [    6.347977]  driver_register+0x60/0x128
> [    6.348465]  __platform_register_drivers+0x60/0xe8
> [    6.349071]  mtk_drm_init+0x24/0x1000 [mediatek_drm]
> [    6.349736]  do_one_initcall+0x58/0x268
> [    6.350226]  do_init_module+0x58/0x238
> [    6.350705]  load_module+0x1db8/0x1e84
> [    6.351181]  init_module_from_file+0x84/0xc4
> [    6.351723]  __arm64_sys_finit_module+0x144/0x328
> [    6.352321]  invoke_syscall.constprop.0+0x50/0xe4
> [    6.352919]  do_el0_svc+0x40/0xc4
> [    6.353342]  el0_svc+0x48/0x1a0
> [    6.353744]  el0t_64_sync_handler+0x10c/0x138
> [    6.354297]  el0t_64_sync+0x198/0x19c
> [    6.354765] Code: 39400025 35ffff05 f9404a60 371805a6 (b9400000)
> [    6.355533] ---[ end trace 0000000000000000 ]---
> 
> I think this is larb->mmu being NULL in line 277 of
> drivers/memory/mtk-smi.c.
> 
> Does this ring a bell?
> 

No, not really... but I can connect you with a colleague of mine that has a MT8365
EVK that works just fine.

Louis, can you please follow up?

Thanks,
Angelo

> Best regards
> Uwe



