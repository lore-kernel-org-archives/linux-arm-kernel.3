Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39B4CCD18F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 11:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPd0ZjeboARFnV14EUx/4trsex2WcBOkc8rNb5ltniA=; b=l0lRU+EkeSPKexBaw1MIwXFyDN
	o/zImUSibPOrnLwNqRHUare6Z775+OpctITHDMx0sOoz4hTAYjGmPd9cR+7c0XwPf3fKEzNqg40er
	YegTdBjgXsRNi4qeMYSGs9010Tkns2VbdqiYEFwiZ1YQVFl4zr3rQOv8r2uT0tIvr4n1NoYwWSIqo
	4Mpl6oiMQ2VUZ3AKiu6TKHvIaSOC9J4ETVnloC9i6zbw4LLJYjuC9dw38nZ+nSQ7eI8xZfDjiNB1f
	Plhe09wEKqbLm0hv22//7YCsmE5oDLO25vG8fpF9YsOYlVl+1WKPE23SZQzlrz4KU4RleQlAp4cOX
	ppu04OkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6onn-00000005y7r-2ocV;
	Thu, 09 Oct 2025 11:27:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6onk-00000005y4J-20FJ;
	Thu, 09 Oct 2025 11:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760009234;
	bh=Ci7fJTXqo4Z20C2XhPVrLu17OYCK7HuDTL8uZuZ4OA8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VRa6RD7Z4Ol1Fi6WqTpUb4G5Kwx/WEEJvoDj3O7XI7UtRxwsZWqDvZi7rz+8Yi2U1
	 74l8i5c1HmW7+/oIF2wwuVu/QkUH9oXcRxE/Sl4YTESoHst3p6/6x+QKOvCzENZkM9
	 vaEI06KKa9cZkQ5utMuvB6whcGIWEHeF494dGEtt/Qz4kp37JTpsU0a8eiqIiMr0n+
	 E0QV7nmS4cYw3HbxyzuCVpYqC3+h0YNKCD7MxCbCvevMfWnWDZgNr03vFG9PPrsuwr
	 J+XsyfNE2DEqTZYSlQF8/UPho0EX4DH4N/l4YtafPp3fEtorvPw0gR00MPOvndUMlU
	 9h+U96Rz4XV5g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C15F17E0579;
	Thu,  9 Oct 2025 13:27:13 +0200 (CEST)
Message-ID: <044f8f98-7ae2-45ef-9b9e-a112d7013e5d@collabora.com>
Date: Thu, 9 Oct 2025 13:27:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/20] mailbox: mtk-cmdq: Add GCE hardware
 virtualization configuration
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-7-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-7-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_042716_691301_71AE32EB 
X-CRM114-Status: GOOD (  12.84  )
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

Il 27/08/25 13:37, Jason-JH Lin ha scritto:
> The GCE hardware virtualization configuration supports the isolation of
> GCE hardware resources across different OS environments. Each OS is
> treated as a virtual machine (VM) for GCE purposes.
> There are 6 VMs and 1 host VM. The host VM has main control over the
> GCE virtualization settings for all VMs.
> 
> To properly access the GCE thread registers, it is necessary to
> configure access permissions for specific GCE threads assigned to
> different VMs.
> Currently, since only the host VM is being used, it is required to
> enable access permissions for all GCE threads for the host VM.
> 
> There are 2 VM configurations:
> 1. VM_ID_MAP
> There are 4 registers to allocate 32 GCE threads across different VMs:
> VM_ID_MAP0 for threads 0-9, VM_ID_MAP1 for threads 10-19,
> VM_ID_MAP2 for threads 20-29, and VM_ID_MAP3 for threads 30-31.
> Each thread has a 3-bit configuration, where setting all bits to 1
> configures the thread for the host VM.
> 
> 2. VM_CPR_GSIZE
> It is used to allocate the CPR SRAM size to each VM. Each VM has 4-bit
> configuration, where setting bit 0-3 to configures the size of host VM.
> This setting must be configured before the VM configuration to prevent
> resource leakage.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



