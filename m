Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDABD7833F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfhF3thY/6qpZJaS04GnvZ/MEIY9ZCMsNsrMbVaGUm0=; b=1OgJCA1F8w0Mkipd5/hNUMrw3Y
	2PBIcxkhGs1d3yT/+4Ctq2Yg0jZ5WLo75ZHrTUEtww3LzVz1Mg4+0CmGdMpM6OKm3SQMBcMWynNgh
	e9a827jLOlcn1/UCwicvAIe+T56P2Gx9dN3co+36UOn6Ey3a1pY8vxCSQoKBlmo8yq+wPDV6pfxPJ
	ML+AyxNAv/fI8uJ88LwM7EaSJEkIVIuYd4NbkLyEKHYAZdht/zGAmMAoUK1xV+Xf/W4BKj9T7/qfo
	2eGFwlKA92FyHSEL5ia5SshyIxqsOCU9otSSwjxsXadgpXBbK0a6dkya9Uwd3ncgp0RKQae6i5G1K
	uxsZcbHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPTO-00000008xEB-1aNc;
	Tue, 03 Dec 2024 09:45:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPOX-00000008vwO-412K;
	Tue, 03 Dec 2024 09:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733218836;
	bh=mQrPvTHBU9kamXtdQ6gaZmlwNXNXUC4oOdkVd++NnNc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q+qUmzjWXCMBbMFTKojflo1CpccRVjjhaNImCS2YlZXl1uo97+8kfot5/JszojIVu
	 B41gkX04CfuVMKdjbYE1v1ILvqCdasjQe9A2/HQibREFUk7pmbE1CYV7NN7pwYJGlk
	 +N2s8BJxbDIbMb+2qh8OUHfWFycRaR7rs1JuUMnMPHm4tCF3+Turbt/BoQGn8cIBJG
	 UQ0uNHkSOFHobz+kLDPCw7yAxtB24onwI7TXbXRka4zktY2shFhIBHvUJWEiAsnDRA
	 Exq0dTz8e6aoVsEDfkqarAABc3QWH81GNcYEpEwbbBAbgFX5Asz7KOBNUWvq1WFmmE
	 3YkrQyzdF8o/w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2EF2C17E35EA;
	Tue,  3 Dec 2024 10:40:36 +0100 (CET)
Message-ID: <b3672b3d-a336-433e-aa8a-6ddc6c8997d2@collabora.com>
Date: Tue, 3 Dec 2024 10:40:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/18] arm64: dts: mediatek: mt7988: add proc-supply
 for cpus on bpi-r4
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-16-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202122602.30734-16-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_014038_140059_115B32B2 
X-CRM114-Status: UNSURE (   5.93  )
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

Il 02/12/24 13:25, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add proc-supply property to cpus on Bananapi R4 board.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



