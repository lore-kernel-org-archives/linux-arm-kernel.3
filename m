Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6E1C7113C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xOpRB8OpoI7JVDghx5OS8h0dyqtDLEoX/p28PIBs+o=; b=Z6vE07Q9vnvO1lZMAHJ1aJX2m5
	vuqKpZn1gBzydipw9G73EjlbK4aMlSK8FG+KvqzJwBgW2Lasc7dRcETECZxDnhrsciii3zDkWy068
	HqjyuLAtfLPmR2BtrDwdUJnybaQTc/lWqCj4YlICu3W11vmdDS1R5mR4QbAn5/0o4PHBcnXq8W8hf
	b98AZONRJHwP+EusEwwezoaoCTo8ILGEf6jcki5Pd8k2Fy2gAz05n6MEiQ/U2zATD9DzrHX+KJoDJ
	VMozAWZSKL8jH6PVQdLdoLoben1ynEepWD5xQNoV/25gNfdjRpzTqtt/dWf7wLPYV1JcVhstfbSgP
	dW2atMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMke-0000000A9LX-1ByA;
	Wed, 11 Jun 2025 14:48:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHQT-00000009QQi-0YRn;
	Wed, 11 Jun 2025 09:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7xOpRB8OpoI7JVDghx5OS8h0dyqtDLEoX/p28PIBs+o=; b=elH5/tTHDdDskEgFdQj+9fqNYQ
	UCbbuMiuPPFpGd6dzG+uXVrUR2de5Tz3a2lAgo+TFlN54QEgjYaRpVKQZksBnWNJX/RByc8qsliz9
	GZONJJzrmCa4J7vuhSMKt9RKfR03XHwixBpJFQAEWSRh1qRDNHIGRsw8jliLas/znO7Gt5J+vuL4i
	9jUHMfK9gUxtQ+x8yF4LrtDd99AjubYxXlhzKj2LAevH31OAHx7goLBLB1eI24OE0uBzlCJIgc/Qp
	vdAcBDEwPGg4bwTbgZnfgn7vXtplIi+sFHFsA612egndRO/KVxWs/t2/ogG0MpsTbPbmIG60fAG4i
	KvUJ4+Pw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHQR-00000002Dep-0dQV;
	Wed, 11 Jun 2025 09:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749632830;
	bh=3Ip4QlReFFhe2GLgKmX5HdTzhz5q7Ydnp6NSKHxRFlA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oeBR2Cdkvw5FS5Uj+EMSWDpyYAIRfmum/UQEmEmc2NH+uR3ykyn782Cwk++CJV68w
	 lTMYB9QLbBFILVapHjXCVkxxn5HO6MNp5wabOBINNpPKg+zMFNdNpnUQQOPFquqLki
	 G9rTB3wl25n8txJ16MHKJVl39rzd4R5a7jQNZGPJTpKr3oTnBa56QUxTzwSUsiih8j
	 SMDxAGmHpK87FuHPmv3PDqQLHn0otU7xM6ldZhTSKbLwT/3bCNvLeBHqWQLz7BaQSv
	 Z/n5sTMwJwpoIo4bJVvlISXhbuZrlJieYT/6XSceGYnn42SPeGunysx+E0yd0dHrTw
	 a5EWbwjgoQwkA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 858FC17E1045;
	Wed, 11 Jun 2025 11:07:09 +0200 (CEST)
Message-ID: <c197ad80-cd12-4168-b1db-9826cc42760f@collabora.com>
Date: Wed, 11 Jun 2025 11:07:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: mtk_dpi: Reorder output formats on
 MT8195/88
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250606-mtk_dpi-mt8195-fix-wrong-color-v1-1-47988101b798@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250606-mtk_dpi-mt8195-fix-wrong-color-v1-1-47988101b798@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_100715_349738_8BD70AD6 
X-CRM114-Status: UNSURE (   7.96  )
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

Il 06/06/25 14:50, Louis-Alexis Eyraud ha scritto:
> Reorder output format arrays in both MT8195 DPI and DP_INTF block
> configuration by decreasing preference order instead of alphanumeric
> one, as expected by the atomic_get_output_bus_fmts callback function
> of drm_bridge controls, so the RGB ones are used first during the
> bus format negotiation process.
> 
> Fixes: 20fa6a8fc588 ("drm/mediatek: mtk_dpi: Allow additional output formats on MT8195/88")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Well actually there is a way to make this still behave while having those
alphabetically sorted, which I was thinking that was already properly implemented
for MediaTek drivers.

Apparently it's not true for *all* of them... but then, just keeping things ordered
by preference is a simpler solution and probably the best one for now.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



