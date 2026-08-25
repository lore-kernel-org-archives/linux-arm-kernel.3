Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1F9C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 18:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLhl7vMzATDfLTJ4Lrym/q2o4NDrnz3WBA6CQS/z/Wg=; b=UBstaTrAf2pumBEG/YdP9a82A9
	GKJ+7UfqtfZWZ6oINhjHvneQhM32lrF3CeU7WCuLJuz3L12rFNyZiTyp0CCpTitf52LYwz71SHOJW
	VNjEr30wV0QCIq0tDgcqk9Eg8QdyOYo9dlFH2HyKnYsRvyBGh9jXXVMcPkHCs1wH4wugi41lpCHMi
	dwjD8ylNv8XmFPsOqnc5OihdSBuz7encBq77l08bzOQGHKJziKTjfqFHzlnO+/MoI4aBiG6wCBL3z
	SLr/W3pzT74VKyg3UwQ/gFdb21D9HOpN1T8mJwcKXN5Vqglj73H7dhfl2cu8up5Tyf6rMkm1eCeo0
	sMNlaMcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyvrl-00000001JKX-2zkH;
	Tue, 25 Aug 2026 18:27:21 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyvrj-00000001JJU-1TTi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 18:27:21 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-39c74722e27so2131101fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 11:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787682437; x=1788287237; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cLhl7vMzATDfLTJ4Lrym/q2o4NDrnz3WBA6CQS/z/Wg=;
        b=r0udJLFJk+dzHaVUiWVMSL5c6fqcNO+rFiFe+5x+s1TGUB1+b4ZPzCQHF8wdg0IJh1
         3mLzYQeeRkikEzRXM0K+Lepqj8dlotRIk2UEh+2vpiPjn1GhmUfWdN44HX+usoPKqABS
         Bb7xnGl+b0JUdmoxeZBrekcmM/9veEo90jbHYBF4A4AfPzvnFM0KmSGkyCfV2QuBAekz
         Yq1bnDuyrjcu+zaz2fljPLXCA2d9JcMy8maJioUajse42RgGaGbTGW1XW08vQtArYu4w
         UCAOYfdqWnoBLFwnSylow3pS3aaPrjr0XU6h+PdmTq/JLnR10J1WmSh5McGNK0ed9JHG
         X9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787682437; x=1788287237;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cLhl7vMzATDfLTJ4Lrym/q2o4NDrnz3WBA6CQS/z/Wg=;
        b=Y6iBjGhyhcnyT+P30McYBgNFRS5mE0y6Km9RZ0f5ARGh0k3Zjiw/QwRQaOvRq2Pgmo
         h9JTMocsuwM9pf+8ABY4I8Ssg5zhogJpKcbq7kXgygZwKcgQ8ovTPrqyaoocPk3/imEE
         1W2qBw/IXXAq//rtTik2fs1sVmjzwWyKLhYcxVcX8c7nYJwlJwEzxEdPSJNt/lLnjiJg
         N/DJGEvejgXv3HKqU9fXzY/Mm4EqKDCImxr1xus+MbpCqNCOESp+ZSKCoAyRtY1p1Fh7
         567l3NGkrfivxNe4us7NKVS2uUoiAxlT2Rrwyu+zQgrqW7BYkTLOeNHN6MB51hlyTz1I
         21qA==
X-Forwarded-Encrypted: i=1; AHgh+RqaNUpDXPczZ/issgIv5cN7adGebM4Bgt55oiWEuE/0HgXlDyT2gBq93uBQKm4tjDH1Oj86Xp7700mOD2IQWmJ+@lists.infradead.org
X-Gm-Message-State: AFuF++n3hmyvfYmuz8mlqRfKmbfPdLHLhRiQDY6yz2giDZ+rtBcmnNlE
	pE9vFU3O8YuTPPorm3vyKBsJw1rsB9Xm1VUZTM9XIcRdQg716Ziwl8hs
X-Gm-Gg: AR+sD12e5cu3BPbz5X+19eJpnEqiBcpPPbakfHCDTkUCejqXI9ed/hC4uKlwjp5vYXk
	c+6Y1Cc4qQMvzBCJxVTV4uawuDMDwQj+D2acrhJ5wTIpwSw0+oCul0SALK9wGpvmWSeWsr6ausD
	P15qb1GJe94QDNCDZ8zZiylrvr4HyzTazpBxObbSrbBd3rDzZkdtBSfxkRCiuFL1Q8+PRdKcdBv
	9BKnCxzbfHsxP3yWVcmbWNp3ivAqPpsst0urVRRFGp/2l0+RAquBHGz9TiSy6G/Q7HO46VbCXiV
	/jaq9agLTTDU12sgbkymgv9oN8QBI/MD6Y+3dW4tp9OfdYwQBSxsSS8soIrrfYfW6Euh+2v39Z6
	C3x40IYlfd1Td5FXfdmg8Bz0xcrHw+3bmhpaPKCUsQLcV+z9asoep4Nlt4OVMKwRGfm9wVIjLOq
	GtAh3Y0dLLJpXJkr1fZMMlGonEoid3J1hAV7ue4v1ZMh5UdIMOJgFC0JQ0pxNjSWuI6c5mqbS8E
	0c=
X-Received: by 2002:a05:651c:54a:b0:3a1:4530:fb2 with SMTP id 38308e7fff4ca-3a1edab181bmr15138391fa.5.1787682436763;
        Tue, 25 Aug 2026 11:27:16 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1fd13a484sm393461fa.38.2026.08.25.11.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 11:27:16 -0700 (PDT)
Date: Tue, 25 Aug 2026 20:27:15 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>, JB Tsai <jb.tsai@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH wireless] wifi: mt76: mt792x: fix NULL dereference in
 ACPI SAR init during probe
Message-ID: <ao3dyqWJ3nf3rMMW@soda.int.kasm.eu>
References: <20260825181712.28548-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825181712.28548-1-lucid_duck@justthetip.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_112719_413543_BE622224 
X-CRM114-Status: GOOD (  29.18  )
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

On 2026-08-25 11:17:12 -0700, Devin Wittmayer wrote:
> Some laptops carry a MediaTek power table in their firmware, and the
> driver reads it to set a transmit limit for each frequency range. It
> only fills in the ranges themselves when it registers the device.
> 
> The startup step that does this existed already, but it never programmed
> anything. These two commits made it run a regulatory update instead,
> which sets the limits on the way through, long before registration. So on
> a machine that has the table the driver reads through an empty pointer
> and the interface never appears:
> 
>   BUG: kernel NULL pointer dereference, address: 0000000000000004
>   RIP: 0010:mt792x_init_acpi_sar_power
>   Call Trace:
>    mt7921_set_tx_sar_pwr
>    mt7921_mcu_regd_update
>    mt7921_regd_update
>    mt7921_run_firmware
>    mt7921e_mcu_init
>    mt7921_init_work
> 
> Skip it when the ranges are missing. They are applied again once the
> device is up, which is where they came from before.
> 
> Reported-by: Klara Modin <klarasmodin@gmail.com>
> Closes: https://lore.kernel.org/linux-wireless/aoyxqHYvSuaBeubf@soda.int.kasm.eu/
> Fixes: 9b80bd9cab40 ("wifi: mt76: mt7921: add regulatory wiphy self manager support")
> Fixes: e9f3f1cc133f ("wifi: mt76: mt7925: add regulatory wiphy self manager support")
> Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
> ---
> 
> Reproduced on both chips before sending, an MT7922 and an MT7925, and the
> fix clears both. Neither machine here ships a vendor power table, so I
> supplied one through an ACPI override in the initrd. It also wants recent
> firmware. The June builds do not turn on self-managed regulatory and
> nothing happens; the builds now in linux-firmware do, and then it dies
> exactly as reported with no interface at all. Patched, both come up and
> scan normally, and the injected limits still show through in the power
> table afterwards, so the skip does not lose them.
> 
> With that table still in place and the fix absent, backing out the mt7921
> commit on its own also boots clean, so the table is not what causes this.
> 

Thanks for the quick fix!

Regards,
Tested-by: Klara Modin <klarasmodin@gmail.com>

>  drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> index 946dd7956e4a..b468051fbe68 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
> @@ -323,7 +323,8 @@ int mt792x_init_acpi_sar_power(struct mt792x_phy *phy, bool set_default)
>  	const struct cfg80211_sar_capa *capa = phy->mt76->hw->wiphy->sar_capa;
>  	int i;
>  
> -	if (!phy->acpisar || !((struct mt792x_acpi_sar *)phy->acpisar)->dyn)
> +	if (!capa || !phy->acpisar ||
> +	    !((struct mt792x_acpi_sar *)phy->acpisar)->dyn)
>  		return 0;
>  
>  	/* When ACPI SAR enabled in HW, we should apply rules for .frp
> -- 
> 2.55.0
> 

