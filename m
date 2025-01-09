Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6D6E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 11:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZEAv/qpP0y4izZnUEw3H18W9W4FALowj+RGX5VFVmg=; b=G1FnoVygU1uYfVrKcBsbXjf06u
	++148yqNpyGLzCJ2j2BUTPcTMQtV+PTNGbO/Yi0Qht3MKZfcWllMBaHkRc38yxyTI76FzuR/thOoR
	rwOypmJ8DJGKs4hL+1JRY5o1wQ/X/ZvhE/wn2q9TxWkEFb1Py81lp1ER+cx859e/0ygab/WGXlUqL
	Pj0GINNB/3Fgq8fnBz6SIRfCwfMx5Ey/tc6xW6GKRWa+npPUJ9YIhdUJbVh/3wK8MccH5jhPmc1Fk
	F/SfjWtn/TEcnBbm6LTL5myZpGkm0oIWcScoyqpn0N+eXdKdHrIqRrnppD+gzv8iBGoUzGejYViQK
	Mcb7GvPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqZ6-0000000Bgkd-3XA0;
	Thu, 09 Jan 2025 11:19:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqSy-0000000BfbR-3ake;
	Thu, 09 Jan 2025 11:12:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736421163;
	bh=wj/WEZ7nYGvdYQsrY4pb5UsSsCFzsxlWe/W89R9Au6s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R6eXMt5Ss5OxKm/L/cgQTBVSozuc958UZELoxIjxwTvnmIZg5K8gw5FJ96Wig9c6m
	 XxUNJAJkq2O82/JwQVOn0jO31J65FkOWJHhVexHxusX5+bR9H3lhsEPaXGgqJxtW5P
	 CWEaOmWT9HKa8xlmoMlqilaJLCmWenVbx1FQuJgBhJv3dAsE9dwOE2gBYVNHUoq4W3
	 WyeBAzVwCRUXRePTINi1nOEf4wncNl8jLY2S5jI++n4BaTh1C+Txy0vLCUFOkb3h+z
	 lOs4p2lMuz4yzaIu1X9QG7rE+WGC1k+FGJdSFiBlmam6HWxLRhcauO1o5zwEwk3ozV
	 rHiZEHsLhVTmg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BCEC517E156B;
	Thu,  9 Jan 2025 12:12:42 +0100 (CET)
Message-ID: <c140449f-8572-4a8f-9e79-5269cc0115e9@collabora.com>
Date: Thu, 9 Jan 2025 12:12:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: mt8173-elm: Drop pmic's
 #address-cells and #size-cells
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel test robot <lkp@intel.com>
References: <20250108083424.2732375-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250108083424.2732375-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_031245_067725_15483B87 
X-CRM114-Status: UNSURE (   8.22  )
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

Il 08/01/25 09:34, Chen-Yu Tsai ha scritto:
> The PMIC has child nodes for each of its functions. It is not an actual
> bus and no addressing is involved.
> 
> Dropping the bogus properties fixes a DT validation error:
> 
>      arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: pmic: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
>              from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412212322.JTFpRD7X-lkp@intel.com/
> Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



