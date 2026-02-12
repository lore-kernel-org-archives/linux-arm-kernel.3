Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FFBEB48F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 09:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lGjYhMYArClGmT+MBkZx7WjfoJcGQ/ZGOmAjK7M3TU=; b=feWF6/2ck/rdFMAy74SgHLXkdV
	XznvBDUudGn77pkIsKXTPufwf0Z1xJUW0Tk+/7NGWjwF7GmcqdANMNMJcyFOs6ImusEUTWfFuWJs6
	kswDRAuD8RJKT9ETm82UikmQ/aVBNvnsHZipa8EQ5dDh6EdVruS5d45axhHKCS3RT/r80ZZ9Yko0E
	YMLRUy4TO1IUBPIJZ2Hql+7q16IlJ3gROfPwrPF2cJ6MXYxTvPbeKJ6J9qwJB1n7yZSQAFcglWWZ1
	VYOVlyqprlZZ/4q//YRsDSWCPfS+Q/5LV0ykg5hGdFs+l87J4E0LoboiIj5tcaIjYgPbMPNRdqOmd
	k+99a3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTPz-00000001sB1-2Aje;
	Thu, 12 Feb 2026 09:55:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTPt-00000001sAb-3SFc;
	Thu, 12 Feb 2026 09:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770890118;
	bh=N62o0AizXGvG6KW1+joGamHuqnTNnvR3ujtxM+9dnw8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=laYuff1m37ibybD2IrXe46Ic/HVfch2ccbM/zJh2WZzVGmJey+Fp5p1EPLvPSplDX
	 wxgOsM1LZ+VcENrVt4c1qV7ZJFhX5yhT1trmn976thQAHdPLIIHZeIceuFZ6kOFPDd
	 /AN0oy2uUCj3ZSDWIoAhkL+wDCT9N4cjf4oTYAkibaOIZW3xpJOqDffJfKzVntEo3K
	 r4sYbDkTI0exkwkYN/nSXFL9ArH5M6UlGT7vG16bTe2mFoCdRpv9vv3X0SXJheQOrE
	 jhW0dXAf3u+GgreZkvjV7kQd0NkH5HLIkNsiZ6AxRRwcPnMF+MElCCNT6hFoMe8EVL
	 Uy5eke5GkKwAw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4148817E110D;
	Thu, 12 Feb 2026 10:55:18 +0100 (CET)
Message-ID: <2db84c85-706c-42db-8706-debe37ca3166@collabora.com>
Date: Thu, 12 Feb 2026 10:55:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: mt8167: Add additional mmsys reset bits
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1770836189.git.l.scorcia@gmail.com>
 <6f803b6dd1f61728c17afadd2fe983e9fdc0c109.1770836190.git.l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <6f803b6dd1f61728c17afadd2fe983e9fdc0c109.1770836190.git.l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_015522_307101_E85955AB 
X-CRM114-Status: GOOD (  13.78  )
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

Il 11/02/26 20:03, Luca Leonardo Scorcia ha scritto:
> Some extra mmsys reset bits are defined in the Lenovo
> Smart Clock kernel sources - file cmdq_mdp.c
> 

Hah, just noticed that this patch actually adds the same resets as the ones
in my hints at patch 2.

In any case, since you're adding the MMSYS resets in patch [2/7], having two
patches doesn't make any sense.

Leaving the fact that this patch has the wrong title ... but well anyway, just
squash this one with [2/7] and send one patch adding all of the mmsys resets
at once.

Cheers,
Angelo

> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>   include/dt-bindings/reset/mt8167-resets.h | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/include/dt-bindings/reset/mt8167-resets.h b/include/dt-bindings/reset/mt8167-resets.h
> index f77c2ca897cf..b379f8f023d5 100644
> --- a/include/dt-bindings/reset/mt8167-resets.h
> +++ b/include/dt-bindings/reset/mt8167-resets.h
> @@ -33,6 +33,15 @@
>   #define MT8167_TOPRGU_SW_RST_NUM		15
>   
>   /* MMSYS resets */
> +#define MT8167_MMSYS_SW0_RST_B_SMI_COMMON	0
> +#define MT8167_MMSYS_SW0_RST_B_SMI_LARB		1
> +#define MT8167_MMSYS_SW0_RST_B_CAM_MDP		2
> +#define MT8167_MMSYS_SW0_RST_B_MDP_RDMA0	3
> +#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ0		4
> +#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ1		5
> +#define MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0	6
> +#define MT8167_MMSYS_SW0_RST_B_MDP_WDMA		7
> +#define MT8167_MMSYS_SW0_RST_B_MDP_WROT0	8
>   #define MT8167_MMSYS_SW0_RST_B_DISP_DSI0	22
>   
>   #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8167 */



