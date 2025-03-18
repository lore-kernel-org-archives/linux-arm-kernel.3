Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3771C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 14:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Vu9UWMHYAo+WREfVqGn05FQGVJkuqzIWhw2WmRdXFc=; b=azj8oGX0XDCLkmoJ7wcHE+827a
	BhLfDODvKGzFn+4rd8E47Lfn0FJLfzNM9uQoXWCzJx3CfDev/vqkC2qlYugrox2ar39a/MmyQz+Ck
	YdltDncuMZEiCURJxwP4xknZRGzc1Ea1FYbCWEQ+3ZFvumMxD00vIP6tkvk73mbYAzCRzmPc4nzva
	otUZMnbOoulllFvq2IRC9RBxOz3hTPZyX7NEFeXNZgPajQS4vlHSOBukdOIeWxXFN0Fv/+v+ulhi+
	fWfwJ1ZXkknyjmvUq8sPG8sVIDFx+XNFBJVD+1aA7w3s9pfIOJiLrpV3HRcYnuFo1g/ULsxbMdqxM
	Tvc2kxrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXs9-00000006ApB-0Kax;
	Tue, 18 Mar 2025 14:24:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXoq-00000006ADR-357h;
	Tue, 18 Mar 2025 14:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742307682;
	bh=R1uBNBSVuYoXGI+w/jGLsCwuPYjh6hh6pbgZVbgBndk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MPx7Op0GztK8XDA43dN7d9m9g8obqpG4VPaQyhXd3Wl3l63svvb8erQsNCqAkJ1u2
	 MvooMn7k6FmeqtVm5AELGh767VevQUwQq8sY/nsrzLz0FCZVJuUJMDpODZuedGLjG4
	 s/P3ilp+tqDk8w7DinMJPePdGw252accAnez0PnFr+L7ViRN8Di/Jj2W7Y//8ZGQZ0
	 NocnTStQZGqAJFsJ8sFTDSNDdcUwGC5hebX9diyn17HFnmmlupDbOOw6f1NiWFQrLB
	 BI+Od0udujNoSt5YXyIhaLaoHJahUpWeEHHF/LfFDUbcuauHFn6x4ztckbPdyY8mFo
	 3+HzCvYiCWO9Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8AC4817E0848;
	Tue, 18 Mar 2025 15:21:21 +0100 (CET)
Message-ID: <79fc072f-9fea-4810-bd9d-3539ebb70ca3@collabora.com>
Date: Tue, 18 Mar 2025 15:21:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8192-asurada-spherion: Mark
 trackpads as fail-needs-probe
To: Laura Nao <laura.nao@collabora.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, bleung@chromium.org,
 tzungbi@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 chrome-platform@lists.linux.dev, nfraprado@collabora.com,
 kernel@collabora.com
References: <20250318102259.189289-1-laura.nao@collabora.com>
 <20250318102259.189289-3-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250318102259.189289-3-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_072124_926472_45063007 
X-CRM114-Status: UNSURE (   7.24  )
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

Il 18/03/25 11:22, Laura Nao ha scritto:
> Different Spherion variants use different trackpads on the same I2C2
> bus. Instead of enabling all of them by default, mark them as
> "fail-needs-probe" and let the implementation determine which one is
> actually present.
> 
> Additionally, move the trackpad pinctrl entry back to the individual
> trackpad nodes.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



