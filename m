Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5140C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 12:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0uGPys7OikREDoz8H8cNYAk6Mj7dQKpLuXJaFO3CNE=; b=rjt/1myrSEPXuAabb7CmD7jwo1
	P87JuObgUQv6HluqOMcpbfNYw4t63xkGxUBv+KvuO7G2W/soS5Si2h/JBvTNWFJ7PNTxqMkYBweqR
	atDqEJ62F1d1RfibsQn/P3vsw66B5GDTnosX/tOMOU9hm/tEB02PK6Diqc2WLmz4WsEPe/cNLazEg
	vCdpN/wml3IvoMLRCv2odWW1C+17/5oKxtTkVVD+Ukqf2PpfcwGAvGoP+oxxkFkcs2EqFFC5vl0Ti
	qOpLavmmvl5Ul4LsharmB5u7N4lkJxEFVmFR88eCIqgM9DeOjtO+wZFoeabiwbKdgBlQV72aLqg8V
	GwiMrjxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9xE-0000000Arei-3Aj6;
	Thu, 06 Mar 2025 12:03:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8rZ-0000000AhmB-2JRx;
	Thu, 06 Mar 2025 10:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=X0uGPys7OikREDoz8H8cNYAk6Mj7dQKpLuXJaFO3CNE=; b=odLBDurjB9/5kquki5r+UGKTOE
	+Hx+YeL6yXHydqSsqEOYOmtLnQNkMmbhVBUhwzzyMQFoke6lOBkREDxlzLTqW0+cOf2gdAoUis/X0
	P755UC8PxSe3Jr8pWoQZbHUq1XM4+8oUXoMaF1RExtRtai5278/S/MXgB+lxvsNcz/oucVL1CmZ1x
	dX9HFc54grv0JNTzuyClIn2sEOz90EaX0QX2yi6PnU7vcnav1F4EhKi1jhei4Zybx9AexFmKmTQHE
	vKBQDX3cKrSD5iINPDTqNSVuLUOSg5kXkNSLxmNB3DcH0z8AiEDGSI0d886bKhissECBR9iUchjMf
	hzFziExA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8rW-000000011pc-1958;
	Thu, 06 Mar 2025 10:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741258434;
	bh=mlfJGkDy4TYPN23XQOALun4gCtktQqPl5OUILFcu94g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Adxdai4BHQ0nrk+Y8TguTPs3jteQqha22poRWLoQgrvVF+zA3MyEMhAgziIOIy+2y
	 OjHxAw4IRwy/8GS9KDxEmtD1zT8HvYL/FgVIGbjfuYQ/x6WrDiLPMSXffgT/+oLvCn
	 ldiABCy7QePDBPP3N77tk/wEL2QI5UDBKC9y4tbGsCf1AdZ/ttOYfaX2DTtEcFql0R
	 R5KLzKh8zzlBWO1L+/6verr1o91S4KpSsMRqf83LsDREgjMLRGi1Zq4JEFifA9YL8C
	 nAFJTxWfJmIchSeZFDGM5oQPnzBLPEXGEzLC+hu16nS+sOOi9war6JjdgCsKnlqAVJ
	 f2Tyj6DiY7lhg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1037F17E0599;
	Thu,  6 Mar 2025 11:53:54 +0100 (CET)
Message-ID: <7af26747-34cd-4088-a6b5-865de9e87fba@collabora.com>
Date: Thu, 6 Mar 2025 11:53:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mailbox: mtk-cmdq: Refine GCE_GCTL_VALUE setting
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>,
 Xavier Chang <xavier.chang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250224105414.3576243-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250224105414.3576243-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_105358_689603_A8E41BE8 
X-CRM114-Status: GOOD (  11.37  )
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

Il 24/02/25 11:50, Jason-JH Lin ha scritto:
> Add cmdq_gctl_value_toggle() to configure GCE_CTRL_BY_SW and GCE_DDR_EN
> together in the same GCE_GCTL_VALUE register.
> 
> For the SoCs whose GCE is located in MMINFRA and uses MMINFRA_AO power,
> this allows it to be written without enabling the clocks. Otherwise, all
> GCE registers should be written after the GCE clocks are enabled.
> Move this function into cmdq_runtime_resume() and cmdq_runtime_suspend()
> to ensure it is called when the GCE clock is enabled.
> 
> Fixes: 7abd037aa581 ("mailbox: mtk-cmdq: add gce ddr enable support flow")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

I have erroneously picked this patch in the MediaTek tree, as I had misread the
changed file, thought that it was mtk-cmdq-helper.c.

This patch also has the wrong recipients, as this should not go through the
MediaTek trees, but through the mailbox one.

Therefore, I dropped this patch from the MediaTek tree - sorry for the confusion.

Regards,
Angelo

