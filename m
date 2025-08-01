Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4120C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 07:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fyiy27i2+Z4zCLmLQG1usEQLiIN2gUEV9aj6dfIm6fA=; b=CSXoVi0qs5weDmiT8+hryBPnDz
	QnDnIuEVOLua/i2CIWIKqsL90K8sGiLQ5aP2MzvDxILQ7rFgfpDMoNBRH3QWPrzxibjy6zRULtvv3
	6iaIu8+dbYuXw+NOCqXECdJpYoYSJvgDPhByoR/DynWhMTyScEqXaX8GNbDfVQFp1VQxjab9NH1uh
	LUElBR4U/E5175cCBh8K/VNZ1Haj3pluySMfVOfmvZbAT2O/5G36NBrSq+PQ1bkdoK1bQQxnxvNiF
	+hseWcaNXLm11NCqPd4W+CPag4cqy4s9XtXHUNPyL0Gi0Wo07oolNegmoWWmZybwrOIk6Hgxfxd39
	hpJ9EufQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkTs-00000005Aab-461P;
	Fri, 01 Aug 2025 07:47:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhkC9-000000058Ke-0n0Q;
	Fri, 01 Aug 2025 07:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754033327;
	bh=ampSXwXhrsh0B69HgKlyT4DdAISxdbwFoDCgBK1hfc8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cjvIiO48+WQC4N5/io9LgHRVljj/OmVGX3CRimyWTBRQx8T87takQ6PcYWeLJVNq6
	 k+ApgpZNHp39HyAFs+VYK1D1d2f889PQq5S3AWLbKwKPilh6XDEpRA7r6w8JwBQT9P
	 mm02Ccu2cR6wQFVIph0bPyIOTQL72BbJ/wXHGbcj4Du44xkNht4o2jSYuZ/GU+uP+C
	 5OKpFkE3etD0rYpp2l1/GVQ7dBEWFVPCJmnPhPv2CpysyVuGQL/iv0mvutTzlFPH10
	 dJ8ToQ6zD1ipagVp0osunQuN8GX8HfvErmXMuh1NN69t8CRnr86dDnWoqwfeEfi+Zx
	 daPAl2xBA2uWA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF71A17E1293;
	Fri,  1 Aug 2025 09:28:46 +0200 (CEST)
Message-ID: <6d117b30-1017-42db-af45-9d4137e9656d@collabora.com>
Date: Fri, 1 Aug 2025 09:28:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] thermal/drivers/mediatek/lvts_thermal: Add MT8196
 support
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 matthias.bgg@gmail.com
Cc: wenst@chromium.org, nfraprado@collabora.com, arnd@arndb.de,
 colin.i.king@gmail.com, u.kleine-koenig@baylibre.com,
 andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, bchihi@baylibre.com,
 frank-w@public-files.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250730152128.311109-1-laura.nao@collabora.com>
 <20250730152128.311109-9-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250730152128.311109-9-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_002849_374448_39C50AD3 
X-CRM114-Status: UNSURE (   6.66  )
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

Il 30/07/25 17:21, Laura Nao ha scritto:
> Add LVTS driver support for MT8196.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

When changing commit 4/9, this also needs to follow with

const struct lvts_platform_ops lvts_platform_ops_v2 = {
	.lvts_raw_to_temp = lvts_raw_to_temp,
	.lvts_temp_to_raw = lvts_temp_to_raw_v2,
};

and

static const struct lvts_data mt8196_lvts_mcu_data = {
	.lvts_ctrl	= mt8196_lvts_mcu_data_ctrl,
	.num_lvts_ctrl	= ARRAY_SIZE(mt8196_lvts_mcu_data_ctrl),
	.temp_factor	= LVTS_COEFF_A_MT8196,
	.temp_offset	= LVTS_COEFF_B_MT8196,
	.gt_calib_bit_offset = 0,
	.def_calibration = 14437,
	.num_cal_offsets = 2,
	.msr_offset = LVTS_MSR_OFFSET_MT8196,
	.ops = lvts_platform_ops_v2,
};

static const struct lvts_data mt8196_lvts_ap_data = {
	.lvts_ctrl	= mt8196_lvts_ap_data_ctrl,
	.num_lvts_ctrl	= ARRAY_SIZE(mt8196_lvts_ap_data_ctrl),
	.temp_factor	= LVTS_COEFF_A_MT8196,
	.temp_offset	= LVTS_COEFF_B_MT8196,
	.gt_calib_bit_offset = 0,
	.def_calibration = 14437,
	.num_cal_offsets = 2,
	.msr_offset = LVTS_MSR_OFFSET_MT8196,
	.ops = lvts_platform_ops_v2,
};

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



