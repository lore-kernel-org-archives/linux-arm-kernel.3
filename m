Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39058C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 14:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fspd5e54mfMI6aa1OpsBB/dqGjkj7jaOpc4EH06UMKo=; b=bApxVFIwskhv+C2CAr4sawm/g0
	rXzzj3A1co3amyUgXZbhB85fBA7DjHTSgFR09z9FcKEwD7GEZ2Zef+CcwPj5QBB5cUa1L45TqiZQR
	TQoNTM36B+41d0ocDfMxAN8yHFJHJh9K7UB3xR0fO6VkJcHJs23tCa9QjwN71dMgkEf1xCEnpp2++
	9hhbI435kvUSN9J7jfqIZ7bM6LahK1UoOQG90kr4FSz03lfkTXngnMcT4QL0a+K6gBa37IqLQQOwM
	0up0fQR2fr6K5Cxm6U4El54Hf0LEoD6dplEkyKcphuXB4LNItdHcSUjxXcEVtvFgS44pxcqETruJi
	Jjr+mP5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRu3S-0000000AU2K-02Wh;
	Wed, 18 Jun 2025 14:46:22 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsMt-0000000ACp2-3TKb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:58:21 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250618125813euoutp0135189e87b2b584a0dbafed8ee04c22e2~KJHXE1puy0417304173euoutp01O
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 12:58:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250618125813euoutp0135189e87b2b584a0dbafed8ee04c22e2~KJHXE1puy0417304173euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750251493;
	bh=fspd5e54mfMI6aa1OpsBB/dqGjkj7jaOpc4EH06UMKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HeSEi6BoetPrdRExaNto6pbVCX9/4dRHlYYaUeUVpUQt/IGMnW06+0U4IRL4NJEIA
	 DktiAHaJ1j+FrmFJL4mDT8NBE03hLVRdjVqs4OEwk1mLvwpt6zXMK97OteZKrGkt2E
	 exIk0AMNabBxk1H5UpwpzPsvxNWTuV5fjr2aDmU4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250618125812eucas1p11a1ab5210d4efa95a51b3bc7c4f0924d~KJHWqi6Rd0340003400eucas1p1l;
	Wed, 18 Jun 2025 12:58:12 +0000 (GMT)
Received: from AMDC4515.digital.local (unknown [106.120.51.28]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250618125812eusmtip2b1f7a7d239a1b83dd4fe9a93315b1bca~KJHWEb5oH0417004170eusmtip2Y;
	Wed, 18 Jun 2025 12:58:12 +0000 (GMT)
From: Mateusz Majewski <m.majewski2@samsung.com>
To: linux.amoon@gmail.com
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org,
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org,
	rui.zhang@intel.com, Mateusz Majewski <m.majewski2@samsung.com>
Subject: Re: [RRC v1 1/3] thermal/drivers/exynos: Remove unused base_second
 mapping and references
Date: Wed, 18 Jun 2025 14:58:06 +0200
Message-ID: <20250618125806.2260184-1-m.majewski2@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616163831.8138-2-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250618125812eucas1p11a1ab5210d4efa95a51b3bc7c4f0924d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250618125812eucas1p11a1ab5210d4efa95a51b3bc7c4f0924d
X-EPHeader: CA
X-CMS-RootMailID: 20250618125812eucas1p11a1ab5210d4efa95a51b3bc7c4f0924d
References: <20250616163831.8138-2-linux.amoon@gmail.com>
	<CGME20250618125812eucas1p11a1ab5210d4efa95a51b3bc7c4f0924d@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_055820_298505_64984AA6 
X-CRM114-Status: GOOD (  10.35  )
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

>  	/* On exynos5420 the triminfo register is in the shared space */
> -	if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
> -		trim_info = readl(data->base_second + EXYNOS_TMU_REG_TRIMINFO);
> -	else
> +	if (data->soc == SOC_ARCH_EXYNOS5420 ||
> +			data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO) {
>  		trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
> -
> -	sanitize_temp_error(data, trim_info);
> +		sanitize_temp_error(data, trim_info);
> +	}

If I understand correctly, this means that the triminfo will no longer
be read on other SoCs calling this function (3250, 4412, 5250, 5260). Is
this intended?

By the way, are we sure that data->base_second really is unnecessary?
According to the bindings documentation (in
Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml),
the different address is necessary because the triminfo registers are
misplaced on 5420.

Thank you,
Mateusz Majewski

